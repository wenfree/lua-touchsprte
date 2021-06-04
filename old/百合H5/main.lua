
require("tsp")
require("api")






-- openURL("http://m.baihe.com/regChat?channel=hscm&code=11")


t={}
t['百合网-男女']={0x6cabfd, "354|1|0xff7a5e,145|-4|0x5eb4fb,146|-4|0xff9c5d",90,21,1121,732,1264}
t['百合网->']={0x969799, "-10|-10|0x969799,-10|11|0x969799,-7|0|0xffffff",90,528,1155,740,1323}
    t['百合网-弹窗->确定']={0x1989fa, "0|0|0x1989fa,0|-5|0x1989fa",90,594,627,739,889}
        t['百合网-弹窗->选择生日']={0x323233, "0|0|0x323233,250|-2|0x323233,500|-2|0x323233",90,22,964,709,1085}
        t['百合网-弹窗->选择居住地']={0x323233, "0|0|0x323233,227|3|0xffffff,393|0|0x323233",90,76,954,645,1089}
        t['百合网-弹窗->选择身高']={0x323233, "0|0|0x323233,-348|5|0xffffff,335|8|0xffffff",90,12,945,737,1110}
            t['百合网-弹窗->选择身高->5万']={0x323233, "0|0|0x323233,-12|-14|0xffffff,-7|-16|0x323233,-100|-21|0x323233,-91|-23|0xfcfcfc,-90|-24|0x383839",90,279,999,452,1051}
t['百合网-未婚-离异-失偶']={0xffffff, "0|0|0xffffff,245|3|0xff5f5e,513|-1|0xff5f5e,391|-27|0xffffff,391|-43|0xff5f5e",90,11,1130,708,1315}
t['百合网-随机昵称-发送']={0xff6968, "144|4|0xff5f5e,70|2|0xff5f5e,69|2|0xffffff,-59|-1|0xff5f5e",90,430,1152,732,1292}
t['百合网-请输入手机号']={0x969799, "0|0|0x969799,446|-19|0xff5f5e,530|20|0xff5f5e,478|1|0xffffff",90,16,1156,737,1285}
t['百合网-发送']={0xff5f5e, "0|0|0xff5f5e,3|-20|0xff5f5e,18|-3|0xffffff",90,568,597,742,1316}
--注册过
t['百合网-点击下载']={0xf2317d, "0|0|0xf2317d,141|118|0x0202ee,325|142|0x0000ee",90,10,865,733,1244}
t['百合网-清理输入']={0xffffff, "0|0|0xffffff,-1|-9|0xc8c9cc,104|18|0xff5f5e",90,505,623,735,1311}
    t['百合网-清理输入-完成']={0x007aff, "0|0|0x007aff,1|-6|0x007aff",90,644,541,733,1034}
--验证码
t['百合网-请输入验证码']={0x969799, "0|0|0x969799,388|-21|0xeeeeee,414|-17|0xffffff,442|-4|0xff5f5e",95,7,1152,732,1323}
t['百合网-请输入密码']={0x969799, "0|0|0x969799,391|-3|0xffffff,393|-3|0x969799,384|-3|0x969799,375|-3|0x999a9c,428|-3|0xffffff,429|-3|0xff5f5e",95,2,1138,733,1302}
t['百合网-注册完成']={0xff5f5e, "0|0|0xff5f5e,3|-18|0xffffff,203|-6|0xf0f0f0,202|-6|0xff5f5e,423|-17|0xfe6261",90,59,1133,655,1294}
t['百合网-卡住']={0x007aff, "0|0|0x007aff,-27|-96|0xff5f5e,-66|-120|0xff5f5e",90,565,605,740,1079}

function reg()
    high = 1
    openURL("http://m.baihe.com/regChat?channel=hscm&code=11")
    local timeLine = os.time()
    while (os.time()-timeLine < 120 ) do
        if d("百合网-男女",true,rd(1,2) ) then
        elseif d("百合网->",true ) then
        elseif d("百合网-卡住",true ) then
        elseif d("百合网-弹窗->确定" ) then
            if ( d("百合网-弹窗->选择生日") )then
                for i=1,rd(2,3) do
                    moveTo(125,850,125,1100,20)
                end
                for i=1,rd(2,3) do
                    moveTo(370,850,370,1100,20)
                end
                for i=1,rd(2,3) do
                    moveTo(622,850,622,1100,20)
                end
                d("百合网-弹窗->确定",true )
            elseif   d("百合网-弹窗->选择居住地")  then
                for i=1,rd(2,5) do
                    moveTo(125,1100,125,850,20)
                end
                for i=1,rd(2,5) do
                    moveTo(558,1100,558,850,20)
                end
                d("百合网-弹窗->确定",true )
            elseif   d("百合网-弹窗->选择身高")  then
                local movteaa = { 10,2,3 }
                for i=1,rd(1,movteaa[high] ) do
                    moveTo(558,1100,558,rd(850,1000),20)
                    delay(0.5)
                end
                high = high + 1
                d("百合网-弹窗->确定",true )
            end
        elseif d("百合网-未婚-离异-失偶",true ) then
        elseif d("百合网-随机昵称-发送",true ) then
            d("百合网-发送",true)
        elseif d("百合网-请输入密码",true) then
            input( "Aa123456" )
            delay(1)
            d("百合网-发送",true)
            d("百合网-清理输入-完成",true)
        elseif d("百合网-请输入验证码",true) then
            if ( getMessage()  )then
                input( appinfo.sms )
                delay(1)
                d("百合网-发送",true)
                delay(2)
            else
                delay(3)
            end
            d("百合网-清理输入-完成",true)
        elseif d("百合网-请输入手机号",true,1,2)then
            if ( getPhone()  )then
                input( appinfo.phone )
                delay(1)
                d("百合网-发送",true)
                delay(2)
            end
            d("百合网-清理输入-完成",true)

        elseif d("百合网-注册完成",true) then
            Idfa()
            return true
        end
        
    end
end



while true do

    if vpn() then
        reg()
    end
    vpnx()
    delay(2)

end
















