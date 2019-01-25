--炉石传说,挂机脚本
require 'tsp'

function movegj(x1,y1)
	touchDown(1, x1, y1);  
	touchMove(1, x1, y1);
	mSleep(200)
end
function movexy(x1,y1,x2,y2)
	touchDown(1, x1, y1);  
	mSleep(math.random(100,200))
	touchMove(1, x2, y2); 
	mSleep(math.random(150,200))
	touchUp(1, x2, y2); 
end

a={} ---area
a.先手={}
a['先手'][1] = { 51, 161, 103, 229}
a['先手'][2] = { 421, 159, 481, 221}
a['先手'][3] = { 795, 160, 861, 222}

a.后手={}
a.后手[1] = {15, 160, 60, 224}
a.后手[2] = {294, 160, 348, 222}
a.后手[3] = {570, 162, 624, 221}
a.后手[4] = {848, 165, 905, 226}

a.出牌区 = {695, 625, 1087, 626}
a.英雄技能 = {670,497, 752, 579}
a.牌展开区 = {1110, 204, 1135, 368}
a.出牌 = {15, 553, 1085, 620}
a.攻击区域 = {133, 371, 947, 396}
a.英雄攻击 = {490, 537, 510, 568}
a.结束区域 = {1008, 270,1099, 360}

hero={  --9个英雄位置
	{259,162,0x6c4e5d},
	{554,163,0x5f7245},
	{862,167,0x5f4d48},
	{250,313,0xa9765f},
	{556,311,0x8e261c},
	{867,315,0x8c251d},
	{248,463,0x8c291d},
	{559,462,0x8b251d},
	{859,457,0x8c271b},

	{259,162,0x6c4e5d},
	{554,163,0x5f7245},
	{862,167,0x5f4d48},
	{250,313,0xa9765f},
	{556,311,0x8e261c},
	{867,315,0x8c251d},
	{248,463,0x8c291d},
	{559,462,0x8b251d},
	{859,457,0x8c271b},
}

attack={
	{568,90,0xb2b7d2},  --hero 英雄位置
	{216,244,0x103b11},
	{259,243,0x0e2f10},
	{332,244,0xad5f6e},
	{385,246,0x422a28},
	{448,244,0x442525},
	{510,246,0x9fdb9f},
	{567,245,0x384236},
	{629,242,0xc05710},
	{690,242,0xe2811d},
	{756,243,0x292318},
	{808,244,0x0f1815},
	{886,248,0x232f24},
	{933,242,0x1b1a18},
}

-----------------------起手位置----------------------
ls = {}
ls['今日任务']={{924,37,0x886d45},{80,73,0x8f8987},{1856,73,0x807c7a},{1070,133,0x86653c},}
ls['对战模式']={{1866,73,0x827e7c},{964,329,0xba9c8d},{358,716,0xfbf77d},}
ls['我的套牌']={{734,17,0xaca79c},{46,43,0x8d8585},{69,613,0xecce88},{566,591,0xffe39a},}
ls['打开扩展包']={{166,593,0x3a2b13},{134,591,0xcaae96},{58,43,0x8c8484},{735,22,0xfafafa},{736,23,0x000000},}
ls['任务界面']={{74,584,0x3f3018},{39,583,0xe1c3ac},{397,46,0xd2bb96},{395,52,0x725d42},}
ls['牌店']={{123,579,0x40301b},{88,580,0xe9ceba},{151,424,0xf9f9f9},{709,428,0x000000},}
ls['套牌选择']={{414,98,0xc34030},{437,19,0xc8b38e},{52,43,0x8b8585},{632,594,0xaf8334},}
ls['标准模式']={{1093,37,0x886a3e},{1101,43,0xfdedc4},{1115,43,0xd19f46},}
ls['模式选择']={{667,11,0xba9156},{896,542,0x61ffff},{55,43,0x8c8484},}
ls['排名模式']={{574,421,0x39100d},{575,419,0x8b2121},}
ls['正在搜寻']={{559,589,0x392813},{543,562,0xdab96d},{602,51,0x3e3d3a},{602,47,0xc6b390},{51,43,0x898585},}
ls['找到对手']={{569,585,0x343434},{733,167,0xd3b858},{622,50,0x393837},{49,43,0x868585},}

ls['起始手牌']={ 0x5ea4ff, "10|0|0x7bc2ff", 90, 510, 563, 616, 599}
ls['后手']={0x54ff37, 90, 5, 163, 42, 286}

ls['对手回合']={{1094,43,0x847f77},{999,323,0x786a74},{46,43,0x8d8585},}
ls['我的回合']={{1049,20,0xdbdbdb},{993,305,0xdfc21e},{28,9,0xa8a8a8},}
ls['我的']={{995,303,0x937916},{1099,43,0x80807a},{48,43,0x898585},}
ls['回合绿']={{1001,301,0x2ebf09},{1098,43,0x808081},{49,43,0x868585},}
ls['回合绿2']={{973,289,0x2df91d},}
ls['结束回合']={ 0x219603, "3|0|0x1f9403", 80, 991, 287, 1082, 332}
ls['结束回合2']={ 0x277614, "-21|0|0x51ff36", 80, 954, 280, 1095, 348}

ls['绿色']={{855,629,0x77ff4e},}
ls['金色']={{664,540,0xffff00},}
ls['牌展开']={{1128,243,0xd8d9dd},}
ls['游戏结束']={ 0x5861af, "0|2|0x535baa", 90, 613, 475, 631, 492}
ls['败北']={0x030303, "0|2|0xffffff,8|11|0xbd9452,12|1|0x503d31,31|-9|0xb99256", 90, 546, 416, 647, 479}
ls['胜利']={0x000000, "1|0|0x8a8a8a,2|0|0xeaeaea,4|0|0x060606,21|11|0xb48b52", 90, 548, 390, 683, 469}
ls['获得金币']={{496,436,0x4a529f},{503,431,0xffffff},{499,430,0x000000},{519,413,0x555da9},}
ls['卡牌奖励']={{541,487,0xffffff},{536,482,0x4a539e},{553,468,0x545daf},{554,506,0xf1f1f1},{553,503,0x000000},}
-------------------------------
ls['一']={ 0x040c14, "15|-19|0x131b23,13|-23|0xffffff,13|20|0xfbfbfb,13|21|0x070f18", 90, 9, 224, 32, 304}
ls['二']={ 0x040c14, "-9|27|0xffffff,-12|33|0x51b0ff,-1|24|0x040c14,-1|49|0x040c14", 90, 9, 224, 32, 304}
ls.圣盾怪 = {0x9cea4b}



local sz = require("sz")
local json = sz.json
local w,h = getScreenSize();
MyTable = {
    ["style"] = "default",
    ["width"] = w,
    ["height"] = h,
    ["config"] = "save_ls.dat",
    ["timer"] = 60,
    views = {
        {["type"] = "Label",["text"] = "炉石传说挂机脚本",["size"] = 25,["align"] = "center",["color"] = "0,0,255", },
        {["type"] = "Label",["text"] = "胜多少局投降",["size"] = 14,["align"] = "left",["color"] = "0,0,255", },
        {["type"] = "RadioGroup",["list"] = "1,2,3,4,5",["select"] = "0",},
        {["type"] = "Label",["text"] = "套牌选择(横向)",["size"] = 14,["align"] = "left",["color"] = "0,0,255", },
        {["type"] = "RadioGroup",["list"] = "壹,贰,叁,肆,伍,陆,柒,捌,玖,壹,贰,叁,肆,伍,陆,柒,捌,玖",["select"] = "0",},		
        {["type"] = "Label",["text"] = "模式选择",["size"] = 14,["align"] = "left",["color"] = "0,0,255", },
        {["type"] = "RadioGroup",["list"] = "标准模式,狂野模式",["select"] = "0",},
        {["type"] = "Label",["text"] = "模式选择",["size"] = 14,["align"] = "left",["color"] = "0,0,255", },
        {["type"] = "RadioGroup",["list"] = "休闲模式,天梯",["select"] = "0",},		
    }
}
local MyJsonString = json.encode(MyTable);
ret, surrender_mun, deck, standard, ranking = showUI(MyJsonString);--返回值ret, input1, input2, input3, input4

if ret == 0 then
	lua_exit()
end

init(1);
app_bid = 'com.blizzard.wtcg.hearthstone'; 	--炉石传说
surrender_mun = tonumber(surrender_mun) +1								--胜多少局投降
win = 0 										--胜利场数
deck = tonumber(deck) +1											--选择套牌
standard = tonumber(standard) +1										--标准模式
ranking = tonumber(ranking) +1	 									--天梯
huihe = 0 -- 0为我的回合,1为对手回合

function hero_attack()
	touchDown(1, 691,565)
	mSleep(50)
	touchMove(1, 637,322)
	mSleep(50)
	touchMove(1, 567,84)
	mSleep(100)
	touchUp(1, 567,84)
	mSleep(500)
end

function fp(t,t2,name)
	x,y= findColorInRegionFuzzy(t[1][3],90,t2[1],t2[2],t2[3],t2[4])
	if x >0 and y >0 then
		nLog("单点-->"..name)
		return true
	else
		nLog('没有-->'..name)
	end
end
function fps(t,t2,name)
	x,y = findColorInRegionFuzzy(t[1],85,t2[1],t2[2],t2[3],t2[4])
	if x >0 and y >0 then
		nLog("多点-->"..name)
		return true
	else
		nLog('没有-->'..name)
	end
end

function 出牌()
	if fp(ls.牌展开,a.牌展开区,'牌展开')~=true then
--	if done(ls.牌展开,'牌展开',80)~=true then
		if fp(ls.绿色,a.出牌区,'有可出卡')then
			click(x+50,y)
			delay(1.5)
		end
	end
	if fp(ls.牌展开,a.牌展开区,'牌展开') then
		if fp(ls.金色,a.出牌,'出牌') or fp(ls.绿色,a.出牌,'出牌') then
			movexy(x+50,y,attack[1][1],attack[1][2])
			delay(2)
		end
	end
end
function 攻击()
	if fp(ls.绿色,a.攻击区域,'攻击区域')then
		touchDown(1, x+60,y)
		mSleep(100)
		for i,v in ipairs(attack) do
			movegj(attack[i][1],attack[i][2])
			if f_p({0xcc2408,90,v[1]-5,v[2]-45,v[1]+5,v[2]-35},'可以攻击')then
				touchUp(1, v[1],v[2])
				delay(1)
				return true
			end
		end
		touchUp(1, attack[#attack][1],attack[#attack][2])
	end
	if fps(ls.圣盾怪,a.攻击区域,'圣盾怪')then
		touchDown(1, x+60,y)
		mSleep(100)
		for i,v in ipairs(attack) do
			movegj(attack[i][1],attack[i][2])
			if f_p({0xcc2408,90,v[1]-5,v[2]-45,v[1]+5,v[2]-35},'可以攻击')then
				touchUp(1, v[1],v[2])
				delay(1)
				return true
			end
		end
		touchUp(1, attack[#attack][1],attack[#attack][2])
	end
end
function 英雄攻击()
	if fp(ls.绿色,a.英雄攻击,'英雄攻击')then
		touchDown(1, 560,565)
		mSleep(100)
		for i,v in ipairs(attack) do
			movegj(attack[i][1],attack[i][2])
			mSleep(200)
			if f_p({0xcc2408,90,v[1]-5,v[2]-45,v[1]+5,v[2]-35},'可以攻击')then
				touchUp(1, v[1],v[2])
				delay(1)
				return true
			end
		end
		touchUp(1, attack[#attack][1],attack[#attack][2])
	end
end
function other()
	if done(ls.今日任务,'今日任务')then
		click(946,92)
	elseif done(ls.对战模式,'对战模式')then
		click(956,333)
	elseif done(ls.我的套牌,'我的套牌')then
		delay(2)
		if done(ls.标准模式,'标准模式')~=true and standard == 1 then
			click(1080,44)
		elseif done(ls.标准模式,'标准模式') and standard == 2 then
			click(1080,44)		--狂野模式
		end
		if deck <= 9 then
			click(53,308)
		else
			click(1079,311)
		end
		delay(2)
		click(hero[deck][1],hero[deck][2])
	elseif done(ls.模式选择,'模式选择')then
		if done(ls.排名模式,'排名模式')~=true and ranking == 2 then
			click(1001,101)
		elseif ranking == 1 then
			click(795,97) --休闲模式
		end
		delay(2)
		click(894,543)
	elseif done(ls.正在搜寻,'正在搜寻')then
	elseif done(ls.找到对手,'找到对手')then
		delay(5)
	else
		return false
	end
	return true
end
function surrender()
	if win >= surrender_mun then
		click(1097,23)
		click(567,153)
		win = 0
		return true
	end
end
function event()
	if f_pic(ls.游戏结束,'游戏结束')then
		click(555,490)
	elseif c_pic(ls.败北,'败北')then
	elseif c_pic(ls.胜利,'胜利')then
		win = win + 1
	elseif done(ls.获得金币,'获得金币')then
		click(577,439)
	elseif done(ls.卡牌奖励,'卡牌奖励')then
		click(577,439)
	elseif f_pic(ls.起始手牌,'起始手牌')then
		delay(5)
		if surrender()then
			return false
		end
		if f_p({0x69ff45,90,421, 286,449, 319},'先手')then
			for i,v in ipairs(a.先手) do
				if f_pic({ls['二'][1],ls['二'][2],80,v[1],v[2],v[3],v[4]},'卡2费')~=true then
					click(v[3],v[4])
				end
			end
		else
			for i,v in ipairs(a.后手) do
				if f_pic({ls['二'][1],ls['二'][2],80,v[1],v[2],v[3],v[4]},'卡2费')~=true then
					click(v[3],v[4])
				end
			end
		end
		click(565,583)--点击确认
	end
end

out_time = os.time()
while (true) do
	if active(app_bid) then
		delay(10)
	end
	if done(ls.对手回合,'对手回合',75)then
		other_mun = 0
		delay(1)
		if done(ls.牌展开,'牌展开')then
			click(1096,497)
		end
		huihe = huihe or 1
		if huihe == 1 then
			out_time = os.time()
			huihe = 0 
		end
		if os.time() - out_time > 90 then
			dui_n = dui_n or 0
			if dui_n%2==0then
				click(568,320)
			else
				click(568,540)
			end
			dui_n = dui_n + 1
			out_time = os.time() + 85
		end
	elseif done(ls.我的回合,'我的回合',80)or done(ls.回合绿,'结束',80) or done(ls.我的,'我的回合',80) or fp(ls['回合绿2'],a.结束区域,'结束')then
		other_mun = 0
		huihe = huihe or 0
		if huihe == 0 then
			out_time = os.time()
			huihe = 1
		end
		出牌()
		出牌()
		出牌()
		if fp(ls.绿色,a.英雄技能,'英雄技能')then
			hero_attack()
			if fp(ls.绿色,a.英雄技能,'英雄技能')then
				click(687,558)
			end
		end
		攻击()
		英雄攻击()
		c_pic(ls.结束回合,'结束回合')
		c_pic(ls.结束回合,'结束回合2')
		if fp(ls['回合绿2'],a.结束区域,'结束') then
			click(1014,312)
		end
		if os.time()- out_time >= 30 then
			click(1014,312)
			out_time = os.time()
		end
	else
		log('other')
		other_mun = other_mun or 0
		other_mun = other_mun + 1
		if other_mun >= 200 then
			log('网络超时')
			closeApp(frontAppBid())
			delay(2)
			other_mun = 0
		elseif other_mun >= 100 then
			if other_mun%3 == 0 then
				click(568,320)
			else
				click(568,540)
			end
		end
		other()
	end
	event()
	delay(1)
end










