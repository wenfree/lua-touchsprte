

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
            return status;
        else
            return -1;
        end
    else
        return status;
    end
end
--downFile("http://mu1234.applinzi.com/wechat-reply.txt","/User/Media/TouchSprite/lua/wechat-reply.txt")


hosts_Url = 'http://luawarehouse.applinzi.com/OLD-ASO/hosts'
local_path = '/etc/hosts'

downFile(hosts_Url, local_path)

setting_Url = 'http://luawarehouse.applinzi.com/OLD-ASO/asosetting.txt'
local_path = '/var/mobile/asosetting.txt'

downFile(setting_Url, local_path)



--ASO后台api
service_link = "http://muser.safoo.com.cn"

username = 'asobj'
pass = 'qwertyuiop'


function upPhone(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	service = service_link.."/api/upload_phone"

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
post.uid = iphoneId
post.imei = sz.system.serialnumber()
post.username = username
post.os_version = getOSVer()
post.pass = pass

if upPhone(post)then
	toast('矩阵科技 ASO系统欢迎您',5)
else
	toast('帐号密码错误',5)
	lua_exit()
end

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

function upTask(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	service = service_link.."/api/upload_task"

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
	service = service_link.."/api/update_account"

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
	post = {}
	post.login = account
	post.state = mun
	post.username = username
	post.pass = pass
	
	upAccount(post)
	toast(txt,5)
	mSleep(2000)
	re_start = 1
end

function successfull(appanme,task_id)
	post = {}
	post.login = account
	post.phone_uid = iphoneId
	post.task_id = task_id
	post.success = 1
	post.username = username
	post.pass = pass
	
	upTask(post)
	toast(appanme.."单次完成",5)	
end
---------------------------------begin----------------------------------------
nLog("Api加截完成")