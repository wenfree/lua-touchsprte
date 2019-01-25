
iphoneId = getDeviceID(); --帮你玩禁用此函数--触动精灵唯一函数
name = getDeviceName()
ios = getOSVer()
Service_Link = 'http://weimiaoli.cn/api/'


function get_config()
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	service = Service_Link..'get_config'

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = service
	headers_send = cjson.encode(headers)

	getConfig = {}
	getConfig.name = name
	getConfig.phone_uid = iphoneId
	getConfig.login = login
	getConfig.pass = password
	getConfig.version = ios
	getConfig.auth = 1
	getConfig.online = 1
	post_send = cjson.encode(getConfig)
	
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(service, 3, headers_send, post_escaped)
--	nLog(post_send)
	nLog(body_resp)
	
	if status_resp == 200 then
		nLog('服务器通讯成功')
		local json = sz.json
		datas = json.decode(body_resp)
		if datas.code == 0 then
			nLog('返回成功值')
			return true
		end
	end
end


function get_task()
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	service = Service_Link..'get_task'

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = service
	headers_send = cjson.encode(headers)

	getTask = {}
	getTask.phone_uid = iphoneId
	getTask.login = login
	getTask.pass = password
	post_send = cjson.encode(getTask)

	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(service, 3, headers_send, post_escaped)
--	nLog(post_send)
--	nLog(body_resp)

	if status_resp == 200 then

		local json = sz.json
		tasks = json.decode(body_resp)
		nLog('通讯成功-->'..tasks.message)
			
		if tasks.code == 0 then
			nLog('获取任务成功')
			return true
		end
	end
end

function up_Task(state)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	service = Service_Link..'upload_task'

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = service
	headers_send = cjson.encode(headers)

	upTask = {}
	upTask.phone_uid = iphoneId
	upTask.task_id = tasks.task.task_id
	upTask.success = state
	upTask.login = login
	upTask.pass = password
	post_send = cjson.encode(upTask)

	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(service, 3, headers_send, post_escaped)
--	nLog(post_send)
--	nLog(body_resp)

	if status_resp == 200 then
		local json = sz.json
		uptasks = json.decode(body_resp)
		nLog('通讯成功-->'..uptasks.message)
		if uptasks.code == 0 then
			nLog('保存成功')
			return true
		end
	end
end

function up_V1(v_code)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	service = Service_Link..'upload_v_code'

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = service
	headers_send = cjson.encode(headers)

	post = {}
	post.phone_uid = iphoneId
	post.v_code = v_code
	post.login = login
	post.pass = password
	post_send = cjson.encode(post)

	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(service, 3, headers_send, post_escaped)

	if status_resp == 200 then
		local json = sz.json
		v1uptask = json.decode(body_resp)
		nLog('通讯成功-->'..v1uptask.message)
		if v1uptask.code == 0 then
			nLog('保存成功')
			return true
		end
	end
end

function getIndentSpace(indent)
     local str = ""
     for i =1, indent do
          str = str .. " "
     end
     return str
end
function newLine(indent)
     local str = "\n"
     str = str .. getIndentSpace(indent)
     return str
end
function createKeyVal(key, value, bline, deep, indent)
     local str = "";
     if (bline[deep]) then
     str = str .. newLine(indent)
     end
     if type(key) == "string" then
          str = str.. key .. " = "
     end
     if type(value) == "table" then
          str = str .. getTableStr(value, bline, deep+1, indent)
     elseif type(value) == "string" then
          str = str .. '"' .. tostring(value) .. '"'


     else
          str = str ..tostring(value)
     end
     str = str .. ","
     return str
end
function getTableStr(t, bline, deep, indent)
     local str
     if bline[deep] then
          str = newLine(indent) .. "{"
          indent = indent + 4
     else
          str = "{"
     end
     for key, val in pairs(t) do
          str = str .. createKeyVal(key, val, bline, deep, indent)
     end
     if bline[deep] then
          indent = indent-4
          str = str .. newLine(indent) .. "}"
     else
          str = str .. "}"
     end
     return str
end
function printtable(t)
     local str = getTableStr(t, {true, true, true}, 1, 0)
     nLog(str)
end

--[[
login = 'wenhong'
password = '1234qwer'
--get_config()
--get_task()
--mSleep(1000)
--up_Task('yes')
--printtable(datas)
--printtable(tasks)
--]]
nLog("api加截完成")


