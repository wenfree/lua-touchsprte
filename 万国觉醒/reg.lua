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

-- info.phone = '16574509436'
-- info.smsname = '海豚'
-- getPhone();
-- inputText(info.phone)

-- while (true) do
--     if ( getMessage() ) then
--         log( info )
--         log('----------')
--     else
--         log('22')
--     end
--     delay(3);
-- end


t ={}
t['隐私保护-同意并继续']={0x0ea8fc, "0|0|0x0ea8fc,-136|-8|0xf7e1c6,-362|-406|0xd30000,-378|-402|0xf7e1c6",90,176,88,1130,662}
t['绑定手机-绑定']={0x09bf06, "0|0|0x09bf06,-228|-4|0x0ac007,-219|-133|0x65615c,-223|-231|0x65615c,-20|-452|0x33312e",90,375,104,712,702}
    t['绑定手机-绑定按钮']={0xffffff, "0|0|0xffffff,-8|-29|0x09c306,14|22|0x09bd07",90,760,526,896,631}
t['绑定手机-获取验证码']={0xfdf1e3, "0|0|0xfdf1e3,-70|-9|0x33312e,61|1|0x33302e,-21|-2|0xfef3e6",90,1002,349,1263,546}
t['实名制-提交']={0xffffff, "0|0|0xffffff,-348|21|0x09bd07,391|-20|0x09c307",90,380,504,1269,708}
t['更新-确定']={0x00c2ff, "0|0|0x00c2ff,-340|0|0xdd3c33,-194|-109|0x0079ac,-245|-290|0xc7c4b7",90,331,168,977,594}
t['万国觉醒-注册成功']={0xffad00, "0|0|0xffad00,23|-164|0x022f43,-37|-582|0xdf9432,-262|-590|0xefa542",90,0,0,1440,980}

t['弹窗-提示确认']={0x007aff, "0|0|0x007aff,46|-8|0x007aff,41|-152|0x000000,43|-162|0x000000",90,427,285,896,486}
t['弹窗-提示确认2']={0x007aff, "0|0|0x007aff,39|-163|0x000000",90,543,278,801,487}
t['弹窗-提示取消']={0x007aff, "0|0|0x007aff,273|1|0x007aff,171|-188|0x000000",90,412,265,868,503}
t['弹窗-游戏提示']={0x1274ba, "0|0|0x1274ba,2|-22|0x00d4ff,-38|65|0x00648e,-70|74|0xc5c2b6,-58|-282|0xc7c4b7",90,397,149,811,634}

function reg_game()
	local timeline = os.time()
	
	while os.time()-timeline < 60 * 3 do
		if active(_app.bid,8)then
			
			if d('隐私保护-同意并继续',true)then
			    
			elseif d('绑定手机-绑定')then
			 --   {{502, 355, 0xd3cac0},{501, 261, 0xfef3e7}}
			    if getPhone()  and #(info.phone) >= 11 then
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
			                    return false
			                elseif getMessage() then
			                    click(503, 459)
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
			elseif d('更新-确定')then
                update_token()
			    return true;
			elseif d('万国觉醒-注册成功')then
			    update_token()
			    return true;
			else
			    if d('弹窗-提示确认',true)then
			    elseif d('弹窗-提示确认2',true)then
			    elseif d('弹窗-提示取消',true)then
			    elseif d('弹窗-游戏提示',true)then
			    else
			        click(74, 152)
			    end
		    end
		end
		delay(1)
	end
end
	
function all()
    awzNew()
    vpn()
    if(reg_game())then
        reg__()
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














