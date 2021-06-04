-- nike-arrow
-- arrow.lua  

-- Create By TouchSpriteStudio on 20:35:53   
-- Copyright © TouchSpriteStudio . All rights reserved.
require("tsp")


local arrowbid = "com.liguangming.Shadowrocket"


function ip()
    local url = 'http://nikeapi.honghongdesign.cn/?s=App.IndexIp.Ip'
    local ip___ = get(url)
    if ip___ then
        return ip___['data']
    end
end

function whiteip()
   local url = 'http://www.jinglingdaili.com/Users-whiteIpAddNew.html?appid=2420&appkey=ef2f43ef02109467a23c34f5b1e0982c&type=dt&index=&whiteip='..ip()
   return get(url)
end

function getNetIPproxy()
    local url = 'http://t.ipjldl.com/index.php/api/entry?method=proxyServer.generate_api_url&packid=0&fa=0&fetch_key=&groupid=0&qty=1&time=102&pro=&city=&port=1&format=json&ss=5&css=&dt=1&specialTxt=3&specialJson=&usertype=2'
    local ip___ = get(url)
    if ip___ then
        log(ip___['data'][1])
        return ip___['data'][1]
    end
end

if t == nil then
    t={}
end
t['vpn-首页-未激活']={0x000000, "0|0|0x000000,1|-2|0xf5f5f5,1|-4|0x222222,0|-19|0x808080",90,65,1243,124,1323}
t['vpn-首页-激活']={0x4587c2, "0|0|0x4587c2,1|-2|0xf5f5f5,1|-4|0x5d96c9,0|-19|0x4587c2",90,65,1243,124,1323}
    t['vpn-首页-编辑']={0x4587c2, "0|0|0x4587c2,-13|-1|0xffffff,-687|0|0xff9400",90,2,524,739,996}
    t['vpn-首页-开关开']={0xffffff, "0|0|0xffffff,67|-1|0xe5e5e5,-32|3|0xd9d9d9,16|-29|0xe3e3e3",90,601,192,729,296}
    t['vpn-首页-开关关']={0x4486c0, "0|0|0x4486c0,69|-1|0x407fb6,18|-29|0x4486c0",90,604,194,730,287}
    t['vpn-首页-连接成功']={0x000000, "0|0|0x000000,-2|-22|0xffffff,-3|38|0xffffff",90,259,186,453,293}
t['vpn-首页-编辑节点']={0xed402e, "0|0|0xed402e,1|-7|0xed402e,-14|-18|0xffffff",90,245,782,516,1175}
    t['vpn-首页-编辑节点-HTTP']={0x8e8e93, "0|0|0x8e8e93,8|-8|0x8e8e93,20|-8|0xffffff,23|8|0x8e8e93,117|0|0xc7c7cc,108|-10|0xc7c7cc",90,561,191,729,293}
    hpptwz = {301, 781}
    t['vpn-首页-编辑节点-完成']={0xffffff, "0|0|0xffffff,5|-3|0x4386c5,34|-7|0x4386c5,39|-12|0xffffff",90,622,53,727,113}
t['vpn-其它']={0xffffff, "0|0|0xffffff,22|-15|0x4386c5,399|-5|0xffffff,664|-10|0xffffff,656|3|0x4386c5",90,23,41,729,116}


function Shadowrockets()
    
    
	local setp_ = ''
	local setp__ = ""
	local setp___ = 0
	
	local vpnInputKey = false
	
	local timeline = os.time()
	local outTimes = 60
	while (os.time()-timeline < outTimes) do
		if active(arrowbid,5) then
		    if d('vpn-首页-激活')  then
		        setp_ = 'vpn-首页-激活'
		        if d('vpn-首页-编辑') then
		            setp_ = 'vpn-首页-第一页'
		            if vpnInputKey then
		                if d('vpn-首页-开关开',true)then
		                elseif d('vpn-首页-开关关') then
		                    if d('vpn-首页-连接成功') then
		                        return true
		                    end
		                end
		            else
		                if d('vpn-首页-开关关',true)then
		                else 
		                    d('vpn-首页-编辑',true)
		                end
		            end
		        elseif d('vpn-首页-编辑节点')then
		            setp_ = 'vpn-首页-编辑节点'
		            
		            if d("vpn-首页-编辑节点-HTTP") == nil then
		                click(649, 239)
		                click(301, 781)
		            end
		            log(whiteip())
		            local vpnList = getNetIPproxy()
		            local vpnlistWz = {{200, 398, 0xffffff},{200, 484, 0xffffff}}
		            click( vpnlistWz[1][1],vpnlistWz[1][2],1)
		            keyDown("Clear")
                    keyUp("Clear")
                    delay(1)
		            inputText(vpnList['IP'])
		            delay(1)
		            click( vpnlistWz[2][1],vpnlistWz[2][2],1)
		            keyDown("Clear")
                    keyUp("Clear")
                    delay(1)
		            inputText(vpnList['Port'])
		            delay(1)
		            if d('vpn-首页-编辑节点-完成',true)then
		                vpnInputKey = true
		            end
		        end
		    elseif d('vpn-首页-未激活',true)then
		        setp_ = 'vpn-首页-未激活'
		    elseif d('vpn-其它',true)then
		        setp_ = '其它UI'
            else
                setp_ = '其它'
		    end
		    
		    if setp_ == setp__ then
		        setp___ = setp___ + 1
		    else
		        setp__ = setp_
		    end
		    if setp___ >= 15 then
		        closeApp(arrowbid,1)
		        setp___ = 0
		    end
		    
		    log({setp_,setp___,'vpn->'..os.time()-timeline})
		    if setp_ == '其它' then
		        delay(0.5)
		    else
			    delay(rd(1,3))
			end
		end
	end
end




	


nLog('arrow 加截完成')






