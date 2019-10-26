require("ui")
require("tsp")
require("AWZ")


t['tip_向上箭头']={0xfffce7, "-50|51|0xf6d188,53|53|0xfad992,-1|27|0xfceec3,1|81|0xecc348",90,5,3,745,1294} --多点找色

--找箭头合集
function find_arrow()
	if(d("tip_向下箭头",true,1))then
		click(x,y+50);
		return true	
	elseif(d("tip_向上箭头",true,1))then
		click(x,y-50);
		return true
	end
end




t['tip_同意条款']={0x6f4e17, "288|0|0x721e17,430|-672|0xe2c9a2,-170|-660|0xe3caa2,-168|-660|0x302416",90,32,185,714,1028} --多点找色
t['tip_指引建筑']={0x4f3a26, "291|-98|0x634b33,255|-186|0x776142,-423|-144|0x4f3b28,-422|-144|0x765d3f",90,11,80,746,343} --多点找色
t['tip_指引建筑_确定']={0x446d27, "-3|-2|0xfcfcf7,-3|-4|0x346412",90,380,730,574,826} --多点找色
t['tip_指引建筑_取消']={0x6b1d1d, "-17|-33|0xd45b60,36|35|0xd07c84,-17|-4|0xfaf8f8,-64|1|0x611a1a",90,105,404,650,1080} --多点找色
t['tip_运输_资源运输']={0x60afe1, "-177|-27|0xfff100,-206|3|0xfff70b,-200|-12|0xf89617",90,313,482,705,797} --多点找色

--弹窗合集
function tips()
	if(d("章节_领取",true))then
	elseif(d("章节_前往",true))then
		click(374,652,2)
	elseif(d("tip_派遣"))then
		click(622,700)	
	elseif(d("tip_派遣2"))then
		click(622,700)
	elseif(d("tip_提示确定",true))then
	elseif(d("tip_同意条款",true))then
	elseif(d("tip_工程车选择弹窗")  or d('tip_工程车选择弹窗2'))then
		d('tip_工程车选择弹窗_派遣',true)
	elseif(d("tip_运输_资源运输",false))then
		click(519,757)
		click(515,851)
		click(375,947)
	elseif(d("tip_人口前往",true,1,3))then
	elseif(d("tip_右下角的x_3金币"))then
		log("右下角的x-->tip_右下角的x_3金币")
		movejz_lun = movejz_lun or 0
		movejz_lun = movejz_lun + 1
		if movejz_lun%2 == 0 then
			local water = {{124,1268,0x583f19},{332,1274,0x3e3a37},{546,1271,0x3a3734},} 
			localwater_mun = localwater_mun or 2
			localwater_mun = localwater_mun + 1

			if d('tip_右下角的x_3金币_需求',true)then
			else
				moveTo(water[localwater_mun%3+1][1],water[localwater_mun%3+1][2],368,300,5)
				delay(2)
				if d('建筑确定',true)then
					delay(2)
					d('建筑确定_公路',true)
				elseif d('建筑取消',true)then
				else
					click(water[localwater_mun%3+1][1],water[localwater_mun%3+1][2],2)
				end
			end
		else
			log("右下角的x-->准备移动建造建筑")
			moveTo(336,1235,378,668,2)
			delay(2)
			d('tip_指引建筑_确定',true)
			find_arrow()
			d('tip_指引建筑_取消',true)
		end

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







app_ = {}
app_.bid = 'com.more.dayzsurvival.ios'
require("game_ui")

function ocr(x1,y1,x2,y2)
	local ress = ocrText(x1,y1,x2,y2, 10) or 0
	if ress == '' then
		nLog('nil')
		return 0
	end
	return ress
end


function Move_to_city()
	local time_line = os.time()
	local out_time = 60*3
	

	
	local done_ = false
	
	if UI_v.service_key == '1' then
		while (os.time()-time_line < out_time) do
			if active(app_.bid,10)then
				if d("守望_主界面")then
					if d('守望_主界面_野外')then
						if done_ then
							click(rd(190,543),rd(454,748))
							if(d('守望_主界面_野外_迁城',true))then
							else
							end
						elseif d('世界地图_位置',true)then
							
						end
					elseif d('守望_主界面_城里',true)then
					end
				elseif d('世界地图_国家全部')then
					local world_mun = ocr(t['国家编号'][1][1],t['国家编号'][1][2],t['国家编号'][2][1],t['国家编号'][2][2])
					log(world_mun)
					if world_mun then
						if done_ and world_mun == UI_v.service then
							log("转服成功",'all')
							return true
						else
							d('世界地图_国家全部',true,1,3)
						end
					end
				elseif d('tip_请输入区编号')then
					click(368,655)
					input[1](UI_v.service)
					d('tip_请输入区编号',true)
					if d('tip_请输入区编号',true,1,3)then
						done_ = true
						click(380,716)
					end
				elseif d('tip_作为征服者加入',true)then
				end
			end
			delay(2)
		end
	else
		log("转服未开启")
	end
end

t['守望_主界面_城里_挂勾']={0xa0302e, "0|17|0xaa2f2f,0|20|0xf48988,20|-16|0x81362c",90,3,1029,333,1152} --多点找色
t['守望_主界面_城里_挂勾_激活']={0xfc8a04, "8|-6|0xeb820b,30|-5|0xdcdcdc,-20|13|0xcacaca,6|30|0x364653",90,274,542,478,773} --多点找色
t['守望_主界面_城里_粮食']={0xfffffd, "5|12|0xfffffd,8|16|0xb94140,5|29|0xf18889,-25|7|0x982f31,12|-22|0xfffffd",90,6,1047,87,1139} --多点找色
t['守望_主界面_城里_粮食_运输']={0x040202, "-8|-6|0xe80202,9|-5|0xea0202,15|8|0x0c0202,9|8|0xd70202",90,151,510,580,940} --多点找色
t['守望_主界面_城里_升级']={0xe4b266, "0|-17|0xe6c363,-20|3|0xa1895b,14|3|0xdda669",90,139,551,639,989} --多点找色


t['tip_任务弹窗']={0xccaf92, "34|-2|0xb08d63,-650|-13|0x3c2e1d,-653|-13|0x000000,-652|-13|0xd0ba95,-644|-33|0xe6cca5",90,24,169,735,330} --多点找色
t['tip_任务弹窗_领取']={0x3b5536, "44|-9|0xffffff,48|23|0xb4de9b",90,557,492,700,1100} --多点找色
t['tip_任务弹窗_前往']={0xa07833, "-4|-4|0xe9ded7,-6|-4|0x7d3f12",90,557,492,700,1100} --多点找色
t['tip_任务弹窗_全部领取']={0x876320, "-2|4|0xf5f1ec,1|8|0x9b742d",90,539,987,704,1043} --多点找色

t['tip_工程车选择弹窗']={0xceb296, "-321|-1|0x040402,-323|17|0xffc86f,-318|16|0xffc971,-663|-13|0xaa9474,-665|12|0x13100d,-658|-34|0xccb592",90,15,201,730,1055} --多点找色
t['tip_工程车选择弹窗2']={0xffd68a, "0|1|0x0c0a06,-7|12|0xffc86f,-347|4|0xb19a77,-341|-39|0xcbb592",90,17,133,739,1039} --多点找色
t['tip_工程车选择弹窗_派遣']={0x795922, "-12|-1|0xf7f4f2,2|30|0xf3e2b3",90,513,563,722,850} --多点找色


t['返回_跳转']={0x7e502f, "69|19|0xa07838,-59|-14|0x7d5826",90,525,795,743,1210} --多点找色
t['返回_升级']={0xffffff, "2|4|0x794e25,5|10|0x82632b",90,376,1228,716,1327} --多点找色

function  game()
	local time_line = os.time()
	local out_time = 60*10
	
	while (os.time()-time_line < out_time) do
		if active(app_.bid,5)then
			if d("守望_主界面")then
				if d('守望_主界面_野外')then
					d('守望_主界面_野外',true)
					
				elseif d('守望_主界面_城里')then
					
					if d('守望_主界面_城里_挂勾',true,1,2)then
						if d('守望_主界面_城里_挂勾_激活',true)then
						else
							click(373,664,2)
						end					
					elseif d('守望_主界面_城里_粮食',true,1,2)then
						click(373,664,2)
						if d('守望_主界面_城里_粮食_运输',true)then
						else
							click(373,664,2)
						end
					elseif d('守望_主界面_城里_运输',true,1,2)then
					elseif d('守望_主界面_感叹号',true)then
					elseif d('守望_主界面_感叹号2',true)then
					else
						home_click = home_click or 0
						home_click = home_click + 1
						if home_click%2 == 0 then
							click(46,1189)
						else
							click(372,679)
						end
					end
				else
					click(372,679)
				end
			elseif d('守望_主界面_返回')then
				if d('守望_主界面_返回_建造',true)then
				elseif d('返回_升级',true)then
				elseif d('返回_跳转',true,1,3)then
					click(377,715,2)
					click(377,715,2)
					up_lun__ = up_lun__ or 0
					up_lun__ = up_lun__ + 1
					if up_lun__%2 == 0 then
						d('守望_主界面_城里_升级',true)
					end
				end
			elseif d('tip_任务弹窗')then
				if d('tip_任务弹窗_领取',true)then
				elseif d('tip_任务弹窗_全部领取',true)then
				elseif d('tip_任务弹窗_前往',true)then
					click(374,652,2)
					up_lun_ = up_lun_ or 0
					up_lun_ = up_lun_ + 1
					if up_lun_%2 == 0 then
						d('守望_主界面_城里_升级',true)
					end
				end
			else
				tips()
			end
		end
		delay(0.5)
	end
end

function all()

	game()
	awz_next()
	delay(2)
	
end

while (true) do
	local ret,errMessage = pcall(all)
	if ret then
	else
		log(errMessage)
		dialog(errMessage, 10)
		mSleep(2000)
	end
end
























