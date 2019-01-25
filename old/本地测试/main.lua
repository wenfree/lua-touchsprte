
require("TSLib")
require("tsp")
require("AWZ")




url = 'http://shop120247289.m.taobao.com'



t={}
t['url_打开']={{464,628,0x007aff}, {198,629,0x007aff}, {472,616,0x007aff}, }
t['taobao_完整展示']={{44,1076,0x569fd5}, {87,1110,0x57a1d3}, {45,1111,0x569fd4}, {75,1086,0x2e2c2a}, }

function open()
	local timeline = os.time()
	openURL(url)
	delay(2)
	while (os.time()-timeline < 30) do
		if d('url_打开',true,1)then
			delay(10)
			return true
		end
		delay(2)
	end
end

function see()
	local timeline = os.time()
	while (os.time()-timeline < 30) do
		if d('taobao_完整展示',true)then
			moveTo(300,900,300,900-400,rd(10,20))
			delay(rd(1,3))
			click(rd(200,600),rd(200,700))
		else
			click(rd(200,600),rd(200,700))
		end
		delay(2)
	end
end


vpnx()

while (true) do
	if awzNew() then
		if vpn() then
			if open()then
				see()
			end
		end
	end
	vpnx()
	delay(3)
end

































