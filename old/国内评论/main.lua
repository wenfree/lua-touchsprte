require("tsp")
require("api")
--toast('手机分辨率'..w..'*'..h)
log('手机分辨率'..w..'*'..h,true,2)


--设置全局参数
--[[
appleID = 'd1615819@icloud.com'
appleID_password = 'Au746007'
key_word = 'wechat'
app_id = '1252909089'
app_bid = 'com.vyoutech.ddpaioverseas'
commnet_name = '评论用户名'
commnet_title = '评论标题'
commnet_content = '评论内容'
--]]
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
	page['Tips']['获取-需要登录']={ 0x000000, "-3|3|0xf8f8f8,-3|9|0xf8f8f8,-3|10|0x2f2f2f,0|17|0x000000,-5|22|0xf8f8f8", 90, 421, 301, 441, 362}
		--{512,591} --{242,589}
	page['Tips']['Vrequired']={ 0x000000, "3|0|0x010101,3|24|0x010101,-10|15|0x171616", 90, 520, 537, 540, 602}	
		--(518,782)
	page['Tips']['Media']={ 0x0b0a0a, "4|4|0xf5f0ef,6|3|0x000000,6|23|0x000000", 90, 493, 499, 522, 545}
	page['Tips']['iTunesStore']={ 0x151515, "0|-5|0xf9f9f9,0|-6|0x0d0d0d,0|-12|0xf9f9f9,0|-13|0x373737", 90, 494, 290, 513, 376}
	page['Tips']['TouchID']={{257,745,0x007aff},{257,751,0x007aff},{604,591,0x000000},}
	page['Tips']['Require15Minutes']={{190,840,0x1182fc},{193,853,0x007aff},{190,863,0x087dfe},}
	
	page['Tips']['蓝色点']={ 0x007aff, "", 90, 129, 645, 615, 788}
		
page['Setting']={}
	page['Setting']['Setting-page']={{431,79,0x313131},{432,79,0xececec},{433,79,0x000000},}
		page['Setting']['red']={ 0xff0000, "", 90, 20, 145, 673, 322}
	page['Setting']['Ageree']={{519,72,0x0b0b0b},{514,76,0xf9f9f9},{526,87,0x0d0d0d},}
		
		
		
		
function tips()
	if done(page['Tips']['有弹窗'],'有弹窗')then
		if password_input and c_pic(page['Tips']['required'],'请输入密码',false)then
			input(password)
			click(512,591)
		elseif password_input and c_pic(page['Tips']['获取-需要登录'],'获取-需要登录-请输入密码',false)then
			input(password)
			click(512,591)
		elseif c_pic(page['Tips']['required'],'请输入密码',false)then
			click(242,589)
		elseif c_pic(page['Tips']['Vrequired'],'Vrequired',false)then
			click(518,782)
		elseif c_pic(page['Tips']['Media'],'Media',false)then
			click(517,822)
		elseif password_input and c_pic(page['Tips']['iTunesStore'],'iTunesStore',false)then
			input(password)
			click(512,591)
		elseif done(page['Tips']['TouchID'],'TouchID',true,1)then
		elseif done(page['Tips']['Require15Minutes'],'Require15Minutes',true,1)then
		elseif c_p(page['Tips']['蓝色点'],'蓝色点',true)then
			--return '帐号错误'
		end
	elseif done(page['Setting']['Setting-page'],'Setting-page') then
		if c_p(page['Setting']['red'],'red',true)then
			return '帐号错误'
		else
			click(663,86)
		end
		get_times = true
	elseif done(page['Setting']['Ageree'],'Agree')then
		click(663,86)
		click(510,790)
		get_times = true
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
			boxshow('登录成功',w/2+50,0,630,50)
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
		elseif tips() then
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


function open(app_id)
	
计时 = os.time()
超时 = 20
url = 'https://itunes.apple.com/cn/app/id'..app_id
openURL(url)

while os.time() - 计时 < 超时 do
	
	if c_pic(page['OPEN']['分类'],'分类',false)then
		return true
	end
	mSleep(1000)
	
end

	
end


page['STORE']={}
page['STORE']['get']={ 0x0080fc, "-57|-1|0x0080fc,33|1|0x0080fc", 90, 584, 225, 740, 503}
page['STORE']['install']={ 0x19ab20, "-22|-17|0x19ab20,-12|33|0x19ab20", 90, 584, 225, 740, 503}
page['STORE']['down']={ 0x0080fc, "0|25|0x0080fc,0|-26|0x0080fc,25|-1|0x0381fc", 90, 598, 232, 749, 510}
page['STORE']['rong']={ 0x0281fc, "", 90, 609, 232, 748, 591}
page['STORE']['downland']={ 0x0080fc, "0|26|0x0080fc,5|13|0x7f7f7f,-6|13|0x808080,-5|13|0xffffff", 90, 600, 212, 748, 518}
page['STORE']['open']={ 0x0080fc, "3|-6|0xffffff,3|-9|0x0e86fc,3|-23|0x0080fc,42|2|0x0080fc,-7|26|0x0080fc", 90, 565, 227, 746, 550}



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

function get(app_bid)
	
计时 = os.time()
超时 = 60*3
get_times = true
install_times = 0
password_input = false

while os.time() - 计时 < 超时 do
	
	if c_pic(page['STORE']['open'],'open',false)then
		boxshow('准备卸载',w/2+50,0,630,50)
		ipaUninstall(app_bid)
		closeX(AppStore_bid)
		boxshow('卸载成功',w/2+50,0,630,50)
		open()
	elseif get_times and c_pic(page['STORE']['get'],'get',true)then
		get_times = false
		boxshow('获取',w/2+50,0,630,50)
	elseif get_times == false and c_pic(page['STORE']['get'],'get',false)then
		boxshow('下载失败',w/2+50,0,630,50)
		return false
	elseif install_times and c_pic(page['STORE']['install'],'install',true)then
		install_times = install_times + 1
		password_input = true
		boxshow('安装',w/2+50,0,630,50)

	elseif c_pic(page['STORE']['down'],'down',true)then
	elseif c_pic(page['STORE']['downland'],'downland',false)then
		boxshow('已经拥有',w/2+50,0,630,50)
		return true
	elseif Rond() then
		boxshow('正在转圈',w/2+50,0,630,50)

	else
		if frontAppBid() ~= AppStore_bid then
			closeApp(AppStore_bid)
			return false
		else
			if tips() == '帐号错误' then
				return false
			end
		end
	end
	mSleep(1000)
	
end

end

page['commnet']={}
	page['commnet']['reviews']={ 0x878787, "0|-1|0xffffff,-90|-29|0x848484,62|26|0x848484", 90, 266, 344, 484, 673}
	page['commnet']['reviews_acitve']={ 0xfcfcfc, "0|-1|0x848484,-99|-30|0x848484,64|27|0x848484", 90, 266, 344, 484, 673}
		page['commnet']['writeReview']={ 0x0080fc, "-3|-11|0x0080fc,-5|-11|0xffffff", 90, 46, 686, 347, 985}
	page['commnet']['撰写评论']={{399,70,0x000000},{399,73,0xf9f9f9},{399,85,0x000000},}
	page['commnet']['star']={{513,159,0xff9500},}
		page['commnet']['昵称']={ 0xcdcdd3, "0|-22|0xffffff,0|-28|0xc7c7cd", 90, 241, 223, 335, 298}
		page['commnet']['标题']={ 0xc7c7cd, "0|-5|0xffffff,0|-9|0xc7c7cd", 90, 33, 227, 117, 382}
		page['commnet']['内容']={ 0xb2b2b2, "25|7|0xb2b2b2", 100, 10, 313, 249, 456}
		page['commnet']['发送']={ 0x007aff, "-10|0|0xf9f9f9,-12|0|0x007aff", 90, 637, 56, 729, 111}
		page['commnet']['空格']={ 0x000000, "0|-6|0xffffff,0|-11|0x2e2e2e", 90, 303, 1256, 443, 1318}
	page['commnet']['star_str']={{233,158,0xff9500},{302,160,0xff9500},{373,161,0xff9500},{443,161,0xff9500},{513,160,0xff9500},}
	
	

function commnet(title,content,user_name)
	
计时 = os.time()
超时 = 60*3
write_times = true
password_input = true
send = true
appleID_name = GetName() or user_name or myRand(4,math.random(12,14))
commnet_title = title
commnet_content = content

nikename_do = true
title_do = true
content_do = true
send_do = false
commnet_ok = false


while os.time() - 计时 < 超时 do
	
	if done(page['commnet']['撰写评论'],'撰写评论')then

		page['commnet']['star'][1][1]=page['commnet']['star_str'][star_mun][1]
		page['commnet']['star'][1][2]=page['commnet']['star_str'][star_mun][2]
		
		if send_do and c_pic(page['commnet']['发送'],'发送',true)then
			send_do = false
			commnet_ok = true
			boxshow('等待发送',w/2+50,0,630,50)
		elseif done(page['commnet']['star'],'star')then
			if nikename_do and c_pic(page['commnet']['昵称'],'昵称',true)then
				input(appleID_name)
				nikename_do = false
				boxshow('输入名字',w/2+50,0,630,50)
			elseif title_do and c_pic(page['commnet']['标题'],'标题',true)then
				input(commnet_title)
				title_do = false
				boxshow('输入标题',w/2+50,0,630,50)
			elseif content_do and c_pic(page['commnet']['内容'],'内容',true)then
				input(commnet_content)
				delay(1)
				content_do = false
				boxshow('输入内容',w/2+50,0,630,50)
				if c_pic(page['commnet']['空格'],'空格',true)then
					send_do = true
				else
					return false
				end	
			end

		else
			click(page['commnet']['star_str'][star_mun][1],page['commnet']['star_str'][star_mun][2])
		end
	elseif commnet_ok and c_pic(page['commnet']['reviews_acitve'],'reviews_acitve',false)then
		boxshow('评论成功',w/2+50,0,630,50)
		return true
	elseif c_pic(page['commnet']['reviews_acitve'],'reviews_acitve',false)then
		if write_times and c_pic(page['commnet']['writeReview'],'writeReview',true)then
			write_times = false
		end
	elseif c_pic(page['commnet']['reviews'],'reviews',true)then
	else
		tips()
	end
	mSleep(1000)
	
end

end

--删除文件
function delFile(path)--帮你玩平台禁用此函数
    os.execute("rm -rf "..path);
end
FileApple = {
	[1] = '/var/mobile/Library/Accounts/Accounts3.sqlite',
	[2] = '/var/mobile/Library/Accounts/Accounts3.sqlite-shm',
	[3] = '/var/mobile/Library/Accounts/Accounts3.sqlite-wal',
}
function DelStore()
	closeApp("com.apple.AppStore",1)
	mSleep(2000)
	for i,v in pairs(FileApple)do
		delFile(v)
	end
	os.execute("find /private/var/containers/Data/System/ -name updates.* | xargs rm -rf")
	os.execute("find /private/var/containers/Data/System/ -name appstored.* | xargs rm -rf")
	os.execute("launchctl kickstart -k system/com.apple.appstored")
	mSleep(500)
end



while true do

	DelStore()		--删除文件
	
	if GetTask()then
		boxshow('准备登录',w/2+50,0,630,50)
		
		for i,v in ipairs(data.tasks)do
			keywords = v.keywords
			image = v.image
			app_id = v.app_id
			task_id = v.task_id
			app_name = v.app_name
		
			if login(account,password)then
				if open(image)then
					if get(app_id)then
						open_comments = v.open_comments
						if open_comments then
							
							if commnet(v.comment.title,v.comment.content,v.user_name)then
								successfull(app_name,task_id)
							end
							
						end
					end
				end
			end
			boxshow(i,w/2+50,0,630,50)
			delay(3)
			
		end
	end
end




























