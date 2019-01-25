init('0',1)
require("TSLib")
require("upload")
wwlist = '1234567890'

function upTlbb(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	local Url = 'http://tb1.host.apijs.cc/Public/tlbb/?service=tlbb.role'

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
	init('0',1)
	local recognize = ocrText(t[1],t[2],t[3],t[4],0)
	if recognize ~= nil then
		nLog('recognize--'..recognize)
		local i,j = string.find(recognize,"%d+")
		if i~= nil and j~= nil then
			recognize =string.sub(recognize,i,j)
			recognize = tonumber(recognize)
			recognize = recognize or 1
			nLog(recognize)
			return recognize
		end
	end
	return 0
end

tlbblvl = {6, 70, 33, 84}
tlbbshow={}
--tlbbshow.lvl = {175, 76, 223, 103}
tlbbshow.silver = {663, 490, 751, 502}
tlbbshow.copper = {873, 490, 988, 502}
tlbbshow.ybao = {823, 440, 879, 455}
tlbbshow.ybao2 = {883, 521, 971, 533}
--tlbbshow.fight = {342, 510, 438, 529}

function UpOrc()
	local bagTimeLine = os.time()
	while (os.time()-bagTimeLine < 10) do
		if done(aoc['游戏']['游戏弹窗-任务牌'],'游戏弹窗-任务牌')then
			if not(done(aoc['游戏']['游戏弹窗-背包-材料激活'],'游戏弹窗-背包-材料激活'))then
				click(869,89)
			elseif c_pic(aoc['游戏']['游戏弹窗-背包-材料激活-元宝-使用'],'游戏弹窗-背包-材料激活-元宝-使用',true)then
			elseif c_pic(aoc['游戏']['游戏弹窗-背包-材料激活-元宝'],'游戏弹窗-背包-材料激活-元宝',true)then
			else
				click(621,526)
				keepScreen(true)
				for k,v in pairs(tlbbshow)do
					local res = orc(v)
					if res ~= nil then
						nLog(k.."--"..res)
						postTlbb[k] = res
					end
				end
				local ybshow={780, 437, 872, 458}
				lzScreen(780, 437, 872, 458,0.5)
				local uploadqq = tostring(readQQ() or backname(awz))
				local uproleMun = tostring(roleMun)
				pic_url = Tlbbupload(uploadqq,uproleMun)['data']['url']
				if c_pic(aoc['游戏']['游戏弹窗-背包-材料激活-元宝-稀世宝图定位'],"游戏弹窗-背包-材料激活-元宝-稀世宝图定位")then
--					map_total = orc({x-17,y-20,x,y})
					lzScreen(x-70,y-22,x,y,0.5)
					map_url = Tlbbupload(uploadqq.."-map",uproleMun)['data']['url']
					log("map_url-->"..map_url)
				else
					map_url = nil
				end

				nLog('pic_url->'..pic_url)
				
				keepScreen(false)
				if done(aoc['游戏']['游戏弹窗-任务牌'],'游戏弹窗-任务牌',true,1)then
					postTlbb.imei = IMEI
					postTlbb.phonename = getDeviceName()
					postTlbb.idfa = idfa
					postTlbb.awz = awz
					postTlbb.urls = pic_url
					postTlbb.role = roleMun
					postTlbb.mail = readQQ() or backname(awz)
					postTlbb.mapurls = map_url
					upTlbb(postTlbb)
					return true
				end
			end
		elseif c_pic(aoc['游戏']['游戏主界面-背包按钮'],'游戏主界面-背包按钮',true)then
			delay(2)
		end
	end
	toast('识别超时',1)
end

--orc(tlbblvl)

--[[ 
keepScreen(true)
postTlbb={}
for k,v in pairs(tlbbshow)do
	local res = orc(v)
	if res ~= nil then
		nLog(k.."--"..res)
		postTlbb[k] = res
	end
end
keepScreen(false)

--]]

