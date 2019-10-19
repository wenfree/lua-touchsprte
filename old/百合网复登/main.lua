require("TSLib")
require("tsp")





function get_account()
	local url = 'http://wenfree.cn/api/Public/idfa/'
	local postdata = {};
	postdata.service = 'Idfa.GetNday';
	postdata.name = '婚恋网';
	postdata.rate = '50';
	postdata.day = '7';

	local res = post(url,postdata)
	log(res);
	if res then
		return res
	end
end

--get_account()

--精准滑动的原理就是通过向滑动方向的垂直线方向移动 1 像素来终止滑动惯性
--简单的垂直精准滑动

function  ld(x1,y1,x2,y2)
	touchDown(x1,y1)
	for i = x1, x2, rd(1,5) do
		touchMove(i, y1+rd(-15,15))
		mSleep(rd(10,50))
	 end
	--只要横向滑动 1 像素就可以精准滑动
	--横向滑动 1 像素
	touchMove(x2, y2) 
	mSleep(50)
	touchUp( x2, y2) 
	mSleep(50)
end

--ld(125,  792,  353,  792)



t={}
t['首页_登录界面']={ 0xff5f5e, "-2|-3|0xffffff,-192|8|0xffffff,152|14|0xf64a56,474|11|0xff6273,340|-30|0xfffcfc", 
	90, 17, 70, 735, 188 } --多点找色
t['首页_登录界面_手机号/邮箱']={ 0xffffff, "-60|8|0xc7c7cd,-48|-16|0xc7c7cd,-194|1|0xffffff,-202|0|0xc9c9cf", 
	90, 62, 252, 607, 317 } --多点找色
t['首页_登录界面_请输入密码']={ 0xc7c7cd, "-1|3|0xffffff,-1|5|0xc9c9cf,-1|9|0xffffff,421|1|0xcccccc", 
	90, 51, 359, 710, 437 } --多点找色
t['首页_登录界面_登录按钮']={ 0xfffefe, "8|1|0xff5051,290|47|0xfe2e6d,-303|-42|0xff7230", 
	90, 39, 595, 728, 727 } --多点找色



t['错误_输入验证码']={ 0xfc6e27, "34|-4|0xf9f9f9,36|-4|0xfc712b,430|-14|0x000000", 
 90, 9, 52, 478, 112 } --多点找色


t['弹窗_极验证滑动']={ 0x7e7e7e, "24|-119|0x66d200,79|-5|0x7e7e7e,119|-1|0x7e7e7e,134|1|0xffffff", 
 90, 104, 730, 647, 944 } --多点找色



var={}
var.app = 'com.baihe.online'


function login()
	local 计时 = os.time()
	local 超时 = 60*15
	var.account = get_account();
	
	while ((os.time()-计时<超时 )) do
		if active(var.app,5)then
			if d("首页_登录界面")then
				if d('首页_登录界面_手机号/邮箱',true)then
					input[3](var.account.data.phone)
					delay(1)
				elseif d('首页_登录界面_请输入密码',true)then
					input[1](var.account.data.password)
					delay(1)
				elseif d('首页_登录界面_登录按钮',true,3)then
					
				end
				
				
			elseif d("弹窗_极验证滑动") then
				
				
				ld(125,  792,  370,  792)
				delay(5)
				
			end
		end
		delay(1)
	end
end


--login()

function getRGB(x,y)
	local colorRGB ={}
	colorRGB.r,colorRGB.g,colorRGB.b = getColorRGB(x,y)
	return colorRGB
end

function left()
	keepScreen(true)
	local left_top_x = 140
	local left_top_y = 398
	local left_top_y_max = 644
	local color1 = {}
	local color2 = {}
	for i = left_top_y,left_top_y_max do
		color1 = getRGB(left_top_x,i)
		color2 = getRGB(left_top_x,i+5)
--		log(color1)
--		log(color2)
		local key_true = 0
		for k,v in pairs(color1)do
			if color2[k]- v > 100 then
				key_true = key_true + 1
			end
		end
		
		if key_true >= 2 then
			keepScreen(false) 
			return i+5;
		end
	end
	keepScreen(false) 
end

function right_p(y)
	keepScreen(true)
	local left_top_x = 266
	local left_top_y = y
	local left_top_x_max = 620
	local color1 = {}
	local color2 = {}
	for i = left_top_x,left_top_x_max do
		color1 = getRGB(i,y)
		color2 = getRGB(i+5,y)
--		log(color1)
--		log(color2)
		local key_true = 0
		for k,v in pairs(color1)do
			if v - color2[k] > 80 then
				key_true = key_true + 1
			end
		end
		
		if key_true >= 2 then
			keepScreen(false) 
			return i+1;
		end
	end
	keepScreen(false) 
end




log(
left())

local left_p = left()
if left_p then
	log(right_p(left_p))
	local right_p = right_p(left_p)
	if right_p then
		ld(125,  792,  right_p,  792)
	end
end



























