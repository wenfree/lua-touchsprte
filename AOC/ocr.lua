init('0',1)
--list = '1234567890k'



function ocr(x1,y1,x2,y2)
	local ress = ocrText(x1,y1,x2,y2, 10) or 0
	if ress == '' then
		nLog('nil')
		return 0
	end
	return ress
end

aoc_zy={}
aoc_zy['资源']={}
aoc_zy['资源']['gold']={{389,  224,0x102138}, {  533,  265,0x17283d}, }
aoc_zy['资源']['water']={{  625,  226,0x192b3e}, {  767,  268,0x1b2e40}, }
aoc_zy['资源']['wood']={{  857,  224,0x182b3b}, { 1002,  264,0x112946}, }
aoc_zy['资源']['blood']={{  387,  296,0x14253d}, {  532,  339,0x162a40}, }
aoc_zy['资源']['silver']={{  633,  299,0x15263a}, {  765,  335,0x152639}, }
aoc_zy['资源']['crystal']={{  857,  296,0x192a39}, { 1000,  338,0x142336}, }
aoc_zy['资源']['mobi']={{  391,  488,0x132c46},{  532,  526,0x13304a},}

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

--取帐号token
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
--取帐号全部
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
--上传到yzdd
function upAoc_yzlilith(t)
	local sz = require("sz")
	local json = sz.json
	local url = 'http://dajin.yzdingding.com/phalapi/public/'
	local postArr = {}
	postArr.s="Wadd.Add"
	postArr.imei = sz.system.serialnumber()
	postArr.whos = UI_v.whos
	postArr.token = llsGameToken()
	postArr.name = getDeviceName()
	postArr.arr = json.encode(t)
	local imeiwebuidata = post(url,postArr)
	log(imeiwebuidata)
end
--根据imei取脚本设置
function getImeiUi()
	local sz = require("sz")
	local url = 'http://dajin.yzdingding.com/phalapi/public/'
	local postArr = {}
	postArr.s="Wgetui.getUiByimei"
	postArr.imei = sz.system.serialnumber()
	postArr.whos = UI_v.whos
	local imeiwebuidata = post(url,postArr)
	if imeiwebuidata and type(imeiwebuidata.data) == "table" then
		local sz = require("sz")
		local json = sz.json
		if type(imeiwebuidata.data.webui)== 'string' and string.len(imeiwebuidata.data.webui) > 10 then
			return json.decode(imeiwebuidata.data.webui)
		end
	end
end
--根据帐号取 脚本设置
function getTokenUi()
	local sz = require("sz")
	local url = 'http://dajin.yzdingding.com/phalapi/public/'
	local postArr = {}
	postArr.s="Wgetui.getUiBytoken"
	postArr.token = llsGameToken()
	postArr.whos = UI_v.whos
--	postArr.token = 'Z2oJ5c0b2DqQdXLhYMUwnsXZ2ZzSKBGn'
	local imeiwebuidata = post(url,postArr)
	if imeiwebuidata and type(imeiwebuidata.data) == "table" then
--		log(imeiwebuidata)
		local sz = require("sz")
		local json = sz.json
		if type(imeiwebuidata.data.webui)== 'string' and string.len(imeiwebuidata.data.webui) > 10 then
--		if imeiwebuidata.data.webui ~= '' and imeiwebuidata.data.webui ~= nil then
			return json.decode(imeiwebuidata.data.webui)
		end
	end
end

--UI_v={}
--UI_v.whos = "ouwen000"
--nLog(appDataPath(frontAppBid()))
--require("TSLib")
--require("/aoc/tsp")
--log(getTokenUi())
--log(getImeiUi())














