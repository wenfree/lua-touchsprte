function post(url,arr)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	local safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	local headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = url
	headers_send = cjson.encode(headers)
	post_send = cjson.encode(arr)
	post_escaped = http.build_request(post_send)
	nLog(post_send)
	local status_resp, headers_resp, body_resp = http.post(url, 5, headers_send, post_escaped)
	nLog(status_resp)
	if status_resp == 200 then
		nLog(body_resp)
		local json = sz.json
		return json.decode(body_resp)
	end
end


function updateNike()
	local urls = 'http://wenfree.cn/api/Public/tjj/?service=Nike.address'
	local tb={}
	tb.address_mail = 12313
	tb.address_pwd = 123123
	tb.address_phone = 123123123
	return post(url,tb)
end



