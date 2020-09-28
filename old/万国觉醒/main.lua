-- 万国觉醒
-- main.lua  

-- Create By TouchSpriteStudio on 13:31:43   
-- Copyright © TouchSpriteStudio . All rights reserved.
	
	
	
	
	
require('tsp')
require('AWZ')
require('ui')
require('ZZBase64')
require("yzm")

init(1)
_app = {}
_app.bid = 'com.lilithgames.rok.ios.offical'
_UI = {}


local _key = {}
_key['on']= true
_key['off']= false


_UI.国家 = UIv.国家 + 1
_UI.升级 = _key[UIv.升级]
_UI.奖励 = _key[UIv.奖励]
_UI.造兵 = {}
_UI.造兵.key = _key[UIv.造兵key]
_UI.造兵.步兵 = _key[UIv.步兵]
_UI.造兵.骑兵 = _key[UIv.骑兵]
_UI.造兵.弓兵 = _key[UIv.弓兵]
_UI.造兵.车兵 = _key[UIv.车兵]
_UI.建造 = _key[UIv.建造]
_UI.英雄 = _key[UIv.英雄]
_UI.采集 = {}
_UI.采集.key = _key[UIv.采集key]
_UI.采集.种类 = UIv.采集种类+1
_UI.斥候 = _key[UIv.斥候]
_UI.任务 = _key[UIv.任务]


log(_UI)


t={}
degree = 85


t['箭头向下'] = { 0xab4d21,"6|7|0xf0eca5,0|13|0xa15828,0|15|0xe9cb72,-11|50|0x687782,24|37|0xbbd3ea,4|86|0x596d84",degree,0,0,1334,750}
t['箭头向左下'] = { 0xa15026,"-2|8|0xfef5b3,-14|12|0xd9c574,-23|39|0xbfd4e8,-32|58|0xa9c4e4,-59|63|0x5c7188",degree,0,0,1334/2,750}
t['箭头向左下2'] = { 0x596d83,"17|-62|0xe8e9e8,39|-29|0xc3d7eb,16|-15|0x839db6,10|-21|0x576674,48|-51|0xf4edaa",degree,0,0,1334/2,750}
t['箭头向左上'] = { 0xa25228,"-7|-4|0xf6eaaa,-13|-15|0xd3c97f,-61|-62|0x647991,-58|-38|0xafc8e4,-47|-42|0x8ca6c0",degree,0,0,1334,750}
t['箭头向右'] = { 0xa15026,"8|-3|0xfdf4b3,19|-1|0xd9d08a,82|-3|0x677c96,63|-19|0xa9c4e4,41|-14|0xc2d8ec",degree,0,0,1334,750}
t['箭头向右2'] = { 0xa3542b,"9|-2|0xfff7b5,18|1|0xae834c,20|1|0xd3c97f,78|-1|0x687e94",degree,0,0,1334,750}
t['箭头向右-攻击'] = { 0xaf2f23,"184|67|0x820c0c,192|10|0x820c0c,-7|60|0x830b0b",degree,837,458,1065,543}
	
--事件
t['e-国家选择'] = { 0xf9db41,"-50|-32|0xeca140,-35|-63|0xfbd13f,-577|451|0x61f634",degree,259,24,1244,612}
--1罗马，2德国，3不列直，4法兰西，5西班牙，6中国，7日本，8韩国，9阿拉伯，10奥斯曼，11拜占庭
t['e-国家选择-位置']={{98,664,0x542b9f},{287,664,0x333333},{470,663,0xd0952d},{655,663,0xd9a72f},{838,664,0xef9798},{1023,665,0x732c1b},{1208,663,0xa0939e},
	{693,667,0x2c3786},{879,667,0x12582e},{1065,663,0x8f2323},{1249,665,0xce8c29},}
	t['e-国家选择-位置-确定'] = { 0xffb000,"2|-8|0xb67016",degree,1061,498,1193,551}

function _Evevnt()
	if d('e-国家选择')then
		if _UI.国家 > 7 then
			moveTo(1247,663,139,666,10)
			delay(2)
		end
		click(t['e-国家选择-位置'][_UI.国家][1],t['e-国家选择-位置'][_UI.国家][2],2)
		d('e-国家选择-位置-确定',true,2)
	else
		return true
	end
end


function _Arrow()
	
local ret = false
_arrow = _arrow or 0


local result = false

keepScreen(true)
	if d('箭头向下')then
		_arrow = _arrow + 1
		click(x,y + (_arrow%3+1)*50+100)
		_arrow = _arrow + 1
		click(x,y + (_arrow%3+1)*50+100)
		_arrow = _arrow + 1
		click(x,y + (_arrow%3+1)*50+100)
		ret = true
	elseif d('箭头向左下') or d('箭头向左下2')  then
		log("向左")
		log({'x',x,'y',y})
		_arrow = _arrow + 1
		click(x - (_arrow%3+1)*50-50 ,y + (_arrow%3+1)*50+50 )
		_arrow = _arrow + 1
		click(x - (_arrow%3+1)*50-50 ,y + (_arrow%3+1)*50+50 )
		_arrow = _arrow + 1
		click(x - (_arrow%3+1)*50-50 ,y + (_arrow%3+1)*50+50 )
		ret = true
	elseif d('箭头向左上')then
		_arrow = _arrow + 1
		click(x - (_arrow%3+1)*50 ,y - (_arrow%3+1)*50 )
		_arrow = _arrow + 1
		click(x - (_arrow%3+1)*50 ,y - (_arrow%3+1)*50 )
		_arrow = _arrow + 1
		click(x - (_arrow%3+1)*50 ,y - (_arrow%3+1)*50 )
		ret = true
	elseif d('箭头向右') or d("箭头向右2")then
		_arrow = _arrow + 1
		click(x + (_arrow%3+1)*50+100 ,y )
		_arrow = _arrow + 1
		click(x + (_arrow%3+1)*50+100 ,y )
		_arrow = _arrow + 1
		click(x + (_arrow%3+1)*50+100 ,y )
		ret = true
	elseif d('箭头向右-攻击',true,2)then
		ret = true
	end
keepScreen(false)
	
return x
end


t['游戏主界面'] = { 0x13567e,"83|1|0x1f5a80,54|625|0xf5e18a,56|727|0xf4bd63",degree,0,0,123,749}
t['游戏主界面-夜'] = { 0xf5bd63,"-1|-102|0xf2dc88,-56|-727|0xa507e,27|-731|0xf476f",degree,0,0,123,749}
	t['游戏主界面-野外'] = { 0xb527f,"0|1|0x3ea0c4,-1|15|0x7fdef5,-1|16|0x4192b3,-21|-2|0x66ddf8,-24|-2|0xa507c",degree,18,640,108,726}
	t['游戏主界面-城内'] = { 0x2074a0,"0|-10|0xffffff,0|15|0x6ce6ff,10|29|0x24776,15|33|0x82e7fe,-42|32|0x8578f",degree,27,653,106,722}
t['联盟加入'] = { 0x1274ba,"-60|-12|0xc8f6,-18|20|0xace9,47|1|0xc7ff",degree,586,203,753,269}
	t['联盟加入不能'] = { 0x939585,"-271|98|0xd3ff",degree,545,87,993,301}
	
function _init()
	d('游戏主界面-城内',true,2)
	d('游戏主界面-野外',true,1,3)
	if d('联盟加入',true)then
		d("联盟加入不能",true)
	elseif d('游戏主界面-城内')then
		log('初始化完成')
		return true
	end
end
	

t['弹窗-任务x'] = { 0xd3d1ca,"-11|-10|0xd7d6ce,-11|-4|0x9c9b8d,6|13|0x9d9a8f,9|9|0xd2cfc6",degree,1113,66,1165,112}	
t['弹窗-邮件面板x'] = { 0xd3d1c9,"-12|-10|0xd7d4cc,-13|-7|0x9e9991,9|14|0xa09c93",degree,1256,25,1317,70}
t['弹窗-资料面板x'] = { 0xd3d1ca,"-11|-10|0xd7d5ce,-13|-7|0x9a968e,8|13|0x9c988e",degree,1115,66,1161,110}
t['弹窗-设置面板x'] = { 0xd3d1ca,"-13|-8|0x9b978f,-9|10|0xd2d0c7,14|12|0x9a968d",degree,1136,24,1187,71}
t['弹窗-蓝色按钮'] = { 0x1274ba,"-107|-25|0xd4ff,-110|24|0xb5f0,115|24|0xb5f0,109|-24|0xd4ff",degree,333,164,1000,596}
t['弹窗-返回按钮'] = { 0xd6d4cf,"15|-9|0x8e8c86,10|-14|0xdbd9d3,10|13|0xd0d0cb,0|24|0x959287",degree,3,3,86,82}
t['弹窗-正在加载'] = { 0xbb2fe,"2|14|0x64ae,7|-2|0xdb2fe,14|8|0x180d5",degree,343,652,558,690}	
t['弹窗-升级箭头-物质不足'] = { 0xd3d1ca,"-464|378|0xc7ff,-378|377|0x1274ba,-304|404|0xb7f3",degree,232,97,1095,651}	
t['弹窗-招到英雄'] = { 0x1274ba,"-84|-26|0xd2fd,88|25|0xb5f1",degree,67,574,339,695}
t['弹窗-开箱确定'] = { 0x1577bc,"-81|-27|0xd4ff,422|15|0xffa700,619|10|0xffa900",degree,274,591,1061,695}
t['弹窗-升级确认'] = { 0x1274ba,"-95|-7|0xc9ff,159|-389|0x858278,318|1|0xc2ff",degree,230,94,1088,661}
t['弹窗-取消城市编辑'] = { 0xd6d4cc,"-264|615|0xc0fc,-537|608|0xc4ff,-824|606|0xc5ff",degree,186,6,1328,717}
t['弹窗-网络断开'] = { 0x1176bc,"50|-291|0x858278,118|-289|0xc6c3b6",degree,362,183,974,568}
t['弹窗_点击任务_宝石'] = { 0xd3d1c9,"-460|407|0xffb100,-305|382|0xfebf00",degree,483,102,1099,662}
t['弹窗_绑定帐号'] = { 0xd3d1c9,"-274|395|0xc1fe,-497|388|0xc5ff,-591|234|0xf2a643",degree,241,99,1098,644}
t['弹窗_弹出宝箱'] = { 0x9bab6e,"-596|544|0xb77016,-397|533|0xb77016,-501|516|0xffc000,-502|568|0xfca100",degree,487,78,1195,716}
t['弹窗—回天改命'] = { 0xadafaf,"-595|521|0xb77016,-409|552|0xfeaa00",degree,462,21,1223,740}
t['弹窗—验证图片'] = { 0x1274ba,"-51|-7|0xd3ff,43|17|0xb5f1,58|-5|0x1077bc,-10|-131|0xffef00",degree,663,90,1029,458}
	t['弹窗—验证图片-确定'] = { 0x539ffe,"83|0|0x539ffe,-339|-2|0xffffff,-323|-10|0x7e7e7e,-406|-3|0x7e7e7e",degree,392,644,944,730}
t['弹窗—app更新'] = { 0xc3ff,"-82|-24|0xd3fd,64|20|0xb5f0,192|-1|0xdf3d33,343|2|0xdd3c33",degree,384,427,966,569}
	
function _Tips()
	local tips = {
		'弹窗-网络断开',
		'弹窗-任务x',
		'弹窗-邮件面板x',
		'弹窗-资料面板x',
		'弹窗-设置面板x',
		'弹窗-蓝色按钮',
		'弹窗-返回按钮',
		'弹窗-招到英雄',
		'弹窗-升级确认',
		'弹窗-开箱确定',
		'弹窗-取消城市编辑',
		'弹窗-升级箭头-物质不足',
		'弹窗—app更新',
		'弹窗_绑定帐号',
		'弹窗_弹出宝箱',
		'弹窗—回天改命',
		'弹窗_点击任务_宝石',
		'弹窗—验证图片',
		'弹窗-正在加载',
		}
	for k,v in pairs(tips)do
		if v == "弹窗-正在加载" then
			if d(v)then
				delay(15)
				return false
			end
		elseif v == "弹窗—验证图片" then
			if d(v,true,1,5) then
				local time_ = os.time()
				while ( os.time() - time_ < 120 ) do
					if d("弹窗—验证图片-确定")then
						delay(1)
						if _yzmsb()then
							d("弹窗—验证图片-确定",true,1,5)
							delay(10);
							return true
						end
					end
				end
				click(20,20);
			end
		else
			if d(v,true,1,2)then
				return false
			end
		end
	end
		_other = _other or 0
	_other = _other + 1
	local other_w = {{50,174},{1128,44},
--		{837,535},{1050,171},{42,40}
		}
	local other_w_c = _other%(#other_w+1)
	if other_w_c == 0 then
		moveTo(500,200,500,300,rd(10,20))
	else
		click(other_w[other_w_c][1],other_w[other_w_c][2],0.2)
	end
	log('e')
	return true
end
	
t['升级-升级箭头'] = { 0x1faa0f,"12|28|0x9203,-2|-29|0x70d255",degree,478,356,597,477}
t['升级-升级箭头青铜'] = { 0xeab212,"0|-30|0xfee35c,-9|22|0xde9800",degree,485,356,585,460}
t['升级-升级按钮'] = { 0xc2ff,"101|2|0xc2ff,-158|2|0xfeaf00,-298|-3|0xfeb200",degree,638,381,1162,682}
t['升级-前往'] = { 0x1274ba,"-37|-18|0xd3fd,63|14|0xace9",degree,671,496,1120,656}
t['升级-前往-升级箭头'] = { 0x17a50a,"-3|22|0x9203,-1|-26|0x5ecb43",degree,448,360,885,607}
t['升级-正在升级中'] = { 0xe0a10f,"27|-1|0xdea716,-8|-22|0xf0efe9,-1|-22|0xf1c03a,-32|17|0xcf920d,-41|18|0xe6e4d9",degree,470,357,861,570}
t['升级-正在升级中-总部'] = { 0xe3a412,"29|1|0xdea716,-1|-19|0xf1be35,-6|-20|0xf4ece1,-1|23|0xce9408,-35|8|0xf2e3cd,-31|20|0xcf920d",degree,478,344,616,490}
	t['升级-宝石'] = { 0xfeaf00,"148|-67|0x334e,397|2|0xc1fe,471|29|0x1176bc",degree,325,414,1020,611}
	t['升级-宝石不足'] = { 0x980e0e,"11|1|0xffa700",degree,754,529,848,626}
	t['升级-新手保护确定'] = { 0x1274ba,"-115|-4|0xc7ff,114|4|0xc2ff,241|-23|0xd4ff,461|33|0x1176bc",degree,297,456,1040,615}
function _build()
	log("升级")	
		click(469,218,2)	--点击市政厅
		if d("升级-升级箭头",true,1,2) or d('升级-升级箭头青铜',true,1,2)then
			while d("升级-升级按钮") or d("升级-前往") do
				if d("升级-升级按钮",false,1,2)then
					
					local dengji = ocrText(783,171,835,206, 10,'1234567890')
					log({"dengji",dengji})
					if dengji == "" or dengji== nil then
						dengji = 100
					end
		
					if dengji+0 <= 3 and not(d("升级-宝石不足")) then
						click(766,571)
						d("升级-宝石",true,1,5)
					else
						if d("升级-升级按钮",true,1,2)then
							d("升级-新手保护确定",true,1,2)
							_UI.升级 = false
							delay(3)
						end
					end
				elseif d("升级-前往",true,1,2)then
					if d("升级-前往-升级箭头",true,1,2)then
					elseif d('升级-正在升级中')then
						_UI.升级 = false
						return true
					end
				end
			end
		elseif d('升级-正在升级中-总部') then
			_UI.升级 = false
			return true
		end

end


t['奖励-有奖励'] = { 0xe0ac64,"6|-9|0xfef6a4,34|-41|0xe30000",degree,8,119,109,221}
t['奖励-奖励面板-领取'] = { 0xbf0f,"-58|-16|0xd40f,57|15|0x9e0d",degree,954,173,1137,657}
t['奖励-奖励面板-领取分类'] = { 0x1e6184,"-32|-31|0xe20000",degree,31,112,157,525}
t['奖励-奖励面板-红色-银'] = { 0xc2c4d4,"37|-36|0xe20000",degree,606,155,717,249}
t['奖励-奖励面板-红色-黄'] = { 0xf4b246,"37|-35|0xe20000",degree,1013,148,1166,258}
t['奖励-奖励面板-领取箱子'] = { 0xffff19,"-26|2|0xfec404",degree,292,132,1160,278}
function _Award()
	log("奖励")
	if d("奖励-有奖励",true,1,3)then
		local _jlcs = 1
		while _jlcs< 30 and (d("奖励-奖励面板-领取",true,1,2) or d("奖励-奖励面板-红色-银",true,1,2)or d("奖励-奖励面板-红色-黄",true,1,2)or d("奖励-奖励面板-领取箱子",true) or d("奖励-奖励面板-领取分类",true,1,2)) do _jlcs=_jlcs+1 end
	else
		_UI.奖励 = false
		return false
	end

end


t['造兵-训练'] = { 0xfafeff,"20|-28|0xcffe,-92|-14|0xc5ff",degree,914,574,1137,659}
t['造兵-加速'] = { 0xd3d1c9,"-151|515|0x1176bc,-232|500|0xd1ff,-38|545|0xb6f3",degree,858,58,1165,680}

function _soldier()
	log("造兵")
	local 兵营位置={
			{{549,449,0x4b3e35},{686,595,0x880ba},},
			{{549,449,0x4b3e35},{686,595,0x880ba},},
			{{549,449,0x4b3e35},{686,595,0x880ba},},
			{{549,449,0x4b3e35},{686,595,0x880ba},},
		}
	local 兵种 = { 
		"步兵","骑兵","弓兵","车兵",
		}
	for k,v in ipairs(兵种) do
		if _UI.造兵[v] then
			click(兵营位置[k][1][1],兵营位置[k][1][2],2)
			click(兵营位置[k][1][1],兵营位置[k][1][2],2)
			click(兵营位置[k][2][1],兵营位置[k][2][2],2)
			if d('造兵-训练',true) or d('造兵-加速',true,1,2) then
				_UI.造兵[v] = false
			end
		end
	end
	_UI.造兵.key = false
end


t['建造-有建造'] = { 0xe20000,"20|-4|0xe20000",degree,75,511,116,557}
t['建造-装饰'] = { 0x656257,"-29|-37|0xe30000",degree,3,602,97,700}
t['建造-可以建造'] = { 0x255273,"-132|1|0x9ee6ff,111|1|0x9ee6ff",degree,134,469,419,665}
t['建造-可以建造分类'] = { 0x757568,"-42|-34|0xe20000",degree,3,478,99,570}
t['建造-准备建造'] = { 0x89a05,"-131|4|0xe50909,-171|-35|0xf27979,-151|6|0xf3e9e5",degree,6,2,1252,744}
	t['建造-建造取消'] = { 0xd3d1c9,"-24|242|0xd0ff,-30|441|0xffb000,-187|466|0xfca000",degree,898,58,1169,681}
t['建造-编辑城市'] = { 0xd59813,"24|-16|0xe20000",degree,1115,145,1210,286}

function _NewBuild()
	log("建造")
	if d('建造-有建造')then
		click(64,564,2)
		d("建造-装饰",true,1,2)
		click(53,411,2)
		
		while d("建造-可以建造") or d("建造-可以建造分类",true,1,2)do
			if d("建造-可以建造",true,1,2) then
				if d('建造-准备建造',false,1,2)then
					log({x,y})
					if x > 1000 then
						moveTo(600,300,400,300,5)
						delay(2)
					end
					d('建造-准备建造',true,1,2)
					if d('建造-建造取消',true,1,2)then
						_UI.建造 = false
						return false
					end
				else
					_NewBuild_lun = _NewBuild_lun or 0
					_NewBuild_lun = _NewBuild_lun + 1
					if _NewBuild_lun%4 == 0then
						moveTo(600,300,400,300,5)--向左
					elseif _NewBuild_lun%4 == 1then
						moveTo(400,300,600,300,5)--向右
					elseif _NewBuild_lun%4 == 2then
						moveTo(300,500,300,300,5)--向上
					elseif _NewBuild_lun%4 == 3then
						moveTo(400,100,400,300,5)--向下
					end
					delay(0.5)
					d('建造-准备建造',true,1,2)
					if d('建造-建造取消',true,1,2)then
						_UI.建造 = false
						return false
					end
				end
			end
		end
		d('建造-编辑城市',true,1,2 )
	else
		_UI.建造 = false
	end
end


t['草-夜'] = { 0x378a56,"22|39|0x328057,17|3|0x51c1a,15|18|0xd131e",degree,9,6,1252,742}
t['草-白'] = { 0xabf54d,"20|41|0xa2eb50,16|5|0x133618,-10|12|0xd3117",degree,10,6,1242,741}
t['树-白'] = { 0xaefb4f,"-31|-59|0x6ba83a,12|-38|0x143516,41|-23|0x82c146",degree,6,3,1242,738}
t['草-铲子'] = { 0xeb3535,"-24|24|0xe50909,-162|2|0xe4f1f4,-155|-12|0x28a4dc",degree,5,4,1244,742}
t['草-铲子-是'] = { 0x1274ba,"-98|-19|0xd2ff,473|9|0xbffc",degree,331,450,1019,600}
function _glass()
	log("除草")
	for i=1,10 do
		if d("树-白",false,1,2) or d('草-夜',false,2,2) or d('草-白',false,2,2)then
			
			if x < 150 then
				moveTo(300,600,500,600,10)
				delay(2)
			end
			if y > 500 then
				moveTo(300,600,300,400,10)
				delay(2)
			end
			
			if d("树-白",true,1,2) or d('草-夜',true,2,2) or d('草-白',true,2,2)then
				log({x,y})
				if d("草-铲子",true)then 
					d("草-铲子-是",true)
				end
			end
		end
	end
end

t['签到-vip'] = { 0xffb400,"36|-13|0xe20000",degree,128,45,203,88}
t['签到-领取'] = { 0xc40e,"-47|-18|0xc80e,44|21|0xc760a",degree,855,121,1126,489}
t['签到-领取-红'] = { 0,"13|7|0xcddce2,13|-55|0xe20000",degree,987,141,1136,254}
t['签到-领取-黄'] = { 0xf5b347,"37|-34|0xe20000",degree,767,526,877,629}
function _SignIn()
	log("签到")
	if d("签到-vip",true,1,2)then
		if d("签到-领取-黄",true,1,2)then
		elseif d("签到-领取",true,1,2)then
		elseif d("签到-领取-红",true,1,2)then
		end
	end
end


t['收集-玉米'] = { 0xffff6b,"-5|-3|0xffe731,6|8|0x7fe81d,-10|18|0x236602,-12|6|0x5bc40f",70,94,50,1208,716}
t['收集-木材'] = { 0xe0e0e1,"-5|-20|0xd3955f,12|-34|0x7a2f0a,2|-35|0xe1702b",70,20,85,1250,745}
t['收集-木材黄'] = { 0x6e2a08,"-19|2|0xecb87b,-16|21|0xd0905c,-5|7|0x92380b",degree,21,43,1232,712}
t['收集-石头'] = { 0xd8dfee,"0|-7|0x969fb7,-15|10|0x9da6c1,-16|16|0x606a83,12|11|0x485168",80,50,20,1250,736}
t['收集-握手'] = { 0xdedee0,"8|-19|0x2f9c01,0|-36|0xfcf2e1,-12|-41|0xffe67e,-12|-25|0x33a600",70,54,85,1224,723}
function _Collect()
	log("收集")
	local 收集 = {"收集-玉米","收集-木材","收集-石头","收集-握手","收集-木材黄"}
	for k,v in ipairs(收集) do
		d(v,true,2,2)
	end
end


t['英雄-放大镜'] = { 0xd8edf6,"7|6|0x1188bb,17|33|0x6093,-16|43|0xcce6ea,-20|29|0x6195",degree,415,475,515,570}
t['英雄-开启'] = { 0x1274ba,"-93|-24|0xd3ff,111|25|0xb3ef,47|32|0x1176bc",degree,213,531,1107,705}
t['英雄-开启-确定'] = { 0x1274ba,"-76|-23|0xd1ff,105|20|0xb6f3,570|5|0xffac00",degree,270,596,1080,700}
function _Hero()
	log("英雄")
	click(314,344,2)
	if d("英雄-放大镜",true,1,2)then
		local _opentimes = 0
		while (d("英雄-开启",true,1,5) or d("英雄-开启-确定",true,1,3)) and _opentimes < 10 do
			_opentimes = _opentimes + 1
		end
		_UI.英雄 = false
	end
end


t['采矿-放大镜'] = { 0xe5984,"-5|-15|0xfdffff,-1|22|0x5585,11|13|0x7ce7ff",degree,13,507,107,613}
t['采矿-搜索'] = { 0x1274ba,"-69|-29|0xd3fe,81|23|0xb4f0",degree,130,454,1201,605}
	t['采矿-搜索-攻击'] = { 0x970e0e,"-104|-23|0xe94d3d,63|29|0xc12724,-103|24|0xd4302b",degree,167,94,1195,732}
	t['采矿-搜索-采集'] = { 0x1273b9,"-85|-29|0xd1fc,93|31|0x1175bb,88|-25|0xd2fe",degree,73,51,1233,739}
t['采矿-创建部队'] = { 0x1375ba,"-82|-24|0xd3fd,86|33|0x1175bb",degree,927,14,1195,727}
t['采矿-行军'] = { 0xfdae00,"118|-1|0xfeae00,-118|-6|0xfdb100,-340|-14|0xcafd,-208|8|0xbcf8",degree,612,603,1164,719}

function _Collection()
	log("采集")
	if _UI.采集.key then
		local 采集位置={{269,665,0xb3b0b0},{474,661,0x428a22},{675,662,0xc28f71},{861,659,0x585858},{1064,661,0x878787},}
		if d('采矿-放大镜',true,1,2)then
			
			_Collection_lun = _Collection_lun or 0
			_Collection_lun = _Collection_lun + 1
			local _Coll_key = _Collection_lun%5+1
			if tonumber(_UI.采集.种类) >= 6 then
				log({'_Coll_key',_Coll_key})
				click( 采集位置[_Coll_key][1],采集位置[_Coll_key][2],2 )
			else
				click( 采集位置[tonumber(_UI.采集.种类)][1],采集位置[tonumber(_UI.采集.种类)][2],2 )
			end
			if d("采矿-搜索",true,1,2)then
				click(663,367,2)	--点屏中间
				if d("斥候-搜索-绿")then
					log("未开荒")
					_UI.采集.key = false
					return false
				end
				d("采矿-搜索-攻击",true,1,2)
				d("采矿-搜索-采集",true,1,2)
				d("采矿-创建部队",true,1,2)
				
				if d("采矿-行军",true,1,2) and _Coll_key ~=1 then
					_UI.采集.key = false
				elseif _Coll_key == 1 then
					log('打野中休息15秒','all')
					delay(15)
				end
			end
		end
	end
end



local 斥候位置={{808,404,0xb2004},{952,564,0x97fb8},}
t['斥候-搜索'] = { 0xffac00,"-91|-29|0xffbf00,83|16|0xffa500",degree,894,263,1159,561}
t['斥候-搜索-绿'] = { 0xb67016,"-75|-29|0xffc000,94|22|0xffa400",degree,97,25,1230,722}
t['斥候-搜索-派遣'] = { 0xb67016,"-8|-19|0xffbe00,-93|-20|0xffbe00,79|25|0xffa500",degree,916,7,1195,572}
t['斥候-搜索-派遣中'] = { 0xffffff,"5|-5|0xb66200,-22|-36|0xbc13eb",degree,1224,158,1332,436}
t['斥候-休息中'] = { 0xffffff,"7|1|0x7d7d7d,-1|-13|0x7d7d7d,3|8|0xbdbdbd",degree,406,331,471,419}
function _Acouts()
	log("斥候")
	click(斥候位置[1][1],斥候位置[1][2],2)
	click(斥候位置[2][1],斥候位置[2][2],2)
	
	if d("斥候-搜索",true,1,2)then
		d("斥候-搜索-绿",true,1,2)
		d("斥候-搜索-派遣",true,1,2)
		if d("斥候-搜索-派遣中")then
			_UI.斥候 = false
		end
	elseif d("斥候-休息中")then
		_UI.斥候 = false
	end
end



t['医院+'] = { 0xf31919,"0|-13|0xfe3333,-11|1|0xf11616,1|11|0xe90202,15|-1|0xeaeee7",degree,606,225,699,323}
t['医院-治疗'] = { 0xc2ff,"100|-25|0xd1ff,-160|25|0xfea200,-399|-28|0xfebf00",degree,566,549,1153,669}
t['医院-治好'] = { 0x9d4400,"9|0|0x9a4300,26|-4|0xc86600",75,609,228,703,335}

function _Hospital()
	log("医院")
	if d("医院+",true,1,2)then
		d("医院-治疗",true,1,2)
	elseif d("医院-治好",true,1,2)then
	else
		return false
	end
end

--简单清理
function clearOneAccount()
	log('简单清理')
	local sonlist={
		'/tmp/',
		'/Library/',
	}
	for k,v in ipairs(sonlist)do
		local dataPath = appDataPath(_app.bid)
		local AllPath = dataPath..v
		log(AllPath)
		delFile(AllPath)
	end
end


t['任务_点击任务'] = { 0xe4b067,"-18|15|0x6d0000,-16|-7|0x560000",degree,18,141,76,196}
	t['任务_点击任务_前往'] = { 0x1274ba,"-56|-18|0xd4fe,59|7|0xb6f3",degree,937,139,1163,429}
	t['任务_点击任务_训练'] = { 0xc9ff,"-349|-175|0x14d900,-309|15|0xffac00",degree,595,387,1140,668}
	t['任务_点击任务_训练_取消'] = { 0xc0fe,"-445|-7|0xfeb200,-264|-67|0x334e",degree,286,356,1070,630}
t['任务_点击任务_采矿'] = { 0x8c7ff,"162|-26|0x1077bc,162|19|0x1076bd",degree,128,429,1173,600}		
	
function _task()
	
	_setp['任务'] = _setp['任务'] + 1
	if _setp['任务'] > 2 then
		_UI.任务 = false
		return false
	end

	if d('任务_点击任务',true,1,3)then
		click(122,336,2)
		d("奖励-奖励面板-领取",true,1,2)
		if d("任务_点击任务_前往",true,1,3)then
			
			if d("任务_点击任务_采矿",true,1,2)then
				
			else
				click(809,507,2)
			end
			delay(1)
			
			if d("游戏主界面-野外")then
				click(663,367,2)	--点屏中间
				d("采矿-搜索-攻击",true,1,2)
				d("采矿-搜索-采集",true,1,2)
				d("采矿-创建部队",true,1,2)
				if d("采矿-行军",true,1,2)then
					_UI.任务 = false
				end
			else
			
				d("任务_点击任务_训练_取消",true,1,2)
				
				if d('任务_点击任务_训练',true) or d('造兵-加速') then
					_UI.任务 = false
				end
			
			end
		end
	end
end

function allclear()
	main_path = '/var/mobile/awzdata/'.._app.bid.."/"
	--遍历文件
	function getList(path)
		local a = io.popen("ls "..path);
		local f = {};
		for l in a:lines() do
			table.insert(f,l)
		end
		a:close()
		return f
	end
	list = getList(main_path)	--文件夹例表
	son = '/Library/'
	son2 = '/tmp/'
	
	function delFile(path)--帮你玩平台禁用此函数
		os.execute("rm -rf "..path);
	end

	function 清理()
		for i,v in pairs(list)do
			all = main_path..v..son
			nLog(all)
			delFile(all)
		end
		for i,v in pairs(list)do
			all = main_path..v..son2
			nLog(all)
			delFile(all)
		end
	end
	清理()
end

function game()
	local timeline = os.time()
	
	while os.time()-timeline < 60 * 5 do
		if active(_app.bid,8)then
			if d('游戏主界面') or d('游戏主界面-夜')then
				if d("游戏主界面-城内")then
					d('弹窗_绑定帐号',true,1)
					_glass()
					_SignIn()
					_Collect()
					
					if _init()then
						if _Hospital() then
						elseif _UI.建造 then
							_NewBuild()
						elseif _UI.英雄 then
							_Hero()
						elseif _UI.升级 then
							_build()
						elseif _UI.奖励 then
							_Award()
						elseif _UI.任务 then
							_task()
						elseif _UI.造兵.key  then
							_soldier()
						elseif _UI.斥候 then
							_Acouts()
						elseif _UI.采集.key then
							if d("游戏主界面-城内",true,1,2)then
								_Collection()
							end
						else
							return 'next'
						end
					end
				elseif d("游戏主界面-野外")then
					click(65,681,2)
				end
			else
				if _Evevnt() then
					_Arrow()
					_Tips()
				end
			end
		end
	end
	return 'next'
end
	
	
function main()
	
	while true do
	
		_setp = {}
		_setp['任务'] = 0
	
		_UI.国家 = UIv.国家 + 1
		_UI.升级 = _key[UIv.升级]
		_UI.奖励 = _key[UIv.奖励]
		_UI.造兵 = {}
		_UI.造兵.key = _key[UIv.造兵key]
		_UI.造兵.步兵 = _key[UIv.步兵]
		_UI.造兵.骑兵 = _key[UIv.骑兵]
		_UI.造兵.弓兵 = _key[UIv.弓兵]
		_UI.造兵.车兵 = _key[UIv.车兵]
		_UI.建造 = _key[UIv.建造]
		_UI.英雄 = _key[UIv.英雄]
		_UI.采集 = {}
		_UI.采集.key = _key[UIv.采集key]
		_UI.采集.种类 = UIv.采集种类+1
		_UI.斥候 = _key[UIv.斥候]
		_UI.任务 = _key[UIv.任务]
			
		game()
--		clearOneAccount();
		allclear();
		delay(1)
		awz_next()

		delay(1)
	end
end
	
	
main()

















	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	