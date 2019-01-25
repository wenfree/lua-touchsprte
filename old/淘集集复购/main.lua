require("TSLib")
require("tsp")
require("AWZ")
--require("lz-api")
--require("yzm")
--require("ui")
require("iphone6")



init('0',0)
var={}

--app包名 合集------------------------------------
var.bid={}
var.bid['淘集集']='com.huanshou.taojiji'
var.bid['支付宝']='com.alipay.iphoneclient'

var.name = '淘集集复购'

var.phonename = getDeviceName()
var.pwd = '520000'



pwdlist={}
pwdlist['Tihot000']='520000'



if pwdlist[var.phonename] then
	var.pwd = pwdlist[var.phonename]
end
---------------------------------全局变量-------------------------



function idfaupdate()
	local url = "http://idfa888.com/Public/idfa/?service=idfa.idfa"
	local tb={}
	tb.name = var.name
	tb.idfa = var.awz_idfa
	tb.ip = var.ip
	tb.phonename = var.phonename
	tb.other = var.other
	tb.password = var.password
	tb.phone = var.phone
	tb.account = var.account or var.awz_name
	return post(url,tb)
end

phoneKey={
	{114,756,0x000000}, 
	{319,760,0x000000}, 
	{542,762,0x000000}, 
	{115,861,0x000000}, 
	{321,869,0x000000}, 
	{541,868,0x000000}, 
	{109,963,0x000000}, 
	{319,977,0x000000}, 
	{539,977,0x000000}, 
	[0]={318,1081,0xffffff},
	}
	
function phone_input(str)
	for i =1,string.len(str) do
		local mun_ = tonumber(string.sub(str,i,i))
		click(phoneKey[mun_][1],phoneKey[mun_][2],0.3)
	end
end





--------------------------小函数--------------------------

function TIPs()
	if d('tip_选择规格')then
		d('tip_选择规格_款式',true)
			delay(1)
		if not(d('tip_选择规格_款式_选中'))then
			click(80,577)
		end
		moveTo(300,900,300,900-400,20)
			delay(1)
		d('tip_选择规格_样式',true)
			delay(1)
		d('tip_选择规格',true,1)
	elseif d('tip_暂时放弃',true,1)then
	elseif d('tip_支付宝_重试',true,1)then
	elseif d('tip_支付成功',true,1)then
		var.other = '支付成功'
		idfaupdate()
		购买成功 = true
		vpnx()
		return "支付成功"
	else
		return true
	end
end

function tjjbuy()
	local timeline = os.time()
	local outline = 60*10
	local 第一次滑动 = true
	local 第一次滑动次数 = rd(3,10)
	local 购买成功 = false
	
	
	while (os.time()-timeline < outline) do
		local frontApp = frontAppBid()
		if frontApp == var.bid.支付宝 or frontApp == var.bid.淘集集 then
			if d('淘集集_首页')then
				if 购买成功 then
					
				elseif 第一次滑动 then
					for i=1,第一次滑动次数 do
						moveTo(300,900,300,900-400,20)
						第一次滑动 = false
					end
				else
					if d('淘集集_首页_去购买',true,1)then
					else
						moveTo(300,900,300,900-400,20)
					end
				end
			elseif d('淘集集_商品界面')then
				if 购买成功 then
					d('淘集集_后退',true)
				else
					d('淘集集_商品界面',true,1)
				end
			elseif d('淘集集_购物车_提交订单',true,1)then
			elseif d('淘集集_订单列表')then
				click(338,365)
			elseif d('淘集集_我的')then
				d('淘集集_我的_待发货',true,1)
			-------------------------------------------------------支付宝----------------------------
			elseif d('支付宝_立即付款',true,1)then
			elseif d('支付宝_请输入支付密码')then
				phone_input(var.pwd)
				var.other = '准备支付'
				idfaupdate()
				delay(5)
			else
				local tips_res = TIPs()
				if tips_res == '支付成功' then
					return true
				elseif tips_res then
				else
--					d('淘集集_后退',true)
				end
			end
		else
			active(var.bid.淘集集,3)
		end
		delay(1)
	end
end

while (true) do
	if vpn()then
		var.awz_name,var.awz_idfa = getTrueName_awz()
		tjjbuy()
		awz_next()
		delay(1)
	end
	vpnx()
	delay(3)
end































































































































