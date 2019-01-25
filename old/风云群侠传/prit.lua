require("tsp")
















for i=1,100 do
	local where ={
		string.format("延芳路4038号 %s%s小区%d%d栋%d0%d%d号",	myRand(7,1),myRand(7,1),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("罗沙路4099号 %s%s小区%d%d栋%d0%d%d室",	myRand(7,1),myRand(7,1),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("延芳路600号 %s%s小区%d%d栋%d0%d%d室",	myRand(7,1),myRand(7,1),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("延芳路588号 %s%s%s小区%d%d栋%d0%d%d号",	myRand(7,1),myRand(7,1),myRand(7,1),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("罗湖广岭小区 %d%d栋%d0%d%d号",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("罗沙路 新世界四季御园 %d%d%d栋%d0%d%d号",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("大澎花园 %d%d栋%d%d0%d室",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("中震大厦 %s%s阁%d%d0%d室",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("通发花园 %d%d栋%d0%d%d号",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("罗芳苑 %d%d栋%d%d0%d室",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("银丰花园 %d%d栋%d0%d%d号",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("龙泉花园 %d%d栋%d0%d%d号",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("芳春花园 %d%d栋%d0%d%d号",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("深港新村 %d%d栋%d0%d%d号",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("锦绣新村 %d%d栋%d0%d%d号",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("兴华苑 %d%d栋%d%d0%d室",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("华兴花园 %d%d栋%d%d0%d室",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("赤龙新村 %d%d栋%d0%d%d号",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("经二路1号 %s%s小区%d%d栋%d0%d",	myRand(7,1),myRand(7,1),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("经二路3号 %s%s%s小区%d%d栋%d0%d",	myRand(7,1),myRand(7,1),myRand(7,1),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("罗芳路190号 %s%s%s小区%d%d栋%d0%d",	myRand(7,1),myRand(7,1),myRand(7,1),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("经二路19号名太轩 %d%d栋%d%d0%d室",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("广陵家园 %d%d栋%d%d0%d室",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("罗湖党校 %d%d栋%d0%d",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("西岭花园 %d%d栋%d0%d",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
		string.format("安业花园 %d%d栋%d0%d",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
	}
	log(where[rd(1,#where)])
	delay(0.02)
end
















