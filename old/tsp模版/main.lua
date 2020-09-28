




--精准滑动的原理就是通过向滑动方向的垂直线方向移动 1 像素来终止滑动惯性
--简单的垂直精准滑动

function  ld(x1,y1,x2,y2)
	
--	touchDown(  x1, y1)
--	for i = x1, x2, math.random(5,10) do
--		touchMove(  i+math.random(-5,5), y1+math.random(-50,50))
--		mSleep(math.random(20,50))
--	end
--	touchMove(  x2, y2) 
--	mSleep(50)
--	touchUp( x2, y2) 
--	mSleep(50)
	
	
	touchDown(x1,y1)
	for i = 0, 500, 50 do
		touchMove(200, 1000-i)
		mSleep(10)
	end
	--只要横向滑动 1 像素就可以精准滑动
	--横向滑动 1 像素
	touchMove(x2, y2) 
	mSleep(50)
	touchUp( x2, y2) 
	mSleep(50)
	
end

ld(125,  792,  443,  792)




























