-- 积分墙合集
-- axj.lua

-- Create By TouchSpriteStudio on 20:35:53   
-- Copyright © TouchSpriteStudio . All rights reserved.
	
	

require("TSLib")
require('tsp')
local axjbid = 'YOY'

function locks()
	local flag = deviceIsLock();
	if flag == 0 then
	else
		unlockDevice(); --解锁屏幕
	end
end
function activeaxj(app,t)
	t = t or 0.5
	locks()
	local bid = frontAppBid();
	if bid ~= app then
		nLog(app.."，准备启动")
		runApp(app)
		mSleep(t*1000)
		return true
	end
end

function axj_next()
	function nextrecord()
		local sz = require("sz");
		local http = require("szocket.http");
		local res, code = http.request("http://127.0.0.1:1688/cmd?fun=nextrecord");
		if code == 200 then
			local resJson = sz.json.decode(res);
			local result = resJson.result;
			nLog("the result is: " .. result);
			if tonumber(result) == 1 then
				return true
			end
		end	
	end
	
	local out_time = os.time()
	while os.time()-out_time <= 10 do
		if activeaxj(axjbid,2)then
		elseif nextrecord()then
			return true
		end
		mSleep(1000* 2)
	end
end

function axj_new()
	local timeLine = os.time()
	local outTime = 60 * 0.5

	function newRecord()
		local sz = require("sz");
		local http = require("szocket.http");
		local res, code = http.request("http://127.0.0.1:1688/cmd?fun=newrecord");
		if code == 200 then
			local resJson = sz.json.decode(res);
			local result = resJson.result;
			nLog("the result is: " .. result);
			if result == 3 then
				--//IP地址重复
				dialog('ip 地址重复', 3)
				return true
			elseif result == 1 then
				return true
			elseif result == 2 then
				toast('正在一键新机ing',1)
			end
		end	
	end

	while (os.time()-timeLine < outTime) do
		if activeaxj(axjbid,3)then
		elseif newRecord() then
			return true
		end
		mSleep(1000)
	end
	nLog('新机超时')
end

function axj_info()
	function info()
		local sz = require("sz");
		local http = require("szocket.http");
		local res, code = http.request("http://127.0.0.1:1688/cmd?fun=getcurrentrecordparam");
		if code == 200 then
			local resJson = sz.json.decode(res);
			local result = resJson.result;
			nLog("the result is: " .. result);
			if tonumber(result) == 1 then
				local infotxt = readFile('/var/mobile/iggparams.txt')
				local infotable = {}
				for k,v in ipairs(infotxt) do
					local tb = strSplit(v,':')
					if tb[1] == 'MAC' or tb[1] == 'BSSID' then
						infotable[tb[1]] = tb[2]..":"..tb[3]..":"..tb[4]..":"..tb[5]..":"..tb[6]..":"..tb[7]
					else
						infotable[tb[1]] = tb[2]
					end
				end
				return infotable
			end
		end	
	end
	
	local out_time = os.time()
	while os.time()-out_time <= 10 do
		if activeaxj(axjbid,2)then
		else
			return info()
		end
		mSleep(1000* 2)
	end
end
nLog('AXJ 加截完成')














