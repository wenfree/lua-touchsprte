local url = "http://wenfree.cn/static/version.txt"
local sz = require("sz")
local http = require("szocket.http")
local version, code = http.request(url);
if code == 200 then
	version = tonumber(version)
	nLog(version)
end

function downFile(url, path)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	local status, headers, body = http.get(url)
	if status == 200 then
		file = io.open(path, "wb")
		if file then
			file:write(body)
			file:close()
			return status;
		else
			return -1;
		end
	else
		return status;
	end
end

local localversion = 1
if localversion >= version then
	nLog('版本相同无需更新')
else
	nLog('下载新版本')
	local web_url = "http://wenfree.cn/static/tsp.lua";
	local local_url = "/User/Media/TouchSprite/lua/tsp.lua";
	if downFile(web_url,local_url)then
		require("tsp")
		log('tsp下载成功', 2)
	end
end



function llsGameToken()
	local appbid = 'com.lilithgame.sgame'
	local AccountInfo = appDataPath(appbid).."/Documents/AccountInfo.json"
	local account = readFileString(AccountInfo)
	log(account)
	local sz = require("sz")
	local json = sz.json
	local newTable = json.decode(account)
	return newTable[1].app_token
end
function AccountInfo()
	local appbid = 'com.lilithgame.sgame'
	local AccountInfo = appDataPath(appbid).."/Documents/AccountInfo.json"
	local account = readFileString(AccountInfo)
	log(account)
	local sz = require("sz")
	local json = sz.json
	local newTable = json.decode(account)
	local back_token = newTable[1].app_token.."|"..newTable[1].app_uid.."|"..newTable[1].player_id
	log(back_token)
	return back_token
end



log(appDataPath(appbid))















