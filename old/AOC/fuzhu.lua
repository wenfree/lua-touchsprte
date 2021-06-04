

function join()
	计时 = os.time()
	超时 = 60*2
	while (os.time()-计时< 超时) do
		if active(app,10)then
		elseif UI('入盟','入会成功')then
			return true
		elseif UI('在地图中','在地图界面')then	
			UI('入盟','聊天选项',true,2)
			
		elseif UI('返回','返回图标',false,1)then
			if UI('返回','公会')then
				if UI('返回','搜索激活')then
					click(479,208)
					delay(2)
					input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
					input('凛冬将至')
					click(705,204)
					click(733,301)
				elseif UI('返回','搜索',true,2)then
				end
				
				
			else
				UI('返回','返回图标',true,1)
			end
		elseif UI('入盟','改名',false,1)then
			click(791,319)
			input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
			input('三爺')
			click(650,209)
			UI('入盟','改名',true,2)
					
		elseif UI('入盟','加入',true,1)then
		else
			other()
			nLog('other')
		end
		mSleep(1000)
	end
end