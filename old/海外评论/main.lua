require("tsp")
require('nikename')
require("api")



log('手机分辨率'..w..'*'..h,true,2)


--设置全局参数

appleID = 'd1615819@icloud.com'
appleID_password = 'Au746007'
key_word = 'wechat'
app_id = '1340664225'
app_bid = 'com.whip.cougar'
commnet_name = '评论用户名'
commnet_title = '评论标题'
commnet_content = '评论内容'
star_mun = 5


AppStore_bid = 'com.apple.AppStore'
Setting_bid	 = 'com.apple.Preferences'

page={}

page['Tips']={}
page['Tips']['有弹窗']={{350,1,0x939394},{356,1,0x939394},{372,1,0x939394},}
	page['Tips']['需要用AppleID登录']={ 0x000000, 
		"-9|-2|0xf7f8f9,-9|-10|0x000000,-9|-9|0xdfe0e1,-23|-5|0x000000", 90, 503, 264, 535, 362}

	page['Tips']['弹窗登录按钮']={ 0x007aff, "0|13|0x007aff,0|-6|0x007aff", 90, 445, 478, 589, 636}
	page['Tips']['注销AppleID']={ 0x007aff, "-8|1|0x007aff,-30|-10|0x007aff", 90, 320, 660, 430, 746}
	
	
	page['Tips']['左边的提示']={ 0x007aff, "", 90, 114, 490, 377, 857}		--左边的提示
	page['Tips']['required']={ 0x010101, "0|-2|0xf8f8f9,-4|23|0xf8f8f8,-3|24|0x010101", 90, 498, 253, 508, 441}
		--{512,591} --{242,589}
	page['Tips']['Vrequired']={ 0x000000, "3|0|0x010101,3|24|0x010101,-10|15|0x171616", 90, 520, 537, 540, 602}	
		--(518,782)
	page['Tips']['Media']={ 0x0b0a0a, "4|4|0xf5f0ef,6|3|0x000000,6|23|0x000000", 90, 493, 499, 522, 545}
	page['Tips']['iTunesStore']={ 0x151515, "0|-5|0xf9f9f9,0|-6|0x0d0d0d,0|-12|0xf9f9f9,0|-13|0x373737", 90, 494, 290, 513, 376}
	page['Tips']['hk需要登录入']={ 0xf6f6f6, "0|1|0x202020,-4|11|0xf7f7f6,-7|14|0x000000,-7|15|0xeeeeed", 90, 369, 271, 408, 373}
	page['Tips']['TouchID']={{257,745,0x007aff},{257,751,0x007aff},{604,591,0x000000},}
	page['Tips']['Require15Minutes']={{190,840,0x1182fc},{193,853,0x007aff},{190,863,0x087dfe},}
	page['Tips']['appleid锁定']={ 0x000000, "0|-6|0xf9f9f9,0|-8|0x000000,-1|-15|0xf8f8f8,-1|-16|0x000000,2|-24|0x000000", 90, 479, 565, 498, 604}
	page['Tips']['Disabled']={{381,748,0x007aff},{421,648,0x131313},{422,648,0xe0dbdb},{428,597,0x000000},}
	page['Tips']['ukDisabled']={{381,750,0x007aff},{378,589,0x0a0a0a},{384,589,0xe2e2e2},{385,589,0x0a0a0a},}
		--(489,761)
	page['Tips']['修改约定']={{517,786,0x007aff},{557,553,0x000000},{573,552,0x000000},}
	page['Tips']['蓝色点']={ 0x007aff, "", 90, 129, 645, 615, 888}
		
page['Setting']={}
	page['Setting']['Setting-page']={{431,79,0x313131},{432,79,0xececec},{433,79,0x000000},}
		page['Setting']['red']={ 0xff0000, "", 90, 20, 145, 673, 322}
	page['Setting']['Ageree']={{519,72,0x0b0b0b},{514,76,0xf9f9f9},{526,87,0x0d0d0d},}
	page['Setting']['修改约定']={{605,71,0x000000},{608,74,0xf9f9f9},{612,71,0x060606},{613,71,0xf9f9f9},}	
		
		
		
function tips()
	if done(page['Tips']['有弹窗'],'有弹窗')then
		if password_input and ( c_pic(page['Tips']['required'],'请输入密码',false) or c_pic(page['Tips']['hk需要登录入'],'hk需要登录入')) then
			input(appleID_password)
			click(512,591)
		elseif c_pic(page['Tips']['required'],'请输入密码',false)then
			click(242,589)
		elseif c_pic(page['Tips']['Vrequired'],'Vrequired',false)then
			click(518,782)
		elseif c_pic(page['Tips']['Media'],'Media',false)then
			click(517,822)
		elseif password_input and c_pic(page['Tips']['iTunesStore'],'iTunesStore',false)then
			input(appleID_password)
			click(512,591)
		elseif done(page['Tips']['TouchID'],'TouchID',true,1)then
		elseif done(page['Tips']['Require15Minutes'],'Require15Minutes',true,1)then
		elseif c_pic(page['Tips']['appleid锁定'],'appleid锁定',false)then
			click(489,761)
			TaskReportStatus(task_record_id,'3')
			return '帐号问题'
		elseif done(page['Tips']['Disabled'],'Disabled',true,1) or done(page['Tips']['ukDisabled'],'ukDisabled',true,1) then
			TaskReportStatus(task_record_id,'4')
			return '帐号问题'
		elseif done(page['Tips']['修改约定'],'修改约定',true)then
			
		elseif c_p(page['Tips']['蓝色点'],'Tips->蓝色点',true)then
			--return '帐号错误'
			toast('其它弹窗',1)
		end
	elseif done(page['Setting']['Setting-page'],'Setting-page') then
		if c_p(page['Setting']['red'],'red',true)then
			TaskReportStatus(task_record_id,'4')
			return '帐号问题'
		else
			click(663,86)
		end
		get_times = true
	elseif done(page['Setting']['Ageree'],'Agree') or done(page['Setting']['修改约定'],'修改约定') then
		click(663,86)
		click(510,790)
		get_times = true
		delay(5)
	else
		return true
	end
end


page['Login']={}
page['Login']['iTunesStore']={{523,80,0x000000},{523,82,0xf5f5f7},}
	page['Login']['登录']={ 0x007aff, "-8|-8|0x007aff,16|-5|0x007aff", 90, 22, 190, 109, 299}
	page['Login']['已登录状态']={ 0x007aff, "0|-13|0x007aff,-12|-6|0x007aff", 90, 133, 203, 207, 285}

function login(appleID,appleID_password)

	注销 = true
	登录 = false
	计时 = os.time()
	超时 = 60 * 3 --3分钟超时
	打开 = true

	while os.time() - 计时 < 超时 do
		
		if done(page['Login']['iTunesStore'],'iTunesStore')then
			
			if 注销 and c_pic(page['Login']['已登录状态'],'已登录状态',true)then
				mSleep(1000*2)
				if c_pic(page['Tips']['注销AppleID'],'注销AppleID',true)then
					注销 = false
				end
			elseif 登录 and c_pic(page['Login']['已登录状态'],'已登录状态',false)then
				mSleep(1000)
				log(appleID..' 登录成功',true,2)
				closeX(AppStore_bid)
				boxshow('登录成功',w/2+50,0,630,30)
				return true
			elseif c_pic(page['Login']['登录'],'登录',true)then
			else
				log('返回顶部')
				click(w/2,20)
				mSleep(1000*2)
			end
			
		elseif done(page['Tips']['有弹窗'],'有弹窗')then
			if c_pic(page['Tips']['需要用AppleID登录'],'需要用AppleID登录',false)then
				input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
				input(appleID)
				click(655,1286) --点击换行
				input(appleID_password)
				if c_pic(page['Tips']['弹窗登录按钮'],'弹窗登录按钮',true)then
					mSleep(1000*5)	--给5秒反应时间
					登录 = true
					注销 = false
				end
			elseif c_pic(page['Tips']['注销AppleID'],'注销AppleID',true)then
				注销 = false
			elseif tips() == '帐号问题' then
				return false
			end
		else
			if 打开 then
				openURL("prefs:root=STORE")
				打开 = false
				mSleep(1000*3)
			else
				if active(Setting_bid,3)then
				end
			end
		end
		mSleep(500)
	end

end


page['OPEN']={}
	page['OPEN']['分类']={ 0x007aff, "0|9|0xf9f9f9,0|10|0x007aff,-1|21|0x007aff", 90, 686, 57, 731, 116}


function open()
	
	open_time = os.time()
	open_used_time = 20

	url = 'https://itunes.apple.com/'..country..'/app/id'..app_id
	
	openURL(url)

	while os.time() - open_time < open_used_time do
		
		if c_pic(page['OPEN']['分类'],'分类',false)then
			return true
		else
			tips()
		end
		mSleep(1000)
		
	end
	
end


page['STORE']={}
page['STORE']['get']={ 0x0080fc, "0|-2|0xffffff,-12|9|0x0080fc,-12|10|0xffffff,29|7|0x0080fc,-10|-16|0x0080fc,-11|33|0x0080fc", 
						90, 568, 217, 746, 564}
page['STORE']['hk取得']={{692,338,0xffffff},{692,336,0x0080fc},{718,345,0x0080fc},{654,318,0x0080fc},{657,369,0x0080fc},}

page['STORE']['install']={ 0x19ab20, "31|0|0x19ab20,-17|-25|0x19ab20,-9|25|0x19ab20", 90, 530, 214, 742, 575}
page['STORE']['down']={ 0x0080fc, "0|-25|0x0281fc,25|-1|0x0281fc,-8|-1|0xffffff,-24|-1|0x0281fc", 90, 530, 214, 742, 575}
page['STORE']['rong']={ 0x0281fc, "", 90, 609, 232, 748, 591}
page['STORE']['downland']={ 0x0080fc, "0|14|0x0080fc,-5|14|0x808080,-4|14|0xffffff", 90, 612, 222, 748, 608}
page['STORE']['open']={ 0x0080fc, "-9|3|0xffffff,-10|3|0x178bfc,-43|2|0x0080fc,-42|2|0xfafcfe,24|3|0x0080fc,-88|-1|0x0080fc,-30|28|0x0080fc", 
						90, 533, 214, 747, 552}


function Rond()
	if c_pic(page['STORE']['get'],'get',false)then
	elseif c_pic(page['STORE']['install'],'install',true)then
	elseif c_p(page['STORE']['rong'],'rong',false)then
		if c_p({0xffffff,90,x+25,y,x+26,y+1},'中心白',false)then
			Ring = 1
			if f_p({0x2b95fd,80,x+23,y-26,x+25,y-24},'上蓝',false)then
				Ring = Ring + 1
			end
			if f_p({0x2b95fd,80,x+49,y-1,x+51,y+1},'右蓝',false)then
				Ring = Ring + 1
			end
			if f_p({0x2b95fd,80,x+23,y+24,x+26,y+26},'下蓝',false)then
				Ring = Ring + 1
			end
			if Ring >= 3 then
				return true
			end
		end
	end
end

function get()
	
	计时 = os.time()
	超时 = 60*5
	get_times = true
	install_times = 0
	password_input = false

	while os.time() - 计时 < 超时 do
		
		if c_pic(page['STORE']['open'],'open',false)then
			boxshow('准备卸载',w/2+50,0,630,30)
			ipaUninstall(app_bid)
			closeX(AppStore_bid)
			boxshow('卸载成功',w/2+50,0,630,30)
			open()
		elseif get_times and c_pic(page['STORE']['get'],'get',true)then
			get_times = false
			boxshow('获取',w/2+50,0,630,30)
	--	elseif get_times == false and c_pic(page['STORE']['get'],'get',false)then
	--		boxshow('下载失败',w/2+50,0,630,30)
	--		return false
		elseif install_times and c_pic(page['STORE']['install'],'install',true)then
			install_times = install_times + 1
			password_input = true
			boxshow('安装',w/2+50,0,630,30)

		elseif c_pic(page['STORE']['down'],'down',true)then
		elseif c_pic(page['STORE']['downland'],'downland',false)then
			boxshow('已经拥有',w/2+50,0,630,30)
			return true
		elseif Rond() then
			boxshow('正在转圈',w/2+50,0,630,30)
		else
			if tips() == '帐号问题' then
				return false
			elseif frontAppBid() ~= AppStore_bid then
				open()
			end
		end
		mSleep(1000)
	
	end
	toast('get超时',1)

end

page['commnet']={}
	page['commnet']['reviews']={ 0x878787, "0|-1|0xffffff,-90|-29|0x848484,62|26|0x848484", 90, 266, 344, 484, 673}
	page['commnet']['hk评论']={ 0x848484, "-8|0|0xffffff,-8|-6|0x848484,-8|-30|0x848484,5|27|0x848484", 90, 286, 321, 446, 616}
	page['commnet']['reviews_acitve']={ 0xfcfcfc, "0|-1|0x848484,-99|-30|0x848484,64|27|0x848484", 90, 266, 344, 484, 673}
	page['commnet']['hk评论激活']={ 0xffffff, "13|0|0x848484,-58|-26|0x848484,-59|22|0x848484,88|-22|0x848484", 90, 279, 339, 469, 583 }
		page['commnet']['writeReview']={ 0x0080fc, "-3|-11|0x0080fc,-5|-11|0xffffff", 90, 46, 686, 347, 985}
	page['commnet']['撰写评论']={{399,70,0x000000},{399,73,0xf9f9f9},{399,85,0x000000},}
	page['commnet']['star']={{513,159,0xff9500},}
		page['commnet']['昵称']={ 0xcdcdd3, "0|-22|0xffffff,0|-28|0xc7c7cd", 90, 241, 223, 335, 298}
		page['commnet']['标题']={ 0xc7c7cd, "0|-5|0xffffff,0|-9|0xc7c7cd", 90, 33, 227, 117, 382}
		page['commnet']['内容']={ 0xb2b2b2, "25|7|0xb2b2b2", 100, 10, 313, 249, 456}
		page['commnet']['发送']={ 0x007aff, "-10|0|0xf9f9f9,-12|0|0x007aff", 90, 637, 56, 729, 111}
		page['commnet']['空格']={ 0x000000, "0|-6|0xffffff,0|-11|0x2e2e2e", 90, 303, 1256, 443, 1318}
	page['commnet']['star_str']={{233,158,0xff9500},{302,160,0xff9500},{373,161,0xff9500},{443,161,0xff9500},{513,160,0xff9500},}
	page['commnet']['确认发送星']={ 0xff9500, "0|-8|0xff9500", 90, 197, 130, 549, 189}
	page['commnet']['确认发送内容']={ 0x000000, "0|-13|0x000000", 90, 26, 312, 708, 835}
	

function commnet(title,content)
	
	计时 = os.time()
	超时 = 60*3
	write_times = true
	password_input = true
	send = true
	appleID_name = commnet_name or EnglishName()
	commnet_title = title
	commnet_content = content

	nikename_do = true
	title_do = true
	content_do = true
	send_do = false
	commnet_ok = false
	send_ok = false


	while os.time() - 计时 < 超时 do
		
		if done(page['commnet']['撰写评论'],'撰写评论')then
			page['commnet']['star'][1][1]=page['commnet']['star_str'][star_mun][1]
			page['commnet']['star'][1][2]=page['commnet']['star_str'][star_mun][2]
			if send_ok then
				if c_pic(page['commnet']['确认发送星'],'确认发送星',false) and c_pic(page['commnet']['确认发送内容'],'确认发送内容',false) then
					boxshow('确认成功',w/2+50,0,630,30)
					delay(2)
					return true
				end
			elseif send_do and c_pic(page['commnet']['发送'],'发送',true)then
				send_do = false
				commnet_ok = true
				
				boxshow('等待发送',w/2+50,0,630,30)
			elseif done(page['commnet']['star'],'star')then
				if nikename_do and c_pic(page['commnet']['昵称'],'昵称',true)then
					input(appleID_name)
					nikename_do = false
					boxshow('输入名字',w/2+50,0,630,30)
				elseif title_do and c_pic(page['commnet']['标题'],'标题',true)then
					input(commnet_title)
					title_do = false
					boxshow('输入标题',w/2+50,0,630,30)
				elseif content_do and c_pic(page['commnet']['内容'],'内容',true)then
					input(commnet_content)
					delay(1)
					content_do = false
					boxshow('输入内容',w/2+50,0,630,30)
					if c_pic(page['commnet']['空格'],'空格',true)then
						send_do = true
					else
						return false
					end	
				end

			else
				click(page['commnet']['star_str'][star_mun][1],page['commnet']['star_str'][star_mun][2])
			end
		elseif c_pic(page['commnet']['reviews_acitve'],'reviews_acitve',false) or c_pic(page['commnet']['hk评论激活'],'hk评论激活',false) then
			log(x..','..y)
			if write_times and c_pic(page['commnet']['writeReview'],'writeReview',true)then
				write_times = false
			elseif commnet_ok and c_pic(page['commnet']['writeReview'],'writeReview',true) then
				send_ok = true
				boxshow('确认评论中',w/2+50,0,630,30)
				delay(3)
			end
		elseif c_pic(page['commnet']['reviews'],'reviews',true) or c_pic(page['commnet']['hk评论'],'hk评论',true) then
		else
			log('-o')
			tips()
		end
		mSleep(1000)
		
	end

end

--删除文件
function delFile(path)--帮你玩平台禁用此函数
    os.execute("rm -rf "..path);
end
apple_id_file = {
	'/var/mobile/Library/Accounts/Accounts3.sqlite',
	'/var/mobile/Library/Accounts/Accounts3.sqlite-shm',
	'/var/mobile/Library/Accounts/Accounts3.sqlite-wal',
}
function dell_apple()
	closeApp("com.apple.AppStore",1)
	mSleep(2000)
	for i,v in pairs(apple_id_file)do
		delFile(v)
	end
	os.execute("find /private/var/containers/Data/System/ -name updates.* | xargs rm -rf")
	os.execute("find /private/var/containers/Data/System/ -name appstored.* | xargs rm -rf")
	
	mSleep(500)
	os.execute("launchctl kickstart -k system/com.apple.appstored")
end

--[[ 
commnet('非常好','皇包车我喜欢')
lua_exit()
--]]



while (true) do
	if TaskAccept() then
		
		task_record_id = TaskInfo.data.task.task_record_id
		
		appleID = TaskInfo.data.task.apple_id     -- 'd1615819@icloud.com'
		appleID_password = TaskInfo.data.task.my_password
		key_word = TaskInfo.data.task.task_name
		app_id = TaskInfo.data.task.apple_store_id
		app_bid = TaskInfo.data.task.bundle_id
		country = TaskInfo.data.task.country
		
		star_mun = TaskInfo.data.task.star
		commnet_name = TaskInfo.data.task.nickname
		commnet_title = TaskInfo.data.task.title
		commnet_content = TaskInfo.data.task.content
		
		

		
		if login(appleID,appleID_password)then
			if open()then
				if get()then
					if commnet(commnet_title,commnet_content)then
						TaskReportStatus(task_record_id,'ok')
					end
				end
			end
		end
		boxshow(key_word,w/2+50,0,630,30)
		delay(3)
	else
		toast('没有任务',10)
		delay(20)
	end
end





























