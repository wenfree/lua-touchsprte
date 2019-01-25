--ASO后台api
service_link = "http://aso.lelingnet.com/"
secret = "effbee6651036ad6baa340e4992a68e6ed0215"

function upPhone(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	service = service_link.."api/upload_phone"

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = service
	headers_send = cjson.encode(headers)

	post_send = cjson.encode(t)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(service, 3, headers_send, post_escaped)
	
	nLog(status_resp)
	if status_resp == 200 then
		nLog('上传成功')
		return true
	end
end

function GetTask()
	get_task_url = service_link..'api/get_task?phone_uid='..iphoneId..'&secret='..secret
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(get_task_url);
	nLog(res)
	if code == 200 then
		local json = sz.json
		data = json.decode(res)

		nLog("接口成功")
		mSleep(200)
		
		if data.code ~= -1 then
		
			account = data['account']["login"]
			password = data['account']["password"]
			nLog(account.."\n"..password)

			return true
		else
			toast("暂时没有任务休息60秒",55)
			mSleep(55*1000)
		end
	end
end

function upTask(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	service = service_link.."api/upload_task"

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = service
	headers_send = cjson.encode(headers)

	post_send = cjson.encode(t)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(service, 3, headers_send, post_escaped)
	
	nLog(status_resp)
	if status_resp == 200 then
		nLog('上传成功')
		return true
	end
end


function upAccount(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	service = service_link.."api/update_account"

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = service
	headers_send = cjson.encode(headers)

	post_send = cjson.encode(t)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(service, 3, headers_send, post_escaped)
	
	nLog(status_resp)
	if status_resp == 200 then
		nLog('上传成功')
		return true
	end
end

function errorAccount(txt,mun)
	upStat = {}
	upStat.login = account
	upStat.state = mun
	upStat.secret = secret
	upAccount(upStat)
	toast(txt,5)
	mSleep(2000)
	re_start = 1
end
function successfull(appanme,task_id)
	up = {}
	up.login = account
	up.phone_uid = iphoneId
	up.task_id = task_id
	up.success = 1
	up.secret = secret
	upTask(up)
	toast(appanme.."完成一次",5)	
end
---------------------------------begin----------------------------------------
local sz = require("sz")
iphoneName = sz.system.mgcopyanswer("UserAssignedDeviceName")  --设备名
iphoneId = getDeviceID(); --帮你玩禁用此函数--触动精灵唯一函数
---------------------------------------------------------------------
post = {}
post['name'] = "DaLian-"..iphoneName
post['uid'] = iphoneId
post['secret'] = secret
nLog(post.name.."-"..iphoneId)
toast("ASO开始啦",2)
mSleep(math.random(1,2000))
upPhone(post)
nLog("Api加截完成")

