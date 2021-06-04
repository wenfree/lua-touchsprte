require("tsp")
require('api')
require('token')
require("AWZ")





init(1)
info = {}
info.api = 'http://sms.wenfree.cn/public/'
_app = {}
_app.bid = 'com.lilithgames.rok.ios.offical'
__reg = true

function getphone2()
    local url = 'http://103.91.211.167/api/specified?sid=274&phone='..info.phone..'&token=75044e220f7e11eb81a2008cfa0433f8'
    local res = get_(url)
    log(res)
    if res then
        local ress = split(res,'|')
        if ress[1] == 0 or ress[1] == '0' then
            return true
        end
    end
end

function upall()
    if 是否注册过 then
        update_token_already()
    else
        update_token()
    end
end

function update_token()
    local RokToken = llsGameToken();
    local info ={}
    info['cradid']=info.cradid
    info['phone']=info.phone
    info['token']=RokToken[1]
    info['idfa']=RokToken[2]
    info['s']='Rok.Token'
    _api_rok(info)
end

function update_token_already()
    local RokToken = llsGameToken();
    local info ={}
    info['cradid']=info.cradid
    info['phone']=info.phone
    info['token']=RokToken[1]
    info['idfa']=RokToken[2]
    info['note']='别人注册'
    info['s']='Rok.Token'
    _api_rok(info)
end

function phone_already()
    local posta ={}
    posta['arr']= '{"phone":'..info.phone..'}'
    posta['table']='rok_already'
    posta['id']=''
    posta['s']='Index.update'
    log(posta)
    _api_rok(posta)
end


if t==nil then
    t ={}
end
t['隐私保护-同意并继续']={0x0ea8fc, "0|0|0x0ea8fc,-136|-8|0xf7e1c6,-362|-406|0xd30000,-378|-402|0xf7e1c6",90,176,88,1130,662}
t['绑定手机-绑定']={0x09bf06, "0|0|0x09bf06,-228|-4|0x0ac007,-219|-133|0x65615c,-223|-231|0x65615c,-20|-452|0x33312e",90,375,104,712,702}
    t['绑定手机-绑定按钮']={0xffffff, "0|0|0xffffff,-8|-29|0x09c306,14|22|0x09bd07",90,760,526,896,631}
t['绑定手机-获取验证码']={0xfdf1e3, "0|0|0xfdf1e3,-70|-9|0x33312e,61|1|0x33302e,-21|-2|0xfef3e6",90,1002,149,1263,546}
t['实名制-提交']={0xffffff, "0|0|0xffffff,-348|21|0x09bd07,391|-20|0x09c307",90,380,504,1269,708}
t['更新-确定']={0x00c2ff, "0|0|0x00c2ff,-340|0|0xdd3c33,-194|-109|0x0079ac,-245|-290|0xc7c4b7",90,331,168,977,594}
t['万国觉醒-注册成功']={0xffad00, "0|0|0xffad00,23|-164|0x022f43,-37|-582|0xdf9432,-262|-590|0xefa542",90,0,0,1440,980}

t['弹窗-提示确认']={0x007aff, "0|0|0x007aff,46|-8|0x007aff,41|-152|0x000000,43|-162|0x000000",90,427,285,896,486}
t['弹窗-提示确认2']={0x007aff, "0|0|0x007aff,39|-163|0x000000",90,543,278,801,487}
t['弹窗-提示取消']={0x007aff, "0|0|0x007aff,273|1|0x007aff,171|-188|0x000000",90,412,265,868,503}
t['弹窗-游戏提示']={0x1274ba, "0|0|0x1274ba,2|-22|0x00d4ff,-38|65|0x00648e,-70|74|0xc5c2b6,-58|-282|0xc7c4b7",90,397,149,811,634}
t['弹窗-网络错误']={0x1176bc, "0|0|0x1176bc,54|0|0x00c2fe,-16|-290|0x858278,-18|-300|0x858278",90,343,161,989,582}

t['QQ下->登录']={0x007aff, "0|0|0x007aff,-142|-274|0x0abe06,21|-313|0x09c308",90,392,102,664,594}
-- t['QQ下->登录']={0x007aff, "0|0|0x007aff,-28|-88|0xffffff,-33|-98|0xeb1c26",90,375,176,875,624}
t['登录游戏成功']={0xa4fcff, "0|0|0xa4fcff,45|8|0xd9a148,87|32|0xfcfcfc",90,28,624,191,748}
t['rok-封号']={0x1176bc, "0|0|0x1176bc,168|2|0x00bffb,214|-1|0x1176bc,86|-288|0x858278",90,310,109,999,616}
t['弹窗-已经注册']={0x007aff, "0|0|0x007aff,110|-127|0x000000,112|-130|0xf9f9f9,112|-132|0x000000,-84|-177|0x000000,-273|-1|0x007aff",90,425,247,919,505}
t['切换帐号界面']={0x33312e, "0|0|0x33312e,-3|3|0xfef3e7,-112|337|0x09c507,505|416|0x09bb07,-144|-1|0x33312e",90,385,118,1252,674}
t['未注册']={0x007aff, "0|0|0x007aff,25|-180|0x000000,122|-142|0xf9f9f9,124|-143|0x000000,38|-5|0x007aff",90,406,244,927,507}

function reg_game()
    是否注册过 = false
	local timeline = os.time()
	
	while os.time()-timeline < 60 * 5 do
		if active(_app.bid,8)then
			
			if d('隐私保护-同意并继续',true)then
			elseif d( '弹窗-已经注册',true,1,3 ) then
			    reName(info.phone)
			    phone_already()
			    return false
			elseif d('绑定手机-绑定')  then
			    
			   
			    if getPhone() and #info.phone == 11 then
			        click(502, 355)
			        keyDown("Clear")
                    keyUp("Clear")
                    delay(1)
			        inputStr(info.phone)
			        delay(1)
			        click(74, 152)
	
	                isreturn = true
			        if d('绑定手机-获取验证码',true)then
			            delay(5)
			            local times_ = 0
			            while (times_ < 15 ) do
			                times_ = times_ + 1
			                if d('弹窗-提示确认',true)then
			                 --   return false
			                elseif getMessage() then
			                    keyDown("Clear")
                                keyUp("Clear")
                                delay(1)
			                    inputStr(info.yzm)
			                    delay(1)
			                    click(74, 152)
			                    delay(2)
			                    isreturn = false
			                    break
			                else
			                    delay(3)
			                end
			            end
			            if isreturn then
			                return
			            end
			        end
                    if d('绑定手机-绑定按钮',true)then
                        delay(3)
                    end
			    end
		    elseif d('实名制-提交') then
                getCrad();
                log(info)
                click(639, 336)
                keyDown("Clear")
                keyUp("Clear")
                delay(1)
                inputStr(info.cardname)
                delay(1)
                click(74, 152)
                click(622, 443)
                keyDown("Clear")
                keyUp("Clear")
                delay(1)
                inputStr(info.cardnumber)
                delay(1)
                click(74, 152)
                d('实名制-提交',true)
			elseif d('更新-确定') or d('万国觉醒-注册成功') or d('登录游戏成功')or d('rok-封号') then
                update_token()
			    return true;
			else
			    if d('弹窗-提示确认',true)then
			    elseif d('弹窗-提示确认2',true)then
			    elseif d('弹窗-提示取消',true)then
			    elseif d('弹窗-游戏提示',true)then
			    elseif d('弹窗-网络错误',true,1)then
			    else
			        click(74, 152)
			    end
		    end
		end
		delay(1)
	end
end


function login_game()

	local timeline = os.time()
	while os.time()-timeline < 60 * 5 do
		if active(_app.bid,8)then
			
			if d('隐私保护-同意并继续',true)then
			elseif d( '未注册',true,1,3 ) then
			    return false
			elseif d('绑定手机-绑定')  then
			    delay(2)
			    moveTo(600,500,600,200,10)
			    delay(2)
			    d('QQ下->登录',true,1,2)
			    
			    if getPhone() and #info.phone == 11 then

			        click(502, 355)
			        keyDown("Clear")
                    keyUp("Clear")
                    delay(1)
			        inputStr(info.phone)
			        delay(1)
			        click(74, 152)
			            
			        if d('绑定手机-获取验证码',true)then
			            delay(5)
			            local times_ = 0
			            while (times_ < 15 ) do
			                times_ = times_ + 1
			                if d('弹窗-提示确认',true)then
			                 --   return false
			                elseif getMessage() then
			                    keyDown("Clear")
                                keyUp("Clear")
                                delay(1)
			                    inputStr(info.yzm)
			                    delay(1)
			                    click(74, 152)
			                    delay(2)
			                    break
			                else
			                    delay(3)
			                end
			            end
			        end
                    if d('绑定手机-绑定按钮',true)then
                        delay(3)
                        -- reName('取号成功')
                        -- update_token()
                        -- return true
                    end
			    end
		    elseif d('实名制-提交') then
                return false
			elseif d('更新-确定') or d('万国觉醒-注册成功') or d('登录游戏成功')or d('rok-封号') then
                update_token_already()
			    return true;
			else
			    if d('弹窗-提示确认',true)then
			    elseif d('弹窗-提示确认2',true)then
			    elseif d('弹窗-提示取消',true)then
			    elseif d('弹窗-游戏提示',true)then
			    elseif d('弹窗-网络错误',true,1)then
			    else
			        click(74, 152)
			    end
		    end
		end
		delay(1)
	end
end



	
function all()
    if vpn() then
        awzNew()
        reg_game()
        -- login_game()
    end
    vpnx()
    delay(2)
end

while (true) do
	local ret,errMessage = pcall(all)
	if ret then
	else
	    vpnx();
		log(errMessage)
		dialog(errMessage, 10)
		mSleep(2000)
	end
end












