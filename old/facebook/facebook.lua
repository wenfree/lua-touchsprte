require("TSLib")
require("tsp")
require("ALZ")
require("AWZ")
require("POST")
require("facebook_name")
require("facebook_maps")


init('0',0);
appbid = 'com.facebook.Facebook'
appm = 'com.facebook.Messenger'
local_path = '/User/Media/TouchSprite/lua/facebook.txt'


--[[
nLog('登录 ALZ')
if ALZ()then--登录一次
else
	dialog("alz 登录失败",10)
	lua_exit();
end
--]]

page={}
page['reg']={}
page['m']={}

function messenger()
	计时 = os.time()
	超时 = 60 * 3
	
	page['m']['登录']={{328,1112,0x007aff},{49,1115,0x007aff},{373,421,0x00c5ff},{702,1241,0x007aff},}	--1
	page['m']['登录界面']={{620,152,0x000000},{617,155,0xffffff},{617,171,0x2e2e2e},{617,170,0xffffff},}
		page['m']['帐号']={ 0xc7c7cd, "1|-17|0xc9c9cf", 90, 154, 356, 319, 412}
		page['m']['密码']={ 0xc9c9cf, "21|-11|0xc7c7cd", 90, 76, 455, 155, 517}
		page['m']['继续']={ 0xffffff, "0|2|0x0f82ff,0|5|0xffffff", 90, 320, 570, 438, 643}
	page['m']['跳过手机号']={ 0xff928b, "-63|73|0xff928b,88|102|0x191b4c", 90, 217, 117, 491, 340}
		--371,1234
	page['m']['跳过']={{265,755,0x007aff},{408,1,0x999999},}
	page['m']['确定完成']={{395,915,0x0084ff},{437,544,0x0080ff},{432,479,0xd2d6d9},{395,479,0xffffff},}
	page['m']['联系人确定']={{545,767,0x0084ff},{551,762,0xf7fbff},{551,760,0x0084ff},}
	
	while (os.time()-计时 < 超时) do
		if active(appm,3)then
		elseif done(page['m']['确定完成'],'确定完成',true,1)then
			mSleep(1000* 5)
			return true
		elseif done(page['m']['跳过'],'跳过',true,1)then		
		elseif done(page['m']['联系人确定'],'联系人确定',true,1)then
			mSleep(1000* 10)
		elseif c_pic(page['m']['跳过手机号'],'跳过手机号',false)then
			click(371,1234)
		elseif done(page['m']['登录界面'],'登录界面',false,1)then
			if c_pic(page['m']['帐号'],'帐号',true)then
				input(phone)
			end
			if c_pic(page['m']['密码'],'密码',true)then
				input(fb_password)
			end
			c_pic(page['m']['继续'],'继续',true)
			
		elseif done(page['m']['登录'],'登录',true,1)then
		end
		mSleep(1000)
	end
end

page['手机键盘']={
		{132,946,0x000000},{374,946,0x000000},{630,940,0x000000},
		{133,1058,0x000000},{364,1049,0x000000},{620,1053,0x000000},
		{132,1153,0x000000},{374,1156,0x000000},{630,1160,0x000000},
		[0]={374,1280,0xffffff},
	}
	
function input_phone()
	for i =1,string.len(phone) do
		nLog(string.sub(phone,i,i))
		phone_mun_input = tonumber(string.sub(phone,i,i))
		click(page['手机键盘'][phone_mun_input][1],page['手机键盘'][phone_mun_input][2],0.2)
	end
end

function reg()
	计时 = os.time()
	超时 = 60 * 3
	手机号 = true
	提交 = false
	二次验证 = false
	
	page['reg']['首页']={{381,1263,0x4267b2},{351,209,0xffffff},{382,128,0xfea100},{416,216,0x4267b2},} --多点比色
	page['reg']['马上开始']={{382,583,0xffffff},{377,573,0x5990ff},{480,291,0x4267b2},{477,291,0xe9ebee},}	--1
	page['reg']['开始']={ 0xffffff, "-311|-28|0x5890ff,352|32|0x5890ff", 90, 8, 426, 734, 552 } --多点找色
	page['reg']['us+1']={{51,389,0x141823},{50,389,0xf0f0f1},{147,402,0x141823},{148,403,0xeaeaeb},}
		--72,1018 点击中国
		
	page['reg']['请输入手机号']={{454,289,0x4b6eb5},{284,290,0x4267b2},{292,293,0xe9ebee},}					--界面
	page['reg']['请输入手机号']={{428,289,0x4267b2},{454,289,0xe9ebee},{455,289,0x4b6eb5},{476,308,0x486cb4},}
		page['reg']['手机号']={ 0xc7c7cd, "0|-28|0xc7c7cd,16|-26|0xc7c7cd", 90, 244, 373, 384, 427}			--click(w/2,50)
		page['reg']['继续']={ 0xffffff, "-5|-2|0x5890ff", 90, 333, 467, 419, 516}
		
	page['reg']['请输入姓名上移']={{445,240,0x4267b2},{447,241,0xe5e8ec},{458,243,0x4267b2},{456,266,0xe9ebee},}
	page['reg']['请输入姓名']={{458,291,0x4267b2},{448,289,0xe9ebee},{459,305,0x4267b2},{459,304,0xdee3ea},}
	page['reg']['请输入姓名']={{425,247,0x4267b2},{418,240,0x4267b2},{420,240,0xe9ebee},{426,269,0x4267b2},}
		page['reg']['姓']={ 0xc8c8ce, "-3|-20|0xc7c7cd", 90, 46, 375, 98, 429}
		page['reg']['姓']={ 0xc7c7cd, "-1|-10|0xc7c7cd,-2|-21|0xceced4", 90, 65, 328, 86, 373}
		page['reg']['名']={ 0xc7c7cd, "-10|-12|0xc7c7cd", 90, 402, 373, 455, 428}
		
	page['reg']['创建密码']={{441,241,0x4267b2},{426,241,0xe9ebee},{428,241,0x4267b2},{429,244,0xe9ebee},}		--1创建密码
		page['reg']['密码']={ 0xc7c7cd, "-2|-12|0xc7c7cd,-4|-25|0xc7c7cd", 90, 80, 331, 123, 375}
	
	page['reg']['请输入生日']={{457,241,0x4267b2},{454,244,0xe6e8ec},{425,247,0xe9ebee},{423,246,0x4267b2},}
		-- 217,1000-214,1256
	page['reg']['请选择性别']={{253,433,0x46629e},{355,436,0xadb2bb},{356,436,0xe9ebee},{495,443,0x44619d},}
	page['reg']['注册完成_注册']={ 0xffffff, "-342|24|0x5890ff,328|-28|0x5890ff,15|-284|0x4267b2", 90, 8, 222, 742, 665 } --多点找色
		-- 251,484
	page['reg']['添加头像']={{378,612,0x9eaacb},{443,1154,0x5890ff},{427,1253,0x5890ff},{382,1201,0xe1e3e7},}		--1跳过
	page['reg']['跳过通讯录']={{355,199,0xc53332},{359,211,0xf5c700},{365,221,0xfefeff},{440,253,0x209f71},}						--1跳过
	page['reg']['加好友请求']={{32,83,0xffffff},{41,83,0x4267b2},{458,247,0x141823},{690,80,0xffffff},}			--4跳过
	page['reg']['添加学校']={{707,84,0xffffff},{499,223,0xf4a503},{466,73,0xffffff},{45,83,0x4267b2},}
	
	page['reg']['验证手机号']={{449,72,0x476bb4},{449,71,0xffffff},{453,79,0x4267b2},{459,81,0x4267b2},}
		page['reg']['输入验证码']={ 0xc7c7cd, "0|-16|0xc7c7cd", 90, 48, 302, 231, 455}
		page['reg']['提交']={ 0x5890ff, "-2|-8|0xe9ebee,-2|-10|0x5890ff", 90, 332, 412, 417, 562}
		
	page['reg']['二次验证']={{699,82,0x4267b2},{71,160,0x202020},{48,85,0xffffff},{61,77,0x4267b2},}	--二次输入验证码
	page['reg']['验证Phone']={ 0x000000, "35|-7|0x202020,35|16|0x101111,122|7|0x000000,46|7|0xf6f7f8", 90, 8, 148, 190, 192}
		page['reg']['二次验证码输入']={ 0xccccd2, "-18|-7|0xc7c7cd", 90, 17, 286, 170, 337}
		page['reg']['确认']={ 0xffffff, "6|-14|0x4267b2", 90, 336, 390, 411, 431}
		
	page['reg']['添加好友']={ 0x9197a3, "144|7|0x9197a3,-36|-20|0x9197a3,-221|6|0x9197a3,-41|34|0x9197a3,-219|1|0xffffff", 90, 52, 571, 642, 901}
	page['reg']['右上角跳过']={0xffffff, "-2|-3|0x4267b2,-23|5|0xffffff,-23|4|0x4469b3", 90, 633, 55, 734, 113}
	

	while (os.time()-计时 < 超时) do
		if active(appbid,3)then
		elseif done(page['reg']['首页'],'首页',true,1) then
		elseif done(page['reg']['马上开始'],'马上开始',true,1) then
		elseif c_pic(page['reg']['开始'],'开始',true,1) then
		elseif done(page['reg']['us+1'],'us+1',true,1) then
			mSleep(1000)
			click(72,1018)
		elseif done(page['reg']['请输入手机号'],'请输入手机号',false,1) then
			if  手机号 then
				if GET_Phone(id,token)then
					if c_pic(page['reg']['手机号'],'手机号',true)then
						input_phone()
						click(w/2,50)
						手机号 = false
					end
				end
			end
			mSleep(1000 * 2)
			c_pic(page['reg']['继续'],'继续',true)
		elseif done(page['reg']['请输入姓名上移'],'请输入姓名上移',false,1) then
			click(w/2,50)
		elseif done(page['reg']['请输入姓名'],'请输入姓名',false,1) then
			if c_pic(page['reg']['姓'],'姓',true)then
				frist_name = usa_xin[math.random(1,#usa_xin)]
				input(frist_name)
				click(w/2,50)
			end
			if c_pic(page['reg']['名'],'名',true)then
				last_name = usa_name[math.random(1,#usa_name)]
				input(last_name)
				click(419,1286,0.5)
				click(706,1179,0.5)
				
				click(660,1292) 	--点击 前往
			end
		elseif done(page['reg']['创建密码'],'创建密码',false,1) then
			if c_pic(page['reg']['密码'],'密码',true)then
				fb_password = myRand(4,math.random(8,12))
				fb_password = "AaDd112211"
				input(fb_password)
				click(419,1286,0.5)
				click(706,1179,0.5)
				
				click(660,1292) 	--点击 前往
			end
		elseif done(page['reg']['请输入生日'],'请输入生日',false,1) then
			moveTo(214,1000,214,1256,50,20)
			mSleep(1000* 5)
			click(691,862)		
		elseif done(page['reg']['请选择性别'],'请选择性别',true,1) then
		elseif c_pic(page['reg']['注册完成_注册'],'注册完成_注册',true,1) then
		elseif done(page['reg']['添加头像'],'添加头像',false,1) then
			click(697,89)
		elseif done(page['reg']['跳过通讯录'],'跳过通讯录',false,1) then
			click(697,89)
		elseif done(page['reg']['加好友请求'],'加好友请求',true,4) then
		elseif done(page['reg']['添加学校'],'添加学校',true,1) then
		elseif done(page['reg']['验证手机号'],'验证手机号',false,1) then
			
			if getMessage(id,phone,token) then
				if c_pic(page['reg']['输入验证码'],'输入验证码',true)then
					input(dxyzm)
					c_pic(page['reg']['提交'],'提交',true)
					writeFile(local_path,phone..'----'..fb_password)					
					mSleep(1000* 6)

					up ={}
					up.mail = frist_name..'.'..last_name..'@gemehouse.com'
					up.password = fb_password
					up.phone = phone
					up.fristname = frist_name
					up.lastname = last_name
					local sz = require("sz")
					up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")  --设备名
					up.map = mapss
					upFacebook(up)
	
					mSleep(1000* 5)
					reName(frist_name..'-'..last_name)
					提交 = true
					二次验证 = true
				end
			end
			
		elseif 二次验证 and c_pic(page['reg']['验证Phone'],'验证Phone',false) then
			if c_pic(page['reg']['二次验证码输入'],'二次验证码输入',true)then
				input(dxyzm)
				click(375,411)
				提交 = true
			end
		elseif 二次验证 and done(page['reg']['二次验证'],'二次验证',false,1) then
			if c_pic(page['reg']['二次验证码输入'],'二次验证码输入',true)then
				input(dxyzm)
				if c_pic(page['reg']['确认'],'确认',true)then
					提交 = true
				end
			end
			
		elseif 提交 and c_pic(page['reg']['添加好友'],'添加好友',false) then
			dialog('注册成功', 5)
			mSleep(1000*5)
			return true
		elseif c_pic(page['reg']['右上角跳过'],'右上角跳过',true) then
		else
			log(' :) ')
		end
		mSleep(1000)
	end
end


sys = {
	clear_bid = (function(bid)
		closeApp(bid)
		delay(1)
		os.execute("rm -rf "..(appDataPath(bid)).."/Documents/*") --Documents
		os.execute("rm -rf "..(appDataPath(bid)).."/Library/*") --Library
		os.execute("rm -rf "..(appDataPath(bid)).."/tmp/*") --tmp
		clearPasteboard()
		--[[
		local path = _G.const.cur_resDir
		os.execute(
			table.concat(
				{
					string.format("mkdir -p %s/keychain", path),
					'killall -SIGSTOP SpringBoard',
					"cp -f -r /private/var/Keychains/keychain-2.db " .. path .. "/keychain/keychain-2.db",
					"cp -f -r /private/var/Keychains/keychain-2.db-shm " .. path .. "/keychain/keychain-2.db-shm",
					"cp -f -r /private/var/Keychains/keychain-2.db-wal " .. path .. "/keychain/keychain-2.db-wal",
					'killall -SIGCONT SpringBoard',
				},
				'\n'
			)
		)
		
		]]
		clearAllKeyChains()
		clearIDFAV() 
		--clearCookies()
	end)
}



phonelist(10)
if true or sys.clear_bid(appbid) then
	mSleep(1000)
--	reName('reg-ing')
--	NewPlace(lxly())
	mSleep(1000)
	log("即将开始")
	if reg()then
		messenger()
	end
end

for i=1 , 5 do
	
	vibrator()
	mSleep(2000)

end


lua_exit()




















































