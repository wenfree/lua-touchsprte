require("TSLib")
awzbid = 'AWZ'
require("tsp")

function locks()
	local flag = deviceIsLock();
	if flag == 0 then
	--	log("未锁定");
	else
		unlockDevice(); --解锁屏幕
	end
end


function activeawz(app,t)
	local t = t or 0.5
	locks()
	local bid = frontAppBid();
	if bid == app then
		mSleep(t*1000)
		return true
	else
	    nLog(app.."，准备启动")
		runApp(app)
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
		    if renameCurrentRecord(newName)then
			    return true
		    end
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
			log('ip 地址重复')
			return true
		elseif result == 1 then
			return true
		elseif result == 2 then
			log('正在一键新机ing')
		end
	end	
end

function awzNew()
	local timeLine = os.time()
	local outTime = 60 * 0.5
	while (os.time()-timeLine < outTime) do
		if activeawz(awzbid,3)then
		    if newRecord() then
			    return true
			end
		end
		mSleep(1000)
	end
	nLog('新机超时')
end

if not(t) then
    t = {}
end
t['awz-一键新机横']={0xffffff, "-9|-110|0xffffff,0|-187|0x6f7179,-1|73|0x6f7179,-28|-65|0x6f7179", 90, 577, 445, 654, 724}
t['awz-一键新机竖']={0xffffff, "112|-4|0xffffff,189|0|0x6f7179,-72|0|0x6f7179,64|-28|0x6f7179", 90, 19, 585, 301, 653}

function clickNew()
    closeApp(awzbid,0)
    delay(1)
	local timeLine = os.time()
	local outTime = 60 * 0.5
	while (os.time()-timeLine < outTime) do
		if activeawz(awzbid,3)then
            if d("awz-一键新机横",true) or d("awz-一键新机竖",true) then
                return true
            end
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
function getAll()
	local sz = require("sz");
	local http = require("szocket.http");
	local res, code = http.request("http://127.0.0.1:1688/cmd?fun=getallrecordnames");
	if code == 200 then
		local resJson = sz.json.decode(res);
		local result = resJson.result;
		toast("the result is: " .. result, 2);
		if tonumber(result) == 1 then
			return #readFile('/var/mobile/iggrecords.txt')
		end
	end	
end

function getAllmun()
	timeLine = os.time()
	outTime = 60 * 0.5
	while (os.time()-timeLine < outTime) do
		if activeawz(awzbid,3)then
		else
			return getAll()
		end
		mSleep(1000)
	end
	nLog('设置超时')
end

----获取当前名
function getOnlineName()
	function getName()
		local sz = require("sz");
		local http = require("szocket.http");
		local res, code = http.request("http://127.0.0.1:1688/cmd?fun=getcurrentrecordparam");
		if code == 200 then
			local resJson = sz.json.decode(res);
			local result = resJson.result;
			nLog("the result is: " .. result);
			if tonumber(result) == 1 then
				jg = readFile('/var/mobile/iggparams.txt')
				nLog(jg[1])
				awz_online_name = strSplit(jg[1],'/')
				awz_online_name[2] = awz_online_name[2] or 'AOC'
				nLog(awz_online_name[2])
				return awz_online_name[2]
			end
		end	
	end
	
	timeLine = os.time()
	outTime = 60 * 0.5
	while (os.time()-timeLine < outTime) do
		if activeawz(awzbid,3)then
		else
			return getName()
		end
		mSleep(1000)
	end
	nLog('设置超时')
end

function getTrueName_awz()
	function getTrueName()
		local sz = require("sz");
		local http = require("szocket.http");
		local res, code = http.request("http://127.0.0.1:1688/cmd?fun=getcurrentrecordparam");
		if code == 200 then
			local resJson = sz.json.decode(res);
			local result = resJson.result;
			nLog("the result is: " .. result);
			if tonumber(result) == 1 then
				jg = readFile('/var/mobile/iggparams.txt')
				return jg[1],jg[4]		--name,idfa
			end
		end	
	end

	timeLine = os.time()
	outTime = 60 * 0.5
	while (os.time()-timeLine < outTime) do
		if activeawz(awzbid,3)then
		else
			return getTrueName()
		end
		mSleep(1000)
	end
end

--new 新封装
function new_fun(todos)
    local timeLine = os.time()
    local outTime = 10
    while (os.time()-timeLine < outTime) do
        if activeawz(awzbid,3)then
        	local sz = require("sz");
        	local http = require("szocket.http");
        	local res, code = http.request("http://127.0.0.1:1688/cmd?fun="..todos);
        	if code == 200 then
            	local resJson = sz.json.decode(res);
        		local result = resJson.result;
        		return result
        	end
        end
    end
end

require('tsp')

function setAWZ(id)
    if  new_fun( 'getallrecordnames')  == 1 then
        jg = readFile('/var/mobile/iggrecords.txt')
        log( jg )
        for k,v in ipairs( jg ) do
            local a,b = string.find(v,id)
            if ( a ) then
                new_fun( "activerecord&record="..v )
                delay(1)
                reName(id..'-'..__game.note)
                delay(1)
                return true
            end
        end
        clickNew()
        delay(5)
        reName(id..'-'..__game.note)
        local i = 0
        while i < 20 do
            if active(_app.bid,5)then
                if d("弹窗-掉档") then
                    return true
                elseif d("e-同意并继续",true,1,2) or d("e-同意并继续6s",true) then
                end
            end
            i=i+1
            delay(1)
        end
    end
end

















nLog('new 加截完成')