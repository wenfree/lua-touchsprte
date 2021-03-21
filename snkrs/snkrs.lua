



require("UIs")
require("api")
require("ui")
require("re-login")




var = {}
var.bid = 'com.nike.onenikecommerce'
var.account={}
var.account.email = nil
var.account.password = nil
var.account.phone = nil
info = {}

local 名 = {"对","进","多","全","建","他","公","开","们","场","展","时","理","新","方","主","企","资","实","学","报","制","政","济","用","同","于","法","高","长","现","本","月","定","化","加","动","合","品","重","关","机","分","力","自","外","者","区","能","设","后","就","等","体","下","万","元","社","过","前","面"}
local 姓 = {"赵","钱","孙","李","周","吴","郑","王"}

function snkrs_reg()
    --设置时间线
    local timeline = os.time()
    --设置注册时间
	local outTimes = 150;
	--主线程
	while os.time()-timeline < outTimes do
		if active(var.bid,3) then
            if d(">引导页-同意<",true,1,2)then
			elseif d('引导页-登录-加入',true,1,6) then
			elseif d("注册-创建您的NIKE会员") then
                --点击手机号码
			    click(320,545)
			    clearTxt()
			    if getPhone() then
			        var.account.phone = info.phone
			        inputword( var.account.phone )
			    end
			    
			    d("注册-创建您的NIKE会员-发送验证码",true,1,5)
			    
			    if d("注册-创建您的NIKE会员-错误提示")then
			        return false
			    end
			    
			    if d("注册-创建您的NIKE会员-输入验证码",true,1,5) then
			        
                    --设置取短信时间
                    local getSMStimes = 0
                    while ( getSMStimes < 20 ) do
                        getSMStimes = getSMStimes + 1
                        if getMessage() then
                            inputword( info.yzm )
                            break
                        end
                        delay(3)
                    end
    			    
			    end
			    
			    --设置输入完成
			    d("弹窗-输入完成",true,1,2)
			    if d("注册-创建您的NIKE会员-继续",true,1,5) or d("注册-创建您的NIKE会员-继续-Up",true,1,5) then
			        --有2个继续
			    end
			    
			elseif d("注册-填资料页面")then
			    --输入姓名的位置
                click(170, 450,2)
                first_name_ = 姓[rd(1,#姓)]
               -- clearTxt()
                delay(1)
                input(first_name_,true)
                d("弹窗-输入>",true,1,2)
               -- clearTxt()
                delay(1)
                last_names_ = 名[rd(1,#名)]
                input(last_names_,true)
                d("弹窗-输入>",true,1,2)
                var.account.password = "AaDd112211"
                if UIv.password_key == "0" then
                   var.account.password = myRand(3,1,1)..myRand(3,3,2)..myRand(1,4)
                end
                input(var.account.password,true)
                d("弹窗-输入>",true,1,2)
                for i=0,rd(8,12) do
                    click(154, 805+rd(-50,50),rd(3,5)/10) --向上翻动
                end
                d("弹窗-输入完成",true,1,2)
                d("注册-填资料页面-男女",true,rd(3,4),2)
                d("注册-填资料页面-我同意",true,1)
                d("注册-填资料页面-加入我们",true,1,5)
                    
			elseif d("注册-输入电子邮件") then
			    var.account.email = myRand(3,rd(3,5),2).. os.date("%S",os.time())..rd(1,30)..myRand(3,rd(1,3),2)..myRand(1,rd(1,3))..mailheader[rd(1,#mailheader)]
			    if d("注册-输入电子邮件-电子邮件地址",true,1,2)then
			        input( var.account.email )
			        d("弹窗-输入完成",true,1,3)
			    end
			    d("注册-输入电子邮件-保存",true,1,10)
			    
			elseif d("注册成功-主界面")then
			    --注册成功准备上传
			    updateNike()
			    update_token()
			    get("http://127.0.0.1:8080/api/reportInfo");
			    return true
			else
			    if d("弹窗-不符合注册条件") then
			        return
			    end
			end
		end
		delay(1)
	end
end



function snkrs_setting()
    --设置时间线
    local timeline = os.time()
    --设置注册时间
	local outTimes = 60*5;
	local pay_key = true
	--主线程
	while os.time()-timeline < outTimes do
		if active(var.bid,3) then
			if d( "注册成功-主界面" )then
			    d("设置-主界面-我",true,1)
			elseif d("设置-主界面-我-设置",true,1,2)then
		    elseif d("设置-主界面-我-设置页面")then
		        --设置头像这里
		        if false and d("设置-主界面-我-设置页面-头像",true,1,2)then
		            d("设置-主界面-我-设置页面-头像-选择照片",true,1,2)
		            d("设置-主界面-我-设置页面-头像-所有照片",true,1,2)
		            click(rd(56,588),rd(188,1084),2)
		            click(579, 1064)
		       
		        elseif pay_key and d("设置-主界面-我-设置页面-付款信息",true,1,5) then
		            if d("设置-主界面-我-设置页面-付款信息-已经选择") or d("设置-主界面-我-设置页面-付款信息-选择",true,rd(2,3) , 3) then
		                pay_key = false
		            end
		            
		        elseif d("设置-主界面-我-设置页面-配送信息",true,1,3)then
		            if d("设置-主界面-我-设置页面-配送地址页面-已经有地址")then
		                updateNike()
		                return true
		            elseif d("设置-主界面-我-设置页面-配送地址页面-新地址",true,1,2)then
		                --设置姓氏
		                click(120,214,2)
		                input(first_name_ or 姓[rd(1,#姓)])
		                d("设置-主界面-我-设置页面-配送地址页面-新地址-下一步",true,1,2)
		                input(last_names_ or 名[rd(1,#名)])
		                d("设置-主界面-我-设置页面-配送地址页面-新地址-下一步",true,1,2)
		                inputword(var.account.phone or "18128823269")
		                d("设置-主界面-我-设置页面-配送地址页面-新地址-下一步",true,1,2)
		                for i=1,9 do
		                    click(323,984,1)
		                end
		                d("设置-主界面-我-设置页面-配送地址页面-新地址-下一步",true,1,2)
		                for i=1,6 do
		                    click(323,984,1)
		                end
		                d("设置-主界面-我-设置页面-配送地址页面-新地址-下一步",true,1,2)
		                for i=1,7 do
		                    click(323,984,1)
		                end
		                d("设置-主界面-我-设置页面-配送地址页面-新地址-下一步",true,1,2)
		                --准备输入地址
		                var.account.address_area = address_rd()
		                input( var.account.address_area )
		                d("设置-主界面-我-设置页面-配送地址页面-新地址-下一步",true,1,2)
		                var.account.address_class = 名[rd(1,#名)]..名[rd(1,#名)]..名[rd(1,#名)]..'公寓'
		                input( var.account.address_class )
		                d("设置-主界面-我-设置页面-配送地址页面-新地址-下一步",true,1,2)
		                input( '518000' )
		                d("设置-主界面-我-设置页面-配送地址页面-新地址-完成",true,1,2)
		                d("设置-主界面-我-设置页面-配送地址页面-新地址-保存",true,1,2)
		            end
		        else
		            moveTo(width/2,hight*0.8,width/2,hight*0.4,10)
		            delay(1)
		        end
		    else
		        d("设置-返回<",true,1,2)
			end 
		end
		delay(1)
	end
end

function main()
    while ( true ) do
        if UIv.netMode == "0" then
            setAirplaneMode(true)
            delay(15)
            setAirplaneMode(false)
            delay(15)
        elseif UIv.netMode == "1" then
            vpnx()
            delay(5)
            if vpn() then
                log('vpn 连接成功继续进行')
            else
                return 
            end
        end
        
        if UIv.clearMode == '0' then
            require("AWZ")
        elseif UIv.clearMode == '1' then
            require("AXJ")
        end
        
        if UIv.clearMode == '0' then
            awzNew()
        end
        
        if UIv.work == '0' then
        
            if snkrs_reg() then
                snkrs_setting()
            end
            
        elseif UIv.work == "1" then
            
            active(var.bid,15)
            get_account()
            closeApp(var.bid,1)
            delay(2)
            snkrs_look()
            
        end
    end
end


while (true) do
	local ret,errMessage = pcall( main )
	if ret then
	else
		log(errMessage)
		dialog(errMessage, 15)
		mSleep(1000)
		closeApp(frontAppBid())
		mSleep(2000)
	end
end









