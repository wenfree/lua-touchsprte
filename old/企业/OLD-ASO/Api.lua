--ASO后台api
service_link = "http://dalian.zhangdabei.com:3000/"

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
	
	nLog(status_resp)
	if status_resp == 200 then
		nLog('上传成功')
		return true
	end
end
--[[
	post http://store.zhangdabei.com:3000/api/upload_phone
	参数
	{ :name=>
	"name",:uid=>"uid",:secret=>"effbee6651036ad6baa340e4992a68e6ed0215"}
]]
-----------upPhone(po)

function GetTask()
	secret = "effbee6651036ad6baa340e4992a68e6ed0215"
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
			--[[
			for i,v in pairs(data.tasks)do
				for o,p in pairs(v)do
					if p == false then
						p = 'false'
						nLog(o..':'..p)
					elseif type(p) == "table" then
						nLog("这是一个表格")
						for k,l in pairs(p)do
							nLog(k.."---"..l)
						end
					elseif p == true then
						p = "true"
						nLog(o..':'..p)
					else
						nLog(o..':'..p)
					end
					mSleep(200)
				end
			end
			--]]
			return true
		else
			toast("暂时没有任务休息60秒",55)
			mSleep(55*1000)
		end
	end
end
--//http://store.zhangdabei.com:3000/api/get_task?phone_uid=xx&secret=effbee6651036ad6baa340e4992a68e6ed0215
--GetTask()

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

--[[
	--http://store.zhangdabei.com:3000/api/upload_task
	{ :login=>"login", :phone_uid=> phone.uid,:task_id=> task.id,:success=>1
	,:secret=>"effbee6651036ad6baa340e4992a68e6ed0215"}
	--------------------------------------------------------
	up = {}
	up.login = account
	up.phone_uid = iphoneId
	up.task_id = data['task']['task_id']
	up.success = 1
	up.secret = "effbee6651036ad6baa340e4992a68e6ed0215"

	upTask(t)

--]]

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
	upStat.secret = "effbee6651036ad6baa340e4992a68e6ed0215"
	upAccount(upStat)
	toast(txt,5)
	mSleep(2000)
	re_start = 1
end
--[[
	post 
	http://store.zhangdabei.com:3000/api/update_account
	参数
	{ :login=> "this is login",:secret=>"effbee6651036ad6baa340e4992a68e6ed0215"}
	]
	account = "l_ke88@126.com"
	upStat = {}
	upStat.login = account
	upStat.state = 1
	upStat.secret = "effbee6651036ad6baa340e4992a68e6ed0215"
	upAccount(upStat)
	lua_exit()
--]]

---------------------------------begin----------------------------------------
local sz = require("sz")
iphoneName = sz.system.mgcopyanswer("UserAssignedDeviceName")  --设备名
iphoneId = getDeviceID(); --帮你玩禁用此函数--触动精灵唯一函数
---------------------------------------------------------------------
post = {}
post['name'] = "DaLian-"..iphoneName
post['uid'] = iphoneId
post['secret'] = "effbee6651036ad6baa340e4992a68e6ed0215"
nLog(post.name.."-"..iphoneId)
toast("ASO开始啦",2)
mSleep(math.random(1,2000))
upPhone(post)
nLog("Api加截完成")

--GetTask()
--[[	--]
mSleep(1000)
nLog('即将上传')
up = {}
up.login = account
up.phone_uid = iphoneId
up.task_id = data['task']['task_id']
up.success = 1
up.secret = "effbee6651036ad6baa340e4992a68e6ed0215"
--upTask(up)
--]]



