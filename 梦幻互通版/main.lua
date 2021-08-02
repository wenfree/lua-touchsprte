
require("tsp")
w.log("梦幻互通版-启动")
init(1)



page = {}
page['主界面'] = {{1205, 1, 0x4f859f},{110, 31, 0xb0b8d0},{220, 44, 0xa0acc8}}
page['主界面-展示任务'] ={{1317, 217, 0x96bfce}}
page['主界面-任务'] = { {{1282, 261, 0xf70301},{1291, 261, 0xf70301}}, 70, 1106,230,1330,505 }
    page['主界面-任务-战斗'] = {{{1283, 235, 0xebeae6},{1279, 231, 0xb81c10},{1282, 231, 0xf3f0ec}},90,1254,222,1332,250}
page['主界面-使用'] = { {{655, 467, 0xffffff},{665, 460, 0x701428},{674, 461, 0xffffff}}, 90,617,444,708,485}


page['弹窗-对话框'] = {{1300, 555, 0xa0c0c8},{1309, 563, 0x93b9c3},{1293, 562, 0x98bcc8}}
page['弹窗-对话框-对话'] = { {{1106, 456, 0xffffff},{1104, 430, 0x385868},{1106, 480, 0x305060}},90,989,292,1204,568 }
page['弹窗-...']= {{{1242, 452, 0xf5f9f5},{1232, 451, 0xf8fcf8},{1253, 451, 0xf8fcf8},{1243, 445, 0x405860}}, 90,1209,341,1276,531}

function d(name,clickKey,n )
    if w.fmc( page[name][1],page[name][2],page[name][3],page[name][4],page[name][5],page[name][6] ) then
        w.log( "找到->" .. name )
        if clickKey then
            w.click( page[name][1][n][1],page[name][1][n][2] )
        end
    end
end


function main()
    if w.mc(page['主界面']) then
        w.log("主界面")
        if d('主界面-使用' ,true,1)then
        elseif d( '主界面-任务' ,true,1 ) or d( '主界面-任务-战斗' ,true,1 )  then
        
        else
            w.mc( page['主界面-展示任务'],true,1)
        end
    else
        if w.mc( page['弹窗-对话框'] ) then
            if d("弹窗-对话框-对话",true,1) then
                
            else
                w.mc( page['弹窗-对话框'] )
                w.click(x,y)
            end
        else
            w.click(40,40)
        end
    end
    
    w.delay(1)
end

while (true) do
    main()
end





