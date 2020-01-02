-- 积分墙对接
-- xiaoq.lua  

-- Create By TouchSpriteStudio on 13:15:24   
-- Copyright © TouchSpriteStudio . All rights reserved.




package.loaded['AWZ'] = nil
require("TSLib")
require("AWZ")
require("tsp")

local var={}
local jfq={}
jfq.url = 'https://m.applyape.com/api/'
jfq.model = ''
jfq.adid = '217490'
jfq.appid = '1476137545'
jfq.kid	= '贵州石油'
jfq.idfa = ''
jfq.os_version = ''
jfq.device = 'iPhone10,2'
jfq.source = 'pengzhi'
jfq.udid = ''
jfq.callback = false
jfq.name = '51车主加油'
jfq.bid = 'com.chezhu.chezhu'


function start()
	local info = getOnlineName()
	jfq.idfa = strSplit(info[8],":")[2]
	jfq.os_version = strSplit(info[3],":")[2]
	jfq.udid = strSplit(info[4],":")[2]
end

function idfa_idfaPc()
	jfq.model = 'idfaPc'
	local service = jfq.url..jfq.model
	local postArr = {}
	postArr.adid = jfq.adid
	postArr.appid = jfq.appid
	postArr.ip = ip()
	postArr.kid = urlEncoder(jfq.kid)
	postArr.os_version = jfq.os_version
	postArr.device = jfq.device
	postArr.source = jfq.source
	postArr.udid = jfq.udid
	postArr.idfa = jfq.idfa
--	log(postArr)
	local res = post(service,postArr)
	if (res[jfq.idfa] == '0') then
		log("排重成功","all")
		return true
	end
end

function idfa_click()
	jfq.model = 'click'
	local service = jfq.url..jfq.model
	local postArr = {}
	postArr.adid = jfq.adid
	postArr.appid = jfq.appid
	postArr.ip = ip()
	postArr.kid = urlEncoder(jfq.kid)
	postArr.os_version = jfq.os_version
	postArr.device = jfq.device
	postArr.source = jfq.source
	postArr.udid = jfq.udid
	postArr.idfa = jfq.idfa
	if jfq.callback then
		postArr.callbackurl = urlEncoder("http://wenfree.cn/api/Public/idfa/?service=Idfa.Callback&idfa="..jfq.idfa.."&appid="..jfq.appid)
	end
--	log(postArr)
	local res = post(service,postArr)
	if (res['code'] == '0' or res['code'] == 0 ) then
		log("点击成功","all")
		return true
	end
end

function idfa_activate()
	jfq.model = 'activate'
	local service = jfq.url..jfq.model
	local postArr = {}
	postArr.adid = jfq.adid
	postArr.appid = jfq.appid
	postArr.ip = ip()
	postArr.kid = urlEncoder(jfq.kid)
	postArr.os_version = jfq.os_version
	postArr.device = jfq.device
	postArr.source = jfq.source
	postArr.udid = jfq.udid
	postArr.idfa = jfq.idfa

	local res = post(service,postArr)
	if (res['code'] == '0' or res['code'] == 0 ) then
		log("上报成功","all")
		return true
	end
end

function up(name,other)
	local url = 'http://wenfree.cn/api/Public/idfa/'
	local idfalist ={}
	idfalist.service = 'Idfa.Idfa'
	idfalist.phonename = getDeviceName()
--	idfalist.phoneimei = getIMEI()
	idfalist.phoneos = jfq.os_version
	idfalist.idfa = jfq.idfa
	idfalist.ip = ip()
	idfalist.account = jfq.kid
	idfalist.password = var.password
	idfalist.phone = var.phone
	idfalist.appid = jfq.appid
	idfalist.name = name
	idfalist.other = other
	return post(url,idfalist)
end




t={}
local degree = 85
t['agree']={0xff5100,"-196|-35|0xff7f00,-507|24|0xf2f2f2",degree,48,1124,707,1274}
t['skip']={0xf2f2f2,"506|-8|0xff4800,-17|-45|0xf2f2f2",degree,43,1190,713,1319}

function app()
	local timeLine = os.time()
	while os.time() - timeLine < rd(20,30) do
		if active(jfq.bid,5)then
			if d("agree",true,2)then
			elseif d("skip",true,2)then
			end
		end
		delay(1)
	end
end

function all()
	vpnx()
	if(vpn())then
		awzNew()
		start()
		if (idfa_idfaPc())then
			up(jfq.name,'排重成功')
			if(idfa_click())then
				app()
				if not(jfq.callback) then
					idfa_activate()
				end
			end
		end
	end
end

while (true) do
	local ret,errMessage = pcall(all)
	if ret then
	else
		log(errMessage)
		dialog(errMessage, 10)
		mSleep(2000)
	end
end















