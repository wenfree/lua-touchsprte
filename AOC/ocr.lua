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
aoc_zy['set']['fight'] ={{373,411,0x103a62},{529,452,0x103b62},}		--战力
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
	postArr.name = getDeviceName()
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
	postArr.name = getDeviceName()
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
function call_back()
	local sz = require("sz")
	local url = 'http://dajin.yzdingding.com/phalapi/public/'
	local postArr = {}
	postArr.s="Wadd.Call_back"
	postArr.token = llsGameToken()
	postArr.whos = UI_v.whos
	log(post(url,postArr))
end


--UI_v={}
--UI_v.whos = "ouwen000"
--nLog(appDataPath(frontAppBid()))
--require("TSLib")
--require("/aoc/tsp")
--log(getTokenUi())
--log(getImeiUi())


--取帐空闲帐号
function AccountInfoBack()
	
	local sz = require("sz")
	local url = 'http://dajin.yzdingding.com/phalapi/public/'
	local postArr = {}
	postArr.s="App.Wadd.Get_rest"
	postArr.whos = UI_v.whos
--	postArr.whos = "ouwen000"
	local game_data = post(url,postArr)

	local json = sz.json	
	if game_data then
--		game_date = json.decode(game_date)
		log(game_data)
		log(game_data.data.account)
		local game_arr = strSplit(game_data.data.account,"|")
		app_token = game_arr[1]
		app_uid = game_arr[2]
		player_id = game_arr[3]
	end
	
	local appbid = 'com.lilithgame.sgame'
	local AccountInfo = appDataPath(appbid).."/Documents/AccountInfo.json"

--	app_token = "qCOcHlziQlIVaEKWUlhwA37lme6PjEbt"
--	app_uid = "19430454"
--	player_id = "E76A9205-BCE5-4F51-B746-CB5D83E6AE3C"
	
	local account_ = {}
	account_['app_token'] = app_token
	account_['user_password'] = ""
	account_['app_uid'] = app_uid
	account_['player_id'] = player_id
	account_['nickname'] = "游客"
	account_['user_type'] = 1


	
	account_ = json.encode(account_)
	account_ = "["..account_.."]"

	log(account_)
	
	writeFileString(AccountInfo,account_)
	closeApp(appbid)
	mSleep(2000)
end

--AccountInfoBack()
--inputText("66A910713D8049C680271A25506D29D6812A3437")







