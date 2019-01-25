require("TSLib")
require("tsp")
require("AWZ")


local URL = 'https://at.umeng.com/eiCGDm'
local var = {}
var.bid = 'com.chineseall.17kReaderForFree'


function open(URL)
	openURL(URL)
	delay(3)
	local TimeLine = os.time()
	local UsedTime = 30
	
	while ( os.time()-TimeLine < UsedTime ) do
		if d('url_打开',true)then
			delay(rd(10,15))
			return true
		end
		delay(2)
	end
end


t={}
t['url_打开']={ 0x007aff, "-139|-5|0x007aff,-428|-60|0xffffff", 90, 54, 513, 589, 678 } --多点找色

t['弹窗_允许']={ 0x007aff, "-253|-9|0x007aff,-328|-22|0x007aff", 90, 67, 633, 556, 701 } --多点找色

function IDFA()
	local TimeLine = os.time()
	local UsedTime = rd(35,50)
	
	while ( os.time()-TimeLine < UsedTime ) do
		if active(var.bid,3)then
			if d('弹窗_允许',true)then
				
			else
				moveTo(542,689,80,258,20)
				delay(rd(2,3))
			end
		end
		delay(2)
	end
end


function NEW()
	index = 0
	while (index < 160 ) do
		if vpn() then
			if awzNew()then
				if open(URL)then
					IDFA()
					index = index + 1
					reName('read-'..os.time())
				end
			end
			vpnx()
			delay(3)
		end
	end
end

function OLD()
	index = 0
	while (index < 60 ) do
		if vpn() then
			if awz_next()then
				if open(URL)then
					IDFA()
					index = index + 1
					reName('留存-'..os.time())
				end
			end
			vpnx()
			delay(3)
		end
	end
end

NEW()
OLD()


































































