

require("TSLib")
require('tsp')


if not(t)then
    t={}
end



if not(UIv) then
    var = {}
    var.bid = 'com.nike.onenikecommerce'
    UIv = {}
    UIv.again = 0
    UIv.note = 'wen'
    UIv.look_min_time = 90
	UIv.look_max_time = 150
end

function snkrs_look()
    
	local timeline = os.time()
	local outTimes = math.random( UIv.look_min_time+0 ,UIv.look_max_time+0 )
	
	local 看鞋向下滑动计数 = 0
	local 鞋详情下滑计数 = 0
	local setp_ = ''
	local setp__ = ""
	local setp___ = 0

    updateNikeLog('浏览「 SNKRS 」')
    delay(1)
    local 摘要热卖 = {{59, 82, 0xffffff},{168, 81, 0xe9e9e9},{295, 83, 0xffffff}}

	while (os.time()-timeline < outTimes) do
		if active(var.bid,3) then
		    if (  d('look-首页-激活')  ) then
		        setp_ = '首页-激活'
		        
		        看鞋向下滑动计数 = 0
		        click(摘要热卖[rd(1,2)][1],摘要热卖[1][2],2)
		        moveTo(300,800,300,800-rd(200,400),rd(20,30))	--从下向上滑动
		    elseif d('look-首页-按尺码筛选') then
		        setp_ = '首页-按尺码筛选'
                看鞋向下滑动计数 = 看鞋向下滑动计数 + 1
                if ( 看鞋向下滑动计数 > rd(6,10) ) then
                    moveTo(300,500,300,500+rd(200,400),rd(20,30))	--向下滑动
                else
                    moveTo(300,800,300,800-rd(200,400),rd(20,30))	--向上滑动
                    if rd(1,100)>50 then
                        d('look-首页-激活-喜欢心',true,1,2)
                    end
    		        if rd(1,100) > 50 then
    		            log('准备看详情')
    		            click(rd(88,651),rd(187,946),2)
    		            鞋详情下滑计数 = 0
    		        end
                end
		    elseif d('look-鞋详情x') then
		        setp_ = '鞋详情'
		        
                鞋详情下滑计数 = 鞋详情下滑计数 + 1
                moveTo(300,800,300,800-rd(200,400),rd(20,30))	--向上滑动
                if rd(1,100) > 90 then
                    d('look-鞋详情x',true)
                elseif 鞋详情下滑计数 > rd(5,8) then
                    d('look-鞋详情x',true)
                end
		    elseif d('look-异常-购物偏好设置',true)then
		        setp_ = '购物偏好设置'
		    elseif d('look-首页未激活',true)then
                setp_ = '首页未激活'
            else
                setp_ = '其它'
                moveTo(300,500,300,500+rd(200,400),rd(20,30))	--向下滑动
		    end
		    
		    
		    --开始查看设置页面
		    if setp_ == setp__ then
		        setp___ = setp___ + 1
		    else
		        setp__ = setp_
		    end
		    --对超时进行设置
		    if setp___ >= 30 then
		        click(672, 106)
		        closeApp(frontAppBid(),1)
		        setp___ = 0
		    end

			delay(rd(1,2))
			--显示日志
		    updateNikeLog(setp_.."->"..setp___)
			log('look->'..os.time()-timeline)
			
		end
	end
	-- body
	backId()
	return true
end

-- get_account()
-- 0,0,200,100
function updateNikeLog(txt)
	adbox = adbox or 0
	if adbox == 0 then
		adbox = 1
		--创建文本视图
		fwShowWnd("window1",0,0,200,30,1);
		mSleep(500)
	end
	fwShowTextView("window1","text1",txt,"center","FF0000","FFDAB9",10,0,0,0,200,30,0.8);
	--fwShowTextView("window1","text1","文本视图","center","FF0000","FFDAB9",10,0,0,0,200,30,0.5);
end





























