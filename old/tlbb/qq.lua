local sz = require("sz")
require("AWZ")
require("tsp")
	
IMEI = sz.system.serialnumber()
nLog(IMEI)

function getqq(idfa)
	PhoneName = sz.system.mgcopyanswer("UserAssignedDeviceName")
	IMEI = sz.system.serialnumber()
	local apiqq = readQQ() or backname(awz)
	GetUrl = 'http://tb1.host.apijs.cc/Public/tlbb/?service=tlbb.getqq&imei='..IMEI..'&idfa='..idfa..'&phonename='..PhoneName..'&qq='..apiqq
	nLog(GetUrl)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(GetUrl);
	nLog(res)
	if code == 200 then
		local json = sz.json
		data = json.decode(res)
		nLog("取QQ成功")
		mSleep(200)
		id = tonumber(data['data']["id"])
		qqmun = data['data']["qq"]
		qqpw = data['data']["qqpw"]
		--nLog(qqmun..'\n'..qqpw)
		return true
	end
end

function backqq(idfa,qqhao)
	toast('正在执行, qq号上传服务器',2)
	local GetUrl = 'http://tb1.host.apijs.cc/Public/tlbb/?service=tlbb.backqq&idfa='..idfa..'&qq='..qqhao..'&imei='..IMEI
	nLog(GetUrl)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(GetUrl);
	nLog(res)
	if code == 200 then
		return true
	end
end

function localQQ(awz)
	nLog(awz)
	local nameList = strSplit(awz,'/')
	if nameList[1] == 'RecordID:QQ' then
		return nameList[2]
	else
		local nameList = strSplit(nameList[1],':')
		return nameList[2]
	end
end

qq = {}
qq['qq启动界面-登录']={{181,984,0xffffff},{514,985,0xffffff},{514,986,0x35abda},}
qq['qq登录界面']={{80,164,0xffffff},{150,166,0xffffff},{150,162,0x969aa4},{617,2,0x9c9da7},}
	qq['qq登录界面-QQ']={ 0xcdd1d7, "3|0|0x848e9d,49|-14|0xcdd0d6,52|16|0xcdd1d7", 90, 55, 311, 368, 375}
	qq['qq登录界面-QQ密码']={ 0xcacfd4, "10|19|0xc6c8ce,16|-9|0xcbcfd5", 90, 50, 400, 136, 463}
	qq['qq登录界面-QQ登录']={ 0xffffff, "3|2|0x22abe3,-11|-14|0xffffff,-10|-12|0x50bae3", 90, 213, 541, 427, 604}
	-----click(575,51)
qq['QQ-验证码界面']={{360,70,0x000000},{360,72,0xffffff},{360,83,0x141414},{609,80,0x000000},}
	qq['QQ-验证码界面-加载完成']={{95,612,0x007aff},{132,587,0x007aff},{135,635,0x007aff},}
qq['QQ-系统弹窗不允许']={ 0x007aff, "0|12|0x007aff,270|-6|0xf8f8f8,270|-9|0x007aff", 90, 70, 383, 550, 854}
	
qq['QQ-消息主页']={{94,1092,0x47bafe},{102,1071,0xffffff},{107,1071,0x47bafe},{114,1071,0xffffff},}
qq['QQ-消息主页-看点']={{66,1075,0x47bafe},{247,1102,0x7f8393},{400,1085,0x7f8393},{400,1077,0xffffff},}
	qq['QQ-消息主页-消息红点']={ 0xf74c31, "9|0|0xffffff", 90, 522, 211, 637, 1021}
	qq['QQ-消息主页-消息界面-后退']={ 0x171717, "19|-19|0x131314,19|-1|0xefeff4,18|18|0x161617", 90, 5, 39, 67, 125}
	qq['QQ-消息主页-通讯录绑定']={ 0xa8d575, "-203|-90|0x07beff,-347|-131|0xcf2374,-347|-153|0xf3cec4", 90, 28, 131, 607, 974}
	qq['QQ-消息主页-关闭绑定']={{70,80,0x000000},{57,80,0xffffff},{54,80,0x000000},{34,84,0x000000},}
	qq['QQ-消息主页-确定关闭']={{488,717,0x000000},{428,376,0x1eb9f2},{80,374,0x1eb9f2},}

qq['QQ-弹窗-马上设置推送']={{319,858,0xfdfdfd},{341,347,0x14b6f5},{300,364,0xffffff},{367,396,0x65d4ff},{442,701,0x1eb9f2},}
qq['QQ-弹窗-第一次登录报错']={ 0x000000, "275|-262|0x1eb9f2,-263|-264|0x1eb9f2,19|-264|0x1eb9f2,3|-255|0xffffff", 90, 14, 254, 631, 848}


function qqloging()
	qqbid = 'com.tencent.mqq'
	qqTimeline = os.time()
	qqTimeUsed = 60*3
	init('0',0)
	awz,idfa = getTrueName_awz()
	
	--localQQ(awz)
	
	local 第一次登录 = false
	local loginState = false
	
	while (os.time()-qqTimeline<qqTimeUsed) do
		if active(qqbid,10)then
		elseif done(qq['QQ-消息主页'],'QQ-消息主页',true,1) or done(qq['QQ-消息主页-看点'],'QQ-消息主页-看点',true,1)  then
			delay(2)
			if loginState then
				backqq(idfa,qqmun)
			end
			if c_pic(qq['QQ-消息主页-消息红点'],'QQ-消息主页-消息红点',true)then
				log('读消息')
			else
				if 第一次登录 then
					reName(qqmun)
				else
					local apiqq = readQQ() or backname(awz)
					reName(apiqq)
					backqq(idfa,apiqq)
				end
				app_bid = 'com.tencent.cyoutstlty'
				closeX(app_bid)
				return true
			end
		elseif c_pic(qq['QQ-系统弹窗不允许'],'QQ-系统弹窗不允许',true)then
		elseif c_pic(qq['QQ-消息主页-消息界面-后退'],'QQ-消息主页-消息界面-后退',true)then
		elseif c_pic(qq['QQ-消息主页-通讯录绑定'],'QQ-消息主页-通讯录绑定',false)then
			click(49,84)	--关闭
			click(472,724)	--关闭
		elseif done(qq['QQ-弹窗-马上设置推送'],'QQ-弹窗-马上设置推送',true,1)then
		elseif done(qq['QQ-消息主页-关闭绑定'],'关闭绑定',true,1)then
		elseif done(qq['QQ-消息主页-确定关闭'],'确定关闭',true,1)then
		elseif done(qq['qq启动界面-登录'],'qq启动界面-登录',true,1)then
		elseif done(qq['qq登录界面'],'qq登录界面')then	
			if getqq(idfa)then
				if c_pic(qq['qq登录界面-QQ'],'qq登录界面-QQ',true)then
					input(qqmun)
					click(575,51)
				end
				
				if c_pic(qq['qq登录界面-QQ密码'],'qq登录界面-QQ密码',true)then
					input(qqpw)
					click(575,51)
				end
				
				if c_pic(qq['qq登录界面-QQ登录'],'qq登录界面-QQ登录',true)then
					loginState = true
					第一次登录 = true
					delay(5)
				end
			end
		elseif done(qq['QQ-验证码界面'],'QQ-验证码界面')then
			if done(qq['QQ-验证码界面-加载完成'],'QQ-验证码界面-加载完成')then
				top = {98,237}
				down = {98,484}
				left_top = leftP(top[1],top[2],down[1],down[2])+1
				if left_top < 2 then
					click(583,694)		--刷新一次
					delay(3)
				else
					left ={ 98,  left_top}
					lun2 = { 300 , left_top , 607 , left_top }
					right_left = rightP(lun2[1],lun2[2],lun2[3],lun2[4])
					right ={ right_left, left_top}
					--table.print(right)
					moveTo(98,613,right_left,613,20,50)
					delay(3)
				end
			else
				delay(3)
			end
		else
			c_pic(qq['QQ-弹窗-第一次登录报错'],'QQ-弹窗-第一次登录报错',true)
		end
		mSleep(1000)
	end
	closeX(qqbid)
end



function backname(awz)
	--nLog(awz)
	local nameList = strSplit(awz,'/')
	if nameList[1] == 'RecordID:QQ' then
		return nameList[2]
	else
		local nameList = strSplit(nameList[1],':')
		return nameList[2]
	end
end

function readQQ()
	function getList(path)
		local a = io.popen("ls "..path);
		local f = {};
		for l in a:lines() do
			table.insert(f,l)
		end
		a:close()
		return f
	end
	dataPath = appDataPath("com.tencent.mqq");   --
	if dataPath ~= "" then                    --如果获取到路径
		dataPath = dataPath..'/Documents/'
	end
	qqlist = getList(dataPath)
	for k,v in pairs(qqlist)do
		res = tonumber(v)
		if type(res) == "number" then
			--nLog('QQ: '..res)
			return res
		end
	end
end

function RGBConvertToHSV(colorRGB)
    local r,g,b = colorRGB.r, colorRGB.g, colorRGB.b;  
    local h,s,v = 0,0,0;  

    local max1 = math.max(r, math.max(g,b));  
    local min1 = math.min(r, math.min(g,b));  
  
    if max1 == min1 then  
        h=0;  
    else  
        if r == max1 then  
            if g >= b then  
                h = 60 * (g-b) / (max1-min1);  
            else  
                h = 60 * (g-b) / (max1-min1) + 360;  
            end       
        end  
        if g == max1 then  
            h = 60 * (b-r)/(max1-min1) + 120;  
        end  
        if b == max1 then  
            h = 60 * (r-g)/(max1-min1) + 240;  
        end  
    end      
      
    if max1 == 0 then  
        s = 0;  
    else  
        s = (1- min1 / max1) * 255;  
    end  
      
    v = max1;  
      
    local hsvValue = {  
        h = h;  
        s = s;  
        v= v;  
    };  
    return hsvValue;  
end

function getHsv(x,y)
	local colorRGB ={}
	colorRGB.r,colorRGB.g,colorRGB.b = getColorRGB(x,y)
	return RGBConvertToHSV(colorRGB)
end

function leftP(x1,y1,x2,y2)
	keepScreen(true)
	for i = y1,y2 do
		nLog(i)
		hsv1 = getHsv(x1,i)
		hsv2 = getHsv(x1,i + 1)
		if tonumber(hsv2.v) - tonumber(hsv1.v) > 80 then
			keepScreen(false)
			log('竖-->'..i)
			return i
		end
	end
	keepScreen(false)
	return 0
end

function rightP(x1,y1,x2,y2)
	keepScreen(true)
	log('模')
	for i = x1,x2 do
		hsv1 = getHsv(i,y1)
		hsv2 = getHsv(i+2,y1)
--		log('hsv1-->'..hsv1.v..'('..i..','..y1..')')
--		log('hsv2-->'..hsv2.v..'('..i+2 ..','..y1..')')
		
		if tonumber(hsv1.v) - tonumber(hsv2.v) > 45 then
			log('发现插槽')
			
			right2 = i
			计数 = 0
			for k = right2,right2+11 do
				if hsv1.v - getHsv(k,y1).v > 40 then
					计数 = 计数 + 1
				end
			end
			if 计数 > 10 then
				keepScreen(false)
				return i
			end
		end
	end
	keepScreen(false)
	return 450
end

--第二个循环
function table.print(t)  
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            log(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        log(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        log(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        log(indent.."["..pos..'] => "'..val..'"')
                    else
                        log(indent.."["..pos.."] => "..tostring(val))
                    end
					mSleep(100)
                end
            else
                log(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        log(tostring(t).." {")
        sub_print_r(t,"  ")
        log("}")
    else
        sub_print_r(t,"  ")
    end
end



















