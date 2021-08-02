require("TSLib")
width,hight=getScreenSize()
nLog(width..'*'..hight)

w = {
    --深度打印一个表
    print_r = function (t)
        local print_r_cache={}
        local function sub_print_r(t,indent)
            if (print_r_cache[tostring(t)]) then
                nLog(indent.."*"..tostring(t))
            else
                --  mSleep(100)
                print_r_cache[tostring(t)]=true
                if (type(t)=="table") then
                    for pos,val in pairs(t) do
                        if (type(val)=="table") then
                            nLog(indent.."["..pos.."] = "..tostring(t).." {")
                            sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                            nLog(indent..string.rep(" ",string.len(pos)+6).."},")
                        elseif (type(val)=="string") then
                            nLog(indent..'["'..pos..'"] = "'..val..'",')
                        else
                            if (type(val)=="number") then
                                nLog(indent..'["'..pos..'"] = '..val )
                            else
                                nLog(indent..'["'..pos..'"] = "'..val..'"')
                            end
                        end
                    end
                else
                    nLog(indent..tostring(t))
                end
            end
        end
        if (type(t)=="table") then
            nLog(tostring(t).." {")
            sub_print_r(t,"  ")
            nLog("}")
        elseif (type(t)=="string") then
            nLog(t)
        end
    end,
    --解锁
    lock = function ()
        local flag = deviceIsLock();
        if flag ~= 0 then
            unlockDevice(); --解锁屏幕
        end
    end,
    --app在前端
    active = function (app,times)
        local times = times or 5
        w.lock()
        local bid = frontAppBid();
        if bid ~= app then
            w.log(app.."，准备启动")
            runApp(app)
            mSleep(times*1000)
        elseif bid == app then
            w.log("在前端")
            return true
        end
    end,
    closeX = function (app_bid,times,way)
        local times = times or 1
        nLog("kill "..app_bid)
        if way then
            closeApp(app_bid,1)
        else
            closeApp(app_bid)
        end
        mSleep(times*1000)
    end,
    log = function (txt,show,times)
        local times = 1
        if type(txt) == 'table' then
            w.print_r(txt)
            return
        end
        if show == 'all' then
            toast(txt,times)
            nLog(txt)
        elseif show then
            toast(txt,times)
        else
            nLog(txt)
        end
    end,
    click = function (x,y,times,stayTime,logtxt)
        local times = times or 1
        local stayTime = stayTime or 0.05
        if logtxt then
            nLog("准备点击->"..logtxt.."("..x..","..y..")")
        end
        local offset_x = math.random(-3,3)
        local offset_y = math.random(-3,3)
        touchDown(1, x, y)
        mSleep(stayTime * 1000)
        touchUp(1, x, y)
        mSleep(times * 1000)
    end,
    delay = function (times)
        local times = times or 1
        mSleep(times*1000)
    end,
    --单点模糊比色
    isColor = function (x,y,c,s)
        local fl,abs,s= math.floor,math.abs, s or 90
        s = fl(0xff*(100-s)*0.01)
        local r,g,b = fl(c/0x10000),fl(c%0x10000/0x100),fl(c%0x100)
        local rr,gg,bb = getColorRGB(x,y)
        if abs(r-rr)<s and abs(g-gg)<s and abs(b-bb)<s then
            return true
        end
    end,
    --输入---
    input = function (txt,way,times)
        local times = times or 1
        if way then
            inputStr(txt)
        else
            inputText(txt)
        end
        delay(times)
    end,
    downFile = function (url, path)
        --用http.get实现下载文件功能
        local sz = require("sz")
        json = sz.json
        http = sz.i82.http
        status, headers, body = http.get(url)
        if status == 200 then
            file = io.open(path, "wb")
            if file then
                file:write(body)
                file:close()
                return true
            else
                return -1;
            end
        else
            return status;
        end
    end,
    ip = function()
        local http = require("szocket.http")
        local res, code = http.request("http://ip.cn",30);
        if code ~= nil then
            local i,j = string.find(res, '%d+%.%d+%.%d+%.%d+')
            return string.sub(res,i,j)
        end
    end,
    rd = function (min,max)
        local min = min or 1
        local max = max or min
        if min >= max then
            return math.random(max,min)
        else
            return math.random(min,max)
        end
    end,
    --字符串分割
    split =  function (str,delim)
        if type(delim) ~= "string" or string.len(delim) <= 0 then
            return
        end
        local start = 1
        local t = {}
        while true do
            local pos = string.find (str, delim, start, true) -- plain find
            if not pos then
                break
            end
            table.insert (t, string.sub (str, start, pos - 1))
            start = pos + string.len (delim)
        end
        table.insert (t, string.sub (str, start))
        return t
    end,
    vpnx = function ()
        setVPNEnable(false)
        mSleep(1000)
    end,
    vpn = function ()
        setVPNEnable(true)
        mSleep(1000)
        local LineTime = os.time()
        local OutTimes = 60
        while (os.time()-LineTime<OutTimes) do
            local flag = getVPNStatus()
            if flag.active then
                w.log("VPN 打开状态"..flag.status)
                if flag.status == '已连接' then
                    return true
                else
                    setVPNEnable(true)
                    delay(6)
                end
            else
                w.log("VPN 关闭状态"..flag.status)
            end
            mSleep(1000)
        end
    end,
    vpnstate = function ()
        local flag = getVPNStatus()
        if flag.active then
            w.log("VPN 打开状态"..flag.status)
            if flag.status == '已连接' then
                return true
            end
        else
            w.log("VPN 关闭状态"..flag.status)
        end
    end,
    ---------------VPN---------------
    boxshow = function (txt,x1,y1,x2,y2)
        adbox = adbox or 0
        if adbox == 0 then
            adbox = 1
            fwShowWnd("wid",0,0,0,0,1)
            mSleep(2000)
        end
        fwShowTextView("wid","textid",txt,"center","FF0000","FFDAB9",10,0,x1,y1, x2,y2,0.5)
        --fwShowTextView("wid","textid","这是一个文本视图","center","FF0000","FFDAB9",0,20,0,0,200,100,0.5)
    end,
    post = function (url,arr)
        w.log('tsp-post')
        local sz = require("sz")
        local cjson = sz.json
        local http = sz.i82.http
        local safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
        local headers = {}
        headers['User-Agent'] = safari
        headers['Referer'] = url
        headers['content-type'] = 'application/x-www-form-urlencoded'
        headers_send = cjson.encode(headers)
        post_send = cjson.encode(arr)
        post_escaped = http.build_request(post_send)
        w.log(post_send)
        local status_resp, headers_resp, body_resp = http.post(url, 30, headers_send, post_escaped)
        w.log(status_resp)
        if status_resp == 200 then
            w.log(body_resp)
            if body_resp ~= 'timeout' then
                local json = sz.json
                return json.decode(body_resp)
            else
                w.log('超时了')
            end
        end
    end,
    get = function (url)
        local sz = require("sz")
        local http = require("szocket.http")
        local res, code = http.request(url);
        if code == 200 then
            local json = sz.json
            if res ~= nil then
                return json.decode(res)
            end
        end
    end,
    inputword = function (key)
        if key ~= nil then
            for i = 1,string.len(key) do
                w.log(string.sub(key,i,i))
                inputkey = string.sub(key,i,i)
                if type(tonumber(inputkey)) == 'number' then
                    w.log('munber->'..inputkey)
                    keyDown(inputkey)
                    keyUp(inputkey)
                else
                    if inputkey ~= string.lower(inputkey) then
                        w.log('输入大写')
                        keyDown("CapsLock")
                        keyDown(string.lower(inputkey))
                        keyUp(string.lower(inputkey))
                        keyUp("CapsLock")
                    else
                        if inputkey == '@' then
                            w.log('输入符号')
                            keyDown("LeftShift")
                            keyDown(2)
                            keyUp(2)
                            keyUp("LeftShift")
                        else
                            keyDown(string.lower(inputkey))
                            keyUp(string.lower(inputkey))
                        end
                    end
                end
                mSleep(500)
            end
        else
            w.log('一个空值',true)
        end
    end,
    clearTxt = function ()
        keyDown("Clear")
        keyUp("Clear")
    end,
    mc = function(color_table,clickkey,n,options)
        options = options or {["dim"] = 90,["flag"] = false}
        n = n or 1
        if n > #color_table then
            w.log("点击超表")
            return
        end
        clickkey = clickkey or false
        if multiColor(color_table,options) then
            w.log("找到颜色")
            if ( clickkey )then
                w.log({"准备点击",color_table[n][1],color_table[n][2]} )
                w.click(color_table[n][1],color_table[n][2])
            end
            return true
        else
        --   w.log("未找到颜色")
        end
    end,
    fmc = function(tmp,degree,x1,y1,x2,y2,n)
        n = n or 1
        degree = degree or 90
        x,y=findMultiColorInRegionFuzzyByTable(tmp,degree,x1,y1,x2,y2,{orient = n})
        if x ~= -1 and y ~= -1 then
          w.log("找到".."\r\n"..x..","..y)
          return true
        else
          w.log("未找到".."\r\n"..x..","..y)
        end
    end,
}


w.log('基础函数加载完成')
local deskbid=frontAppBid();
if deskbid == nil or deskbid == '' then
    w.log('com.apple.springbord')
else
    w.log(deskbid)
end





































