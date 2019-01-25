--init('0',1)

--list = '1234567890k'

function upTlbb(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	local Url = 'http://test1.oupag.com/Public/tlbb/?service=tlbb.role'

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = Url
	headers_send = cjson.encode(headers)
	
	post_send = cjson.encode(t)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(Url, 5, headers_send, post_escaped)
	nLog(body_resp)
	if status_resp == 200 then
		return true
	end
end


function orc(t)
	return ocrText(t[1],t[2],t[3],t[4], 0) or 0
end

tlbbshow={}
tlbblvl = {5, 71,28, 83}
tlbbshow.silver = {663, 490,751, 502}
tlbbshow.copper = {873, 490,988, 502}
tlbbshow.ybao = {644, 521,766, 534}
tlbbshow.ybao2 = {883, 521, 971, 533}
--tlbbshow.fight = {342, 510, 438, 529}

function UpOrc()
	postTlbb={}
	postTlbb.lvl = orc(tlbblvl)
	local bagTimeLine = os.time()
	while (os.time()-bagTimeLine < 30) do
		if done(aoc['游戏']['游戏弹窗-任务牌'])then
			for k,v in pairs(tlbbshow)do
				local res = orc(v)
				nLog(res)
				postTlbb[k] = res
			end
			if done(aoc['游戏']['游戏弹窗-任务牌-背包界面-x-整理-随身仓库-随身商店'],'关闭背包',true,1)then
				postTlbb.imei = IMEI
				postTlbb.idfa = idfa
				postTlbb.awz = awz
				postTlbb.role = roleMun
				upTlbb(postTlbb)
				return true
			end
		elseif done(aoc['游戏']['游戏主界面-背包按钮'],'游戏主界面-背包按钮',true)then
			delay(2)
		end
	end
	toast('识别超时',1)
end