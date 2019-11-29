require("ui")
require("tsp")
require("AWZ")


t['tip_向上箭头']={0xfffce7, "-50|51|0xf6d188,53|53|0xfad992,-1|27|0xfceec3,1|81|0xecc348",90,5,3,745,1294} --多点找色
t['tip_右下箭头']={0xfffffd, "-72|-5|0xeece80,-28|-27|0xf3d58c,-18|-20|0xfbeec7,-3|-75|0xe5c07e",90,14,15,742,1325} --多点找色

--找箭头合集
function find_arrow()
	if(d("tip_向下箭头",true,1))then
		click(x,y+50);
		return true	
	elseif(d("tip_向上箭头",true,1))then
		click(x,y-50);
		return true
	elseif d('tip_右下箭头',true)then
		click(x+50,y+50)
		return true
	end
end



t['tip_同意条款']={0x6f4e17, "288|0|0x721e17,430|-672|0xe2c9a2,-170|-660|0xe3caa2,-168|-660|0x302416",90,32,185,714,1028} --多点找色
t['tip_指引建筑']={0x4f3a26, "291|-98|0x634b33,255|-186|0x776142,-423|-144|0x4f3b28,-422|-144|0x765d3f",90,11,80,746,343} --多点找色
t['tip_指引建筑_确定']={0x446d27, "-3|-2|0xfcfcf7,-3|-4|0x346412",90,380,730,574,826} --多点找色
t['tip_指引建筑_取消']={0x6b1d1d, "-17|-33|0xd45b60,36|35|0xd07c84,-17|-4|0xfaf8f8,-64|1|0x611a1a",90,105,404,650,1080} --多点找色
t['tip_运输_资源运输']={0x60afe1, "-177|-27|0xfff100,-206|3|0xfff70b,-200|-12|0xf89617",90,313,482,705,797} --多点找色

t['tip_士兵前往']={0x947339, "-91|-50|0xac8351,72|19|0xe3ca78,-5|-15|0xeeeae3",90,13,397,736,883} --多点找色

t['tip_工程车选择3']={0x080604, "0|-8|0xeace92,-318|-10|0xa89373,379|-12|0x090704",90,11,520,740,653} --多点找色
t['tip_工程车选择4']={0x080604, "0|-6|0xeace92,-319|-6|0x8f7f66,376|-8|0x776144",90,11,520,740,653} --多点找色

t['tip_右下角的x_建筑']={0xcdb195, "33|-10|0xbd996d,32|-15|0x69563f,33|-1|0xad8a61,-36|5|0x836847",90,657,1217,747,1310} --多点找色
	t['tip_右下角的x_确定']={0x36631f, "-3|-1|0xfafbf9,-18|5|0x295c0c,-211|1|0x6c1f1e,-123|4|0x2d1918",90,9,18,734,1193} --多点找色

t['tip_任务指导_新']={0xc4ac8c, "15|-16|0xa38b6e,-9|-31|0x6e6152,28|6|0x706356,30|9|0x060b14",90,652,176,743,273} --多点找色
	t['tip_任务指导_新_任务']={0xe5ae64, "1|-34|0xe5ae64",90,63,473,140,1022} --多点找色
	t['tip_任务指导_新_领取全部']={0x7a5b22, "-134|-32|0x593816,87|31|0xd5b668",90,144,1033,589,1192} --多点找色
t['tip_右下角的x_建筑_可造']={0xb39661, "-100|-23|0xead28e,99|-23|0xf8db92",90,4,1257,730,1331} --多点找色

t['tip_任务弹窗2']={0xcbaf93, "-654|-15|0x000000,-653|-15|0xcfb995,10|-33|0xdebc8a,10|-34|0x12110f",90,11,81,738,410} --多点找色


t['守望_主界面_城里_生产士兵']={0x46f121, "-10|-2|0x2c6309,-29|13|0x2c351d,-14|27|0x49532f",90,216,666,595,911} --多点找色

--弹窗合集
function tips()
	if(d("章节_领取",true))then
	elseif(d("章节_前往",true))then
		click(374,652,2)
	elseif(d("tip_士兵前往",true))then
		delay(1)
		click(373,664,2)
		d('守望_主界面_城里_生产士兵',true)
	elseif(d("tip_派遣"))then
		click(622,700)	
	elseif(d("tip_派遣2"))then
		click(622,700)
	elseif(d("tip_提示确定",true))then
	elseif(d("tip_同意条款",true))then
	elseif d("tip_工程车选择弹窗")  or d('tip_工程车选择弹窗2') or d('tip_工程车选择3') or d('tip_工程车选择4')then
		d('tip_工程车选择弹窗_派遣',true)
	elseif(d("tip_运输_资源运输",false))then
		click(519,757)
		click(515,851)
		click(375,947)
	elseif(d("tip_人口前往",true,1,3))then
	elseif(d("tip_右下角的x_3金币") or d('tip_右下角的x_建筑'))then
		log("右下角的x-->tip_右下角的x_3金币")
		movejz_lun = movejz_lun or 0
		movejz_lun = movejz_lun + 1
		if d('tip_右下角的x_确定',true)then
		elseif d('tip_右下角的x_建筑_可造',false) or movejz_lun%2 == 0 then
			local water = {{124,1268,0x583f19},{332,1274,0x3e3a37},{546,1271,0x3a3734},} 

			if d('tip_右下角的x_3金币_需求',true)then
			else
				d('tip_右下角的x_建筑_可造',true)
				
				moveTo(x,y-50,368,300,5)
				delay(2)
				if d('建筑确定',true)then
					delay(2)
					d('建筑确定_公路',true)
				elseif d('建筑取消',true)then
				else
					click(40,80,2)
				end
			end
		else
			log("右下角的x-->准备移动建造建筑")
			moveTo(336,1235,378,668,2)
			delay(2)
			if d('tip_指引建筑_确定',true)then
			else
				click(rd(161,400),rd(490,800))
			end
			find_arrow()
			d('tip_指引建筑_取消',true)
		end
	elseif d('tip_实名确定',true)then
	elseif d('tip_礼包x',true)then
	elseif d('错误_取消GameCenter',true)then
	elseif find_arrow() then
	else
		tips___ = tips___ or 0
		tips___ = tips___ + 1
		if tips___ %2 == 0 then
			log('40-80')
			click(40,80)
		else
			log('屏幕中间')
			click(G.w/2,G.h/2)
		end
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
					else
						click(G.w/2,G.h/2)
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

t['守望_主界面_城里_挂勾']={0xfbfbfb, "-3|4|0x672922,5|-5|0x6a3628,-7|21|0xe0c7c9,-11|20|0xa63336,17|6|0x85322b",90,5,1053,87,1137} --多点找色
t['守望_主界面_城里_挂勾_激活']={0xfc8a04, "8|-6|0xeb820b,30|-5|0xdcdcdc,-20|13|0xcacaca,6|30|0x364653",90,274,542,478,773} --多点找色
t['守望_主界面_城里_挂勾_激活2']={0xd77d0a, "-8|9|0xfa890b,10|7|0xd81704,-24|19|0xcdcdcd,1|39|0x364753",90,243,370,490,846} --多点找色
t['守望_主界面_城里_粮食']={0xfffffd, "5|12|0xfffffd,8|16|0xb94140,5|29|0xf18889,-25|7|0x982f31,12|-22|0xfffffd",90,6,1047,87,1139} --多点找色
t['守望_主界面_城里_粮食_运输']={0xed0202, "40|27|0xe60202,16|7|0x030202,4|-30|0xf30101,-23|22|0xe50202,-1|11|0x040202",90,119,463,612,1003} --多点找色
t['守望_主界面_城里_升级']={0xe4b266, "0|-17|0xe6c363,-20|3|0xa1895b,14|3|0xdda669",90,139,551,639,989} --多点找色
t['守望_主界面_城里_公路']={0x9f3f2f, "-19|1|0xe8d63f,19|1|0xe9d84a,-5|-22|0xfffffd",90,2,1054,387,1137} --多点找色
t['守望_主界面_城里_士兵']={0x66913c, "13|7|0xfffffd,-2|-23|0xfffffd,3|21|0xa8f98a",90,4,1056,357,1142} --多点找色

t['tip_任务弹窗']={0xccaf92, "34|-2|0xb08d63,-650|-13|0x3c2e1d,-653|-13|0x000000,-652|-13|0xd0ba95,-644|-33|0xe6cca5",90,24,169,735,330} --多点找色
t['tip_任务弹窗_领取']={0x3b5536, "44|-9|0xffffff,48|23|0xb4de9b",90,557,492,700,1100} --多点找色
t['tip_任务弹窗_前往']={0xa07833, "-4|-4|0xe9ded7,-6|-4|0x7d3f12",90,557,492,700,1100} --多点找色
t['tip_任务弹窗_全部领取']={0x876320, "-2|4|0xf5f1ec,1|8|0x9b742d",90,539,987,704,1043} --多点找色

t['tip_工程车选择弹窗']={0xceb296, "-321|-1|0x040402,-323|17|0xffc86f,-318|16|0xffc971,-663|-13|0xaa9474,-665|12|0x13100d,-658|-34|0xccb592",90,15,201,730,1055} --多点找色
t['tip_工程车选择弹窗2']={0xffd68a, "0|1|0x0c0a06,-7|12|0xffc86f,-347|4|0xb19a77,-341|-39|0xcbb592",90,17,133,739,1039} --多点找色
t['tip_工程车选择弹窗_派遣']={0x795922, "-12|-1|0xf7f4f2,2|30|0xf3e2b3",90,513,563,722,850} --多点找色


t['返回_跳转']={0x7e502f, "69|19|0xa07838,-59|-14|0x7d5826",90,525,795,743,1210} --多点找色
t['返回_升级']={0xffffff, "2|4|0x794e25,5|10|0x82632b",90,376,1228,716,1327} --多点找色
t['返回_加速']={0x6b4d19, "2|0|0xfafaf8,-2|1|0xf0eee9,-472|-3|0x4f6b41,-417|-29|0x678d50",90,20,1191,737,1322} --多点找色


t['守望_主界面_感叹号3']={0xffe1a8, "0|14|0xfff5e2,-7|-1|0x9d3c16",90,7,1145,300,1307} --多点找色


function  game()
	local time_line = os.time()
	local out_time = 60*10
	
	while (os.time()-time_line < out_time) do
		if active(app_.bid,5)then
			if d("守望_主界面")then
				if d('守望_主界面_野外')then
					d('守望_主界面_野外',true)
				elseif d('守望_主界面_城里')then
					task_lun = task_lun or 0
					task_lun = task_lun + 1
					if task_lun%2== 0 then
						if d('守望_主界面_城里_粮食',true,1,2)then
							click(373,664,2)
							if d('守望_主界面_城里_粮食_运输',true)then
							else
								click(373,664,2)
							end
						elseif d('守望_主界面_城里_挂勾',true,1,2)then
							if d('守望_主界面_城里_挂勾_激活',true)then
							else
								local gtime__ = os.time()
								while (os.time()-gtime__<5) do
									d('守望_主界面_城里_挂勾_激活2',true)
									delay(0.2)
								end
								click(373,664,2)
							end	
						elseif d('守望_主界面_城里_运输',true,1,2)then
						elseif d('守望_主界面_感叹号',true)then
						elseif d('守望_主界面_感叹号2',true)then
						elseif d('守望_主界面_感叹号3',true)then
						elseif d('守望_主界面_城里_公路',true)then
						elseif d('守望_主界面_城里_士兵',true)then
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
						if d('守望_主界面_感叹号',true)then
						elseif d('守望_主界面_感叹号2',true)then
						elseif d('守望_主界面_感叹号3',true)then
						end
					end
				else
					home_click = home_click or 0
					home_click = home_click + 1
					click(372,679+(home_click%9-4)*50)
				end
			elseif d('守望_主界面_返回')then
				if d('返回_加速')then
					click(80,80)
				elseif d('守望_主界面_返回_建造',true)then
				elseif d('返回_升级',true)then
				elseif d('返回_跳转',true,1,3)then
					click(377,715,2)
					click(377,715,2)
					up_lun__ = up_lun__ or 0
					up_lun__ = up_lun__ + 1
					if up_lun__%2 == 0 then
						d('守望_主界面_城里_升级',true)
					end
				else
					click(80,80)
				end
			elseif(d("tip_任务指导_新",false))then
				if d('tip_任务指导_新_任务',true)then
				elseif d('tip_任务指导_新_领取全部',true)then
				elseif d('返回_升级',true)then
				else
					click(42,88)
				end
			elseif d('tip_任务弹窗') or d('tip_任务弹窗2')then
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
		delay(1)
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
























