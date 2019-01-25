--[[
	ios8.0-8.2
	aso 评论脚本
	据说是低版本的不删除

*      
*          ┌─┐       ┌─┐
*       ┌──┘ ┴───────┘ ┴──┐
*       │                 │
*       │       ───       │
*       │  ─┬┘       └┬─  │
*       │                 │
*       │       ─┴─       │
*       │                 │
*       └───┐         ┌───┘
*           │         │
*           │         │
*           │         │
*           │         └──────────────┐
*           │                        │
*           │                        ├─┐
*           │                        ┌─┘    
*           │                        │
*           └─┐  ┐  ┌───────┬──┐  ┌──┘         
*             │ ─┤ ─┤       │ ─┤ ─┤         
*             └──┴──┘       └──┴──┘ 
*                 神兽保佑 
*                 代码无BUG! 

--]]

require("tsp")
ApiVersion = 1 --//爱奇艺全局参数
w,h = getScreenSize() --//屏幕大小
service = 'http://iqiyi.safoo.com.cn/'
username = 'admin'
pass = '1234qwer'
phone_uid = getDeviceID()
local sz = require("sz")
phone_name = sz.system.mgcopyanswer("UserAssignedDeviceName")

function phone(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	ApiUrl = service.."api/check_ip"

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = ApiUrl
	headers_send = cjson.encode(headers)

	post_send = cjson.encode(t)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(ApiUrl, 3, headers_send, post_escaped)
	
	nLog(status_resp)
	if status_resp == 200 then
		nLog('通讯成功')
		local json = sz.json
		phoneData = json.decode(body_resp)
		if phoneData.code == 0 then
			toast(phoneData.message,3)
			nLog('上传成功')
			return true
		else
			toast(phoneData.message,3)
		end
	end
end

function check_ip()
	t = {}
	t.username = username
	t.pass = pass
	t.ip = ip()
	t.phone_uid = phone_uid
	t.phone_name = phone_name
	-----伪装参数------
	t.version = 'iphone5s'
	t.os_version = '8.1.2'
	t.network = 'wifi'
	t.device_name = '设备名'
	t.capacity = '16g'
	t.carrier = '电信'
	t.udid = 'UDID'
	t.imei = 'IMEI'
	t.series_number = '序列号' 
	t.mac_address = '00:20:00:00:00:00:00'
	t.idfa = 'IDFA'
	t.idfv = 'IDFV'
	t.ssid = 'SSID'
	t.bssid = 'BSSID'
	
	t.idfa = '68753A44-4D6F-1226-9C60-0050E4C00067'
	
	if phone(t)then
		return true
	end
end
check_ip()

function task(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	ApiUrl = service.."api/get_task"

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = ApiUrl
	headers_send = cjson.encode(headers)

	post_send = cjson.encode(t)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(ApiUrl, 3, headers_send, post_escaped)
	
	nLog(body_resp)
	if status_resp == 200 then
		nLog('通讯成功')
		local json = sz.json
		taskData = json.decode(body_resp)
		if taskData.code == 0 then
			toast(taskData.message,3)
			nLog('上传成功')
			return true
		else
			toast(taskData.message,3)
		end
	end
end

function get_task()
	t = {}
	t.username = username
	t.pass = pass
	t.ip = ip()
	t.phone_uid = phone_uid
	t.phone_name = phone_name
	-----伪装参数------
	
	if task(t)then
		return true
	end
end

function up(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	ApiUrl = service.."api/upload_task"

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = ApiUrl
	headers_send = cjson.encode(headers)

	post_send = cjson.encode(t)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(ApiUrl, 3, headers_send, post_escaped)
	
	nLog(body_resp)
	if status_resp == 200 then
		nLog('通讯成功')
		local json = sz.json
		last = json.decode(body_resp)
		if last.code == 0 then
			toast(last.message,3)
			nLog('上传成功')
			return true
		else
			toast(last.message,3)
		end
	end
end

function upload_task(task_id)
	t={}
	t.username = username
	t.pass = pass
	t.ip = ip()
	t.phone_uid = phone_uid
	t.phone_name = phone_name
	t.success = 'yes'
	t.task_id = task_id
	计时 = os.time()
	while (os.time()-计时 < 60 * 1) do
		if up(t) then
			return true
		else
			mSleep(1000* 2)
		end
	end
end












