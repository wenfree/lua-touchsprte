
--[[
aoc['换服']={}
aoc['换服']['在地图上']={{1220,33,0x9a5300},{223,698,0xdb0401},{65,694,0xe5ff33},}
	aoc['换服']['帐号管理']={{1180,257,0x2d6720},{1183,257,0x173310},{1185,257,0x9eba94},}
	aoc['换服']['设置功能选择']={{283,275,0x29a0bd},{780,277,0x2aa5c0},{782,558,0x29a5c1},}
		--选服,绑定,礼包
	aoc['换服']['选服界面']={{195,21,0x111820},{206,21,0xffffff},{206,23,0x121821},{207,23,0xf5f5f5},{202,33,0x171d25},}
aoc['换服']['礼包兑换']={{633,413,0x29acbe},{644,180,0xffffff},{640,179,0x0e1d28},}
	aoc['换服']['输入完成']={ 0x007aff, "-26|-3|0x007aff,-19|15|0x007aff", 90, 1, 364, 1321, 735}
aoc['换服']['兑换成功']={{676,584,0x14545e},{674,584,0xfdfdfd},{666,584,0x14545f},{661,584,0x29a8bd},}

aoc['换服']['个人主页']={{1172,142,0xcbef0f},{1128,253,0x2d5e18},{1129,361,0x2d611a},{1110,463,0x2c6318},} -- 2,3
aoc['换服']['设置界面']={{1245,145,0x589427},{1235,258,0x508c26},{1233,356,0xbceb18},{1246,459,0x599428},}
aoc['换服']['设置功能选择']={{208,185,0x2dabc1},{733,216,0x55bcde},{813,181,0x2ba3c0},{202,314,0x299ebd},{203,503,0x299fbd},}

--]]


function service()
	计时 = os.time()
	超时 = 60*5
	换服 = false

	while (os.time()-计时< 超时) do
		if active(app,10)then
		elseif UI('在地图中','在地图界面',false,3,80)then
			return true
		elseif UI('换服','在地图上')then
			click(40,40)
		elseif UI('返回','返回图标',false,1)then
			if UI('返回','设置',false,1)then
				log('--')
				if UI('返回','服务器界面')then
					click(928,281)
					delay(5)
					--[[
					if UI('返回','服务器例表展开')then
					elseif UI('返回','服务器例表未展开',true,1)then
					end
					--]]
				elseif UI('换服','个人主页',true,2)then
				end
			else
				UI('返回','返回图标',true,1)
			end
		else
			log('other')
			other()
		end
		mSleep(1000)
	end
end

function new_account()
	计时 = os.time()
	超时 = 60*5

	while (os.time()-计时< 超时) do
		if active(app,3)then
		elseif UI('换服','在地图上')then
			return true
		else
			log('other')
			other()
		end
		mSleep(1000)
	end
end

giftlist={
"cj9258r44a",
"bqngm2drd3",
"cjh6vh8ip9",
"cjvafe8exg",
"cj2wgd4n8x",
"cjjqfi2qhz",
"c6rjh9y26w",
"c6b8in6wm4",
"c6czhumt4j",
"c69gcqr8vx",
"c67nz8qi6a",
"c6uz7iq4xb",
"c6awsdm9cz",
}

function gift()
	计时 = os.time()
	超时 = 4*60
	兑换券 = values.xchange
	log(兑换券)
	local gift_mun = 1
	
	while (os.time()-计时< 超时) do
		if active(app,10)then
		elseif UI('换服','在地图上')then
			click(40,40)
		elseif UI('返回','返回图标',false,1)then
			if UI('返回','设置',false,1)then
				if UI('换服','设置界面',false,3)then
					UI('换服','设置功能选择',true,5)
				elseif UI('换服','个人主页',true,4)then
				end
			else
				UI('返回','返回图标',true,1)
			end
		elseif UI('换服','礼包兑换',false,1)then
			click(738,295)
			input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
			--input(兑换券)
			input(giftlist[gift_mun])
			UI_pic('换服','输入完成',true)
			UI('换服','礼包兑换',true,1)
			gift_mun = gift_mun + 1

		elseif UI('换服','兑换成功',true,1)then
			toast('兑换成功',1)
			delay(2)
			--[[]]
			if gift_mun > #giftlist then
				return true
			end
			--]]
			--return true
		else
			log('other')
			other()
		end
		mSleep(1000)
	end
end



--[[
87tv84cjim
87ifvuzeq8
7upd87vc4j
7uqz9qt9ij
7a5ss5ufw9
7arehztvgk
7awabq9pn7
7akn9bscv6
7ai3r8akvz
7ax6i7tg6z
7ashyjfe2w
7avpt4qi4w
87ivhskn7f
7uct6sciaq
7u6vvvx5my
7zzw8j4zx5
87sbd7gy3r
87e28phme9
--]]
