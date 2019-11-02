






--深度打印一个表,可以单独调用
function print_r(t)
	local print_r_cache={}
	local function sub_print_r(t,indent)
		if (print_r_cache[tostring(t)]) then
			nLog(indent.."*"..tostring(t))
		else
			print_r_cache[tostring(t)]=true
			if (type(t)=="table") then
				for pos,val in pairs(t) do
					if type(pos) == "string" then
						pos = "'"..pos.."'"
					end
					if (type(val)=="table") then
						nLog(indent.."["..pos.."] = {   --"..tostring(t))
						sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
						nLog(indent..string.rep(" ",string.len(pos)+6).."},")
					elseif (type(val)=="string") then
						nLog(indent.."["..pos.."] = ".."'"..val.."',")
					else
						nLog(indent.."["..pos.."] = "..tostring(val)..",")
					end
				end
			else
				nLog(indent..tostring(t))
			end
		end
	end
	if (type(t)=="table") then
		nLog("{  --"..tostring(t))
		sub_print_r(t,"	")
		nLog("}")
	elseif (type(t)=="string") then
		nLog(t)
	end
end

--打印函数,日志函数
function log(txt,show,times)
    if txt == nil or txt == '' then txt = 'Null'end
	local times = 1;
	if type(txt) == 'table' then
		print_r(txt)
		if show then log('table',true) end
    else
        if show == 'all' then
            toast(show,times)
            nLog(txt)
        elseif show then
            toast(txt,times)
        else
            nLog(txt)
        end
	end
end

--文件按行写入------------文件路径，内容，方式（a为追加，w清除重写，）
function writeFile(file_name,string,way)
	local string = string or "0.0.0.0"
	local way = way or 'a'
	local f = assert(io.open(file_name, way))
	f:write(string.."\n")
	f:close()
end
--将指定文件中的内容按行读取,返回一个表
function readFile(path)
    local file = io.open(path,"r");
    if file then
        local _list = {};
        for l in file:lines() do
            table.insert(_list,l)
        end
        file:close();
        return _list
    end
end


--存入一个表
function saves(path,t)
	for i,v in ipairs(t)do
		if i == 1 then
			writeFile(path,v,"w")
		else
			writeFile(path,v)
		end
	end
end
--读出表
function readAccount(accunt_path)
	return readFile(accunt_path)
end

account = {}
account[1] = "11231313|123123123"
account[2] = "11233313|123123123"
account[3] = "3333313|123123123"
account[4] = "12222313|123123123"
account[5] = "222313|123123123"
local accunt_path = "/User/Media/TouchSprite/lua/1.txt"
saves(accunt_path,account);
--先默认写入一些数据


while (true) do
	a = readAccount(accunt_path)--读出数据
	log(a)
	if #a == 1 then
		return
	end
	mSleep(2000)
	table.remove(a,1)--清除第一项
	mSleep(1000)
	saves(accunt_path,a)--重新写入
end
log("END")





