



--打印日志
function showLog(txt)
	adbox = adbox or 0
	if adbox == 0 then
		adbox = 1
		--创建文本视图
		fwShowWnd("window1",95,8,270,34,1);
		mSleep(500)
	end
	fwShowTextView("window1","text1",txt,"center","FF0000","FFDAB9",10,0,0,0,170,26,0.8);
	--fwShowTextView("window1","text1","文本视图","center","FF0000","FFDAB9",10,0,0,0,200,30,0.5);
end


-- init(1)
-- showLog('万国觉醒')
-- mSleep(50000)


