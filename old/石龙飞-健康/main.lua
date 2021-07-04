


require("tsp")


t={}
t['立即购买']={0xef853c, "0|0|0xef853c,-102|37|0xffeab9,-56|44|0xd94644,-134|-46|0xffebb9",90,0,0,485,960}
t['好']={0x007aff, "0|0|0x007aff,-483|-152|0xf2f2f7,3|-155|0xf1f2f7",90,22,470,610,725}
t['优健康']={0xfffdf0, "0|0|0xfffdf0,54|-53|0xff9d1d,-25|29|0xf0e2bc",90,165,269,438,502}

t['vpn-好']={0x007aff, "0|0|0x007aff,-289|-104|0xffffff,-298|0|0x007aff",90,89,322,491,477}


function vpn()
	setVPNEnable(true)
	mSleep(1000)
	local LineTime = os.time()
	local OutTimes = 60
	while (os.time()-LineTime<OutTimes) do
		local flag = getVPNStatus()
		if flag.active then
			nLog("VPN 打开状态"..flag.status)
			if flag.status == '已连接' then
				return true
			else
			    setVPNEnable(true)
			    delay(6)
			end
		else
			nLog("VPN 关闭状态"..flag.status)
		end
		mSleep(1000)
		
		if d("vpn-好") then
		    log("准备输入")
            click(154,347,2)
            inputText(1)
            delay(1)
            d("vpn-好",true,1,2)
	    end
	end
end

require("new")

function 立即购买()
    url = "https://sourl.cn/9dhxs4"
    openURL(url)
    -- body
    local timeLine = os.time()
    while (os.time()-timeLine < 60 ) do
        if d( "立即购买" ,true , 1,3 ) then
        elseif ( d("优健康") or d("好",true,1,3) ) then
            return true
        else
            moveTo(200,700,200,200,20)
            delay(1)
        end
    end
end


for i=0,200 do
    vpnx()
    delay(3)
    if true or clickNew() then
        delay(3)
        if ( vpn() )then
            立即购买()
        end
    end
end





-- https://sourl.cn/9dhxs4