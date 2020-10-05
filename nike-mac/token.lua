
require('tsp')

--读文件
function readFile_(path)
	local path = path or '/var/mobile/Media/TouchSprite/lua/account.txt'
    local file = io.open(path,"r");
    if file then
        local _list = '';
        for l in file:lines() do
            _list = _list..l
        end
        file:close();
        return _list
    end
end

function local_token()
	local appbid = 'com.nike.onenikecommerce'
	local localPath = appDataPath(appbid).."/Documents/ifkc.plist" --设置 plist 路径
	return readFile_(localPath)
end


--写入
function writeFile_(info,way,path)
	local path = path or '/var/mobile/Media/TouchSprite/lua/account.txt'
	local way = way or 'a'
	local f = assert(io.open(path, way))
    f:write(info)
	f:write('')
    f:close()
end

--用http.get实现下载文件功能
local sz = require("sz")
local cjson = sz.json
local http = sz.i82.http
function downFile(url, path)
    status, headers, body = http.get(url)
    if status == 200 then
        file = io.open(path, "wb")
        if file then
            file:write(body)
            file:close()
            return true
        else
            return -1;
        end
    else
        return status;
    end
end
--取帐空闲帐号
function AccountInfoBack()
	local sz = require("sz")
	local json = sz.json
	local appbid = 'com.nike.onenikecommerce'
	local AccountInfo = appDataPath(appbid).."/Documents/ifkc.plist"
	local url = 'http://nikeapi.honghongdesign.cn/' .. var.account.token
	downFile(url, AccountInfo)
	mSleep(2000)
end





