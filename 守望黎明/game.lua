require("ui")
require("tsp")



--找箭头合集
function find_arrow()
	if(d("tip_向下箭头",true,1))then
		click(x,y+50);
		return true
	end
end
--弹窗合集
function tips()
	if(d("章节_领取",true))then
	elseif(d("章节_前往",true))then
		click(374,652,2)
	elseif(d("tip_派遣"))then
		click(622,700)
	elseif(d("tip_提示确定",true))then
	elseif(d("tip_右下角的x_3金币"))then
		log("右下角的x-->tip_右下角的x_3金币")
		local water = {{124,1268,0x583f19},{332,1274,0x3e3a37},{546,1271,0x3a3734},} 
		localwater_mun = localwater_mun or 2
		localwater_mun = localwater_mun + 1

		click(water[localwater_mun%3+1][1],water[localwater_mun%3+1][2],2)
		if d('tip_右下角的x_3金币_需求',true)then
			d('tip_右下角的x_3金币_需求',true)
		else
			moveTo(water[localwater_mun%3+1][1],water[localwater_mun%3+1][2],368,300,5)
			delay(2)
			if d('建筑确定',true)then
				delay(2)
				d('建筑确定_公路',true)
			elseif d('建筑取消',true)then
			end
		end
	elseif(d("tip_右下角的x"))then
		log("右下角的x-->准备移动建造建筑")
		moveTo(336,1235,378,668,2)
		delay(2)
		find_arrow()
	elseif d('tip_实名确定',true)then
	elseif d('tip_礼包x',true)then
	elseif d('错误_取消GameCenter',true)then
	elseif find_arrow() then
	else
		click(20,20)
		log('tips~')
		return true
	end
end




function  game()
	if d("守望_主界面")then
		if d('守望_主界面_野外')then
			d('守望_主界面_野外',true)
			
		elseif d('守望_主界面_城里')then
			if d('守望_主界面_感叹号',true)then
			elseif d('守望_主界面_感叹号2',true)then
			else
				click(46,1189)
			end
		elseif d('守望_主界面_返回')then
			d('守望_主界面_返回_建造',true)
		end
		
	else
		tips()
	end
end


while (true) do
	game()
	delay(1)
end



