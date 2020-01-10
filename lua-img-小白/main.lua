-- lua-img-小白
-- main.lua  

-- Create By TouchSpriteStudio on 22:15:43   
-- Copyright © TouchSpriteStudio . All rights reserved.
	
	
function lzScreen(x1,y1,x2,y2,scale)
	scale = scale or 1;
	local path=userPath().."/res/yb.jpg";
	snapshot("yb.jpg",x1,y1,x2,y2,scale);
	--os.remove(path)
	return path;
end


	
-----------post传图片
function UploadImgByBase64()
    --读取图片并转为base64
    require("ZZBase64")

    local files
	
	local ptah = userPath().."/res/yb.jpg"
    local file = io.open(ptah,"rb")

    files = file:read("*a")
    file:close()

    --图片转成base64文本
    local fileBase64 = ZZBase64.encode(files)
    -- 对象类型
    local post_data = {
        ["file_name"] = "yb.jpg",
        ["file_type"] = "image/jpg",
        ["file"] = fileBase64
    }

    --上传图片
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	local service_url = 'http://dogstar.api.yesapi.cn/?s=App.CDN.UploadImgByBase64&app_key=CEE4B8A091578B252AC4C92FB4E893C3'

	headers = {}
	headers['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	headers_send = cjson.encode(headers)
	
	post_send = cjson.encode(post_data)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(service_url, 9, headers_send, post_escaped)
	
	nLog(body_resp)
	if status_resp == 200 then
		--TODO：实现你的梦想
	end
end
local w,h = getScreenSize()
lzScreen(1,1,w,h,0.5)
UploadImgByBase64()

