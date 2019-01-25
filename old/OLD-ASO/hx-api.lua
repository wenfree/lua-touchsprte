--ASO后台api

service = "http://aso.acnacn.cn/f/"

function upPhone(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	local url = service.."api/devicephone/savePhone"

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = service
	headers_send = cjson.encode(headers)
	
	post_send = cjson.encode(t)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(service, 3, headers_send, post_escaped)
	
	nLog(body_resp)
	if status_resp == 200 then
		nLog('通讯成功')
		local json = sz.json
		loginData = json.decode(body_resp)
		
		if loginData.code == 0 then
			nLog("接口成功")
			mSleep(200)
			return true
		end
	end
end

local sz = require("sz")
iphoneName = sz.system.mgcopyanswer("UserAssignedDeviceName")  --设备名
iphoneId = getDeviceID(); --帮你玩禁用此函数--触动精灵唯一函数

post = {}
post.name = iphoneName
post.touchSpriteCode = iphoneId
post.udid = sz.system.serialnumber()
post.version = getOSVer()

if upPhone(post)then
	toast('矩阵科技 ASO系统欢迎您',5)
else
	toast('帐号密码错误',5)
	lua_exit()
end

function upPhone()
	get_url = service..'api/devicephone/savePhoneapi?name='..iphoneName..'&touchSpriteCode='..iphoneId..'&udid='..sz.system.serialnumber().."&version="..getOSVer()
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(get_url);
	nLog(res)
	if code == 200 then

	end
end
--upPhone()




function GetTask()
	get_task_url = service_link..'/api/get_task?phone_uid='..iphoneId..'&username='..username..'&pass='..pass
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(get_task_url);
	nLog(res)
	if code == 200 then
		local json = sz.json
		data = json.decode(res)
		nLog("取任务接口通讯成功")
		mSleep(200)
		if data.code == 0 then
			account = data['account']["login"]
			password = data['account']["password"]
			nLog(account.."\n"..password)
			return true
		else
			toast("暂时没有任务休息30秒",40)
			mSleep(30*1000)
		end
	end
end

---------------------------------begin----------------------------------------
nLog("Api加截完成")