require("TSLib")
require("tsp")
require("AWZ")






init(appbid,0)
var={}
var.game_bid = "com.tencent.tmgp.hjol"



--设置全局变量
t={}






----事件------------------
t['事件_进入游戏_注销_修复']={ 0xb3692d, "-323|-1224|0xfbdd91,-314|-1133|0xfbdd91,-281|-85|0x9cc93b", 90, 0, 0, width, hight}

function Event()
	if d('事件_进入游戏_注销_修复',true,1)then
		
		
	else
		return true
	end
end


----弹窗------------------
t['弹窗_系统公告']={ 0xfebcb1, "12|-11|0xfebcac,-1|-11|0x631410,-11|0|0x6a1713,-10|11|0xfebcbb", 90, 657, 122, 714, 179 }
t['弹窗_右上角X']={ 0xffbdb3, "3|-4|0x891f1a,11|-12|0xfebcab,26|24|0x641717,-11|-11|0xfcbd96", 90, 589, 82, 743, 494}

function Tips()
	if d('弹窗_系统公告',true,1)then
	elseif d('弹窗_右上角X',true,1)then
		
	else
		return true
	end
end



function hjol()
	while (true) do
		if active(var.game_bid,rd(4,8)) then
			












			if Tips()then
				Event()
			end
		end
		delay(1)
	end
end


hjol()































































































































