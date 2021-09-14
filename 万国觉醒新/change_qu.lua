
t['设置-执正官资料-角色管理']={0xf9fcfe, "0|0|0xf9fcfe,10|-203|0xfefbaf,260|200|0xf23138",90,215,100,666,681}
t['设置-执正官资料-创建新角色']={0x97b4c5, "0|0|0x97b4c5,1|-38|0x64808a,392|-22|0x72caef",90,168,139,1163,677}
t['设置-创建角色-面板']={0xd3d1ca, "0|0|0xd3d1ca,-752|62|0xfe4200,-529|62|0xfef500,-314|63|0x00f70c",90,253,52,1167,171}
    t['设置-创建角色-第一个点']={0x00fb0c, "0|0|0x00fb0c,361|-91|0xffffff,522|-76|0xffffff,518|-73|0x06638a",90,168,106,937,343}
    t['设置-创建角色-绿点']={0x00ff0c, "0|0|0x00ff0c,-12|0|0x0f78af,12|1|0x117db4,0|11|0x0a4c6e,0|-10|0x107ab2",80,225,176,252,292}
t['设置-创建角色-是']={0x1274ba, "0|0|0x1274ba,-356|3|0x980e0e",80,346,478,987,588}

function _选区()
    show_state("选区中")
    click(50,50,2)
    d('设置-执正官资料-设置',true,1,3)
    d('设置-执正官资料-角色管理',true,1,3)
    d('设置-执正官资料-创建新角色',true,1,3)
    local i = 0;
    while i < 100  and d('设置-创建角色-面板') do
        if d('设置-创建角色-第一个点') or d("设置-创建角色-绿点") then
             log(__game.qus)
            local x1,y1,x2,y2 = x+17,y-12,x+66,y+13
            local res = ocrText(x1,y1,x2,y2, 10) or 0
            log( res )
            res = tonumber( res )
            if res - tonumber(__game.qus) < 8 then
                log('差值少于10')
                local _cha = res - __game.qus
                function y_n(_cha)
                    if _cha < 2 then
                        return 0
                    end
                    if _cha >= 2 then
                        if _cha%2 == 0 then
                            return _cha/2
                        else
                           return (_cha -1)/2
                        end
                    end
                end
                log( {_cha%2*492+x, y_n(_cha)*198+y} )
                click(  _cha%2*492+x, y_n(_cha)*98+y,3 )
                if d("设置-创建角色-是",true)then
                    return true
                end
            else
                moveTo(500,500,500,100,2)
            end
            -- moveTo(500,500,500,100,2)
        end
        delay(1)
        i=i+1
    end
end