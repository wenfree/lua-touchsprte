function moveTo(x1,y1,x2,y2,setp,times)
	setp = setp or 5
	times = times or 50
	touchDown(1, x1, y1)
	mSleep(times)
	if x1==x2 then
		if y2 > y1 then
			for x = y1,y2,setp do
				touchMove(1, x1, x)
				mSleep(times)
			end
		elseif y2 < y1 then
			for x = y1,y2,setp*(-1)do
				touchMove(1, x1, x)
				mSleep(times)
			end
		end
	elseif y1==y2 then
		if x2>x1 then
			for x = x1,x2,setp do
				touchMove(1, x, y1)
				mSleep(times)
			end
		elseif x2<x1 then
			for x = x1,x2,setp*(-1)do
				touchMove(1, x, y1)
				mSleep(times)
			end
		end
	else
		local k = ((y2-y1)/(x2-x1))
		if x1 < x2 then
			touchDown(1, x1,y1)
			for x = x1+1, x2, setp do
				touchMove(1, x, (k*(x-x1))+y1 )
				mSleep(times)
			end
		else
			touchDown(1, x1,y1)
			for x = x1+1, x2, setp*(-1)do
				touchMove(1, x, (k*(x-x1))+y1 )
				mSleep(times)
			end
		end
	end
	touchUp(1, x2,y2)
end

init('0',1)
moveTo(180,560,180,(560-85),2)