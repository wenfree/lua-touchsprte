init("0",0)
function rd(n,m)
	if m>n then
		return math.random(n,m)
	end
end
--qq滑块滑动部分
function moveTo(x1,y1,x2,y2,setp,times)
	setp = setp or 5
	times = times or 50
	touchDown(1, x1, y1)
	mSleep(times)
	for x = x1,x2,2 do
		if x <375 then
			y2 = 2/37.5*x+y1
		else
			y2 = -2/37.5*x+y1
		end
		touchMove(1, x,y2 )
		mSleep(rd(12,17))
	end
	touchUp(1, x2,y2)
end


function rightX()
	keepScreen(true)
	function left_y()
		local one = {
			['top']={110,244},
			['bottom']={110,639},
		}
		for y=one.top[2],one.bottom[2] do
			local a={}
			a.r,a.g,a.b = getColorRGB(one.top[1], y)
--			nLog(y.."--> r="..a.r.." g="..a.g.." b="..a.b)
			local b={}
			b.r,b.g,b.b = getColorRGB(one.top[1], y+2)
			local c={}
			c.r,c.g,c.b = getColorRGB(one.top[1], y+10)

			local alllight = 0
			for k,v in pairs(a)do
				if b[k]-v > 40 then
					alllight = alllight + 1
				end
				if c[k]-v > 40 then
					alllight = alllight + 1
				end
			end
			if alllight >= 6 then
				return y+5
			end
		end
		return 0
	end
	local y = left_y()
	if y > 0 then
		local two ={
			['left']= { 220,y},
			['right']= { 700,y},
		}
		for x = two.left[1],two.right[1] do
			local a={}
			a.r,a.g,a.b = getColorRGB(x,y)
			--			nLog(y.."--> r="..a.r.." g="..a.g.." b="..a.b)
			local b={}
			b.r,b.g,b.b = getColorRGB(x+2,y)
			local c={}
			c.r,c.g,c.b = getColorRGB(x+10,y)

			local alllight = 0
			for k,v in pairs(a)do
				if v - b[k] > 100 then
					alllight = alllight + 1
				end
				if v - c[k] > 100 then
					alllight = alllight + 1
				end
			end
			if alllight >= 6 then
				keepScreen(false)
				return x +49
			end
		end
	end
	keepScreen(false)
	return 0
end

right_x = rightX()
if right_x > 0 then
	moveTo(172,693,right_x,693)
else
	--这里点击 换图
end

















































