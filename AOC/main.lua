--unlockDevice()
require("TSLib")
--require("tsp")

--res, code = http.request("http://ip.chinaz.com/getip.aspx");
--用http.get实现下载文件功能
function downFile(url, path)
	local sz = require("sz")
	local http = require("szocket.http")
	local url = "http://wenfree.cn/api/Public/idfa/?service=Git.Get&url="..url
	local res, code = http.request(url);
--	nLog(res)
    if code == 200 then
		local json = sz.json
		local data = json.decode(res)
		local body = data.data
        local file = io.open(path, "w+")
        if file then
            file:write(body)
            file:close()
            return status;
        else
            return -1;
        end
    else
        return status;
    end
end
--downFile("http://mu1234.applinzi.com/wechat-reply.txt",
--"/User/Media/TouchSprite/lua/wechat-reply.txt")

function delFile(path)--帮你玩平台禁用此函数
    os.execute("rm -rf "..path);
end

--检测指定文件是否存在
function file_exists(file_name)
    local f = io.open(file_name, "r")
    return f ~= nil and f:close()
end

game_lua = {
	{"tsp",'https://raw.githubusercontent.com/ouwen000/lua-touchsprte/master/AOC/tsp.lua'},
	{"ui",'https://raw.githubusercontent.com/ouwen000/lua-touchsprte/master/AOC/ui.lua'},
	{"AWZ",'https://raw.githubusercontent.com/ouwen000/lua-touchsprte/master/AOC/AWZ.lua'},
	{"rob",'https://raw.githubusercontent.com/ouwen000/lua-touchsprte/master/AOC/rob.lua'},
	{"service",'https://raw.githubusercontent.com/ouwen000/lua-touchsprte/master/AOC/service.lua'},
	{"newplay",'https://raw.githubusercontent.com/ouwen000/lua-touchsprte/master/AOC/newplay.lua'},
	{"city",'https://raw.githubusercontent.com/ouwen000/lua-touchsprte/master/AOC/city.lua'},
	{"map",'https://raw.githubusercontent.com/ouwen000/lua-touchsprte/master/AOC/map.lua'},
	{"fuzhu",'https://raw.githubusercontent.com/ouwen000/lua-touchsprte/master/AOC/fuzhu.lua'},
	{"arm",'https://raw.githubusercontent.com/ouwen000/lua-touchsprte/master/AOC/arm.lua'},
	{"help",'https://raw.githubusercontent.com/ouwen000/lua-touchsprte/master/AOC/help.lua'},
	{"ocr",'https://raw.githubusercontent.com/ouwen000/lua-touchsprte/master/AOC/ocr.lua'},
	{"file",'https://raw.githubusercontent.com/ouwen000/lua-touchsprte/master/AOC/file.lua'},
	{"game_ui",'https://raw.githubusercontent.com/ouwen000/lua-touchsprte/master/AOC/game_ui.lua'},
	{"main",'https://raw.githubusercontent.com/ouwen000/lua-touchsprte/master/AOC/main.lua'},
	}


local ver_ =  8
local name_ = "aoc"
local v_url = 'http://wenfree.cn/api/Public/idfa/?service=Git.Update&name='..name_..'&v='..ver_

function get_(url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(url);
	if code == 200 then
		local json = sz.json
		if res ~= nil then
			return json.decode(res)
		end
	end
end

local version = get_(v_url);
if version then
	if version.data then
		t1=os.time();
		nLog(t1)
		for i,v in ipairs(game_lua)do
			nLog(v[1])
			nLog(v[2])
			if v[1] == 'main' then
				local path = "/User/Media/TouchSprite/lua/"..v[1]..".lua"
				delFile(path)
				downFile(v[2],path)
				
			end
			local path = "/User/Media/TouchSprite/lua/aoc/"..v[1]..".lua"
			delFile(path)
			downFile(v[2],path)
			
			mSleep(30)
			toast(v[1],1)
		end
		nLog('end->'..os.time()-t1)
	else
		nLog('无需更新');
		for i,v in ipairs(game_lua)do
			if not(file_exists("/User/Media/TouchSprite/lua/aoc/"..v[1]..".lua"))then
				nLog('文件不存，下载一个->'..v[1])
				downFile(v[2],"/User/Media/TouchSprite/lua/aoc/"..v[1]..".lua")
				if v[1] == 'main' then
					downFile(v[2],"/User/Media/TouchSprite/lua/"..v[1]..".lua")
				end
			end
		end
	end
end

t={}
aoc={}
require("/aoc/tsp")
for i,v in ipairs(game_lua)do
	local path = "/aoc/"..v[1]
	log(i.."->"..path)
	if not(v == "game_ui" or v[1] == "main" ) then
		require(path)
	end
	mSleep(20)
end
local sz = require("sz")
require("/aoc/game_ui")

function init_imei()
	local imeis = sz.system.serialnumber()
	if (imeis) == nil or imeis == '' or string.len(imeis) <5 then
		dialog("请用main启动游戏脚本", 60)
		lua_exit()
	end
	dialog(imeis, 1)
	dialog(UI_v.whos, 1)
end

local ret,errMessage = pcall(init_imei)
if not(ret) then
	dialog("请用main启动游戏脚本", 60)
	lua_exit()
end

function UI(name1,name2,clicks,oder,s)
	local clicks = clicks or false
	local oder = oder or 1
	local s = s or 95
	for i,v in ipairs(aoc[name1][name2]) do
		if isColor(v[1],v[2],v[3],s) then
		else
			return false
		end
	end
	if  clicks then
		click(aoc[name1][name2][oder][1],aoc[name1][name2][oder][2])
	end
	nLog(name1.."->"..name2)
	return true
end
--多点取色
function UI_pic(n,m,clicks)
	x,y = findMultiColorInRegionFuzzy(aoc[n][m][1],aoc[n][m][2],aoc[n][m][3],aoc[n][m][4],aoc[n][m][5],aoc[n][m][6],aoc[n][m][7])
	if x > 0 and y > 0 then
		clicks = clicks or false
		if clicks then
			click(x,y)
			nLog("点多色-->"..m)
		else
			nLog("找多色-->"..m)
		end
		return true
	end
end

function click(x,y,times)
	local times = times or 1
--	log("准备点击("..x..","..y..")")
	touchDown(1,x, y)
	mSleep(50)
	touchUp(1, x, y)
	mSleep(1000*times)
end


init('0',1);--横屏
toast('剑与家园-希望之光',1)
app = 'com.lilithgame.sgame'

function 在地图界面(clicks,clickMun,stayTime)
	local clicks = clicks or false
	local clickMun = clickMun or 1
	local stayTime = stayTime or 1
	if d('在地图界面_商店_领地_地图_任务',clicks,clickMun)then
		delay(stayTime)
		return true
	end
end


function all()

	iphonename = getDeviceName()
	imei = sz.system.serialnumber()
	awz_mun,idfa = getTrueName_awz()

	UIdata = getTokenUi()
	if UIdata and UIdata.delivery then
		log("启用token配置")
		log(UIdata)
	else
		UIdata = getImeiUi()
		if UIdata and UIdata.delivery then
			log('启用imei设置')
			log(UIdata)
		else
			UIdata = false
			dialog('暂无手机本地UI配置,请后台设置',60)
--			lua_exit()
		end
	end
	
	if UIdata then
		newplay()	--新手/当新手没有开启时会自动跳过
		backhome()	--回城
		keji()		--科技
		city()		--升城
		Pantheon()	--万神殿
		auto_get()	--采矿/包函遗迹
		gift()		--兑换
		ad()		--广告
		fixWall()	--修墙
		attck()		--反击
		dragon()	--开龙
	end
	clearOneAccount()
	call_back()
	awz_next()
	delay(2)
end


while (true) do
	local ret,errMessage = pcall(all)
	if ret then
	else
		log(errMessage)
		dialog(errMessage, 10)
		mSleep(2000)
	end
end





























































