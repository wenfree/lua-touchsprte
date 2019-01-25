
function ALZ()
	--采用 cjson 构造请求头部 json
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	headers = {}
	headers['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	headers['Referer'] = 'http://api.hellotrue.com/api/do.php'
	headers_send = cjson.encode(headers)
	post = {}
	post['action'] = 'loginIn'
	post['name'] = 'api-fhif3bxw'
	post['password'] = 'whoami@1314'
	post_send = cjson.encode(post)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post("http://api.hellotrue.com/api/do.php", 5, headers_send, post_escaped)
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
	end
end
function GET_Phone(id,token)
	--采用 cjson 构造请求头部 json
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	headers = {}
	headers['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	headers['Referer'] = 'http://api.hellotrue.com/api/do.php'
	headers_send = cjson.encode(headers)
	post = {}
	post['action'] = 'getPhone'
	post['sid'] = id
	post['token'] = token
	post['vno'] = 0
	post_send = cjson.encode(post)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post("http://api.hellotrue.com/api/do.php", 5, headers_send, post_escaped)
	nLog(status_resp)
	nLog(body_resp)
	if status_resp == 200 then
		phone_list = split(body_resp,'|')
		phone = phone_list[2]
		phone_title =string.sub(phone,1,3)
		if phone_title == '178' or phone_title == '147' or phone_title == '170' or phone_title == '171' then
			addBlacklist(id,phone)
			GET_Phone(id,token)
		end
		if phone_list[1] == '1' then
			log('成功取得手机号,phone = '..phone)
			return true
		else
			log('获取失败')
			return false
		end
	end
end
function getMessage(id,phone)
	--采用 cjson 构造请求头部 json
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	headers = {}
	headers['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	headers['Referer'] = 'http://api.hellotrue.com/api/do.php'
	headers_send = cjson.encode(headers)
	post = {}
	post['action'] = 'getMessage'
	post['sid'] = id
	post['phone'] = phone
	post['token'] = token
	post_send = cjson.encode(post)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post("http://api.hellotrue.com/api/do.php", 5, headers_send, post_escaped)
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
			yzm =string.sub(SMS,i,j)
			log(yzm)
			return true
		elseif SMS_list[2] == '短信已取回或手机号已释放' then
			delay(3)
			return false
		else
			delay(3)
		end
	end
end
function addBlacklist(id,phone)
	--采用 cjson 构造请求头部 json
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	headers = {}
	headers['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	headers['Referer'] = 'http://api.hellotrue.com/api/do.php'
	headers_send = cjson.encode(headers)
	post = {}
	post['action'] = 'addBlacklist'
	post['sid'] = id
	post['phone'] = phone
	post['token'] = token
	post_send = cjson.encode(post)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post("http://api.hellotrue.com/api/do.php", 5, headers_send, post_escaped)
	nLog(status_resp)
	nLog(body_resp)
	Black = split(body_resp,'|')
	if Black[1] == '1' then
		nLog('加入黑名单成功,phone = '..phone)
		return true
	end
end
--ALZ()
--GET_Phone(id,token)
--getMessage(id,phone)


