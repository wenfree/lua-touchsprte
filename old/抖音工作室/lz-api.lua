------------------------------------------------------------------------------------------------------------------------------------------
--本文件不用修改，直接在自己的主程序中引用，然后调用查分，识别，报错接口就可以
------------------------------------------------------------------------------------------------------------------------------------------
--序列化对象
function Serialize(obj)  
    local lua = ""  
    local t = type(obj)  
    if t == "number" then  
        lua = lua .. obj  
    elseif t == "boolean" then  
        lua = lua .. tostring(obj)  
    elseif t == "string" then  
        lua = lua .. string.format("%q", obj)  
    elseif t == "table" then  
        lua = lua .. "{\n"  
    for k, v in pairs(obj) do  
        lua = lua .. "[" .. serialize(k) .. "]=" .. serialize(v) .. ",\n"  
    end  
    local metatable = getmetatable(obj)  
        if metatable ~= nil and type(metatable.__index) == "table" then  
        for k, v in pairs(metatable.__index) do  
            lua = lua .. "[" .. serialize(k) .. "]=" .. serialize(v) .. ",\n"  
        end  
    end  
        lua = lua .. "}"  
    elseif t == "nil" then  
        return nil  
    else  
        error("can not serialize a " .. t .. " type.")  
    end  
    return lua  
end

function fmt(p, ...)
	if select('#', ...) == 0 then
		return p
	else return string.format(p, ...) end
end

function tprintf(t, p, ...)
	t[#t+1] = fmt(p, ...)
end

--添加数据
function append_data(r, k, data, extra)
	tprintf(r, "content-disposition: form-data; name=\"%s\"", k)
	if extra.filename then
		tprintf(r, "; filename=\"%s\"", extra.filename)
	end
	if extra.content_type then
		tprintf(r, "\r\ncontent-type: %s", extra.content_type)
	end
	if extra.content_transfer_encoding then
		tprintf(
			r, "\r\ncontent-transfer-encoding: %s",
			extra.content_transfer_encoding
		)
	end
	tprintf(r, "\r\n\r\n")
	tprintf(r, data)
	tprintf(r, "\r\n")
end

--生成封包边界
function gen_boundary()
	local t = {"BOUNDARY-"}
	for i=2,17 do t[i] = string.char(math.random(65, 90)) end
	t[18] = "-BOUNDARY"
	return table.concat(t)
end

--数据封包
function encode(t, boundary)
	boundary = boundary or gen_boundary()
	local r = {}
	local _t
	for k,v in pairs(t) do
		tprintf(r, "--%s\r\n", boundary)
		_t = type(v)
		if _t == "string" then
			append_data(r, k, v, {})
		elseif _t == "table" then
			assert(v.data, "invalid input")
			local extra = {
				filename = v.filename or v.name,
				content_type = v.content_type,
				--content_transfer_encoding = v.content_transfer_encoding or "binary",
			}
			append_data(r, k, v.data, extra)
		else
			error(string.format("unexpected type %s", _t))
		end
	end
	tprintf(r, "--%s--\r\n", boundary)
	return table.concat(r), boundary
end

--读取图片文件
function lzReadFileByte(file)
	local f = io.open(file,"rb")
	local retbyte = f:read("*all")
	f:close()
	return retbyte
end

--查询余额
function lzPoint(user, pwd)
	local sz = require("sz")
	local http = require("szocket.http")
	local response_body = {}
	local post_data = string.format("user_name=%s&user_pw=%s", user, pwd);  
	res, code = http.request{  
		url = "http://v1-http-api.jsdama.com/api.php?mod=php&act=point",  
		method = "POST",  
		headers =   
		{  
			["Connection"] = "keep-alive",
			["Content-Type"] = "application/x-www-form-urlencoded",  
			["Content-Length"] = #post_data,  
		},  
		source = ltn12.source.string(post_data),  
		sink = ltn12.sink.table(response_body)  
	}
	
	--解析返回结果
	local strExp = "data\":(.*)}";
	local strBody = table.concat(response_body);
	local strResult = string.match(strBody, strExp);
	return strResult;
end

--图片识别
function lzRecoginze(user, pwd, imagefile, yzmtype)
	local sz = require("sz")
	local http = require("szocket.http")
	local pBuffer = lzReadFileByte(imagefile);
	local rq = {
		user_name = user,
		user_pw = pwd,
		yzm_minlen = "4",
		yzm_maxlen = "5",
		yzmtype_mark = yzmtype,
		zztool_token = "d919639313f4640b5c10eccbc6b1ee7f",
		upload = { filename = "yzm.jpg", content_type = "image/jpeg", data = pBuffer }
	};
	
	local response_body = {};
	
	local boundary = gen_boundary();
	local post_data, bb = encode(rq, boundary);
	
	res, code = http.request{  
		url = "http://v1-http-api.jsdama.com/api.php?mod=php&act=upload",  
		method = "POST",  
		headers =   
		{  
			["Connection"] = "keep-alive",
			["Content-Type"] = fmt("multipart/form-data; boundary=%s", boundary),  
			["Content-Length"] = #post_data,  
		},  
		source = ltn12.source.string(post_data),  
		sink = ltn12.sink.table(response_body)
	}	

	--解析返回结果
	local strBody = table.concat(response_body);
	local bl,tbody = pcall(sz.json.decode,strBody)
	if bl then
		if tbody.result == true then
			local id, vcode = tbody.data.id,tbody.data.val
			if (id == nil or vcode == nil) then
				return false, id, vcode;
			else
				return true, id, vcode;
			end
		else 
			return false,nil,nil,tbody.data
		end
	else 
		return bl,nil,nil,"服务器返回json错误"
	end
end

--打码报错
function lzReportError(user, pwd, yzmid)
	local sz = require("sz")
	local http = require("szocket.http")
	local response_body = {}
	local post_data = string.format("user_name=%s&user_pw=%s&yzm_id=%s", user, pwd, yzmid);  
	res, code = http.request{  
		url = "http://v1-http-api.jsdama.com/api.php?mod=php&act=error",  
		method = "POST",  
		headers =   
		{  
			["Connection"] = "keep-alive",
			["Content-Type"] = "application/x-www-form-urlencoded",
			["Content-Length"] = #post_data,  
		},  
		source = ltn12.source.string(post_data),  
		sink = ltn12.sink.table(response_body)  
	}

	--解析返回结果
	local strExp = "result\":true";
	local strBody = table.concat(response_body);
	local strResult = string.match(strBody, strExp);
	if (strResult ~= nil) then
		return "报错成功";
	else
		return "报错失败";
	end
end

--截图函数
function lzScreen(x1,y1,x2,y2,scale)
	scale = scale or 1;
	local path=userPath().."/res/yzm.jpg";
	snapshot("yzm.jpg",x1,y1,x2,y2,scale);
	--os.remove(path)
	return path;
end