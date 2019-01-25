



alz_url = 'http://api.ndd001.com/do.php'

function ALZ()
	--采用 cjson 构造请求头部 json
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	headers = {}
	headers['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	headers['Referer'] = alz_url
	headers_send = cjson.encode(headers)
	post = {}
	post['action'] = 'loginIn'
	post['name'] = 's-f3z93kng'
	post['password'] = 'whoami@520'
	post_send = cjson.encode(post)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(alz_url, 5, headers_send, post_escaped)
	nLog(status_resp)
	nLog(body_resp)
	if status_resp == 200 then
		alz_list = split(body_resp,'|')
		state = alz_list[1]
		token = alz_list[2]
		if state == '1' then
			nLog('登录成功,token = '..token)
			return true
		else
			nLog('登录失败')
		end
	else
		nLog('time_out')
	end
end
ALZ()

function GET_Phone(id,token)
	--采用 cjson 构造请求头部 json
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	headers = {}
	headers['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	headers['Referer'] = alz_url
	headers_send = cjson.encode(headers)
	post = {}
	post['action'] = 'getPhone'
	post['sid'] = id
	post['token'] = token
	post['vno'] = 0
	----这是设备省相关的

	--[[
	post['locationMatching'] = 'include'
	post['locationLevel'] = 'p'
	post['location'] = '广东'
	--]]

	post_send = cjson.encode(post)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(alz_url, 5, headers_send, post_escaped)
	nLog('status_resp='..status_resp)
	nLog('body_resp='..body_resp)
	if status_resp == 200 then
		phone_list = split(body_resp,'|')
		phone = phone_list[2]

		if phone_list[1] == '1' then
			log('成功取得手机号,phone = '..phone)
			
			phonelen = string.len(phone)
			phonetrue = string.sub(phone,1,1)
			
			nLog(phonelen)
			if  phonelen < 11 or phonetrue ~= '1' then
				log('获取失败')
				return false
			else
				return true
			end
		else
			log('获取失败')
			return false
		end
	end
end

function getMessage(id,phone,token)
	--采用 cjson 构造请求头部 json
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	headers = {}
	headers['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	headers['Referer'] = alz_url
	headers_send = cjson.encode(headers)
	post = {}
	post['action'] = 'getMessage'
	post['sid'] = id
	post['phone'] = phone
	post['token'] = token
	post_send = cjson.encode(post)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(alz_url, 30, headers_send, post_escaped)
	
	log('status_resp->'.. status_resp)
	if status_resp == 200 then
		log(body_resp)
		SMS_list = split(body_resp,'|')
		SMS = SMS_list[2]
		if SMS == '参数错误' then
			return false
		end
		if SMS_list[1] == '1' then
			log('验证码,SMS = '..SMS)
			local i,j = string.find(SMS,"%d+")
			dxyzm =string.sub(SMS,i,j)
			log(dxyzm)
			return true
		elseif SMS_list[2] == '短信已取回或手机号已释放' then
			delay(3)
			return false
		else
			log('其它')
			delay(3)
		end
	end
end

function addBlacklist(id,phone,token)
	--采用 cjson 构造请求头部 json
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	headers = {}
	headers['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	headers['Referer'] = alz_url
	headers_send = cjson.encode(headers)
	post = {}
	post['action'] = 'addBlacklist'
	post['sid'] = id
	post['phone'] = phone
	post['token'] = token
	post_send = cjson.encode(post)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(alz_url, 5, headers_send, post_escaped)
	nLog(status_resp)
	nLog(body_resp)
	Black = split(body_resp,'|')
	if Black[1] == '1' then
		nLog('加入黑名单成功,phone = '..phone)
		return true
	end
end

function GET_Phone_again(id,phone,token)
	--采用 cjson 构造请求头部 json
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	headers = {}
	headers['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	headers['Referer'] = alz_url
	headers_send = cjson.encode(headers)
	post = {}
	post['action'] = 'getPhone'
	post['sid'] = id
	post['token'] = token
	post['vno'] = 1
	post['phone'] = phone
	post_send = cjson.encode(post)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(alz_url, 5, headers_send, post_escaped)
	nLog(status_resp)
	nLog(body_resp)
	if status_resp == 200 then
		phone_list = split(body_resp,'|')
		phone = phone_list[2]

		if phone_list[1] == '1' then
			log('成功取得手机号,phone = '..phone)
			return true
		else
			log('获取失败')
			return false
		end
	end
end

--[[
id = 6611
ALZ()
mSleep(1000 * 2)
GET_Phone(id,token)
--GET_Phone_again(id,token,'18741913940')
--getMessage(id,phone)
--addBlacklist(id,phone)

--]]
nLog('爱乐赞OK')

