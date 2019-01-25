--[[ 玉米api对接 ]]
require("tsp")
alz_url = 'http://api.jyzszp.com/Api/index'
token = '705fa2859fa155145c01a580b7ceaeb8'
uid = '47869-tly'

function ALZ()
	--采用 cjson 构造请求头部 json
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	headers = {}
	headers['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	self_url = alz_url..'/userlogin'
	headers['Referer'] = self_url
	headers_send = cjson.encode(headers)
	post = {}
	post['uid'] = '47869-tly'
	post['pwd'] = 'q3991705q'
	post_send = cjson.encode(post)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(self_url, 5, headers_send, post_escaped)
	nLog(status_resp)
	nLog(body_resp)
	if status_resp == 200 then
		alz_list = split(body_resp,'|')
		token = alz_list[3]
		if token ~= nil then
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
	self_url = alz_url..'/getMobilenum'
	headers['Referer'] = self_url
	headers_send = cjson.encode(headers)
	post = {}
	post['action'] = 'getPhone'
	post['pid'] = id
	post['uid'] = uid
	post['token'] = token
	post['vxnh'] = 2

	post_send = cjson.encode(post)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(self_url, 5, headers_send, post_escaped)
	nLog('status_resp='..status_resp)
	nLog('body_resp='..body_resp)
	
	if body_resp == '暂无号码可取，请过几秒再取code:6003' then
		toast('暂无号码可取，请过几秒再取code:6003',1)
		mSleep(3000)
		return false
	end
	
	if status_resp == 200 then
		phone_list = split(body_resp,'|')
		phone = phone_list[1]

		phonelen = string.len(phone)
		if  phonelen < 11 then
			log('获取失败')
			return false
		else
			log(phone)
			log('取号成功')
			return true
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
	self_url = alz_url..'/getVcodeAndReleaseMobile'
	headers['Referer'] = self_url
	headers_send = cjson.encode(headers)
	post = {}
	post['uid'] = uid
	post['pid'] = id
	post['mobile'] = phone
	post['token'] = token
	post_send = cjson.encode(post)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(self_url, 30, headers_send, post_escaped)
	
	log('status_resp->'.. status_resp)
	if status_resp == 200 then
		log(body_resp)
		if body_resp == '还没有接收到验证码,请让程序等待几秒后再次尝试 code:001' then
		elseif body_resp == '还没有接收到验证码,请让程序等待几秒后再次尝试 code:002' then
		elseif body_resp == '取号过期，请重新取号再取码code:0009' then
		else
			SMS_list = split(body_resp,'|')
			SMS = SMS_list[2]
			--toast(SMS,1)
			return true
		end
	end
	mSleep(3000*1)
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




nLog('玉米登录OK')






