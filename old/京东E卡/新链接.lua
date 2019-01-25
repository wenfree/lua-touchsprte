require("TSLib")
require("AWZ")
require("tsp")


var={}
var.url = 'https://m.changyoyo.com/partner/index.htm#shareTo?inviteCode=224b0406e0761ddbae80458ea5c116d1'
var.url = 'https://m.changyoyo.com/mall/?spm=3.1.3.0.0.066471544577301798.02000000.02000000#/goodsDetail?productId=JFJD1-S1000193'
var.bid={}
var.bid.safari = 'com.apple.mobilesafari'
var.bid.alipay = 'com.alipay.iphoneclient'
var.todo = false

var.account={}
var.account.login=''
var.account.pwd = ''
var.name = '京东E卡'
var.alipay = '520000'

local phonenamelist = {}
phonenamelist['百合网']='123124'
phonenamelist['iPhone41']='123124'
phonenamelist['iPhone42']='123124'
phonenamelist['iPhone43']='123124'
phonenamelist['iPhone44']='520000'
phonenamelist['iPhone45']='520000'
phonenamelist['iPhone52']='520000'
phonenamelist['iPhone53']='051268'
phonenamelist['iPhone54']='024290'
phonenamelist['iPhone55']='024290'

if phonenamelist[getDeviceName(str)] then
	var.alipay = phonenamelist[getDeviceName(str)]
end

--取号
function getEcard()
	local url = 'http://idfa888.com/Public/idfa/?service=Jfkj.getjfkj'
	local date = get(url)
	return date.data
end
--回传
function backEcard()
	local url = 'http://idfa888.com/Public/idfa/?service=Jfkj.backjfkj&id='..var.account.id
	local date = get(url)
end
--上传帐号
function idfa888()
	local url = "http://idfa888.com/Public/idfa/?service=idfa.idfa"
	local tb={}
	tb.name = var.name or '京东E卡'
	tb.idfa = var.idfa or string
	tb.ip = var.ip
	tb.phonename = var.phonename or getDeviceName()
	tb.other = var.other
	tb.password = var.account.pwd
	tb.phone = var.account.login
	tb.account = var.account.login or var.awz_name
	return post(url,tb)
end


--初始化帐号体系
if fileExists() then
	log('true')
else
	writeFile({},'w')
	delay(2)
end

function readLocalAccount()
	local res = readFile()
	local tb = {}
	if #res >= 2 then
		for i,v in ipairs(res) do
			local vlist = split(v,":")
			tb[vlist[1]] = vlist[2]
		end
		log(tb)
		return tb
	end
end

function initdata()
	if readLocalAccount()then
		local localaccount = readLocalAccount()
		var.account.login = localaccount['phone']
		var.account.pwd = localaccount['password']
		var.account.id = localaccount['id']
		log('本地数据')
		return true
	else
		local serviceData = getEcard()
		log(serviceData)
		if not(serviceData['phone'])then
			initdata()
		else
			var.account.login = serviceData['phone']
			var.account.pwd = serviceData['password']
			var.account.id = serviceData['id']
			writeFile(serviceData)
			log('网络数据')
			return true
		end
	end
end

local phonekeyArr = {
	{113,764,0x000000},
	{319,762,0x000000},
	{531,761,0x9f9f9f},
	{124,867,0xffffff},
	{320,856,0xffffff},
	{532,864,0xffffff},
	{109,969,0x000000},
	{317,962,0x000000},
	{530,966,0x000000},
	[0]={319,1081,0xffffff},  --多点取色
}
--密码输入的部分
function phoneKey(str)
	for i =1,string.len(str) do
		local phone_mun = tonumber(string.sub(str,i,i))
		click(phonekeyArr[phone_mun][1],phonekeyArr[phone_mun][2],0.3)
	end
end

t={}
t['正在加载']={ 0x007aff, "0|1|0x007aff", 80, 19, 95, 629, 135 } --多点找色
t['立即开通']={ 0xdfc18f, "-223|-46|0xee7259,-287|27|0xde4f32", 90, 14, 890, 532, 1040 } --多点找色
t['注册界面']={ 0xffedb2, "-346|-662|0x666666,185|-671|0xffffff,186|-674|0x666666", 90, 10, 136, 616, 990 } --多点找色
	t['注册界面_手机号']={ 0xbcbcbc, "41|-8|0xbfbfbf,-30|5|0xbdbdbd", 90, 35, 386, 120, 510 } --多点找色
	t['注册界面_密码']={ 0xbcbcbc, "18|-9|0xbcbcbc,-28|12|0xbcbcbc", 90, 34, 520, 95, 678 } --多点找色
	
t['会员专属权益界面']={ 0xb87e3c, "0|-3|0xe0b677,0|-5|0xb87e3c,0|-17|0xffffff,-35|-285|0x000000", 90, 5, 119, 258, 469 } --多点找色
	t['会员专属权益界面_查看']={ 0x2d2d2d, "0|12|0xe6b886,0|-14|0xe6b886", 90, 380, 310, 425, 364 } --多点找色
	
t['我的票券界面']={ 0x000000, "18|0|0xffffff,18|-8|0x000000,303|-9|0x000000,300|-9|0xffffff,297|-9|0x121212", 90, 17, 80, 379, 222 } --多点找色	
	t['我的票券界面_立即使用30$']={ 0xffffff, "0|-14|0xd7b667,16|22|0xd7b667,-389|-50|0xef473c,-381|-54|0xffffff,-399|-29|0xef473c", 90, 35, 285, 598, 1000 } --多点找色
	
t['立即购买界面_立即购买']={ 0xd3b669, "-285|-3|0xd3b669,-80|-37|0xd3b669,-83|21|0xd3b669,-315|-859|0xfffffe", 90, 12, 133, 626, 1094 } --多点找色	
t['确认下单界面']={ 0xe3be5e, "-43|4|0x000000,-34|-36|0xe6c162,132|15|0xd9af48,160|-800|0xffffff", 90, 9, 102, 626, 1024 } --多点找色
t['收银台界面']={ 0xd3b669, "-476|-714|0xfffbf2,-470|-728|0xe4d19f,-486|-756|0x2e384a", 90, 8, 150, 632, 1118 } --多点找色
	t['收银台界面_积分付款']={ 0xffffff, "0|20|0xd5b96d,-32|-54|0xd8be79,32|-50|0xd8be79", 90, 158, 402, 630, 734 } --多点找色
	t['收银台界面_支付宝支付']={ 0xffffff, "-513|-10|0x00a0e9,-487|22|0x00a0e9,-528|24|0x00a0e9,-518|-1|0xffffff", 90, 16, 166, 614, 1120 } --多点找色
	
t['输入的完成']={ 0x007aff, "-22|-9|0x007aff", 90, 556, 503, 631, 766 } --多点找色
t['在支付宝中打开->链接']={ 0x007aff, "-169|3|0x007aff,-81|3|0xffffff,-160|-460|0x00668f", 90, 216, 152, 572, 664 } --多点找色

t['支付成功收银台']={ 0xffffff, "116|-164|0xd3b669,170|-282|0x000000,-147|-284|0x666666", 90, 4, 115, 608, 541 } --返回首页
t['查看券码']={ 0xdfb856, "-2|-3|0x2c2411,65|1|0xdfb856,-475|-141|0xec5c15", 90, 5, 254, 628, 692 } --多点找色
t['<卡包券页面']={ 0x666666, "10|0|0xffffff,323|-8|0xffffff,325|-11|0x000000", 90, 6, 54, 382, 210 } --多点找色
	t['<卡包券页面_']={ 0xd3b669, "78|0|0xd3b669,36|-9|0xffffff", 90, 72, 221, 608, 288 } --必须
	t['<卡包券页面_电子券']={ 0x999999, "-315|32|0xd3b669,-291|4|0xd5ba70", 90, 18, 153, 597, 307 } --多点找色
	t['<卡包券页面_京东e卡_一键复制']={ 0x000000, "6|32|0xc0c0c0,5|-33|0xc0c0c0,1|-323|0xc71325,1|-411|0xc81425", 90, 246, 330, 387, 793 } --多点找色
	t['<卡包券页面_京东e卡']={ 0xc91425, "-18|-35|0xc81325,-14|36|0xc81426,229|2|0xffffff", 90, 38, 312, 589, 888 } --多点找色
t['卡券详情界面']={ 0xffffff, "230|-4|0xffffff,215|-4|0x222730,293|111|0xc81623,280|70|0xc81425", 90, 10, 147, 631, 467 } --多点找色
	t['卡券详情界面_一键复制券码']={ 0x333333, "-5|35|0xcccccc,-5|-30|0xcccccc", 90, 311, 486, 369, 809 } --多点找色

t['支付宝_确认付款界面']={ 0x108ae3, "-363|-689|0x949595,-167|-701|0x108ae3,-171|-700|0xf7f7f8", 90, 10, 108, 618, 1126 } --多点找色
t['支付宝_请输入付款密码'] = { 0x010102, "-300|4|0xf7f7f8,-83|241|0x5eb0ea,34|252|0x108ae3", 90, 24, 344, 517, 667 } --多点找色


function update(text)
	delay(1)
	var.idfa = readPasteboard()
	delay(1)
	snapAndSave()
	var.other = text
	writeFile({},"w")
	idfa888()
	backEcard()
end

function buyJDEcard(urlKey)
	local urlKey = urlKey or false
	if urlKey then
		openURL(var.url)
	end
	delay(3)
	initdata()
		while (true) do
			local frontAppBids = frontAppBid()
			if frontAppBids == var.bid.safari then
				if d('正在加载')then
				elseif d('立即开通',true)then
				elseif d('注册界面')then
					if d('注册界面_手机号',true)then
						input(var.account.login)
					elseif d('注册界面_密码',true)then
						input(var.account.pwd)
					else
						d('注册界面',true)
					end
				elseif d('会员专属权益界面')then
					d('会员专属权益界面_查看',true)
				elseif d('立即购买界面_立即购买',true)then
				elseif d('卡券详情界面')then
					if d('卡券详情界面_一键复制券码',true)then
						update('支付82￥')
						return true
					end
				elseif d('<卡包券页面') and d('<卡包券页面_')then
					if d('<卡包券页面_电子券',true)then
					elseif d('<卡包券页面_京东e卡_一键复制',true)then
						update('支付82￥')
						return true
					elseif d('<卡包券页面_京东e卡',true)then
					end
				elseif d('确认下单界面',true)then
				elseif d('支付成功收银台',true)then
				elseif d('查看券码',true)then
				elseif d('收银台界面')then
					if d('收银台界面_积分付款')then
						moveTo(x,y,10,y,5)
						delay(1)
					elseif d('收银台界面_支付宝支付',true)then
					elseif d('收银台界面',true)then
						delay(2)
					end
				
				elseif d('我的票券界面')then
					moveTo(300,922,300,433,20)
					delay(2)
					if d('我的票券界面_立即使用30$',true)then
						delay(2)
					end
				else
					if d('输入的完成',true)then
					elseif d('在支付宝中打开->链接',true)then
					else
						log('safari-other')
					end
				end
			elseif frontAppBids == var.bid.alipay then
				if d('支付宝_确认付款界面',true)then
				elseif d('支付宝_请输入付款密码')then
					delay(1)
					phoneKey(var.alipay)
					delay(rd(8,10))
					active(var.bid.safari,3)
				end
			end
			delay(1)
		end
end


inputword('4D3964B1AB1340EB9D1BD5713CAAA85C9741149D')
lua_exit()

vpnx()
while (true) do
	if vpn()then
		if false or awzNew(safaribid)then
			buyJDEcard(true)
		end
	end
	vpnx()
end





