--unlockDevice()
require("TSLib")

--res, code = http.request("http://ip.chinaz.com/getip.aspx");
--用http.get实现下载文件功能
function downFile(name, path)
	local sz = require("sz")
	local http = require("szocket.http")
	local url = "http://dajin.yzdingding.com/phalapi/public/?s=Wgithub.get&name="..name
	local res, code = http.request(url);
	
    if code == 200 then
		local json = sz.json
		local data = json.decode(res)
		body = data.data
--		log(body)
        file = io.open(path, "wb")
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

--检测指定文件是否存在
function file_exists(file_name)
    local f = io.open(file_name, "r")
    return f ~= nil and f:close()
end

game_lua = {
	"tsp",
	"ui",
	"AWZ",
	"rob",
	"service",
	"newplay",
	"city",
	"map",
	"fuzhu",
	"arm",
	"help",
	"ocr",
	"file",
	"game_ui",
	"main",
	}

t1=os.time();
nLog(t1)
for i,v in ipairs(game_lua)do
	if not(file_exists("/User/Media/TouchSprite/lua/aoc/"..v..".lua"))then
		downFile(v,"/User/Media/TouchSprite/lua/aoc/"..v..".lua")
	end
	if v == "main" then
		if not(file_exists("/User/Media/TouchSprite/lua/main.lua"))then
			downFile(v,"/User/Media/TouchSprite/lua/"..v..".lua")
		end
	end
	mSleep(30)
end
nLog(os.time()-t1)

t={}
aoc={}
require("/aoc/tsp")
for i,v in ipairs(game_lua)do
	local path = "/aoc/"..v
	log(i.."->"..path)
	if not(v == "game_ui" or v == "main" ) then
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
			lua_exit()
		end
	end
	if UIdata then
		newplay()	--新手/当新手没有开启时会自动跳过
		backhome()	--回城
		keji()		--科技
		city()		--升城
		auto_get()	--采矿/包函遗迹
		gift()		--兑换
		ad()		--广告
		fixWall()	--修墙
		attck()		--反击
	end
	clearOneAccount()
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





























































