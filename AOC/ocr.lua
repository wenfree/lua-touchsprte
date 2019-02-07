init('0',1)
--list = '1234567890k'



function ocr(x1,y1,x2,y2)
	local ress = ocrText(x1,y1,x2,y2, 10) or 0
	if ress == '' then
--		nLog('nil')
		return 0 
	else
--		nLog(ress)
	end
	return ress
end

aoc_zy={}
aoc_zy['资源']={}
aoc_zy['资源']['gold']={{434,226,0x102138}, {549,267,0x17283d}, }
aoc_zy['资源']['water']={{648,226,0x192b3e}, {766,267,0x1b2e40}, }
aoc_zy['资源']['wood']={{858,226,0x182b3b}, {984,266,0x112946}, }
aoc_zy['资源']['blood']={{433,279,0x14253d}, {549,323,0x162a40}, }
aoc_zy['资源']['silver']={{624,281,0x15263a}, {766,322,0x152639}, }
aoc_zy['资源']['crystal']={{854,283,0x192a39}, {980,318,0x142336}, }
aoc_zy['资源']['mobi']={{406,446,0x132c46},{546,492,0x13304a},}

aoc_zy['set']={}
aoc_zy['set']['fight'] ={{140,537,0x770011}, {258,575,0x650f12}, }		--战力
aoc_zy['set']['world']={{486,186,0x154261},{568,208,0x0e2c3f},}			--服
aoc_zy['set']['gid']={{514,129,0x184662}, {668,153,0x1f4b63}, }			--游戏id

aoc_zy['city']={}
aoc_zy['city']['lls']={{1023,26,0x1c3845},{1106,46,0x1f2f40},}
aoc_zy['city']['level']={{97,43,0x17121f},{158,68,0x484b55},}


if show == nil then
	show = {}
end
--[[
show = {}
show['level'] = 0
show['fight'] = 0
show['service'] = 0
show['country'] = 0
show['lls'] = 0
show['gid'] = 0

show['gold'] = 0
show['water'] = 0
show['wood'] = 0
show['blood'] = 0
show['silver'] = 0
show['crystal'] = 0
show['mobi'] = 0
--]]


function get_info(t)
	for k,v in pairs(t)do
		show[k] = ocr(v[1][1],v[1][2],v[2][1],v[2][2])
		nLog('K--'..k.."--"..show[k])
	end
end

--[[
keepScreen(true)
get_info(aoc_zy['资源'])
--]]

--[[
function get_info(t)
	for k,v in pairs(t)do
		local res = ocr(v[1][1],v[1][2],v[2][1],v[2][2])
		nLog(k .. '--' ..res) 
	end
end
--
--]]

function llsGameToken()
	local appbid = 'com.lilithgame.sgame'
	local AccountInfo = appDataPath(appbid).."/Documents/AccountInfo.json"
	local account = readFileString(AccountInfo)
	local sz = require("sz")
	local json = sz.json
	if type(account) == 'string' then
		if account ~= nil  and string.len(account) > 10 then
			local newTable = json.decode(account)
			return newTable[1].app_token
		end
	end
end

function AccountInfo()
	local appbid = 'com.lilithgame.sgame'
	local AccountInfo = appDataPath(appbid).."/Documents/AccountInfo.json"
	local account = readFileString(AccountInfo)
	log(account)
	local sz = require("sz")
	local json = sz.json
	if account ~= nil  and string.len(account) > 10 then
		local newTable = json.decode(account)
		local back_token = newTable[1].app_token.."|"..newTable[1].app_uid.."|"..newTable[1].player_id
		log(back_token)
		return back_token
	end
end


function upAoc(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	
	aoc_url = 'http://test1.oupag.com/Public/ao/?service=Ao.game'
	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = aoc_url
	headers_send = cjson.encode(headers)

	post_send = cjson.encode(t)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(aoc_url, 15, headers_send, post_escaped)
	
	nLog(body_resp)
	if status_resp == 200 then
		return true
	end
end

function upAoc_wenfree(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	
	local aoc_url = 'http://wenfree.cn/api/Public/aoc/?service=User.game'
	local safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'

	local headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = aoc_url
	headers_send = cjson.encode(headers)

	local post_send = cjson.encode(t)
	nLog(post_send)
	local post_escaped = http.build_request(post_send)
	local status_resp, headers_resp, body_resp = http.post(aoc_url, 10, headers_send, post_escaped)
	
	nLog(body_resp)
	if status_resp == 200 then
		return true
	end
end

function upAoc_yzlilith(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	
	local aoc_url = 'http://dajin.yzdingding.com/api_/Public/aoc/?service=User.game'
	local safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'

	local headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = aoc_url
	local headers_send = cjson.encode(headers)

	local post_send = cjson.encode(t)
	nLog(post_send)
	local post_escaped = http.build_request(post_send)
	local status_resp, headers_resp, body_resp = http.post(aoc_url, 10, headers_send, post_escaped)
	
	nLog(body_resp)
	if status_resp == 200 then
		return true
	end
end


function getImeiUi()
	local sz = require("sz")
	local url = 'http://dajin.yzdingding.com/api_/Public/aoc/?service=User.getUiByimei'
	local postArr = {}
	postArr.imei = sz.system.serialnumber()
--	postArr.imei = 'FDNQD3J8G5MD'
	local imeiwebuidata = post(url,postArr)
	if type(imeiwebuidata.data) == "table" then
		local sz = require("sz")
		local json = sz.json
		if type(imeiwebuidata.data.webui)== 'string' and string.len(imeiwebuidata.data.webui) > 10 then
			return json.decode(imeiwebuidata.data.webui)
		end
	end
end

function getTokenUi()
	local sz = require("sz")
	local url = 'http://dajin.yzdingding.com/api_/Public/aoc/?service=User.getUiBytoken'
	local postArr = {}
	postArr.imei = sz.system.serialnumber()
--	postArr.imei = 'FDNQD3J8G5MD'
	postArr.token = llsGameToken()
--	postArr.token = 'QLwAYxPLL6lGyRFO8ESqv6y2rhamjuYZ'
	local imeiwebuidata = post(url,postArr)
	
	if type(imeiwebuidata.data) == "table" then
		log(imeiwebuidata)
		local sz = require("sz")
		local json = sz.json
		if type(imeiwebuidata.data.webui)== 'string' and string.len(imeiwebuidata.data.webui) > 10 then
--		if imeiwebuidata.data.webui ~= '' and imeiwebuidata.data.webui ~= nil then
			return json.decode(imeiwebuidata.data.webui)
		end
	end
end


--nLog(appDataPath(frontAppBid()))

















