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
	if(d("tip_右下角的x"))then
		log("右下角的x-->准备移动建造建筑")
		moveTo(336,1235,378,668,2)
		delay(2)
		find_arrow()
	elseif d('tip_实名确定',true)then
	elseif find_arrow() then
	else
		click(20,20)
		return true
	end
end



if d("守望_主界面")then
	if d('守望_主界面_感叹号',true)then
		
	end
	
else
	tips()
end


