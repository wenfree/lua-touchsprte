require("UI")
require("tsp")

--[[
	ios8.0-8.2
	aso 评论脚本
	据说是低版本的不删除

*      
*          ┌─┐       ┌─┐
*       ┌──┘ ┴───────┘ ┴──┐
*       │                 │
*       │       ───       │
*       │  ─┬┘       └┬─  │
*       │                 │
*       │       ─┴─       │
*       │                 │
*       └───┐         ┌───┘
*           │         │
*           │         │
*           │         │
*           │         └──────────────┐
*           │                        │
*           │                        ├─┐
*           │                        ┌─┘    
*           │                        │
*           └─┐  ┐  ┌───────┬──┐  ┌──┘         
*             │ ─┤ ─┤       │ ─┤ ─┤         
*             └──┴──┘       └──┴──┘ 
*                 神兽保佑 
*                 代码无BUG! 

--]]


Version = 1
--全局变量

init('0',0)
adApp = {}
adApp[1] = 'com.iFitness.FitnessTIGERfitness'

ios={}
ios['tips']={}
ios['tips']['正常展示']={{273,2,0xffffff},{308,1,0xffffff},{364,1,0xffffff},}
ios['tips']['灰色']={{282,1,0x999999},{320,1,0x999999},{359,1,0x999999},}
ios['tips']['错误蓝色']={ 0x007aff, "", 90, 61, 449, 583, 686}

广告位置={
	{51,90,0xad0401},{49,188,0xe54b4b},{52,288,0xe85503},
	{49,385,0xffd602},{47,490,0x39ff00},{49,590,0x10bdc1},
	{53,560,0x10bdc1},{54,791,0x070da3},{54,791,0x070da3},
	{52,982,0x6f0999},{578,1089,0xc98cdc},
	}
--9个位置的广告位置
adshow_mark = {}
adshow_click = {}
for i,v in pairs(广告位置)do
	adshow_mark[i] = 1
	adshow_click[i] = 1
end
function UpPhone()
	imei = getDeviceID()
	name = getOSType()
	p_mun = getDeviceName(str)
	
	url = 'http://onlyonelife.online/Public/adphone/?service=Adphone.addphone'
	url2 = '&phonename='..name..'&phoneimei='..imei..'&phone_mun='..p_mun
	Get_url = url..url2
	nLog(Get_url)
	
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(Get_url);
	nLog(res)
	if code == 200 then
		return true
	end
end

function upTask()
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	service = 'http://onlyonelife.online/Public/adphone/?service=Adphone.addphone'

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = service
	headers_send = cjson.encode(headers)
	
	t = {}
	t.phoneimei = getDeviceID()
	t.phonename = getOSType()
	t.phone_mun = getDeviceName(str)
	
	post_send = cjson.encode(t)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	nLog(post_escaped)
	status_resp, headers_resp, body_resp = http.post(service, 3, headers_send, post_escaped)
	
	nLog(status_resp)
	if status_resp == 200 then
		nLog('上传成功')
		return true
	end
end

function showad()
	计时 = os.time()
	超时 = 60 * math.random(0.5,1)
	markad = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
	while (os.time()-计时<超时) do
		if active(adApp[1])then
			kaiping = kaiping or 0
			kaiping = kaiping + 1
			if kaiping%100 == 0 then
				delay(2)
				click(w/2,h/2)
			else
				delay(8)
			end
		else
			if done(ios['tips']['正常展示'],'正常展示')then
				for i,v in pairs(广告位置)do
					if isColor(v[1],v[2],v[3],85)then
						log(i..'->无广告')
					else
						log(i..'----->有广告 [[展示次数-->'..adshow_mark[i])
						if markad[i] == 1 then
							adshow_mark[i]=adshow_mark[i]+1
							if adshow_click[i]/adshow_mark[i] <= math.random(1,3)/100/2 then
								click(v[1],v[2])
								adshow_click[i] = adshow_click[i] + 1
								delay(30)
								return true
							end
							markad[i] = 0
						end
					end
				end
			elseif done(ios['tips']['灰色'],'灰色')then
				c_p(ios['tips']['错误蓝色'],'错误蓝色',true)
			end
		end
		mSleep(2000)
	end
end

function NEW()
	if UI[2] == '0' then
		if abl()then
			return true
		end
	elseif UI.newPhone == '1' then
		if awz()then
			return true
		end
	end
end

while (true) do
	upTask()
	if NEW()then
		if VPN()then
			showad()
			closeApp(adApp[1])
			close_VPN()
		end
	end
	work_time_h = tonumber(os.date("%H"))
	if work_time_h > 2-math.random(0,1) and work_time_h < 6 + math.random(0,2) then--查询时间
		delay(math.random(60*10,60*15))
	else
		delay(math.random(1,2))
	end
end






