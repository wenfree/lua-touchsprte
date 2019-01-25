awzbid = 'AWZ'

function locks()
	flag = deviceIsLock();
	if flag == 0 then
	--	log("未锁定");
	else
		unlockDevice(); --解锁屏幕
	end
end
function activeawz(app,t)
	t = t or 0.5
	locks()
	bid = frontAppBid();
	if bid ~= app then
		nLog(app.."，准备启动")
		runApp(app)
		mSleep(t*1000)
		return true
	end
end

function awz()
	openURL("IGG://cmd/newrecord");
	mSleep(3000)
	logTxt = '/var/mobile/iggresult.txt'
	out_time = os.time()
	while os.time()-out_time <= 10 do
		if activeawz(awzbid,2)then
		elseif file_exists(logTxt)then
			local new = readFile(logTxt)[1]
			if new == "1" then
				return true
			elseif new == "3" then
				toast('IP-->重复请注意',1)
				return true
			elseif new == '2' then
				toast('一键新机中',2)
			end
			mSleep(2000)
		end
		mSleep(1000* 3)
	end
end

function awz_next()
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
	
	out_time = os.time()
	while os.time()-out_time <= 10 do
		if activeawz(awzbid,2)then
		elseif nextrecord()then
			return true
		end
		mSleep(1000* 2)
	end
end


function renameCurrentRecord(name)
	local sz = require("sz");
	local http = require("szocket.http");
	local res, code = http.request("http://127.0.0.1:1688/cmd?fun=renamecurrentrecord&name="..name);
	if code == 200 then
		local resJson = sz.json.decode(res);
		local result = resJson.result;
		nLog("the result is: " .. result);
		return true
	end	
end
function reName(newName)
	timeLine = os.time()
	outTime = 60 * 0.5
	while (os.time()-timeLine < outTime) do
		if activeawz(awzbid,3)then
		elseif renameCurrentRecord(newName)then
			return true
		end
		mSleep(1000)
	end
	nLog('重命令超时')
end

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

function awzNew()
	timeLine = os.time()
	outTime = 60 * 0.5

	while (os.time()-timeLine < outTime) do
		if activeawz(awzbid,3)then
		elseif newRecord() then
			return true
		end
		mSleep(1000)
	end
	nLog('新机超时')
end


function setCurrentRecordLocation(location)
	local sz = require("sz");
	local http = require("szocket.http");
	local res, code = http.request("http://127.0.0.1:1688/cmd?fun=setcurrentrecordlocation&location="..location);
	if code == 200 then
		local resJson = sz.json.decode(res);
		local result = resJson.result;
		toast("the result is: " .. result, 2);
		if tonumber(result) == 1 then
			return true
		end
	end	
end

function NewPlace(location)
	timeLine = os.time()
	outTime = 60 * 0.5

	while (os.time()-timeLine < outTime) do
		if activeawz(awzbid,3)then
		elseif setCurrentRecordLocation(location) then
			return true
		end
		mSleep(1000)
	end
	nLog('设置超时')
end

--("116.7361382365_39.8887921413_北京老胡同")








nLog('AWZ 加截完成')