-- 守望黎明mac
-- main.lua  

-- Create By TouchSpriteStudio on 10:29:23   
-- Copyright © TouchSpriteStudio . All rights reserved.
	
	
require("TSLib")
require('tsp')
require('AWZ')


if not(t) then
	t ={}
	degree = 90
end


t['广告购买按钮'] = { 0xcc9c68,"-145|36|0x7e5d29,150|34|0x433f3b,81|68|0xd9bc6d,100|41|0x745420",degree,200,1231,545,1332}
t['返回按钮'] = { 0xfff6e2,"2|3|0x432f1c,19|-12|0x4c361b,53|-38|0xb1967c,18|-38|0xdfbb98",degree,8,51,122,144}
t['返回按钮2'] = { 0xfff5e2,"21|-16|0x45372c,26|-28|0xc3a486,-1|-20|0x362a21",degree,2,48,70,113}
t['移动建筑提示'] = { 0xffffff,"5|-44|0x346a40,-157|-41|0x7a2829,-153|-12|0xffffff,-30|16|0x417a56",degree,23,18,726,1311}
function ad_()
	if d("广告购买按钮")then
		click(715,36,2)
	elseif d('返回按钮',true)then
	elseif d('返回按钮2',true)then
	elseif d('移动建筑提示',true)then
	else
		click(40,40,2)
	end
end

t['客服在上_白'] = { 0xd7c3a3,"5|0|0x6a8580,14|-5|0xf4dfb9,24|-10|0x6b8583",degree,72,320,114,356}
t['客服在上_夜'] = { 0x75849e,"6|-4|0x315479,15|-7|0x8698b2,24|-12|0x33557b",degree,72,320,114,356}
t['客服在下_白'] = { 0xb7a68b,"5|-1|0x516769,15|-7|0xd4be9d,24|-13|0x52696b",degree,66,920,113,964}
t['客服在下_夜'] = { 0x74849f,"5|-3|0x315378,14|-7|0x8898b6,24|-16|0x385779",degree,65,914,122,954}

function center()
	click(693,1277,2)	--点到城外
	click(693,1277,3)	--点回城内
	if d('客服在上_白') or d("客服在上_夜")then
		return "top"
	elseif d('客服在下_白') or d("客服在下_夜") then
		return 'bottom'
	end
end

t['交易'] = { 0xe4c023,"1|-9|0xd5b62b,13|25|0xd57700,21|2|0xffec09",degree,527,737,619,836}
t['交易2'] = { 0xf7eb19,"-5|-1|0x876919,-32|8|0xd2af23",degree,554,670,713,870}
t['交易_免费-交易行界面'] = { 0xefd884,"-7|1|0x523910,14|31|0xd9c574,17|-322|0xc6ac74,17|-324|0x55422b",degree,628,59,741,484}
t['交易_箱子'] = { 0xfef8d3,"-25|52|0xede5c8,-45|-3|0xb37645,25|-12|0xb87b42",degree,34,523,724,1047}
t['交易_箱子']={{117,642,0xeadcbb},{281,642,0xb07640},{464,644,0x1e1111},{648,640,0xf2e6c5},{110,951,0x281f25},{275,946,0x936031},{467,947,0xe3d6b6},{644,946,0xe8dbbb},}
t['交易_箱子_购买'] = { 0x66885e,"-58|-54|0x95b27e,62|-19|0x3d5c36",degree,250,652,509,749}
t['交易_箱子_购买_关闭'] = { 0xcdb195,"1|12|0x3a2d1b,12|11|0xe4d3b2,-36|-30|0xc29f76,32|21|0x443521",degree,643,303,738,394}

function _trade()
	_trade__ = _trade__ or 0
	_trade__ = _trade__ + 1
	if _trade__ >= 2 then
		_trade__ = 0
		return true
	end
	click(520,671,2)		--点击交易行
	log('点击交易中心')
	if d('交易',true) or d("交易2",true)then
		if d('交易_免费-交易行界面')then
			for i,v in ipairs(t['交易_箱子'])do
				click(v[1],v[2])
				if not(d('交易_箱子_购买',true,1,2))then
					d('交易_箱子_购买_关闭',true)
				end
			end
			return true
		end
	end
end

t['丰收_使用'] = { 0xfcfafa,"2|-4|0x784a26,3|-6|0xf1ece8,-26|31|0xe2c779,15|-37|0xcc9c68",degree,202,939,545,1034}
t['丰收_使用_确定'] = { 0x3c4a5c,"12|0|0x8f97a2,-21|-34|0x6a80a6,336|-34|0xcb9b67",degree,44,763,707,854}

function _foison()
	_trade__ = _trade__ or 0
	_trade__ = _trade__ + 1
	if _trade__ >= 2 then
		_trade__ = 0
		return true
	end
	click(226,712,2)	--点击丰收
	log('点击生产中心')
	if d("丰收_使用",true)then
		d('丰收_使用_确定',true)
		return true
	end
end

t['英雄招募'] = { 0xfffce6,"4|4|0x5a553c,4|-2|0x1f1a0a,6|1|0xf5f5ed",degree,52,691,95,740}
t['英雄招募界面'] = { 0xfff6e2,"25|-23|0x3f301a,670|-25|0xc6ac74,671|-27|0x4f3a25",degree,9,11,745,88}
t['英雄招募_免费'] = { 0xf5efbd,"-2|0|0x6e5018,-106|0|0x604110,89|146|0x5d732d",degree,32,977,360,1242}
t['英雄招募_X'] = { 0xad9477,"-412|1235|0x3e5e37,-253|1236|0x3e5e37",degree,178,10,744,1331}
t['英雄招募_完成'] = { 0x7596a7,"28|-21|0x7a9aab,14|-38|0x7997ab",degree,584,630,657,733}

function _hero()
	_trade__ = _trade__ or 0
	_trade__ = _trade__ + 1
	if _trade__ >= 2 then
		_trade__ = 0
		return true
	end
	click(6,755,2)
	local heroface = false
--	if d('英雄招募',true)then	--点击英雄
		log('点击英雄招募')
		local ii = 1
		while (d("英雄招募界面") and ii < 5) do
			heroface = true
			if d('英雄招募_免费',true)then
				delay(2)
				click(40,40,2)
				delay(2)
			end
			click(110,1235,2)
			ii = ii + 1
			delay(2)
		end
		if heroface then
			return true
		end
--	end
end


t['恢复按钮'] = { 0xc62719,"-1|16|0xc8d96d",degree,489,533,568,600}
t['急救帐篷页面'] = { 0x6d4d19,"-139|3|0x3a5435,-389|5|0x704f19,-541|-1213|0xfff0d6,-546|-1204|0x31281e",degree,7,8,747,1331}
t['急救帐篷页面无'] = { 0x565656,"-262|1|0x595959,-522|-7|0x525252,-586|-43|0x7f7f7f,-52|10|0xf4f0ed",degree,7,1240,744,1329}

function _hospital()
	_trade___ = _trade___ or 0
	_trade___ = _trade___ + 1
	if _trade___ > 2 then
		_trade___ = 0
		return true
	end
	click(228,502,2)	--点击医院
	delay(2)
	log('点击医院')
	if d('恢复按钮',true)then
		return d('急救帐篷页面',true) or d('急救帐篷页面无')
	end
end

t['训练按钮'] = { 0x84ee27,"0|-9|0x9af131,1|14|0x3aec1f,1|30|0x482815",degree,446,663,696,869}
t['训练界面'] = { 0xeec686,"511|0|0xf2ce8e,382|163|0x906c31,27|158|0x4b633f",degree,7,1092,736,1328}
t['正在训练'] = { 0xa77c44,"210|142|0x3f613a,556|169|0xe4cc79,494|112|0x65441d",degree,19,1111,722,1327}
function _arms_ss()
	_trade___ = _trade___ or 0
	_trade___ = _trade___ + 1
	if _trade___ > 2 then
		_trade___ = 0
		return true
	end
	click(兵营位置[step_][1],兵营位置[step_][2],2);
	log('点击射手');
	if d("训练按钮",true)then
		return d("训练界面",true,3,2) or d("正在训练")
	end
end
function _arms_ys()
	_trade___ = _trade___ or 0
	_trade___ = _trade___ + 1
	if _trade___ > 2 then
		_trade___ = 0
		return true
	end
	click(兵营位置[step_][1],兵营位置[step_][2],2);
	log('点击射手');
	if d("训练按钮",true)then
		return d("训练界面",true,3,2)or d("正在训练")
	end
end
function _arms_cl()
	_trade___ = _trade___ or 0
	_trade___ = _trade___ + 1
	if _trade___ > 2 then
		_trade___ = 0
		return true
	end
	click(兵营位置[step_][1],兵营位置[step_][2],2);
	log('点击射手');
	if d("训练按钮",true)then
		return d("训练界面",true,3,2)or d("正在训练")
	end
end

t['总部升级'] = { 0xe5ba85,"1|45|0xfce8be,-2|52|0x624326",degree,255,484,372,607}
	t['未达要求界面'] = { 0x797979,"272|56|0x7d7d7d,410|45|0x606060,588|-1|0x868686,565|68|0x9a9a9a",degree,23,1189,723,1321}
	t['未达要求界面2'] = { 0x2d2d2d,"189|45|0x555555,476|2|0x7e7e7e,476|0|0x2e2e2e,-78|-1133|0x3e3127,-60|-1146|0xc7a789",degree,5,52,740,1327}
		t['跳转X'] = { 0xa14b4a,"-10|-9|0x86403f,9|-9|0x86403f",70,451,752,515,1174}
		t['其它升级'] = { 0xd6ac7b,"-1|42|0xe5cfa9,-2|50|0x5d3d20,9|46|0xe4d4ae",70,377,746,500,944}
		t['其它升级2'] = { 0xe1b684,"-2|19|0xedcc9c,-3|54|0x614227,-9|49|0xfeeac0,9|48|0xfceac0",70,356,767,480,967}
		t['其它升级3'] = { 0xe0c193,"1|-25|0xd8ac7b,-19|0|0x9e795b,20|0|0x9d7d60,-5|24|0xe9d4ae",degree,422,720,600,954}
		t['升级_金币确定'] = { 0xd6b523,"12|-6|0xeed820,17|-6|0x44623e,-50|-33|0xffffff,14|-61|0x17191b",degree,95,420,647,1206}
		
	t['升级界面'] = { 0x6f5019,"-7|37|0x403524,-440|-34|0x709b58,-296|34|0xa9d796",degree,22,1180,728,1321}
		t['派遣'] = { 0xf8f5f3,"6|0|0x744b21,7|-2|0xede7e2,-71|-33|0x583920,42|37|0xe2c577,-85|6|0x8a642a",degree,518,282,722,1206}
		t['派遣2'] = { 0xdfd4cc,"-2|0|0x7a4a28,-59|27|0x87632d,85|-25|0x65411b",degree,498,144,718,796}
	t['准备开仓库_前往'] = { 0x7a4b27,"-4|8|0xfbfaf9,13|11|0x845729,7|-16|0xbf9856",degree,519,950,725,1123}
	t['开仓库界面'] = { 0xd7b493,"23|17|0x3c2e1a,-13|38|0xfff3dd,60|325|0x50404,60|326|0x4e4a3f,64|328|0x1f1e1a",degree,5,8,149,373}
		t['开仓库界面_使用'] = { 0xf6f3f0,"0|2|0x7a4a29,26|1|0xffffff,9|-27|0xa28353",degree,514,394,740,810}
			t['开仓库界面_使用_使用'] = { 0x774a25,"6|-1|0xfffefe,-302|-194|0xfef1db,-301|-204|0x9c8156,57|20|0x8a6632",degree,34,464,717,906}
		t['达成目标'] = { 0xf3c484,"-46|-5|0xf3c484,50|-5|0xf3c484,-1|-8|0xa88248",degree,1,251,749,305}
		

function _up_city()
	_trade___ = _trade___ or 0
	_trade___ = _trade___ + 1
	if _trade___ > 8 then
		_trade___ = 0
		return true
	end
	click(388,341,2)	--点击总部
	if d('总部升级',true)then
		while d("升级界面") or d('未达要求界面') or d('未达要求界面2') or d('开仓库界面') do
			delay(2)
			if d("跳转X")then
				click(x+160,y,4)
				if not(d('准备开仓库_前往',true))then
					click_center_ = click_center_ or 0
					click_center_ = click_center_ + 1
					click(750/2,1334/2+(click_center_%5-2)*20,1)
					click(750/2,1334/2+(click_center_%5-2)*20,2)
					if d('其它升级',true)then
					elseif d('其它升级2',true)then
					elseif d('其它升级3',true)then
					elseif d('升级_金币确定',true)then
					end
				end
			elseif d('开仓库界面')then
				if d('达成目标')then
					click(40,40,2)
				elseif  d('开仓库界面_使用',true)then
					if d('开仓库界面_使用_使用',true)then
					else
						return true
					end
				end
			elseif d("升级界面",true)then
				delay(2)
				return d("派遣",true) or d("派遣2",true)
			end
		end
	end
end


function _getthing()
	
	
end


t['游戏正常']={{591,77,0xe131a},{600,70,0xbfcdd8},{604,68,0x717e8c},{516,96,0xcda16c},}
	t['游戏正常_城内'] = {{49,279,0xffc983},{68,291,0x332319},{50,305,0xffedcf},}
	t['游戏正常_城外'] = { 0x100c09,"-22|0|0xffedce,-28|-7|0x815c42,-42|-15|0xf9cd92,-58|-7|0xb79571",degree,16,168,95,234}
function game_()
	if d('游戏正常')then
		if d('游戏正常_城内')then
			local 基地_ = center()
			delay(rd(2,3))
			if 基地_ == 'top' then
--				_up_city()
				step_ = step_ or 1
				log("step_ --->"..step_)
				兵营位置={[2]={263,666,0xbba69c},[3]={375,575,0xa6927e},[4]={522,685,0x895f49},}
				if step_ == 1 and _hospital()then
					step_ = step_ + 1
				elseif step_ == 2 and _arms_ss()then
					step_ = step_ + 1
				elseif step_ == 3 and _arms_ys()then
					step_ = step_ + 1				
				elseif step_ == 4 and _arms_cl()then
					step_ = step_ + 1
				elseif step_ == 5 and _up_city()then
					return '切号'
				end
			elseif 基地_ == 'bottom' then
				step = step or 1
				log("step --->"..step)
				if step == 1 and _trade() then
					step = step + 1
				elseif step == 2 and _foison() then
					step = step + 1
				elseif step == 3 and _hero() then
					step = step + 1
				elseif step == 4 then
					toast("准备采矿",2)
				end
			end
		elseif d('游戏正常_城外')then
			click(693,1277,2)	--点到城外
		elseif d('返回按钮2',true)then
		end
		return true
	end
end

function main()
	local TimeLine = os.time()
	local TimeOut = 60*10
	while os.time()-TimeLine<TimeOut do
		if active('com.more.dayzsurvival.ios',6)then
			local res__ = game_()
			if res__ == '切号' then
				return true
			elseif not(res__)then
				ad_()
			end
			delay(2)
		end
	end
end


while true do
	main()
	awz_next()
	delay(2)
end






































