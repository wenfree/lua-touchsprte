require("tsp")
require("nikename")
require("account")

APP_KEY = '90BB9337D7B1ACC0CA642C5726D227CB'
APP_SECRECT = 'tjBu0uVfLx2coNmKILX2C8CjLu2WTwKAR5ec9zcPFyI3hbPVkrJedYwo0y6F'
url = 'http://api.okayapi.com/?s=App.Table.Create'

function md5str(text)
	local sz = require("sz")
	return string.upper(text:md5())
end
function Update(model_name,data)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	local service_url = 'http://api.okayapi.com/?s=App.Table.Create'
	headers = {}
	headers['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	headers['Referer'] = service_url
	headers_send = cjson.encode(headers)
	
	local datas = cjson.encode(data)
	nLog('datas-----'..datas)
	
	updateStr = {}
	updateStr.app_key = APP_KEY
	updateStr.model_name = model_name
	updateStr.data = datas

	signStr = signlist('App.Table.Create',updateStr)
	nLog('~~'..signStr)

	--signStr = APP_KEY..device_name..device_sn..device_version..phone.group_name..'Ouwen000.Device.Report'..APP_SECRECT
	updateStr.sign = md5str(signStr)
	
	
	post_send = cjson.encode(updateStr)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(service_url, 5, headers_send, post_escaped)
	
	nLog(body_resp)
	if status_resp == 200 then
		
	end
end
--将sign字典排序
function signlist(tables)
	local list={}
	for i in pairs(tables) do
		if i ~= nil then 
			table.insert(list, i)  
		end
	end
	table.sort(list, function(a,b) return (a < b) end)
-- 降序
-- table.sort(tableTest, function(a,b) return (a > b) end)
	local signStr = ''
	for _, fName in pairs(list) do 
		nLog(fName)
		signStr = signStr..tables[fName]
	end
	signStr = signStr..APP_SECRECT
	nLog('~~'..signStr)
	return signStr
end

function Create(t,model_name)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	url = 'http://api.okayapi.com/?s=App.Table.Create'
	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	service = url

	data = cjson.encode(t)
	model_name = model_name

	okayapi = {}
	okayapi.app_key = APP_KEY
	okayapi.data = data
	okayapi.model_name = model_name
	
	signStr = APP_KEY..data..model_name..'App.Table.Create'..APP_SECRECT
	log('signStr-->'..signStr)
--	dialog(signStr, time)
	md5sign = md5str(signStr)
	log('md5sign-->'..md5sign)
	okayapi.sign = md5sign



	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = service
	headers_send = cjson.encode(headers)
	post_send = cjson.encode(okayapi)
	

	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(service, 5, headers_send, post_escaped)
	
	if status_resp == 200 then
		log(body_resp)
	end
end


function Delete(id,model_name)
	nLog('del-')
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	url = 'http://api.okayapi.com/?s=App.Table.Delete'
	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	service = url

	data = cjson.encode(t)
	model_name = model_name

	okayapi = {}
	okayapi.id = id
	okayapi.app_key = APP_KEY
	okayapi.model_name = model_name

	signStr = APP_KEY..id..model_name..'App.Table.Delete'..APP_SECRECT
--	log('signStr-->'..signStr)
	md5sign = md5str(signStr)
--	log('md5sign-->'..md5sign)
	okayapi.sign = md5sign



	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = service
	headers_send = cjson.encode(headers)
	post_send = cjson.encode(okayapi)
	

	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(service, 5, headers_send, post_escaped)
	
	if status_resp == 200 then
		--log(body_resp)
	end
end

function Update(t,model_name)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	url = 'http://api.okayapi.com/?s=App.Table.Create'
	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	service = url

	data = cjson.encode(t)
	model_name = model_name

	okayapi = {}
	okayapi.app_key = APP_KEY
	okayapi.data = data
	okayapi.model_name = model_name
	
	signStr = APP_KEY..data..model_name..'App.Table.Create'..APP_SECRECT
	log('signStr-->'..signStr)
--	dialog(signStr, time)
	md5sign = md5str(signStr)
--	log('md5sign-->'..md5sign)
	okayapi.sign = md5sign



	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = service
	headers_send = cjson.encode(headers)
	post_send = cjson.encode(okayapi)
	

	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(service, 5, headers_send, post_escaped)
	
	if status_resp == 200 then
		log(body_resp)
	end
end

--[[
for k,v in ipairs(ca)do
	local newtable = {}
		newtable.apple_id = v[1]
		newtable.my_password = v[2]
		newtable.country = 'ca'
		newtable.nickname = EnglishName()
		Update(newtable,'account')
end
toast("end",1)
--]]



function ChangeNumber(id,model_name)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	local service_url = 'http://api.okayapi.com/?s=App.Table.ChangeNumber'
	headers = {}
	headers['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	headers['Referer'] = service_url
	headers_send = cjson.encode(headers)
	
	local datas = cjson.encode(data)
	nLog('datas-----'..datas)
	
	updateStr = {}
	updateStr.app_key = APP_KEY
	updateStr.model_name = model_name
	updateStr.change_field = 'is_bind'
	updateStr.change_value = '-1'
	updateStr.check_code = '1'
	updateStr.id = id
	updateStr.s = 'App.Table.ChangeNumber'

	signStr = signlist(updateStr)
	nLog('~~'..signStr)
	
	updateStr = {}
	updateStr.app_key = APP_KEY
	updateStr.model_name = model_name
	updateStr.change_field = 'is_bind'
	updateStr.change_value = '-1'
	updateStr.check_code = '1'
	updateStr.id = id


	updateStr.sign = md5str(signStr)
	
	
	post_send = cjson.encode(updateStr)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(service_url, 5, headers_send, post_escaped)
	
	nLog(body_resp)
	if status_resp == 200 then
		
	end
end

--[[  ]]
for i = 2009, 8348 do
	ChangeNumber(i,'account')
end
--]]






















