
--等待页面并点击，page:需要等待出现的页面，sleeptime:等待间隔，timeout:等待超时时间,fuzzy:找色相似度
function WaitingAndClick(waitpage,clickicon,unit,timeout,sleeptime,fuzzy)
    sleeptime = sleeptime or 1000 --默认重复判断等待时间为1000毫秒
    timeout = timeout or 3000 --默认超时时间3000毫秒
    fuzzy = fuzzy or 90 --默认相似度90%
    unit = unit or 0 --内面内部部件，默认标签为0

    --单点模糊比色
    local function IsColor(pixelpoint,fuzzy)
        local fl,abs = math.floor,math.abs
        fuzzy = fl(0xff*(100-fuzzy)*0.01)
        local r,g,b = fl(pixelpoint[3]/0x10000),fl(pixelpoint[3]%0x10000/0x100),fl(pixelpoint[3]%0x100)
        local rr,gg,bb = getColorRGB(pixelpoint[1],pixelpoint[2])
        if abs(r-rr)<fuzzy and abs(g-gg)<fuzzy and abs(b-bb)<fuzzy then
            return true
        end
    end
     
    if waitpage[clickicon].Unit ~= unit and waitpage[clickicon].Unit ~=0 then
        nLog("标签错误，请仔细核对")
        return
    end
     
    local curtime = 0
    local mismatching = 0
    while true do
        for k,v in pairs(waitpage) do
            if v.Pixelpoint and (v.Unit == unit or v.Unit == 0) and  not IsColor(v.Pixelpoint,fuzzy) then
                nLog("图标：<"..k..">不匹配")
                mismatching = 1
                break
            end
        end 
        if mismatching == 0 then break end
        mismatching = 0
        if curtime >= timeout then
            nLog("超时未找到页面")
            return 
        end
        mSleep(sleeptime)
        curtime = curtime + sleeptime
    end
     
    touchDown(0,waitpage[clickicon].Pixelpoint[1],waitpage[clickicon].Pixelpoint[2])
    mSleep(100)
    touchUp(0,waitpage[clickicon].Pixelpoint[1],waitpage[clickicon].Pixelpoint[2])
    return true
end