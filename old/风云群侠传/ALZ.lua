alz_url = 'http://api.ipadh.cn/do.php'
require("TSLib")
require("tsp")
token = '12698a4b-ada8-4ffd-94ff-12d833f33aa0'

function post_kfy(url,arr)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = url
	headers_send = cjson.encode(headers)
	post_send = cjson.encode(arr)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(url, 5, headers_send, post_escaped)
	if status_resp == 200 then
		nLog(body_resp)
		return body_resp
	end
end



function KFY()
	local post = {}
	post['action'] = 'loginIn'
	post['name'] = 's-cgy5paih'
	post['password'] = 'yangmian121'
	
	local kfydata = post_kfy(alz_url,post)

	if kfydata ~= nil then
		alz_list = split(kfydata,'|')
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

function GET_Phone(id)
	local post = {}
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
	local kfydata = post_kfy(alz_url,post)
	
	if kfydata ~= nil then
		phone_list = split(kfydata,'|')
		phone = phone_list[2]

		if phone_list[1] == '1' then
			log('成功取得手机号,phone = '..phone)
			return true
		else
			log('获取失败-'..phone_list[2])
			return false
		end
	end
end

function GET_Message(id,phones)

	local post = {}
	post['action'] = 'getMessage'
	post['sid'] = id
	post['phone'] = phones
	post['token'] = token

	local kfydata = post_kfy(alz_url,post)
	
	if kfydata ~= nil then
		SMS_list = split(kfydata,'|')
		SMS = SMS_list[2]
		if SMS == '参数错误' then
			return false
		end
		if SMS_list[1] == '1' then
			log('验证码,SMS = '..SMS)
			local i,j = string.find(SMS,"%d+")
			sms =string.sub(SMS,i,j)
			log(sms)
			return true
		elseif SMS_list[2] == '短信已取回或手机号已释放' then
			delay(3)
			return false
		else
			log(SMS_list[2])
			delay(3)
		end
	end
end

function ADD_Blacklist(id,phones,token)
	
	local post = {}
	post['action'] = 'addBlacklist'
	post['sid'] = id
	post['phone'] = phones
	post['token'] = token

	local kfydata = post_kfy(alz_url,post)
	if kfydata ~= nil then
		Black = split(kfydata,'|')
		if Black[1] == '1' then
			nLog('加入黑名单成功,phone = '..phones)
			return true
		end
	end
end

function GET_Phone_Again(id,phones,token)
	local post = {}
	post['action'] = 'getPhone'
	post['sid'] = id
	post['token'] = token
	post['phone'] = phones

	local kfydata = post_kfy(alz_url,post)
	if kfydata ~= nil then
		phone_list = split(kfydata,'|')
		phone = phone_list[2]
		if phone_list[1] == '1' then
			log('成功取得手机号,phone = '..phones)
			return true
		else
			log('获取失败-'..phone_list[2])
			return false
		end
	end
end


nLog('爱乐赞OK')