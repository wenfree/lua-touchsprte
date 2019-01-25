require "tsp"

m = {}
m.默认 = {0x007aff, "-3|6|0x007aff,0|6|0x007aff,-3|22|0x007aff,1|22|0x007aff,4|22|0x007aff", 90, 0, 400, 639, 498}
m.编辑 = {0x007aff, "-5|11|0x007aff,1|11|0x007aff,-5|19|0x087eff,3|19|0x99c6fb,-5|27|0x057dff,2|24|0x007aff", 90, 550, 60, 627, 110}
m.描述 = {0x303030, "0|7|0x000000,0|16|0x000000,-5|18|0x000000,4|15|0x000000,0|29|0x050505,-4|29|0x000000", 90, 25, 360, 100, 447}
m.服务器 = {0x000000, "9|0|0x181818,8|8|0x000000,1|8|0x000000,1|16|0x000000,5|16|0x000000,9|16|0x181818,8|27|0x000000,4|27|0x292929,-2|27|0x0a0a0a", 90, 30, 447, 135, 537}
m.账号 = {0x565656, "0|14|0x000000,0|28|0x030303,0|30|0x616161,5|28|0x989898,10|1|0x808080,3|10|0x000000,12|14|0x353535,4|26|0x737373", 90, 0, 0, 639, 1135}
m.密码 = {0x353535, "-13|3|0x020202,-13|9|0x0d0d0d,0|3|0x000000,14|3|0x020202,14|9|0x0d0d0d", 90, 0, 0, 639, 1135}
m.完成 = {0x007aff, "-12|4|0x007aff,-12|9|0x007aff,0|3|0x007aff,14|3|0x007aff,14|9|0x007aff", 90, 550, 60, 627, 110}
m.添加VPN = { 0x007aff, 90, 31, 234, 255, 262}
m.pptp = {  0x8e8e93, 90, 534, 230, 548, 231}
m.必填 = { 0xc7c7cd, "20|3|0xc7c7cd,56|-16|0xc7c7cd,51|5|0xc8c8ce", 90, 230, 160, 298, 717}
m.errore = { 0x007aff,90, 312, 679, 329, 695}

mSleep(2000)
c_p(m.errore,"error")

local sz = require("sz")
local phoneName = sz.system.mgcopyanswer("UserAssignedDeviceName")

function all()
	do
		openURL("prefs:root=General&path=VPN");

		all = {}
		all['iPhone1']={'北京','111.231.66.116','cap1','cap1'}
		all['iPhone2']={'北京','111.231.66.116','cap2','cap2'}
		all['iPhone3']={'北京','111.231.66.116','cap3','cap3'}
		all['iPhone4']={'北京','111.231.66.116','cap4','cap4'}
		all['iPhone5']={'北京','111.231.66.116','cap5','cap5'}
		all['iPhone6']={'北京','111.231.66.116','cap6','cap6'}
		all['iPhone7']={'北京','111.231.66.116','cap7','cap7'}
		all['iPhone8']={'北京','111.231.66.116','cap8','cap8'}
		all['iPhone9']={'北京','111.231.66.116','cap9','cap9'}
		all['iPhone10']={'北京','111.231.66.116','cap10','cap10'}
		all['iPhone11']={'北京','111.231.66.116','cap11','cap11'}
		all['iPhone12']={'北京','111.231.66.116','cap12','cap12'}
		all['iPhone13']={'北京','111.231.66.116','cap13','cap13'}
		all['iPhone14']={'北京','111.231.66.116','cap14','cap14'}
		all['iPhone15']={'北京','111.231.66.116','cap15','cap15'}
		all['iPhone16']={'北京','111.231.66.116','cap16','cap16'}
		all['iPhone17']={'北京','111.231.66.116','cap17','cap17'}
		all['iPhone18']={'北京','111.231.66.116','cap18','cap18'}
		all['iPhone19']={'北京','111.231.66.116','cap19','cap19'}
		all['iPhone20']={'北京','111.231.66.116','cap20','cap20'}
		all['iPhone21']={'北京','111.231.66.116','cap21','cap21'}
		all['iPhone22']={'北京','111.231.66.116','cap22','cap22'}
		all['iPhone23']={'北京','111.231.66.116','cap23','cap23'}
		all['iPhone24']={'北京','111.231.66.116','cap24','cap24'}
		all['iPhone25']={'北京','111.231.66.116','cap25','cap25'}
		all['iPhone26']={'北京','111.231.66.116','cap26','cap26'}
		all['iPhone27']={'北京','111.231.66.116','cap27','cap27'}
		all['iPhone28']={'北京','111.231.66.116','cap28','cap28'}
		all['iPhone29']={'北京','111.231.66.116','cap29','cap29'}
		all['iPhone30']={'北京','111.231.66.116','cap30','cap30'}
		all['iPhone31']={'北京','111.231.66.116','cap31','cap31'}
		all['iPhone32']={'北京','111.231.66.116','cap32','cap32'}
		all['iPhone33']={'北京','111.231.66.116','cap33','cap33'}
		all['iPhone34']={'北京','111.231.66.116','cap34','cap34'}
		all['iPhone35']={'北京','111.231.66.116','cap35','cap35'}
		all['iPhone36']={'北京','111.231.66.116','cap36','cap36'}
		all['iPhone37']={'北京','111.231.66.116','cap37','cap37'}
		all['iPhone38']={'北京','111.231.66.116','cap38','cap38'}
		all['iPhone39']={'北京','111.231.66.116','cap39','cap39'}
		all['iPhone40']={'北京','111.231.66.116','cap40','cap40'}
		all['iPhone41']={'北京','111.231.66.116','cap41','cap41'}
		all['iPhone42']={'北京','111.231.66.116','cap42','cap42'}
		all['iPhone43']={'北京','111.231.66.116','cap43','cap43'}
		all['iPhone44']={'北京','111.231.66.116','cap44','cap44'}
		all['iPhone45']={'北京','111.231.66.116','cap45','cap45'}
		all['iPhone46']={'北京','111.231.66.116','cap46','cap46'}
		all['iPhone47']={'北京','111.231.66.116','cap47','cap47'}
		all['iPhone48']={'北京','111.231.66.116','cap48','cap48'}
		all['iPhone49']={'北京','111.231.66.116','cap49','cap49'}
		all['iPhone50']={'北京','111.231.66.116','cap50','cap50'}
		all['iPhone51']={'北京','111.231.66.116','cap51','cap51'}
		all['iPhone52']={'北京','111.231.66.116','cap52','cap52'}
		all['iPhone53']={'北京','111.231.66.116','cap53','cap53'}
		all['iPhone54']={'北京','111.231.66.116','cap54','cap54'}
		all['iPhone55']={'北京','111.231.66.116','cap55','cap55'}
		all['iPhone56']={'北京','111.231.66.116','cap56','cap56'}
		all['iPhone57']={'北京','111.231.66.116','cap57','cap57'}
		all['iPhone58']={'北京','111.231.66.116','cap58','cap58'}
		all['iPhone59']={'北京','111.231.66.116','cap59','cap59'}
		all['iPhone60']={'北京','111.231.66.116','cap60','cap60'}
		all['iPhone61']={'北京','111.231.66.116','cap61','cap61'}
		all['iPhone62']={'北京','111.231.66.116','cap62','cap62'}
		all['iPhone63']={'北京','111.231.66.116','cap63','cap63'}
		all['iPhone64']={'北京','111.231.66.116','cap64','cap64'}
		all['iPhone65']={'北京','111.231.66.116','cap65','cap65'}
		all['iPhone66']={'北京','111.231.66.116','cap66','cap66'}
		all['iPhone67']={'北京','111.231.66.116','cap67','cap67'}
		all['iPhone68']={'北京','111.231.66.116','cap68','cap68'}
		all['iPhone69']={'北京','111.231.66.116','cap69','cap69'}
		all['iPhone70']={'北京','111.231.66.116','cap70','cap70'}
		all['iPhone71']={'北京','111.231.66.116','cap71','cap71'}
		all['iPhone72']={'北京','111.231.66.116','cap72','cap72'}
		all['iPhone73']={'北京','111.231.66.116','cap73','cap73'}
		all['iPhone74']={'北京','111.231.66.116','cap74','cap74'}
		all['iPhone75']={'北京','111.231.66.116','cap75','cap75'}
		all['iPhone76']={'北京','111.231.66.116','cap76','cap76'}
		all['iPhone77']={'北京','111.231.66.116','cap77','cap77'}
		all['iPhone78']={'北京','111.231.66.116','cap78','cap78'}
		all['iPhone79']={'北京','111.231.66.116','cap79','cap79'}
		all['iPhone80']={'北京','111.231.66.116','cap80','cap80'}
		all['iPhone81']={'北京','111.231.66.116','cap81','cap81'}
		all['iPhone82']={'北京','111.231.66.116','cap82','cap82'}
		all['iPhone83']={'北京','111.231.66.116','cap83','cap83'}
		all['iPhone84']={'北京','111.231.66.116','cap84','cap84'}
		all['iPhone85']={'北京','111.231.66.116','cap85','cap85'}
		all['iPhone86']={'北京','111.231.66.116','cap86','cap86'}
		all['iPhone87']={'北京','111.231.66.116','cap87','cap87'}
		all['iPhone88']={'北京','111.231.66.116','cap88','cap88'}
		all['iPhone89']={'北京','111.231.66.116','cap89','cap89'}
		all['iPhone90']={'北京','111.231.66.116','cap90','cap90'}
		all['iPhone91']={'北京','111.231.66.116','cap91','cap91'}
		all['iPhone92']={'北京','111.231.66.116','cap92','cap92'}
		all['iPhone93']={'北京','111.231.66.116','cap93','cap93'}
		all['iPhone94']={'北京','111.231.66.116','cap94','cap94'}
		all['iPhone95']={'北京','111.231.66.116','cap95','cap95'}
		all['iPhone96']={'北京','111.231.66.116','cap96','cap96'}
		all['iPhone97']={'北京','111.231.66.116','cap97','cap97'}
		all['iPhone98']={'北京','111.231.66.116','cap98','cap98'}
		all['iPhone99']={'北京','111.231.66.116','cap99','cap99'}
		all['iPhone100']={'北京','111.231.66.116','cap100','cap100'}


		delay(2)


		while(true) do
			if c_p(m.添加VPN,'m.添加VPN')then
				toast('第一次添加',1)
				mSleep(2000)
				setp = 1
				outTime = os.time()
				while os.time() - outTime < 60 do
					if setp == 1 then
						if f_p(m.pptp,'pptp')then
							setp = 2
						else
							click(607,242)
							click(441,520)
							click(26,84)
						end
					elseif setp == 2 then
						l = l or 1
						if f_pic(m.完成, "完成") then
							setp = 3
						elseif c_pic(m.必填,'必填')then
							input(all[phoneName][l])
							l = l + 1
						end
					elseif setp == 3 then
						click(567,1095)
						input(all[phoneName][l])
						if c_pic(m.完成, "完成") then
							delay(2)
							click(430, 680)
							return true
						end
					end
				end
			elseif c_pic(m.默认, "默认") then
				--return true

			elseif c_pic(m.编辑, "编辑") then
				if c_pic(m.描述,'描述')then
					toast('描述',2)
					input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
					input(all[phoneName][1])
					delay(2)
				end
				if c_pic(m.服务器, "服务器") then
					toast('服务器',2)
					input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
					input(all[phoneName][2])
					delay(2)
				end
				if c_pic(m.账号, "账号") then
					input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
					input(all[phoneName][3])
					toast('账号',2)
					delay(2)
					click(567,1095)
				end
				if c_pic(m.密码, "密码") then
					input(all[phoneName][4])
					toast('密码',2)
					delay(2)
				end
				if c_pic(m.完成, "完成") then
					delay(2)
					click(430, 680)
					return true
				end
				delay(2)
			end
		end
	end
end


local ret,errMessage = pcall(all)
if ret then
else
	dialog(errMessage, 60)
	mSleep(1000)
	closeApp(frontAppBid())
	mSleep(2000)
end


