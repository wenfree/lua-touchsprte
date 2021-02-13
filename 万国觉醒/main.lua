-- 万国觉醒
-- main.lua  

-- Create By TouchSpriteStudio on 13:31:43   
-- Copyright © TouchSpriteStudio . All rights reserved.
--unlockDevice()
-- require("TSLib")
--require("tsp")

update__ = true
update__ = false

--res, code = http.request("http://ip.chinaz.com/getip.aspx");
--用http.get实现下载文件功能
function downFile(url, path)
	local sz = require("sz")
	local http = require("szocket.http")
	local url = "http://wenfree.cn/api/Public/idfa/?service=Git.Get&url="..url
	local res, code = http.request(url);
--	nLog(res)
    if code == 200 then
		local json = sz.json
		local data = json.decode(res)
		local body = data.data
        local file = io.open(path, "w+")
        if file then
            file:write(body)
            file:close()
            return status;
        else
            return -1;
        end
    else
        return status;
    end
end
--downFile("http://mu1234.applinzi.com/-reply.txt",
--"/User/Media/TouchSprite/lua/-reply.txt")

function delFile(path)--帮你玩平台禁用此函数
    os.execute("rm -rf "..path);
end

--检测指定文件是否存在
function file_exists(file_name)
    local f = io.open(file_name, "r")
    return f ~= nil and f:close()
end

game_lua = {
    {"AWZ",'https://img.wenfree.cn/rok/AWZ.lua'},
	{"ZZBase64",'https://img.wenfree.cn/rok/ZZBase64.lua'},
	{"api",'https://img.wenfree.cn/rok/api.lua'},
	{"phone",'https://img.wenfree.cn/rok/phone.lua'},
	{"token",'https://img.wenfree.cn/rok/token.lua'},
	{"tsp",'https://img.wenfree.cn/rok/tsp.lua'},
	{"ui",'https://img.wenfree.cn/rok/ui.lua'},
	{"yzm",'https://img.wenfree.cn/rok/yzm.lua'},
	{"qu",'https://img.wenfree.cn/rok/qu.lua'},
	{"main",'https://img.wenfree.cn/rok/main.lua'},
	}


function get_(url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(url);
	if code == 200 then
		local json = sz.json
		if res ~= nil then
			return json.decode(res)
		end
	end
end

if update__ then

    t1=os.time();
    nLog(t1)
    for i,v in ipairs(game_lua)do
    	nLog(v[1])
    	nLog(v[2])
    	local path = "/User/Media/TouchSprite/lua/"..v[1]..".lua"
    	delFile(path)
    	downFile(v[2],path)
    	toast('下载->'..v[1],1)
    end
    nLog('end----->'..os.time()-t1)
    toast('更新完成')
    
end
	
__UI = {}
_UI = {}
require('tsp')
-- require('AWZ')
-- require('ui')
require('ZZBase64')
require("yzm")
require('token')
require('api')


init(1)
_app = {}
_app.bid = 'com.lilithgames.rok.ios.offical'
_app.yzmid = 0;



t={}
degree = 80


t['箭头向下'] = { 0xab4d21,"6|7|0xf0eca5,0|13|0xa15828,0|15|0xe9cb72,-11|50|0x687782,24|37|0xbbd3ea,4|86|0x596d84",degree,0,0,1334,750}
t['箭头向下']={0x687c8d, "0|0|0x687c8d,4|-62|0xb47d46,22|-28|0xc0d8ec,2|20|0x536778",degree,0,0,1334,666}

t['箭头向左下'] = {0x5b6c7d, "0|0|0x5b6c7d,-19|21|0x4e5e67,46|-33|0xab6e3a,30|7|0xbcd5ef",80,12,0,600,750}

t['箭头向左下2'] = { 0x596d83,"17|-62|0xe8e9e8,39|-29|0xc3d7eb,16|-15|0x839db6,10|-21|0x576674,48|-51|0xf4edaa",degree,0,0,1334/2,750}
t['箭头向左下2']={0x5f7083, "0|0|0x5f7083,49|-22|0xaf7540,7|-23|0x99a19e,27|14|0xbed7ee,-27|22|0x516270",90,0,0,1334/2,750}

t['箭头向左上'] = { 0xa25228,"-7|-4|0xf6eaaa,-13|-15|0xd3c97f,-61|-62|0x647991,-58|-38|0xafc8e4,-47|-42|0x8ca6c0",degree,0,0,1334,750}
t['箭头向左上']={0x5f7183, "0|0|0x5f7183,25|4|0xa1a9a8,30|44|0xb47e47,-9|31|0xbfd9ed",90,58,44,274,327}

t['箭头向右'] = { 0xa15026,"8|-3|0xfdf4b3,19|-1|0xd9d08a,82|-3|0x677c96,63|-19|0xa9c4e4,41|-14|0xc2d8ec",degree,0,0,1334,750}
t['箭头向右']={0x5a6b7d, "0|0|0x5a6b7d,35|-6|0x526472,-20|-27|0xc0daeb,-52|-8|0xb9844b",degree,0,0,1334,750}

t['箭头向右2'] = { 0xa3542b,"9|-2|0xfff7b5,18|1|0xae834c,20|1|0xd3c97f,78|-1|0x687e94",degree,0,0,1334,750}
t['箭头向右-攻击'] = { 0xaf2f23,"184|67|0x820c0c,192|10|0x820c0c,-7|60|0x830b0b",degree,837,458,1065,543}
	
--事件
t['e-国家选择'] = {0xb67016, "0|0|0xb67016,-12|-1|0xffb200,-19|-507|0x000000,-1059|-481|0x000000",90,12,0,1312,604}
--1罗马，2德国，3不列直，4法兰西，5西班牙，6中国，7日本，8韩国，9阿拉伯，10奥斯曼，11拜占庭
t['e-国家选择-位置']={{552, 529, 0x4a2479},{477, 667, 0xf3bf9c},{664, 665, 0x965d42},{857, 662, 0xad4438},{1044, 663, 0x8e120e},{1232, 670, 0x957f77}}
	t['e-国家选择-位置-确定'] = { 0xffb000,"2|-8|0xb67016",degree,1061,498,1193,551}
t['e-服务器选择-继续按扭']={0xffaf00, "0|0|0xffaf00,-298|-602|0xffffff,-144|-592|0xeea442,-742|-594|0xf2a542",90,122,36,1262,716}
t['e-文明样式选择']={0xb67016, "0|0|0xb67016,-88|-13|0xfebc00,77|-10|0xffbc00,73|30|0xffa500",90,981,450,1256,552}

function _Evevnt()
    log('查询事件')
	if d('e-国家选择')then
		if _UI.国家 > 7 then
			moveTo(1247,663,139,666,10)
			delay(2)
		end
		click(t['e-国家选择-位置'][_UI.国家][1],t['e-国家选择-位置'][_UI.国家][2],2)
		d('e-国家选择',true,1)
	elseif d('e-服务器选择-继续按扭') then
	   -- qu={631,663,670,685}
    --     __game.qu = ocr(qu[1],qu[2],qu[3],qu[4])
    --     local arr ={}
    --     arr['s']='Rok.token'
    --     arr['qu'] = __game.qu
    --     arr['token'] = __game.token
    --     _api_rok(arr)
         d('e-服务器选择-继续按扭',true,1,3)
    
        -- dialog('请选区-点确定后20秒选完\n(帐号原来计划在'..__game.qu,0);
	elseif d('e-文明样式选择')then
	    click(1100, 659)
	    d('e-文明样式选择',true)
	else
		return true
	end
end


function _Arrow()
	
log('查找箭头')
local ret = false
_arrow = _arrow or 0


local result = false

keepScreen(true)
	if d('箭头向下')then
	    for i=1,4 do
	        _arrow = _arrow + 1
	        x = x
	        y = y+50
	        log({x,y})
	        click(x,y)
	    end
		ret = true
	elseif d('箭头向左下') or d('箭头向左下2')  then
		log("向左")
		log({'x',x,'y',y})
		_arrow = _arrow + 1
		click(x - (_arrow%3+1)*50-50 ,y + (_arrow%3+1)*50+50 )
		_arrow = _arrow + 1
		click(x - (_arrow%3+1)*50-50 ,y + (_arrow%3+1)*50+50 )
		_arrow = _arrow + 1
		click(x - (_arrow%3+1)*50-50 ,y + (_arrow%3+1)*50+50 )
		ret = true
	elseif d('箭头向左上')then
		_arrow = _arrow + 1
		click(x - (_arrow%3+1)*50 ,y - (_arrow%3+1)*50 )
		_arrow = _arrow + 1
		click(x - (_arrow%3+1)*50 ,y - (_arrow%3+1)*50 )
		_arrow = _arrow + 1
		click(x - (_arrow%3+1)*50 ,y - (_arrow%3+1)*50 )
		ret = true
	elseif d('箭头向右') or d("箭头向右2")then
	    for i=1,4 do
	        _arrow = _arrow + 1
	        x = x+50
	        y = y
	        log({x,y})
	        click(x,y)
	    end
		ret = true
	elseif d('箭头向右-攻击',true,2)then
		ret = true
	end
keepScreen(false)
	
return ret
end


t['游戏主界面'] = { 0x13567e,"83|1|0x1f5a80,54|625|0xf5e18a,56|727|0xf4bd63",degree,0,0,123,749}
t['游戏主界面']={0x005d8f, "0|0|0x005d8f,-47|-623|0x248dbb,24|-626|0x2d95c2",90,1,30,164,747}
t['游戏主界面-夜'] = { 0xf5bd63,"-1|-102|0xf2dc88,-56|-727|0xa507e,27|-731|0xf476f",degree,0,0,123,749}
	t['游戏主界面-野外'] = { 0xb527f,"0|1|0x3ea0c4,-1|15|0x7fdef5,-1|16|0x4192b3,-21|-2|0x66ddf8,-24|-2|0xa507c",degree,18,640,108,726}
	    t['游戏主界面-野外-玉米']={0x47920f, "0|0|0x47920f,5|-20|0xffe938",90,643,1,1066,48}
	    t['游戏主界面-野外-补充资源X']={0xd4d3cc, "0|0|0xd4d3cc,0|-8|0xb9b6aa",90,1093,50,1181,122}
	t['游戏主界面-城内'] = { 0x2074a0,"0|-10|0xffffff,0|15|0x6ce6ff,10|29|0x24776,15|33|0x82e7fe,-42|32|0x8578f",degree,27,653,106,722}
t['联盟加入'] = { 0x1274ba,"-60|-12|0xc8f6,-18|20|0xace9,47|1|0xc7ff",degree,586,203,753,269}
t['联盟加入']={0x1274ba, "0|0|0x1274ba,193|0|0x00c3ff,-72|-10|0x00cffe,93|3|0x00befb",90,495,236,828,294}
	t['联盟加入不能'] = { 0x939585,"-271|98|0xd3ff",degree,545,87,993,301}
	t['联盟加入不能']={0xbfc1b7, "0|0|0xbfc1b7,-195|128|0x00c2fe,-377|128|0x00c3fe",90,503,111,930,292}
t['关闭任务']={0x0e67ad, "0|0|0x0e67ad,9|1|0x1ac5f1,5|-7|0x1063ad,4|6|0x0e6aaa",90,168,171,207,213}

function _init()
	d('游戏主界面-城内',true,2)
	if d('游戏主界面-野外',false,1,2) then
	    if upimg then
	        ocrInfo()
	        d('游戏主界面-野外-玉米',true,1,2)
	        update_token()
	        uploadquBaiDu()
	        upimg = false
	        d('游戏主界面-野外-补充资源X',true,1)
	    end
	    if allimg then
		    if isimgupload() then
		        uploadimg()
		        _开帮助()
		    end
		    allimg = false
		end
	    d('游戏主界面-野外',true,1,3)
	end
	if d('联盟加入',true)then
		d("联盟加入不能",true)
	elseif d('关闭任务',true)then
	elseif d('游戏主界面-城内')then
		log('初始化完成')
		return true
	end
end
	

t['弹窗-任务x'] = { 0xd3d1ca,"-11|-10|0xd7d6ce,-11|-4|0x9c9b8d,6|13|0x9d9a8f,9|9|0xd2cfc6",degree,1113,66,1165,112}	
t['弹窗-邮件面板x'] = { 0xd3d1c9,"-12|-10|0xd7d4cc,-13|-7|0x9e9991,9|14|0xa09c93",degree,1256,25,1317,70}
t['弹窗-资料面板x'] = { 0xd3d1ca,"-11|-10|0xd7d5ce,-13|-7|0x9a968e,8|13|0x9c988e",degree,1115,66,1161,110}
t['弹窗-设置面板x'] = { 0xd3d1ca,"-13|-8|0x9b978f,-9|10|0xd2d0c7,14|12|0x9a968d",degree,1136,24,1187,71}
t['弹窗-蓝色按钮'] = { 0x1274ba,"-107|-25|0xd4ff,-110|24|0xb5f0,115|24|0xb5f0,109|-24|0xd4ff",degree,333,164,1000,596}
t['弹窗-返回按钮'] = { 0xd6d4cf,"15|-9|0x8e8c86,10|-14|0xdbd9d3,10|13|0xd0d0cb,0|24|0x959287",degree,3,3,86,82}
t['酒馆-返回按钮']={0xd5d5cd, "0|0|0xd5d5cd,6|-1|0xaea8a1,-14|-18|0xbbb3ac,27|24|0xa29f97",90,3,5,80,76}
t['弹窗-正在加载'] = { 0xbb2fe,"2|14|0x64ae,7|-2|0xdb2fe,14|8|0x180d5",degree,343,652,558,690}	
t['弹窗-升级箭头-物质不足'] = { 0xd3d1ca,"-464|378|0xc7ff,-378|377|0x1274ba,-304|404|0xb7f3",degree,232,97,1095,651}
    t['弹窗-升级箭头-物质不足-更多']={0x02afee, "0|0|0x02afee,10|-24|0x1274ba",90,543,470,785,587}
    t['弹窗-升级箭头-物质不足-x']={0xcfcec6, "0|0|0xcfcec6,-396|-7|0x858278,-265|148|0x034e6c,-310|382|0x00c2ff",90,524,89,1112,582}
    t['弹窗-物质面板-x']={0xd4d3cc, "0|0|0xd4d3cc,-18|1|0xbab8ab,0|16|0xbbb5ad,-11|-4|0xa09990",90,1043,31,1197,166}
t['弹窗-招到英雄'] = { 0x1274ba,"-84|-26|0xd2fd,88|25|0xb5f1",degree,67,574,339,695}
t['弹窗-开箱确定'] = { 0x1577bc,"-81|-27|0xd4ff,422|15|0xffa700,619|10|0xffa900",degree,274,591,1061,695}
t['弹窗-升级确认'] = { 0x1274ba,"-95|-7|0xc9ff,159|-389|0x858278,318|1|0xc2ff",degree,230,94,1088,661}
t['弹窗-取消城市编辑'] = { 0xd6d4cc,"-264|615|0xc0fc,-537|608|0xc4ff,-824|606|0xc5ff",degree,186,6,1328,717}
t['弹窗-网络断开'] = { 0x1176bc,"50|-291|0x858278,118|-289|0xc6c3b6",degree,362,183,974,568}
t['弹窗_点击任务_宝石'] = { 0xd3d1c9,"-460|407|0xffb100,-305|382|0xfebf00",degree,483,102,1099,662}
t['弹窗_绑定帐号'] = { 0xd3d1c9,"-274|395|0xc1fe,-497|388|0xc5ff,-591|234|0xf2a643",degree,241,99,1098,644}
t['弹窗_弹出宝箱'] = { 0x9bab6e,"-596|544|0xb77016,-397|533|0xb77016,-501|516|0xffc000,-502|568|0xfca100",degree,487,78,1195,716}
t['弹窗—回天改命'] = { 0xadafaf,"-595|521|0xb77016,-409|552|0xfeaa00",degree,462,21,1223,740}
t['弹窗—验证图片'] = { 0x1274ba,"-51|-7|0xd3ff,43|17|0xb5f1,58|-5|0x1077bc,-10|-131|0xffef00",degree,400,90,1029,458}
t['弹窗—验证图片']={0x1274ba, "0|0|0x1274ba,28|-5|0x00c7ff,-58|-3|0x00c5ff,9|-283|0x000000",90,668,92,1328,452}
	t['弹窗—验证图片-确定'] = { 0x539ffe,"83|0|0x539ffe,-339|-2|0xffffff,-323|-10|0x7e7e7e,-406|-3|0x7e7e7e",90,392,644,944,730}
	t['弹窗—验证图片-确定-有图']={0x252525, "0|0|0x252525,0|1|0x252525",70,700,40,928,78}
	t['弹窗—验证图片-确定-有字']={0x727272, "0|0|0x727272",90,703,25,925,91}
t['弹窗—app更新'] = { 0xc3ff,"-82|-24|0xd3fd,64|20|0xb5f0,192|-1|0xdf3d33,343|2|0xdd3c33",degree,384,427,966,569}
t['酒馆—3确定']={0x1274ba, "0|0|0x1274ba,-48|-2|0x00c4ff,288|-1|0xffb000,633|0|0xffb000",90,177,587,1145,697}
t['弹窗—前往按钮']={0x1274ba, "0|0|0x1274ba,-71|-23|0x02cdf9,89|19|0x03aaec",90,550,529,803,660}
t['弹窗—红蓝点击蓝']={0x00c3ff, "0|0|0x00c3ff,106|-17|0x00cfff,-321|1|0xde3d33,-165|1|0xde3d33",90,431,444,900,538}
t['弹窗-常见问题']={0x007aff, "0|0|0x007aff,548|4|0x000000,298|0|0xf8f8f8",90,20,7,747,53}
t['弹窗-王国历史x']={0x906f40, "0|0|0x906f40,-8|-8|0x8d6f41,-1|12|0xac8d5d,9|-1|0xa08455",90,1191,12,1273,70}
t['弹窗-appid-取消']={0x007aff, "0|0|0x007aff,306|-5|0x007aff,306|9|0x007aff",90,427,63,904,546}
t['弹窗-聊天确定']={0xffffff, "0|0|0xffffff,-50|-37|0x0e75e5,56|28|0x0e75e5",90,596,596,736,676}
t['弹窗-网络错误']={0x007aff, "0|0|0x007aff,12|-6|0x007aff,19|-164|0x000000",90,563,288,769,478}
t['弹窗-商人走了']={0x92734a, "0|0|0x92734a,-418|41|0x000000,-403|42|0xcba973",90,469,159,1006,256}
t['弹窗-与众不同']={0x927560, "0|0|0x927560,11|-15|0x6f5343,-10|-15|0x755542",90,1139,86,1186,130}
t['弹窗-同意并继续']={0x00a5ff, "0|0|0x00a5ff,-366|-405|0xd30000,-456|-6|0xf7e1c6",90,267,148,1008,604}
t['弹窗-五星好评']={0x02a6e5, "0|0|0x02a6e5,70|-99|0x00befb,94|-108|0x1274ba,-97|-109|0xb67016,-78|-106|0xffb200",90,424,344,910,661}
t['弹窗-宝箱广告']={0xb71b10, "0|0|0xb71b10,-8|-13|0xfef4f1,87|-3|0x040502",90,1180,1,1332,45}
    --1163, 110
t['弹窗-背包X']={0xd2d1ca, "0|0|0xd2d1ca,-10|15|0xa19f97,9|8|0xdcdcd8,13|0|0xb6b5a9",90,1128,56,1186,114}
t['弹窗-对话X']={0xfff2e6, "0|0|0xfff2e6,0|-10|0xa58b60,7|-8|0xfff2e6,11|1|0xa58b60",90,538,346,1242,408}
t['弹窗-被攻击中']={0xfff7f2, "0|0|0xfff7f2,-5|-10|0xd20907",90,1219,458,1317,634}
t['弹窗-预警弹窗']={0x1577bc, "0|0|0x1577bc,-3|-4|0x00caff,4|5|0x00bdf9,61|-144|0xd1d0c9",90,191,59,1170,297}
t['弹窗-补充资源x']={0xd2d1cb, "0|0|0xd2d1cb,0|-10|0xb9b6aa,0|12|0xb9b7ab,-217|0|0xc6c2b6",90,759,48,1224,126}
t['弹窗-退出警告']={0xde3e35, "0|0|0xde3e35,295|4|0x00c0fc,230|-180|0xffffff,163|-400|0x858278",90,292,109,1000,590}
t['弹窗-封号警告']={0x107cc1, "0|0|0x107cc1,-123|-193|0xffffff,-139|-193|0x07638b,-132|-194|0xffffff,-173|-303|0x88867b",90,349,178,984,570}
t['弹窗-滑动解锁']={0x1a79ff, "-11|0|0xd1d1d1,-37|1|0x1a79ff,1|-21|0x1a79ff,407|64|0xb3b3b3",90,386,94,941,653}

function _Tips()
    log('查询弹窗')
    -- keepScreen(true)
    local res = ""
	local tips = {
	    '弹窗-封号警告',
		'弹窗-宝箱广告',
		'弹窗-退出警告',
		'弹窗—红蓝点击蓝',
		'弹窗-任务x',
		'弹窗-邮件面板x',
		'弹窗-资料面板x',
		'弹窗-设置面板x',
		'弹窗-网络断开',
		'弹窗-蓝色按钮',
		'酒馆-返回按钮',
		'弹窗-招到英雄',
		'弹窗-升级确认',
		'弹窗-开箱确定',
		'弹窗-取消城市编辑',
		'弹窗-升级箭头-物质不足',
		'弹窗—app更新',
		'弹窗_绑定帐号',
		'弹窗_弹出宝箱',
		'酒馆—3确定',
		'弹窗-与众不同',
		'弹窗_点击任务_宝石',
		'弹窗—验证图片',
		'弹窗-同意并继续',
		'弹窗-正在加载',
		'弹窗—前往按钮',
		'弹窗-常见问题',
		'弹窗-王国历史x',
		'弹窗-appid-取消',
		'弹窗-聊天确定',
		'弹窗-网络错误',
		'弹窗-商人走了',
		'弹窗-五星好评',
		'弹窗-背包X',
		'弹窗-对话X',
		'日历-奖励界面x',
		'弹窗-补充资源x',
		'菜单-战役-打不过-时间到',
		'弹窗-滑动解锁',
	}

	for k,v in ipairs(tips)do
	   -- log('查询-->' .. v )
		if v == "弹窗-正在加载" then
			if d(v)then
				delay(15)
				loadding___ = loadding___ or 0
				loadding___ = loadding___ + 1
				if loadding___%10 == 0 then
				    closeApp(frontAppBid())
				end
			end
		elseif v == '弹窗-滑动解锁' then
		    if d(v)then
		       local right_where = {{499, 541, 0xc9cdd3},{838, 543, 0xe4e4e4}}
		       moveTo(499,541,838,543,5)
		      -- closeApp(frontAppBid())
		       delay(2)
		    end
	    elseif v == '弹窗-封号警告' then
		    if d(v) then
		        local arr = {}
		        arr['s']='index.update'
		        arr['table']='rok_account'
		        local sz = require('sz')
		        local json = sz.json
		        arr['arr']= json.encode({ ['switch'] = 1, ['state']='封号'})
		        arr['id']= __game.id
		        _api_rok(arr)
		       res = '封号'
		    end
		elseif v == '弹窗-预警弹窗' then
		    if d('弹窗-预警弹窗',true,1) then
		        d('弹窗-预警弹窗',true,1,4)
		    end
		elseif v == '弹窗-宝箱广告' then
		    if d('弹窗-宝箱广告') then
		        click(1163, 110)
		        log('宝箱广告')
		    end
		elseif v == '弹窗-对话X' then
		    if d(v,true) then
		        moveTo(500,200,500,300,rd(10,20))
		    end
		elseif v == "弹窗—验证图片" then
			if d(v,true,1,5) then
			    keepScreen(false)
				local time_ = os.time()
				while ( os.time() - time_ < 120 ) do
					if ( d("弹窗—验证图片-确定") ) and ( d('弹窗—验证图片-确定-有图') or d('弹窗—验证图片-确定-有字') )then
						delay(1)
						if _yzmsb()then
							d("弹窗—验证图片-确定",true,1,5)
							delay(6);
							if d("弹窗—验证图片-确定")  then
							    post('http://api.ttshitu.com/reporterror.json',{['id']=_app.yzmid});
							end
							break
						end
					end
					delay(1)
				end
			end
		elseif v == '弹窗-常见问题' then
		    if d(v,true,1)then
    	        closeApp(_app.bid,1)
		    end
		elseif v == '弹窗-升级箭头-物质不足' then
            if d(v)then
                d('弹窗-升级箭头-物质不足-更多',true,1,2)
	            if d("造兵-资源不足-使用",true,1,2) then
    		        d("造兵-资源不足-使用*",true,1,2)
    		        d("造兵-资源不足-使用-X",true,1,2)
    		        d("升级-升级按钮",true,1,2)
    		        d("研究院-研究按钮",true,1,2)
    		    else
    		        d('弹窗-物质面板-x',true,1,2)
    		        d(v,true)
	            end
            end
		elseif v == '菜单-战役-打不过-时间到' then
            if d( v,true,1,2 ) then
                _UI.远征 = false
                log('远征结束-tips')
            end
		else
			if d(v,true,1,2)then
			    if v == '弹窗-商人走了' then
			        _UI.任务 = false
			    elseif  v == '弹窗-补充资源x' then
			        click(711,167,2)
			    end
			    break
			end
		end
	end
	
	keepScreen(false)
	
	_other = _other or 0
	_other = _other + 1
	log('_other->'.._other)
	local other_w = {{50,50},{1128,44},}
	local other_w_c = _other%(#other_w+1)
    if _other%5 == 0 then
		moveTo(500,200,500,300,rd(10,20))
		log('-e-');
	elseif _other%2== 0 then
	    click(other_w[1][1],other_w[1][2],1)
	    log('e');
	end
	
	return res
end

	
t['升级-升级箭头'] = { 0x1faa0f,"12|28|0x9203,-2|-29|0x70d255",degree,478,356,597,477}
t['升级-升级箭头']={0x4cc332, "0|0|0x4cc332,-13|43|0x049407,7|42|0x039506,-25|-13|0xdff0d8",90,292,323,641,485}
t['升级-升级箭头青铜'] = { 0xeab212,"0|-30|0xfee35c,-9|22|0xde9800",degree,485,356,585,460}
t['升级-升级箭头时代']={0xf4cb32, "0|0|0xf4cb32,-24|4|0xdeb434,22|5|0xdd9d22,-12|36|0xdd8f06",90,278,325,698,480}
t['升级-升级箭头时代-iphone7']={0xe5ab0a, "0|0|0xe5ab0a,142|-9|0x01679d,-119|-23|0x087db5",90,255,303,693,512}
t['升级-升级箭头时代-iphone7-9']={0xe5a507, "0|0|0xe5a507,-18|-28|0x75d171,3|-33|0xfcdf55",90,303,313,565,448}
    t['升级-升级箭头-车厂']={0x14a409, "0|0|0x14a409,157|-12|0x006598,-150|-27|0x097cb0,13|-35|0xdcefdd",90,123,109,1325,628}
    t['升级-升级箭头-车厂-正在升级']={0xdea30e, "0|0|0xdea30e,-23|-31|0xf0f0ed,-18|31|0xe7e8e0,-187|-2|0x0b7bb4,-177|37|0xceeff1",90,112,52,1273,692}
t['升级-升级按钮'] = { 0xc2ff,"101|2|0xc2ff,-158|2|0xfeaf00,-298|-3|0xfeb200",degree,638,381,1162,682}
t['升级-前往'] = { 0x1274ba,"-37|-18|0xd3fd,63|14|0xace9",degree,671,496,1120,656}
t['升级-前往-升级箭头'] = { 0x17a50a,"-3|22|0x9203,-1|-26|0x5ecb43",degree,448,360,885,607}
t['升级-正在升级中'] = { 0xe0a10f,"27|-1|0xdea716,-8|-22|0xf0efe9,-1|-22|0xf1c03a,-32|17|0xcf920d,-41|18|0xe6e4d9",degree,470,357,861,570}
t['升级-正在升级中']={0xdea01c, "0|0|0xdea01c,-22|-20|0xeebb37,-52|17|0xd19618",90,470,357,861,570}
t['升级-正在升级中-修正']={0xfdac00, "0|0|0xfdac00,50|-19|0xb67016",90,994,590,994,590}

t['升级-升级后点帮助']={0xfeedd8, "0|0|0xfeedd8,1|13|0x2077bb",90,571,243,759,384}

t['升级-正在升级中-总部'] = { 0xe3a412,"29|1|0xdea716,-1|-19|0xf1be35,-6|-20|0xf4ece1,-1|23|0xce9408,-35|8|0xf2e3cd,-31|20|0xcf920d",degree,478,344,616,490}
t['升级-正在升级中-总部']={0xe0a40f, "0|0|0xe0a40f,10|-31|0xf0eee7,-112|-35|0xe1eff3,-98|-38|0x118dc4,276|-16|0x006599",90,120,196,758,537}
	t['升级-宝石'] = { 0xfeaf00,"148|-67|0x334e,397|2|0xc1fe,471|29|0x1176bc",degree,325,414,1020,611}
	t['升级-宝石-立即升级']={0xffaf00, "0|0|0xffaf00,260|-24|0x00cefc,426|24|0x04a2e4",90,639,523,1147,616}
	t['升级-宝石-不再提示']={0x00334f, "0|0|0x00334f,-16|-10|0x002b43,12|10|0x002b42,-186|68|0xffaf00,195|72|0x00befb",90,357,430,978,577}
	t['升级-宝石-确认']={0xffb100, "0|0|0xffb100,79|-66|0x078b0a,288|3|0x00c0fe",90,349,434,987,585}
	t['升级-宝石不足'] ={0x980e0e, "0|0|0x980e0e,4|0|0xffa700,7|0|0x980e0e",90,1078,189,1111,224}
	t['升级-新手保护确定'] = { 0x1274ba,"-115|-4|0xc7ff,114|4|0xc2ff,241|-23|0xd4ff,461|33|0x1176bc",degree,297,456,1040,615}
	t['升级-新手保护确定']={0x1274ba, "0|0|0x1274ba,64|-11|0x00ccff,257|11|0x00b8f8,422|-16|0x00d2fc",90,369,489,979,594}
	t['升级-宝石-大于100']={0xffffff, "0|0|0xffffff,27|0|0xffffff",90,747,573,808,596}
    t['升级-购买战争之书']={0xffffff, "0|0|0xffffff,-4|-10|0xffb000,-30|-193|0xe33c42,0|-191|0xbc2739,-7|-180|0xfefc76",90,539,272,799,575}

function _升级子程序()
    local i = 0 
    while (d("升级-升级按钮") or d("升级-前往")) and i < 20 do
        i = i+1
		if d("升级-升级按钮",false,1,2)then
			
			local dengji = ocrText(783,171,835,206, 10,'1234567890')
			log({"dengji",dengji})
			if dengji == "" or dengji== nil then
				dengji = 100
			end
			log({"dengji",dengji})
			
			if (dengji=='2' or dengji=='3') and not( d("升级-宝石不足") ) then
				d('升级-宝石-立即升级',true)
				d("升级-宝石-不再提示",true,1,2)
				d("升级-宝石-确认",true,1,2)
			else
				if d("升级-升级按钮",true,1,2)then
				    d('升级-购买战争之书',true)
				    d("升级-新手保护确定",true,1,3)
				    return true
				end
			end
		elseif d("升级-前往",true,1,2)then
			if d("升级-前往-升级箭头",true,1,2)then
			elseif d('升级-正在升级中') or d("升级-正在升级中-修正")then
				return true
			end
		end
	end
end
	
--787,250 建筑小屋
function _build()
	log("升级")
	升级次数 = 升级次数 + 1
	if 升级次数 > 1 then
        _UI.升级 = false
    end

    click(469,218,2)	--点击市政厅

	if d("升级-升级箭头",true,1,2) or d('升级-升级箭头时代',true,1,2) or d('升级-升级箭头时代-iphone7',true,1,2) or d('升级-升级箭头-车厂',true,1,2)
	or d('升级-升级箭头时代-iphone7-9',true,1,2)
	then
        if _升级子程序() then
            d('升级-升级后点帮助',true)
            _UI.升级 = false
        end
	elseif d('升级-正在升级中-总部') then
		_UI.升级 = false
		return true
	end
end

t['第二建筑-钎子']={0x1274a8, "0|0|0x1274a8,-3|-13|0xdeedf2,-158|-3|0xd1f2f2,-142|-14|0x0b87bd",90,638,293,940,434}
t['第二建筑-建筑工人管理-界面']={0xd3d2cb, "0|0|0xd3d2cb,-488|-8|0x858278",90,546,51,1194,142}
    t['第二建筑-建筑工人管理-界面-黄色雇佣按钮']={0xffb200, "0|0|0xffb200,6|-197|0x00d0fc,32|-152|0x079ddf",90,1000,160,1104,477}
    t['第二建筑-建筑工人管理-界面-蓝色建造按钮']={0x1274ba, "0|0|0x1274ba,-1|-38|0x00cef7,-5|17|0x04a6e4,27|0|0x1274ba",90,914,154,1148,511}
    t['第二建筑-建筑工人管理-界面-2个例队正在建筑']={0x0085da, "0|0|0x0085da,-3|179|0x0080d3",90,387,157,423,475}
    
function _build_two()
	log("第二建筑")
	升级次数 = 升级次数 + 1
	if 升级次数 > 4 then
        _UI.建筑列队 = false
	end
	click(787,250,2)	--点击工人小屋
	if d('第二建筑-钎子',1,2)then
	    if d('第二建筑-建筑工人管理-界面')then
	        d('第二建筑-建筑工人管理-界面-黄色雇佣按钮',true,1,2)
	        if d('第二建筑-建筑工人管理-界面-蓝色建造按钮',true,1,2) then
	            if d("升级-前往-升级箭头",true,1,2) then
                    _升级子程序()
	            end
	        elseif d('第二建筑-建筑工人管理-界面-2个例队正在建筑') then
                _UI.建筑列队 = false
            end
        end
	end
end

t['奖励-有奖励'] = { 0xe0ac64,"6|-9|0xfef6a4,34|-41|0xe30000",degree,8,119,109,221}
t['奖励-奖励面板-领取'] = { 0xbf0f,"-58|-16|0xd40f,57|15|0x9e0d",degree,954,173,1137,657}
t['奖励-奖励面板-领取分类'] = { 0x1e6184,"-32|-31|0xe20000",degree,31,112,157,525}
t['奖励-奖励面板-红色-银'] = { 0xc2c4d4,"37|-36|0xe20000",degree,606,155,717,249}
t['奖励-奖励面板-红色-黄'] = { 0xf4b246,"37|-35|0xe20000",degree,1013,148,1166,258}
t['奖励-奖励面板-领取箱子'] = { 0xffff19,"-26|2|0xfec404",degree,292,132,1160,278}
function _Award()
	log("奖励")
	if d("奖励-有奖励",true,1,3)then
		local _jlcs = 1
		while _jlcs< 30 and (d("奖励-奖励面板-领取",true,1,2) or d("奖励-奖励面板-红色-银",true,1,2)or d("奖励-奖励面板-红色-黄",true,1,2)or d("奖励-奖励面板-领取箱子",true) or d("奖励-奖励面板-领取分类",true,1,2)) do _jlcs=_jlcs+1 end
	else
		_UI.奖励 = false
		return false
	end

end


t['造兵-准备训练']={0x0375ac, "0|0|0x0375ac,-151|16|0x1ba80e,-302|-15|0x128bc5",90,50,91,1310,705}
t['造兵-准备训练']={0xd1e6e9, "0|0|0xd1e6e9,-102|7|0x6dd151,-239|-11|0xd9e7ee,-239|-4|0x26a3d8",90,102,261,1240,743}
    t['造兵-训练-可以升级']={0x34bc00, "0|0|0x34bc00,12|-4|0xf2ff00",90,514,114,1029,167}
        t['造兵-训练-可以升级-黄色']={0xb56a00, "0|0|0xb56a00,-2|11|0xffd27f",90,186,142,282,222}
    t['造兵-训练'] = { 0xfafeff,"20|-28|0xcffe,-92|-14|0xc5ff",degree,914,574,1137,659}
    t['造兵-加速'] = { 0xd3d1c9,"-151|515|0x1176bc,-232|500|0xd1ff,-38|545|0xb6f3",degree,858,58,1365,680}
    t['造兵-准备训练-关闭']={0x245aa0, "0|0|0x245aa0,-90|-13|0x0fa2e0,107|-12|0x0fa1e0,142|8|0x002b4d",90,49,202,1323,648}
    
t['造兵-骑兵工厂']={0x1f6198, "0|0|0x1f6198,-4|-3|0xa8553c,-21|22|0xfdd274,-19|26|0x18557d",90,323,6,583,208}
t['造兵-弓兵工厂']={0x0b56ff, "0|0|0x0b56ff,11|16|0xbf9d85,-4|4|0xfda92b,-9|1|0x0a34b1",90,798,47,1005,367}
t['造兵-车兵工厂']={0xffe290, "0|0|0xffe290,22|6|0x0063be,44|6|0xfefcd9,-31|-12|0x00549d,-28|-1|0xffa86d",90,20,159,1317,750}
t['造兵-车兵工厂-车']={0x005cb3, "0|0|0x005cb3,-30|11|0xffbd79",90,977,184,1332,345}
t['造兵-车兵工厂-车-白天']={0x005eb2, "0|0|0x005eb2,-30|2|0xfebf7a",90,910,176,1329,583}
t['造兵-车兵工厂-车-夜里']={0x2048c0, "0|0|0x2048c0,-6|3|0x0a2260",90,962,162,1327,444}
t['造兵-车兵工厂-车-正在生产']={0xe0a00c, "0|0|0xe0a00c,3|-24|0xf3f1f0,123|-9|0x026698,-142|-22|0x0876ab",90,858,223,1333,655}
    t['造兵-资源不足']={0x00c2fe, "0|0|0x00c2fe,384|-383|0xd2d0ca,-13|-382|0x858278,47|-237|0x055171",90,459,79,1102,633}
    t['造兵-资源不足-使用']={0x1274ba, "0|0|0x1274ba,7|-20|0x00cefc,20|22|0x01a4e4",90,908,162,1136,471}
    t['造兵-资源不足-使用*']={0x1274ba, "0|0|0x1274ba,1|13|0x009edf",90,745,175,912,652}
    t['造兵-资源不足-使用-X']={0xd3d2cb, "0|0|0xd3d2cb,-7|-8|0xd8d7ce,-54|21|0xbdbdad,-57|46|0x044a68",90,1026,34,1216,160}
    
function _soldier()
	log("<--造兵-->")
	造兵次数 = 造兵次数 + 1
	if 造兵次数 > 2 then
	    _UI.造兵.key = false
	    return true
	end
	
	local 兵种_ = {
	    ["步兵"]={ 571, 477, 0xecc3a7},
	    ["弓兵"]={ 338, 516, 0xf4caaa},
	    ["骑兵"]={ 923, 554, 0xfed7b5},
	    ["车兵"]={ 1066, 435, 0xffbf80}
	}
	
	for k,v in pairs(兵种_) do
		if _UI.造兵[k] then
		    log('准备造->'..k )
            click( v[1],v[2],2)
			if not (  d('造兵-准备训练') ) then
			    click( v[1],v[2],2)
			else
			    d('造兵-准备训练',true,1,2)
			end
			
			if k ~= "车" and d("造兵-训练-可以升级",true,1,1) and d( "造兵-训练-可以升级-黄色",true,1,2 ) then
			    log("把垃圾兵升级")
			elseif k == "车" then
			    click(657,183)
		    end
			
            if d('造兵-训练',true,1,2) or d('造兵-加速',true,1,2) then
                if d('造兵-资源不足',true,1,2) then
                    d('造兵-资源不足-使用',true,1,2)
                    d('造兵-资源不足-使用*',true,1,2)
                    d('造兵-资源不足-使用-X',true,1,2)
                    d('造兵-训练',true,1,2)
                end
            else
                d("造兵-准备训练-关闭",true)
            end
		    
		end
	end
	
	_UI.造兵.key = false
end


t['建造-有建造'] = { 0xe20000,"20|-4|0xe20000",degree,75,511,116,557}
t['建造-装饰'] = { 0x656257,"-29|-37|0xe30000",degree,3,602,97,700}
t['建造-可以建造'] = { 0x255273,"-132|1|0x9ee6ff,111|1|0x9ee6ff",degree,134,469,419,665}
t['建造-可以建造分类'] = { 0x757568,"-42|-34|0xe20000",degree,3,478,99,570}
t['建造-准备建造'] = { 0x89a05,"-131|4|0xe50909,-171|-35|0xf27979,-151|6|0xf3e9e5",degree,6,2,1252,744}
t['建造-准备建造2']={0x049304, "0|0|0x049304,-133|0|0xe70b0b,31|-30|0x42bf26,2|-33|0xe5f3e1",90,100,55,1137,705}
	t['建造-建造取消'] = { 0xd3d1c9,"-24|242|0xd0ff,-30|441|0xffb000,-187|466|0xfca000",degree,898,58,1169,681}
t['建造-编辑城市'] = { 0xd59813,"24|-16|0xe20000",degree,1115,145,1210,286}
t['建造-编辑城市']={0xd4a434, "0|0|0xd4a434,23|-17|0xe10000",90,1100,151,1234,262}

function _NewBuild()
	log("建造")
	建造次数 = 建造次数 + 1
	if 建造次数 > 8 then
	    _UI.建造 = false
	end
	if d('建造-有建造')then
		click(64,564,2)
		d("建造-装饰",true,1,2)
		click(53,411,2)
		
		while d("建造-可以建造") or d("建造-可以建造分类",true,1,2)do
			if d("建造-可以建造",true,1,2) then
				if d('建造-准备建造',false,1,10) or d('建造-准备建造2',true,1,10) then
					log({x,y})
					if x > 1000 then
						moveTo(600,300,400,300,5)
						delay(2)
					elseif x< 300 and  y < 100 then
					    moveTo(600,100,600,300,5)
					    delay(2)
					end
					d('建造-准备建造',true,1,2)
					d('建造-准备建造2',true,1,2)
					if d('建造-建造取消',true,1,2)then
						_UI.建造 = false
						return false
					end
				else
					_NewBuild_lun = _NewBuild_lun or 0
					_NewBuild_lun = _NewBuild_lun + 1
					if _NewBuild_lun%4 == 0then
						moveTo(600,300,400,300,5)--向左
					elseif _NewBuild_lun%4 == 1then
						moveTo(400,300,600,300,5)--向右
					elseif _NewBuild_lun%4 == 2then
						moveTo(300,500,300,300,5)--向上
					elseif _NewBuild_lun%4 == 3then
						moveTo(400,100,400,300,5)--向下
					end
					delay(0.5)
					d('建造-准备建造',true,1,2)
					if d('建造-建造取消',true,1,2)then
						_UI.建造 = false
						return false
					end
				end
			end
		end
		d('建造-编辑城市',true,1,2 )
	else
		_UI.建造 = false
	end
end


t['草-夜'] = { 0x378a56,"22|39|0x328057,17|3|0x51c1a,15|18|0xd131e",degree,9,6,1252,742}
t['草-白'] = { 0xabf54d,"20|41|0xa2eb50,16|5|0x133618,-10|12|0xd3117",degree,10,6,1242,741}
t['树-白'] = { 0xaefb4f,"-31|-59|0x6ba83a,12|-38|0x143516,41|-23|0x82c146",degree,6,3,1242,738}
t['树2-白']={0xa4eb4c, "0|0|0xa4eb4c,0|-30|0x1d411b,20|0|0x1a4220,-22|3|0xa0e74e,-41|-11|0x174925",degree,6,3,1242,738}
t['树2-白']={0xaaf652, "0|0|0xaaf652,-26|-13|0x173f1a,-36|-6|0xaaf44f,-19|-40|0xaefa4f,14|-6|0x1b421f",90,177,26,1310,663}
t['树-枫树']={0xff8a52, "0|0|0xff8a52,-8|4|0x383026,-20|-30|0xff9b54,20|-24|0x844f34,20|-16|0xffaf5e",90,177,26,1310,663}
t['草-铲子'] = { 0xeb3535,"-24|24|0xe50909,-162|2|0xe4f1f4,-155|-12|0x28a4dc",degree,5,4,1244,742}
t['草-铲子-是'] = { 0x1274ba,"-98|-19|0xd2ff,473|9|0xbffc",degree,331,450,1019,600}
function _glass()
	log("除草")
	除草次数 = 除草次数 + 1
	if 除草次数 < 4 then
    	for i=1,12 do
    		if d("树-白",false,1,2) or d('草-夜',false,2,2) or d('草-白',false,2,2) or d("树2-白",false,1,2) or d('树-枫树',false,1,2)then
    			
    			if x < 100 then
    				moveTo(300,600,500,600,10)
    				delay(2)
    			end
    			if y > 500 then
    				moveTo(300,600,300,400,10)
    				delay(2)
    			end
    			
    			if d("树-白",true,1,2) or d("树2-白",true,1,2)or d('草-夜',true,2,2) or d('草-白',true,2,2)or d('树-枫树',true,1,2)then
    				log({x,y})
    				if d("草-铲子",true)then 
    					d("草-铲子-是",true)
    				end
    			end
    		end
    	end
    end
end

t['签到-vip'] = { 0xffb400,"36|-13|0xe20000",degree,128,45,203,88}
t['签到-领取'] = { 0xc40e,"-47|-18|0xc80e,44|21|0xc760a",degree,855,121,1126,489}
t['签到-领取-红'] = { 0,"13|7|0xcddce2,13|-55|0xe20000",degree,987,141,1136,254}
t['签到-领取-黄'] = { 0xf5b347,"37|-34|0xe20000",degree,767,526,877,629}
t['签到-领取-绿']={0x258c08, "0|0|0x258c08,-51|-12|0x00d00f,44|15|0x01a60d",90,900,386,1052,472}
t['签到-领取-红左']={0x0085bd, "0|0|0x0085bd,-1|-87|0xe30000",90,118,344,152,539}
t['签到-红点']={0xf6c369, "0|0|0xf6c369,38|-25|0xe20000",90,772,518,880,617}
t['签到-有红点提示']={0xd90000, "0|0|0xd90000,3|-1|0xd50000",90,183,44,205,58}
function _SignIn()
	log("签到")
	if d("签到-vip",true,1,2)then
		if d("签到-领取-黄",true,1,2)then
		elseif d("签到-领取",true,1,2)then
		elseif d("签到-领取-红",true,1,2)then
		elseif d("签到-领取-绿",true,1,2)then
		elseif d("签到-领取-红左",true,1,2)then
    	    local i=0
    	    while d("签到-领取-红左",true,1,2) and i< 10 do
    		    i=i+1
    		    d('签到-红点',true,1,2)
    	    end
		end
		
		local i=0
	    while d('签到-有红点提示') and i< 10 do
	        i=i+1
	        click(132, 442)
	        d('签到-红点',true,1,2)
	    end
	end
end


t['收集-玉米'] = { 0xffff6b,"-5|-3|0xffe731,6|8|0x7fe81d,-10|18|0x236602,-12|6|0x5bc40f",70,94,50,1208,716}
t['收集-玉米']= {0x459b12, "0|0|0x459b12,5|-18|0xfff13c,0|-10|0xfec92d,-8|10|0x28700c",80,20,85,1250,745}
t['收集-玉米7']={0xfffc5e, "0|0|0xfffc5e,3|8|0x9bf127,-10|3|0xa2eb24,-8|12|0x49b10a",90,63,50,1307,691}
t['收集-木材'] = { 0xe0e0e1,"-5|-20|0xd3955f,12|-34|0x7a2f0a,2|-35|0xe1702b",70,20,85,1250,745}
t['收集-木材']={0xedae69, "0|0|0xedae69,16|-6|0x8b370f,15|2|0x762805,-8|10|0xc77847",90,20,85,1250,745}
t['收集-木材黄'] = { 0x6e2a08,"-19|2|0xecb87b,-16|21|0xd0905c,-5|7|0x92380b",degree,21,43,1232,712}
t['收集-石头'] = { 0xd8dfee,"0|-7|0x969fb7,-15|10|0x9da6c1,-16|16|0x606a83,12|11|0x485168",80,50,20,1250,736}
t['收集-握手'] = { 0xdedee0,"8|-19|0x2f9c01,0|-36|0xfcf2e1,-12|-41|0xffe67e,-12|-25|0x33a600",70,54,85,1224,723}
t['收集-握手']={0xfeeee1, "0|0|0xfeeee1,-2|-14|0x188ecd,3|13|0x067bbf,2|8|0xd06252,15|0|0x9f5110",90,54,85,1224,723}
t['收集-帮助']={0xfff4e3, "0|0|0xfff4e3,24|-16|0xe20000",70,1251,453,1324,543}
t['收集-金币']={0xd77100, "0|0|0xd77100,4|-5|0xe49700,-4|-9|0xfbbd00,-5|-15|0xffee00,15|-8|0xfdf700",90,122,92,1218,652}
function _Collect()
	log("收集")
	收集次数 = 收集次数 + 1
	if 收集次数 < 3 then
    	local 收集 = {"收集-玉米","收集-玉米7","收集-木材","收集-石头","收集-握手","收集-木材黄","收集-金币"}
    	for k,v in ipairs(收集) do
    		d(v,true,2,2)
    	end
    end
end


t['英雄-放大镜'] = { 0xd8edf6,"7|6|0x1188bb,17|33|0x6093,-16|43|0xcce6ea,-20|29|0x6195",degree,415,475,515,570}
t['英雄-放大镜']={0x056599, "0|0|0x056599,-2|-49|0x3bb3e6",90,406,460,520,578}
    t['英雄-开启'] = { 0x1274ba,"-93|-24|0xd3ff,111|25|0xb3ef,47|32|0x1176bc",degree,213,531,1107,705}
    t['英雄-开启-大号']={0x1274ba, "0|0|0x1274ba,5|-6|0x00c7ff",90,23,571,1312,701}
    t['英雄-开启-确定'] = { 0x1274ba,"-76|-23|0xd1ff,105|20|0xb6f3,570|5|0xffac00",degree,270,596,1080,700}

function _Hero()
	log("英雄")
	英雄次数 = 英雄次数+ 1
	if 英雄次数 > 2 then
	    _UI.英雄 = false
    end
	click(314,344,2)
	if d("英雄-放大镜",true,1,2)then
		local _opentimes = 0
		while (d("英雄-开启",true,1,5) or d("英雄-开启-大号",true,1,3) or d("英雄-开启-确定",true,1,3)  ) and _opentimes < 10 do
			_opentimes = _opentimes + 1
		end
		_UI.英雄 = false
	end
end

t['采矿-放大镜'] = { 0xe5984,"-5|-15|0xfdffff,-1|22|0x5585,11|13|0x7ce7ff",degree,13,507,107,613}
t['采矿-放大镜']={0xb4f1f0, "0|0|0xb4f1f0,10|0|0x136fa0,-9|27|0x00537c",90,9,504,112,610}
t['采矿-搜索'] = { 0x1274ba,"-69|-29|0xd3fe,81|23|0xb4f0",degree,130,454,1201,605}
	t['采矿-搜索-攻击'] = { 0x970e0e,"-104|-23|0xe94d3d,63|29|0xc12724,-103|24|0xd4302b",degree,167,94,1195,732}
	t['采矿-搜索-采集'] = { 0x1273b9,"-85|-29|0xd1fc,93|31|0x1175bb,88|-25|0xd2fe",degree,73,51,1233,739}
	t['采矿-搜索-采集']={0x1274ba, "0|0|0x1274ba,94|-23|0x08d5fe,-63|17|0x00b0ee",90,73,51,1233,739}
t['采矿-创建部队'] = { 0x1375ba,"-82|-24|0xd3fd,86|33|0x1175bb",degree,927,14,1195,727}
t['采矿-创建部队']={0x1274ba, "0|0|0x1274ba,-73|-16|0x03d0ff,90|19|0x00b8f6",90,884,12,1325,570}
    t['打野-创建部队-正在返回']={0xb75f02, "0|0|0xb75f02,7|-5|0xfcf8f5,14|-8|0xb25b00",90,1209,58,1322,309}
    t['打野-创建部队-驻扎']={0xffffff, "0|0|0xffffff,-3|-6|0x008ec2,15|1|0x00d3fb",90,1212,41,1323,450}
    t['打野-创建部队-行军']={0xb67016, "0|0|0xb67016,-90|-10|0xffba00,63|22|0xffa500",90,926,64,1319,394}
    t['打野-创建部队-正在回来敌弱我强']={0xffb200, "0|0|0xffb200,28|-6|0xb67016,12|-47|0x24ac36",90,943,93,1162,254}
    t['行军-已经部队-驻扎']={0xffffff, "0|0|0xffffff,-4|-4|0x00d6ff,6|5|0x008ec2,7|6|0x00d7ff,5|0|0x008ec2",90,1276,190,1318,284}
t['采矿-行军'] = { 0xfdae00,"118|-1|0xfeae00,-118|-6|0xfdb100,-340|-14|0xcafd,-208|8|0xbcf8",degree,612,603,1164,719}
    t['采矿-行军-打不过']={0xfbf1f2, "0|0|0xfbf1f2,-3|2|0xe3680e",90,863,579,1059,620}
t['采矿-行军2']={0xb67016, "0|0|0xb67016,57|-2|0xffb500,-230|5|0x00c4ff",90,706,577,1274,709}

t['打野-增加开关']={0x1073bd, "-99|93|0x00c0fc,-287|-1|0x1172ba",90,77,369,1200,564}
t['打野-七世']={0x57c0f1, "0|0|0x57c0f1,1|3|0x72d8ff,3|8|0x59c2f1",90,462,138,498,175}
    t['打野-切换英雄']={0x3395d6, "0|0|0x3395d6,0|-11|0x3097d6",90,187,455,222,492}
        t['打野-切换英雄-七世']={0xffdcbb, "0|0|0xffdcbb,20|5|0xfdf67e,25|12|0x5a5dee,-26|3|0xc76d1b,-33|13|0x343999",90,12,97,265,623}
t['打野-搜索']={0x1274ba, "0|0|0x1274ba,10|0|0x06c3fc,-71|-15|0x04d0ff,90|21|0x02aff1",90,632,302,1231,617}

t['打野-正在行军']={0xffffff, "0|0|0xffffff,2|5|0x4ef96a,2|-17|0x4ffd6c,7|-5|0x0c9900,6|-5|0xffffff",90,1276,165,1324,460}
t['打野-正在行军-返回']={0xdb8100, "0|0|0xdb8100,6|2|0xfefefd,7|14|0xb45d00",90,1268,167,1322,279}
t['打野-正在行军-返回-iphone6']={0xc97612, "0|0|0xc97612,5|5|0xfdfaf7,5|10|0xb25c01",90,1288,237,1311,266}
    t['打野-正在挖矿']={0xfeffff, "0|0|0xfeffff,2|13|0x4ff86c,6|0|0x0d9a00,13|2|0x4ff169,-66|-83|0x37e7fd",90,1200,151,1330,285}
    t['打野-正在挖矿']={0xfeffff, "0|0|0xfeffff,5|-1|0x109800,1|4|0x0f9a00,1|13|0x4ffc6b",90,1221,161,1331,458}
    t['打野-敌弱我强']={0x06fd30, "0|0|0x06fd30,0|-3|0x06fd30",90,863,589,1051,615}
t['打野-正在战斗']={0xb20000, "0|0|0xb20000,-2|0|0xb20000",90,1279,231,1317,271}
t['打野-体力不足']={0xdaaf00, "0|0|0xdaaf00,-17|-11|0xf18d04,-35|8|0x63e819",90,395,125,485,182}
t['打野-体力不足2']={0xd3d1cb, "0|0|0xd3d1cb,-188|190|0x0af94b,-343|411|0xffad00,-554|175|0xac1c14",90,340,77,1114,601}
t['打野-体力不足-iphone7']={0x71f50f, "0|0|0x71f50f,5|-5|0xa9ff56,-7|-9|0x03384e",90,359,125,457,181}
    t['打野-体力不足-免费体力']={0x218701, "0|0|0x218701,-48|-16|0x00cf0f,96|24|0x00b60e",90,891,196,1147,334}
    t['打野-体力不足-吃体力']={0x1274ba, "0|0|0x1274ba,-48|-12|0x00ccfe,95|18|0x00b8f3",90,903,222,1140,613}
        t['打野-体力不足-吃体力*']={0x1274ba, "0|0|0x1274ba,2|-15|0x00d2ff,4|-30|0xcedee5",90,751,208,907,665}
t['打野-创建部队-驻扎']={0x008fc3, "0|0|0x008fc3,6|4|0xffffff,7|3|0x1c9aca,-6|3|0xffffff,-7|3|0x008ec2,6|-4|0xffffff",90,1269,164,1327,654}
    

function _monster()
	log("打野")
	log({"打野次数记数",打野次数记数,"_UI.打野次数",_UI.打野次数})
	
	local 采集位置={{269,665,0xb3b0b0},{474,661,0x428a22},{675,662,0xc28f71},{861,659,0x585858},{1064,661,0x878787},}
	while d('采矿-放大镜') and 打野次数记数 < _UI.打野次数 and _UI.打野 do
	    打野次数记数 = 打野次数记数 + 1
		local i = 1
	    while i < 300 and ( d('打野-正在行军') or d('打野-正在战斗') or d('打野-正在行军-返回',true,1,5) or d('打野-正在行军-返回-iphone6',true,1,5) )  
	    and d('采集-已经有队伍') and d('采集-已经有队伍-正确') and _UI.打野 do
		    delay(1)
		    i=i+1
	    end
	    
        local dwshu_min = { "采集-已经有队伍-1", "采集-已经有队伍-2", "采集-已经有队伍-3", "采集-已经有队伍-4","采集-已经有队伍-5" }
        local dwshu_max = { "采集-已经有队伍-1-max", "采集-已经有队伍-2-max", "采集-已经有队伍-3-max", "采集-已经有队伍-4-max","采集-已经有队伍-5-max" }
        
        if d('采集-已经有队伍') and d('采集-已经有队伍-正确') and DWs(dwshu_min) == DWs(dwshu_max) and not(d("行军-已经部队-驻扎")) then
            _UI.打野 = false
            return false
        end
	
		if 打野次数记数 >=  _UI.打野次数  then
    	    _UI.打野 = false
    	    return false
		end
	
		d('采矿-放大镜',true,1,2) 
        
        if tonumber(_UI.monsterlevel) == 1  then

            if 打野降低key then
                d('打野-增加开关',true,3,1)
                打野降低key = false
            elseif 打野增长key then
                d('打野-增加开关',true)
                d('打野-增加开关',true)
                d('打野-增加开关',true)
            end
            
        else
            t['打野位置记忆位置']={0xacffff, "0|0|0xacffff,-1|-9|0xb9ffff,-1|9|0xa1ffff",80,161,395,412,446}
            t['打野位置记忆位置-max']={0xa5f5f5, "0|0|0xa5f5f5,7|-1|0x1573af,-8|0|0x1573af",70,339,395,449,441}
            --打野调格记忆
            dayeweizi_M = dayeweizi_M or false;
            --打野调格记忆色彩
            dayeweizi_M_c = dayeweizi_M_c or '';
            if dayeweizi_M and dayeweizi_M_c == getColor(dayeweizi_M[1], dayeweizi_M[2]) then
                --不需要调整
            else
                click( 采集位置[1][1],采集位置[1][2],2 )
                --设置好打野的位置
                d('采集-采集前调低',true,1,1)
                for i = 2,tonumber( _UI.monsterlevel ) do
                    d('打野-增加开关',true,1,0.2)
                end
                
                if d('打野位置记忆位置')  or d('打野位置记忆位置-max') then
                    dayeweizi_M = {x,y}
                    dayeweizi_M_c = getColor(x, y)
                end
            end
            
        end
        
		if d("采矿-搜索",true,1,3)then
			click(663,367,2)	--点屏中间
			log('点屏中间')
			if d("斥候-搜索-绿")then
				log("未开荒")
				_UI.采集.key = false
				return false
			end
			if d('打野-搜索',true)then
			    打野增长key = false
			     d("采矿-搜索",true,1,3)
			else
    			d("采矿-搜索-攻击",true,1,3)
    			
    			if d("采矿-创建部队",false,1,2)  then
    			    d('打野-创建部队-驻扎',true,1,2)
    			    d('打野-创建部队-行军',true,1,3)
    			end
    			
    			d("采矿-创建部队",true,1,3)
    -- 			if d('打野-创建部队-正在回来敌弱我强',true,1,2) then
    			if d('打野-创建部队-正在回来敌弱我强',false,1,2) then
    			    --如何有多个部队就一起攻击
        			if d("远征-战斗界面-有多个部队")then
                        click(1227,710)
                        d("远征-战斗界面-有多个部队-行军",true,1,3)
                    else
                        d('打野-创建部队-驻扎',true,1,2)
        		        d('远征-战斗界面-单个部队-行军',true,1,3)
        			end
    		    end
    			 
                if d("采矿-行军")  then
                    
                    if _UI.monsteDW ~= '默认' then
                        local monsteDW_ = { ['位置1'] = 0 ,  ['位置2'] = 1 ,  ['位置3'] = 2 ,  ['位置4'] = 3 ,  ['位置5'] = 4 }
                        click(1150,277 + monsteDW_[_UI.monsteDW] * 60 )
                    end
                    
                    if tonumber(_UI.monsterlevel) > 1 and d("采矿-行军",true,1,3) then
                    elseif d('打野-敌弱我强') and d("采矿-行军",true,1,3) then
                	else
                	    打野增长key = false
                	    打野降低key = true
                    end
                   
                end
    			
				--查看是否还有体力
				log('打野一次','all')
			    if d('打野-体力不足') or d('打野-体力不足2',true,1,2) or d('打野-体力不足-iphone7')then
			        if d("打野-体力不足-免费体力",true)then
			        elseif _UI.打野吃体力 and d("打野-体力不足-吃体力",true,1,2) then
			            d("打野-体力不足-吃体力*",true,1,2)
			        else
    			        log('体力不足,结束打野','all')
    			        _UI.打野 = false
    			    end
    			    return
			    end
			    delay(10)
    			d('弹窗-设置面板x',true,2)
    		end
		end
	end
end


t['采集-采集前调低']={0x0eab00, "0|0|0x0eab00,-42|-1|0x0f74be,63|89|0x00c3ff,244|-1|0x1073bd",90,20,363,1335,606}
    t['采集-已经有队伍']={0x1fc9f7, "0|0|0x1fc9f7,-8|11|0x11b9ec",90,1209,162,1249,195}
    t['采集-已经有队伍-正确']={0xfbfcfa, "0|0|0xfbfcfa",90,1264,167,1291,184}
    t['采集-已经有队伍-1']={0xfefefe, "0|0|0xfefefe,0|4|0xf3f3f3,0|11|0x000000,4|11|0x15180c",90,1262,166,1275,184}
    t['采集-已经有队伍-2']={0xffffff, "0|0|0xffffff,0|2|0x000000,5|2|0x020404,0|-8|0x121212,3|-8|0xf7f7f7",90,1262,166,1275,184}
    t['采集-已经有队伍-3']={0xffffff, "0|0|0xffffff,0|-3|0x040404,0|-5|0xfefefe,3|-8|0xffffff,0|-8|0x0a0a0a",90,1259,165,1274,185}
    t['采集-已经有队伍-4']={0xfafafa, "0|0|0xfafafa,1|-9|0xffffff,-5|-3|0xf9faf9",90,1261,167,1276,186}
    t['采集-已经有队伍-5']={0xf5f6f3, "0|0|0xf5f6f3,5|0|0xfbfcfa,5|6|0xffffff,2|10|0xffffff,1|6|0x191919",90,1261,167,1276,184}
    --最大值
    t['采集-已经有队伍-1-max']={0xfefefe, "0|0|0xfefefe,0|4|0xf3f3f3,0|11|0x000000,4|11|0x15180c",90,1280,169,1295,185}
    t['采集-已经有队伍-2-max']={0xffffff, "0|0|0xffffff,0|2|0x000000,5|2|0x020404,0|-8|0x121212,3|-8|0xf7f7f7",90,1280,169,1295,185}
    t['采集-已经有队伍-3-max']={0xffffff, "0|0|0xffffff,0|-3|0x040404,0|-5|0xfefefe,3|-8|0xffffff,0|-8|0x0a0a0a",90,1280,169,1295,185}
    t['采集-已经有队伍-4-max']={0xfafafa, "0|0|0xfafafa,1|-9|0xffffff,-5|-3|0xf9faf9",90,1280,169,1295,185}
    t['采集-已经有队伍-5-max']={0xf5f6f3, "0|0|0xf5f6f3,5|0|0xfbfcfa,5|6|0xffffff,2|10|0xffffff,1|6|0x191919",90,1280,169,1295,185}
    
t['采集-行军-有兵']={0x0aba00, "0|0|0x0aba00,0|-1|0x0bc200",90,574,134,1107,584}
t['采集-行军-有兵-新']={0x03364c, "0|0|0x03364c,0|-14|0x04435e",90,975,167,1097,513}
t['采集-行军-有兵-6']={0x04394f, "0|0|0x04394f,0|-14|0x044864",90,975,167,1097,513}
        t['采集-行军-有兵-最大']={0x1274ba, "0|0|0x1274ba,160|21|0xffa700,348|-11|0xffba00",90,571,580,1150,713}

t['采矿-搜索-采集-iphone7']={0x1274ba, "0|0|0x1274ba,-64|-17|0x00cffe,92|20|0x00b7f3",90,81,121,1236,661}
t['采矿-创建部队']={0x1476bb, "0|0|0x1476bb,-36|-17|0x00d0ff,119|5|0x00c2fe",90,934,2,1194,497}

t['采矿-有人行军中']={0xeeeeee, "0|0|0xeeeeee,0|-3|0x507274,5|1|0x4e7173,3|3|0xd6dada,-3|3|0xe1e1e1",80,526,272,809,463}
t['采矿-有人行军中2']={0xececec, "0|0|0xececec,0|7|0xf4f4f4",80,526,272,809,463}
t['采矿-有人行军中3']={0xeeeeee, "0|0|0xeeeeee,-2|-3|0xeaeae9,-3|1|0xe7e8e5,0|4|0x91a954,4|-2|0xe2e3df",80,526,272,809,463}

function DWs(dwshu)
    for k,v in ipairs( dwshu ) do
        if d(v) then return k end
    end
end






function _Collection()
	log("采集")
	采矿次数 = 采矿次数 + 1
	if  采矿次数 > 12 then
	    _UI.采集.key = false
	end
	if _UI.采集.key then
		local 采集位置={{466, 662, 0x8ab039},{661, 667, 0xe1ba7b},{868, 664, 0x404355},{1069, 667, 0x747474}}   --玉米.木材,石头,金币,随机( 不采金币 )
		
	    --查询是否要采集
	    if d('采集-已经有队伍') and d('采集-已经有队伍-正确') then
            local dwshu_min = { "采集-已经有队伍-1", "采集-已经有队伍-2", "采集-已经有队伍-3", "采集-已经有队伍-4","采集-已经有队伍-5" }
            local dwshu_max = { "采集-已经有队伍-1-max", "采集-已经有队伍-2-max", "采集-已经有队伍-3-max", 
                "采集-已经有队伍-4-max","采集-已经有队伍-5-max" }
            --查询是否最大例队
            if DWs(dwshu_min) == DWs(dwshu_max) then
                _UI.采集.key = false
                return true
            end
	    end
        
        if _UI.采集.联盟矿场 and _联盟采矿() then
            --开始采集程序
		elseif d('采矿-放大镜',true,1,2)then
            --计算出采集的长度
            local cj_mun = #_UI.采集.种类
            _Coll_key_mun = _Coll_key_mun or 0
            _Coll_key_mun = _Coll_key_mun + 1
            --计算出采集的种类
			local _Coll_key = _Coll_key_mun%cj_mun+1
			click( 采集位置[_UI.采集.种类[_Coll_key]+1][1],采集位置[_UI.采集.种类[_Coll_key]+1][2],2 )
			
			--准备点采集
			if d("采矿-搜索",false,1,3)then
			    if 采矿调低一次 then
			        d('采集-采集前调低',true,1,1)
			        if _UI.采集.采矿等级 > 1 then
			            for i=2, tonumber(_UI.采集.采矿等级) do
			                d('打野-增加开关',true)
			                _Coll_key_mun = _Coll_key_mun + 1
			            end
			        end
			        采矿调低一次 = false
			        
			    else
			        d('打野-增加开关',true)
			    end
			end
			
			--调的过高后重新来一次
			if _Coll_key_mun%6 == 0 then
			    采矿调低一次 = true
			end
			--点击点矿后的搜索
			if d("采矿-搜索",true,1,3)then
				click(663,367,2)	--点屏中间
				if d("斥候-搜索-绿")then
					log("未开荒")
					_UI.采集.key = false
					return false
				end
				d("采矿-搜索-攻击",true,1,2)
				d("采矿-搜索-采集",true,1,2)
				d('采矿-搜索-采集-iphone7',true,1,2)
			end	
		end
        -- 创建部队前
		if d("采矿-创建部队",false,1,2)  then
		    --不再把造旗的带回来
            if d('行军-已经部队-驻扎',true,1,2) then
                d('打野-创建部队-行军',true,1,3)
            end
		end
		
        --创建部队
		d("采矿-创建部队",true,1,2)
		if d("采矿-行军")  then
            if d("采矿-行军") or d('采矿-行军2') then
                if d('采集-行军-有兵-新') or d("采集-行军-有兵-6") then
                    d("采矿-行军",true)
                    d('采矿-行军2',true)
                else
                    _UI.采集.key = false
                    d('弹窗-设置面板x',true,2)
                end
            end
        end
    end
end

local 斥候位置={{808,404,0xb2004},{952,564,0x97fb8},}
t['斥候-搜索'] = { 0xffac00,"-91|-29|0xffbf00,83|16|0xffa500",degree,894,263,1159,761}
t['斥候-搜索-绿'] = { 0xb67016,"-75|-29|0xffc000,94|22|0xffa400",degree,97,25,1230,722}
t['斥候-搜索-派遣'] = { 0xb67016,"-8|-19|0xffbe00,-93|-20|0xffbe00,79|25|0xffa500",degree,916,7,1195,572}
t['斥候-搜索-派遣中'] = { 0xffffff,"5|-5|0xb66200,-22|-36|0xbc13eb",degree,1224,158,1332,436}
t['斥候-休息中'] = { 0xffffff,"7|1|0x7d7d7d,-1|-13|0x7d7d7d,3|8|0xbdbdbd",degree,406,331,471,419}
function _Acouts()
	log("斥候")
	斥候次数 =  斥候次数 + 1
	if  斥候次数 >= 9999 then
	    _UI.斥候 = false
	end
	click(斥候位置[1][1],斥候位置[1][2],2)
	click(斥候位置[2][1],斥候位置[2][2],2)
	
	if d("斥候-搜索",true,1,2)then
		d("斥候-搜索-绿",true,1,2)
		d("斥候-搜索-派遣",true,1,2)
		if d("斥候-搜索-派遣中")then
			
		end
	elseif d("斥候-休息中")then
		_UI.斥候 = false
	end
end

t['医院+']={0xf72224, "0|0|0xf72224,-8|0|0xfa1717",70,558,177,776,355}
t['医院-治疗'] = { 0xc2ff,"100|-25|0xd1ff,-160|25|0xfea200,-399|-28|0xfebf00",degree,566,549,1153,669}
t['医院-治疗-无资源']={0xd3d2cb, "-291|155|0x0c2d3d,-250|522|0x00c1ff,-266|513|0x1176bc",90,666,35,1189,685}
t['医院-治好'] = { 0x9d4400,"9|0|0x9a4300,26|-4|0xc86600",75,609,228,703,335}
t['医院-治好']={0xcf7f01, "0|0|0xcf7f01,-29|-18|0xeffa00",90,583,205,740,373}
t['医院-治好2']={0xd4980d, "0|0|0xd4980d,-35|-11|0xedeb04,-9|-11|0xeeec05",90,610,230,731,344}
t['医院-治好-iphone7']={0xc96600, "0|0|0xc96600,-16|-20|0xecff00",90,567,222,722,334}
t['医院-治好-无']={0xfefffe, "0|0|0xfefffe,-18|-2|0x2861ae,-104|276|0x0d88bf,159|292|0x0078b5",90,416,127,865,557}

function _Hospital()
	log("医院")
	if d("医院+",true,1,2)then
		d("医院-治疗",true,1,2)
		if d('医院-治疗-无资源',true,1,2) then
		    return false
        end
	elseif d("医院-治好",true,1,2)then
	    d("医院-治好-无",true,1,2)
	elseif d("医院-治好2",true,1,2)then
    elseif d("医院-治好-iphone7",true,1,2)then
	else
		return false
	end
end

t['邮件-邮件']={0x6ae6ff, "0|0|0x6ae6ff,-8|-5|0x156793",90,1259,573,1305,615}
    t['邮件-邮件-报告未激活']={0x858278, "0|0|0x858278,2|17|0xc3c0b4",90,222,22,300,92}
    t['邮件-邮件-报告激活']={0xffffff, "0|0|0xffffff,-5|7|0x0895da",90,176,4,339,84}
        t['邮件-邮件-报告激活-探索报告']={0x1f76d4, "0|0|0x1f76d4,42|18|0x431c11",90,48,90,273,226}
        t['邮件-邮件-报告激活-探索报告-7']={0x007ff7, "0|0|0x007ff7,23|15|0xf6c7b0,36|14|0x3d1309",90,38,98,277,203}
            t['邮件-邮件-报告激活-探索报告-有奖励']={0x208600, "0|0|0x208600,-55|-18|0x05d212",90,701,490,1059,616}
            t['邮件-邮件-报告激活-探索报告-删除']={0x6e5733, "0|0|0x6e5733,-34|1|0xdfbf8c,-30|1|0x9d8057,-34|-6|0xdab685",90,558,667,1148,719}
            t['邮件-邮件-报告激活-探索报告-删除-7']={0x735b36, "0|0|0x735b36,2|-3|0xc9a56c,-20|3|0xdbbc8a,-27|2|0xdcbc8a,-40|3|0xdbbc8a",90,585,665,1083,721}
        t['邮件-邮件-报告激活-探索报告-部落村庄']={0xf9f8f6, "0|0|0xf9f8f6,-8|11|0x69522f,-636|12|0xffcb50,-620|-14|0xffd44f",90,517,278,1256,649}
            t['邮件-邮件-报告激活-探索报告-部落村庄-太棒了']={0x1274ba, "0|0|0x1274ba,-52|-20|0x00cefb",90,488,140,1153,655}
        t['邮件-邮件-报告激活-探索报告-神秘山洞']={0xfcfcfb, "0|0|0xfcfcfb,-12|9|0x68512e,-622|-1|0x323b3a,-616|-8|0x947c68",90,496,236,1269,659}
        t['邮件-邮件-报告激活-探索报告-其它']={0xf9f9f7, "0|0|0xf9f9f7,9|-6|0x725732,-20|14|0x68512d",90,1160,253,1248,658}
            
t['邮件-有邮件提醒']={0x156793, "0|0|0x156793,18|14|0x80e7ff,42|-12|0xde0000",90,1260,541,1333,623}
    t['邮件-邮箱界面']={0xd2b890, "0|0|0xd2b890,26|-2|0x79603a,228|-11|0xd7bd94,228|-1|0x9b855f",90,13,653,455,721}
        t['邮件-邮箱界面-有红点']={0xc4c0b4, "0|0|0xc4c0b4,70|-1|0xdb0000",90,45,3,1234,43}
        
t['邮件-邮件x']={0xd2d1cb, "0|0|0xd2d1cb,-8|-7|0xd3d2c9",90,1256,25,1314,67}

function read_mail()
    log('领邮件奖励')
    领邮件奖励 = 领邮件奖励 + 1
    if 领邮件奖励 > 1 then
        _UI.搜索村庄 = false
    end
    if d('邮件-邮件',true,1,4)then
        local mailtime = os.time()
        local 派遣次数 = 0
        while d('邮件-邮箱界面')  and _UI.读邮件 and os.time() - mailtime < 50 do
            d('邮件-邮件-报告未激活',true,1,2)
            if d('邮件-邮件-报告激活') then
                if d('邮件-邮件-报告激活-探索报告') or d('邮件-邮件-报告激活-探索报告-7') then
                    if d('邮件-邮件-报告激活-探索报告-部落村庄',true,1,3)then
                        click(661,369,2)
                        d('邮件-邮件-报告激活-探索报告-部落村庄-太棒了',true,1)
                        d('邮件-邮件',true,1,2)
                    elseif d('邮件-邮件-报告激活-探索报告-神秘山洞',true,1,2)then
                        click(661,369,2)
                        d('邮件-邮件-报告激活-探索报告-部落村庄-太棒了',true,1)
                        if d("斥候-搜索-派遣",true,1,2)then
                            派遣次数 = 派遣次数 + 1
                            if 派遣次数 >= 1 then
                                _UI.搜索村庄 = false
                            end
                        end
                        d('邮件-邮件',true,1,2)
                    elseif d('邮件-邮件-报告激活-探索报告-其它',true,1,3)then
                        d('邮件-邮件',true,1,2)
                    else
                        d('邮件-邮件-报告激活-探索报告-有奖励',true)
                        d('邮件-邮件-报告激活-探索报告-删除',true,1,3)
                        d('邮件-邮件-报告激活-探索报告-删除-7',true,1,2)
                    end
                else
                    log('不是报告')
                    if d('邮件-邮件-报告激活-探索报告-删除',true,1,3)then
                    elseif d('邮件-邮件-报告激活-探索报告-删除-7',true,1,2)then
                    end
                end
            end
        end
        d('邮件-邮件x',true)
    end
end

function _mail()
    log('读邮件')
    读邮件次数 = 读邮件次数 + 1
    if 读邮件次数 < 3 then
        if d('邮件-有邮件提醒',true,1,3)then
            if d('邮件-邮箱界面')then
                local i=0
                while i<10 and d('邮件-邮箱界面-有红点',true) do
                    d('邮件-邮箱界面',true)
                    i=i+1
                end
            end
            d('邮件-邮箱界面',true)
            d('邮件-邮件x',true)
        end
    end
end



t['礼物-木兰']={0xaa463d, "0|0|0xaa463d,25|-23|0xe20000",90,1082,90,1147,145}
t['礼物-木兰领取']={0x1274ba, "0|0|0x1274ba,-51|1|0x00c2fe",90,608,345,882,508}
function _gift()
    log('领木兰')
    if d('礼物-木兰',true)then
        d('礼物-木兰领取',true)
    end
end

t['日历-有奖励']={0xe00000, "0|0|0xe00000,2|2|0xe30000",90,1281,72,1333,136}
t['日历-奖励界面x']={0x907147, "0|0|0x907147,11|1|0xa88c6b,1|-9|0xa78a69",90,1137,23,1178,58}
    t['日历-奖励界面-领取']={0x228803, "0|0|0x228803,1|-18|0x00c90e,27|17|0x03a60d",90,993,113,1155,691}
    t['日历-奖励界面-领取2']={0x208600, "0|0|0x208600,-3|-7|0x00ce0e",90,879,47,1174,703}
t['日历-奖励界面-左侧面板']={0x533f21, "0|0|0x533f21,119|-29|0xde0000",90,163,45,440,690}
    t['日历-奖励界面-稍后查看']={0xffa900, "0|0|0xffa900,-461|-31|0x00caf6",90,370,622,954,715}
    t['日历-奖励界面-红绿']={0x26b455, "0|0|0x26b455,-15|-16|0xe20000",90,466,73,1171,673}
    t['日历-奖励界面-红蓝']={0x2481c1, "0|0|0x2481c1,-10|-20|0xe20000",90,466,73,1171,673}
    t['日历-奖励界面-兑换奖励']={0x1274ba, "0|0|0x1274ba,-12|-8|0x00cef9,49|11|0x00b3f3",90,960,263,1164,701}
    t['日历-奖励界面-前往']={0x1274ba, "0|0|0x1274ba,31|-1|0x00c1fd,-50|-8|0x00cbff",90,135,16,1202,722}
    t['日历-奖励界面-小红点提示']={0xe50000, "0|0|0xe50000,-40|17|0xe7d3aa",90,463,151,1186,280}
    t['日历-奖励界面-小红点提示-万圣节']={0x5b43db, "0|0|0x5b43db,36|-5|0xe30000",90,460,118,1180,237}

--日历有奖励
function _book()
    log('日历奖励')
    日历奖励 = 日历奖励 + 1
    if 日历奖励 < 3 then
        if d('日历-有奖励',true,1,4)then
            local i=0
            while ( 
                d('日历-奖励界面-领取',true,1,2)  or 
                d('日历-奖励界面-左侧面板',true,1,2)  or 
                d('日历-奖励界面-红绿',true)  or 
                d('日历-奖励界面-红蓝',true) or 
                d('日历-奖励界面-兑换奖励',true) or
                d('日历-奖励界面-领取2',true) or
                d('日历-奖励界面-小红点提示',true) or
                d('日历-奖励界面-小红点提示-万圣节',true)
                ) and i< 6 do
                i=i+1
                d('日历-奖励界面-稍后查看',true)
                delay(1)
            end
            d('日历-奖励界面-前往',true)
            d('日历-奖励界面x',true)
        end
    end
end
--简单清理
function clearOneAccount()
	log('简单清理')
	local sonlist={
		'/tmp/',
		'/Library/',
	}
	for k,v in ipairs(sonlist)do
		local dataPath = appDataPath(_app.bid)
		local AllPath = dataPath..v
		log(AllPath)
		delFile(AllPath)
	end
end


t['任务_点击任务'] = { 0xe4b067,"-18|15|0x6d0000,-16|-7|0x560000",degree,18,141,76,196}
	t['任务_点击任务_前往'] = { 0x1274ba,"-56|-18|0xd4fe,59|7|0xb6f3",degree,937,139,1163,429 }
	t['任务_点击任务_训练'] = { 0xc9ff,"-349|-175|0x14d900,-309|15|0xffac00",degree,595,387,1140,668}
	t['任务_点击任务_训练_取消'] = { 0xc0fe,"-445|-7|0xfeb200,-264|-67|0x334e",degree,286,356,1070,630}
t['任务_点击任务_采矿'] = { 0x8c7ff,"162|-26|0x1077bc,162|19|0x1076bd",degree,128,429,1173,600}		
t['任务_点击任务_科技面板']={0xd4d2cc, "0|0|0xd4d2cc,-454|2|0x858278",90,674,52,1189,94}
    t['任务_点击任务_科技面板-军事']={0x003658, "0|0|0x003658,-10|-150|0x0897d3",90,10,120,129,379}
    t['任务_点击任务_研究']={0x00c2fd, "0|0|0x00c2fd,0|-18|0x00cdff,-240|-19|0xffbb00,-367|14|0xffa500",90,663,494,1129,616}
    
t['任务-联盟互动']={0x00bcfc, "0|0|0x00bcfc,-816|-26|0xeeb5a7,-823|-36|0xa65c4a,-780|-62|0xe3b300,-852|-63|0xd9af01",90,177,246,1147,674}
    t['任务-联盟帮助']={0xffb000, "0|0|0xffb000,-47|-23|0xfebc00,118|22|0xffa500",90,508,641,829,725}
    t['任务-活跃度80+']={0xebbc00, "0|0|0xebbc00,-1|-13|0x04445e",90,950,180,1057,232}
    t['任务-事半功倍']={0xfcf7f7, "0|0|0xfcf7f7,46|4|0x4b2610,44|143|0x492510,45|283|0x492410",90,197,257,332,673}
    t['任务-知识之力']={0x1274ba, "0|0|0x1274ba,-750|-58|0xfdee1c,-756|-57|0x834910,-774|2|0x1ab2ff,-780|-10|0xfeffff",90,178,267,1162,678}
        t['任务-埃及艳后']={0xffddbc, "0|0|0xffddbc,-37|31|0xec7700,19|13|0xfaf974,0|-24|0xfefb7f,-29|-18|0x2c33a0",90,700,40,928,78}
        t['任务-英雄之力-学习']={0x00c0fd, "0|0|0x00c0fd,231|0|0x00c0fb,-1011|-599|0xd4d4cd",90,11,12,1298,691}
        t['任务-英雄之力-学习-使用']={0x1274ba, "0|0|0x1274ba,-85|-18|0x00d0fd,53|23|0x01aeeb",90,912,211,1134,669}
    t['任务-神秘商人界面']={0x007eb9, "0|0|0x007eb9,39|-86|0x858278,99|-85|0xc9c5b6",90,531,65,942,206}
    t['任务-神秘商人-免费刷新']={0xffffff, "0|0|0xffffff,-23|-21|0x197bbf,-31|0|0x00b6f4",90,957,140,1137,201}
    t['任务-神秘商人-收费刷新']={0xd4d3cc, "0|0|0xd4d3cc,-26|92|0xffad00,-152|89|0xffaf00",90,946,63,1176,207}
t['任务-完成']={0xfef6d6, "0|0|0xfef6d6,8|6|0xc27930",90,1127,154,1150,244}

t['任务_采集类']={0x00bffa, "0|0|0x00bffa,-11|-1|0x1274ba,-781|4|0x6f2b00,-784|-22|0xd2e6f6,-833|-55|0xffc379",90,184,265,1149,674}
    t['任务_采集类-搜索']={0x07c7ff, "0|0|0x07c7ff,71|-91|0x1073bd,-216|-90|0x0d7ec5",90,96,247,1282,631}
t['任务_科技时代']={0x00baf9, "0|0|0x00baf9,-811|-26|0x37def8,-815|9|0x03693d,-780|-51|0xffde90,-810|-20|0x0f3073",90,184,265,1149,674}

t['神秘商人来了']={0xf59458, "6|6|0x110909,-15|0|0x00bae8",90,520,362,965,634}

function _神秘商店()
    delay(1)
    local i = 0
    while i < 5 and d('任务-神秘商人界面') do
        local redx = 385
        for ii = 1,4 do
            for i=0,3 do
                t['商店购买-玉米']={0x4fb608, "0|0|0x4fb608,11|1|0x285e00,0|-16|0xffbf00,4|14|0xfb9e00",90,365,234,1144,680}
                t['商店购买-木材']={0x7a2f0a, "-11|4|0xfbba82,-10|3|0x974827,-4|8|0xeaab6f,-13|19|0xfb9f00",90,343,227,1141,683}
                d('商店购买-木材',true,1,2) 
                d('商店购买-玉米',true,1,2)
            end
            moveTo(757, 581,759, 376,2,10)
            delay(2)
        end
        if d('任务-神秘商人-免费刷新',true)then
        elseif d('任务-神秘商人-收费刷新',true) then
            _UI.神秘商人 = false
            return
        end
        i=i+1
    end
end

t['任务_点击任务_王者任务']={0x1274ba, "0|0|0x1274ba,-794|-11|0xf6d58e,-814|-13|0xfa2a39,-798|-52|0xd6dff5,-815|13|0xd32e36",90,165,250,1162,681}
t['任务_采集类']={ 0x00bffa, "0|0|0x00bffa,-11|-1|0x1274ba,-781|4|0x6f2b00,-784|-22|0xd2e6f6,-833|-55|0xffc379",90,165,250,1162,681}
t['任务_采集类']={0x1274ba, "0|0|0x1274ba,-41|-5|0x00c9fe,-756|-10|0xe5f6fe,-748|7|0x752b00,-804|-53|0xfdbf74",90,183,273,1159,679}--旧的好像不会点击采集增加
t['任务-联盟互动']={0x00bcfc, "0|0|0x00bcfc,-816|-26|0xeeb5a7,-823|-36|0xa65c4a,-780|-62|0xe3b300,-852|-63|0xd9af01",90,177,246,1147,674}
t['任务-增产任务']={0x1476bb, "0|0|0x1476bb,-15|0|0x00bffd,-735|-29|0x4c2815,-780|-30|0x01eade,-782|-36|0xffffff",90,172,256,1165,679}
	t['任务-增产任务-提升']={0x3be510, "0|0|0x3be510,15|8|0x3ae50c,30|10|0xca7100",90,938,165,1119,317}
t['任务_采集类-采集增加24小时']={0x3ee911, "0|0|0x3ee911,-57|24|0xc9d9e5,-58|26|0xfdfdfe,-71|-20|0x9db2c6,-58|-29|0xda7ef0",90,162,143,837,693}
t['任务_采集类-采集增加8小时']={0x3eea12, "0|0|0x3eea12,-58|25|0xc9d9e5,-58|27|0xeff3f7,-62|-24|0x20bcdf,-81|13|0x007ca7",90,177,142,835,689}
    t['任务_采集类-采集增加24小时-使用']={0x00c3ff, "0|0|0x00c3ff,15|10|0x1274ba",90,915,549,1121,678}


function _task()
    任务记数 = 任务记数 + 1
	if d('任务_点击任务',true,1,3)then      --点开任务
		click(122,336,2)    --点到任务
		while d("奖励-奖励面板-领取",true,1,2) do    --有奖励就领掉
        end
		d("奖励-奖励面板-领取箱子",true)    --箱子的奖励
		d("奖励-奖励面板-红色-黄",true,1,2) --黄色的箱子

	    local taskArrs = { 
	        '任务-知识之力',
	        '任务-增产任务',
	        '任务_采集类',
	        '任务_科技时代'
	    }
	    
        local i =0 
        while i < 4 do
            i=i+1
            local v = taskArrs[任务记数]
            log('准备查询 -> '..v)
            if d( v,true,2) then
                if v == "任务-知识之力" then
                    click(1280, 305,2)
                    for i=0,4 do
                        d('任务-英雄之力-学习-使用',true)
                    end
                elseif v == "任务_科技时代" then
                    local i = 0
                    while i < 10 and d('研究院-科技面板') do
                        i = i + 1
                        if d('研究院-未升的科技',true,1,2) then
                            if d('研究院-研究按钮',1,2)then
                                break
                            end
                        else
                            moveTo(800,300,500,300,5)
                            delay(1)
                        end
                    end
                elseif v == "任务_采集类" then
                    if d("任务_采集类-采集增加24小时",true,1,2) or d("任务_采集类-采集增加8小时",true,1,2) then
                        d("任务_采集类-采集增加24小时-使用",true,1,2)
                    elseif d("采矿-搜索",true,1,3) or d('任务_采集类-搜索',true,1,3)then
                        click(663,367,2)	--点屏中间
                        d("采矿-搜索-采集",true,1,2)
                        d('采矿-搜索-采集-iphone7',true,1,2)
                        d("采矿-创建部队",true,1,2)
                        if d("采矿-行军")  then
                            if d("采矿-行军",true) or d('采矿-行军2',true) then
                                toast(采矿一次,1)
                            end
                        end
                    end
                elseif v == "任务-增产任务" then
                    d("任务-增产任务-提升",true,1,2)
                    d("任务_采集类-采集增加24小时-使用",true,1,2)
                end
                --判断是什么任务
                break
            end
            --真有此任务
            moveTo(757, 581,759, 376,2)
            delay(1)
        end
	end--任务end
	
    --结束任务
    if 任务记数 >= 4 then
		_UI.任务 = false
		return false
	end
end


t['联盟-展开联盟']={0x044974, "0|0|0x044974,-4|-5|0x6fe6ff,-22|6|0x84e8ff",90,1227,645,1331,746}
t['联盟-展开联盟-联盟']={0x8ff9ff, "0|0|0x8ff9ff,17|4|0x095383,-16|4|0x0a5585",90,1034,662,1117,737}
t['联盟-联盟界面']={0xd1d0c9, "0|0|0xd1d0c9,-1090|132|0x03568f,-1066|147|0x0c9fdb",90,12,5,1205,267}
    t['联盟-礼物']={0xf866f7, "0|0|0xf866f7,43|-46|0xde0000",90,858,505,993,666}
        t['联盟-礼物-领取']={0x208600, "0|0|0x208600,-41|-13|0x00cd10,45|14|0x03a00c",90,652,100,1170,502}
        --1160, 44 关闭的点
    t['联盟-联盟帮助+']={0xfacab6, "0|0|0xfacab6,42|-36|0xde0000",90,993,357,1128,476}
        t['联盟-联盟帮助']={0xb67016, "0|0|0xb67016,-53|-19|0xffb900,-38|8|0xffa900",90,552,635,720,725}
        --1163, 60 关闭的点
    t['联盟-联盟科技']={0x0050de, "0|0|0x0050de,3|-15|0x5fdaf6",90,726,518,837,645}
        t['联盟-联盟科技+官员推荐']={0xd5f8ff, "0|0|0xd5f8ff,37|-49|0xc20808,-50|-53|0xbf0806",90,174,121,892,696}
        t['联盟-联盟科技+可研科技']={0xe3e9ec, "0|0|0xe3e9ec,57|5|0x407182",90,652,100,1170,502}
            t['联盟-联盟科技+捐献']={0x00c7ff, "0|0|0x00c7ff,54|-495|0xd4d3cc,-274|9|0xffae00,-236|8|0xfeb200",90,633,55,1175,652}
            t['联盟-联盟科技+捐献完成']={0xd3d2cb, "0|0|0xd3d2cb,-68|499|0x898989,-320|503|0xffae00,-441|495|0xffb300",90,633,55,1175,652}
            t['联盟-联盟科技+研究科技']={0xba9367, "0|0|0xba9367,1|16|0x01b3f3,-9|25|0xc78a56",90,824,539,946,645}

t['联盟-展开联盟-天赋']={0x024672, "0|0|0x024672,7|-2|0x69e4ff,0|-20|0xf2fefe",90,1133,658,1222,748}
    t['天赋-召唤英雄']={0x1274ba, "0|0|0x1274ba,25|3|0x00befc,30|-81|0xf8a200",90,994,526,1212,687}
    t['天赋-优先升级']={0x2cb101, "0|0|0x2cb101,-7|-5|0x3ac300,2|-5|0x42c300",90,10,84,258,268}
    t['英雄管理-天赋按钮']={0x1274ba, "0|0|0x1274ba,-21|-3|0x00c5ff,289|5|0x00c1fd",90,889,578,1329,691}
        t['英雄管理-天赋升级界面']={0x25cef5, "0|0|0x25cef5,5|7|0x0e67ad",90,1245,84,1274,110}
            t['英雄管理-天赋升级-升级']={0x1274ba, "0|0|0x1274ba,-57|-20|0x04d0fd,62|23|0x00abe8",90,109,115,934,745}
            t['英雄管理-天赋升级-强制升级']={0x980e0e, "0|0|0x980e0e,13|-1|0xdd3c33,148|1|0x00bcfb",90,65,102,879,703}
            
            
t['队例-有采集中队伍']={0xfeffff, "0|0|0xfeffff,4|-1|0x109900,1|3|0x149d05,2|13|0x4ff86c,4|-4|0xfbfcf9",90,1274,173,1325,450}
    t['队例-有采集中队伍-召回']={0x1274ba, "0|0|0x1274ba,12|-3|0x00c5ff,-106|1|0x00c2fe,47|1|0x00c1fe",90,248,136,1248,663}
t['队例-有休息的队伍']={0x008cc4, "0|0|0x008cc4,1|9|0xffffff,10|8|0xffffff,16|6|0x00dafe",90,1276,190,1330,443}
    t['队例-有休息的队伍-召回']={0xe4ac1d, "0|0|0xe4ac1d,7|30|0xf7f4e8,-107|7|0x077fb9",90,436,122,868,619}
    
    
t['联盟-人员']={0x0e4161, "0|0|0x0e4161,16|-122|0x0da0de,-4|102|0x105b81",90,1,71,156,566}
    t['联盟-人员-r4-未展开']={0x78b2d1, "0|0|0x78b2d1,-6|-5|0x5f9fc0,7|-7|0x4895c0,0|-7|0x0c73ad",90,1130,249,1174,286}
    t['联盟-人员-资源援助']={0x1274ba, "0|0|0x1274ba,85|-6|0x1274ba,101|-9|0x06d8fe,-93|-1|0x00c6ff,-114|-6|0x1274ba,-175|1|0x00c1fd",90,46,149,1332,745}
    t['联盟-人员-资源援助-phone7']={0x1274ba, "0|0|0x1274ba,-29|5|0x1274ba,57|-3|0x1274ba,63|-3|0x00ccfe,-209|3|0x00c2fe,-89|5|0x00bffd",90,136,196,1333,740}
        t['联盟-人员-资源援助-资源面板']={0xfbc82d, "0|0|0xfbc82d,-11|101|0xde965d,-2|197|0xa6b0cc,-5|281|0xec9600",90,541,125,651,590}
            t['联盟-人员-资源援助-资源面板-运输']={0x00c0fe, "0|0|0x00c0fe,-4|-20|0x1176bc",90,674,568,940,665}
            t['联盟-人员-资源援助-资源面板-运光了']={0x606060, "0|0|0x606060,1|7|0x8e8e8e,-74|2|0x929292",90,667,560,956,667}
        t['联盟-地图输入-完成']={0x007aff, "0|0|0x007aff,1|-6|0x067dfe",90,1018,266,1281,532}
        t['联盟-地图输入-资源援助']={0x1274ba, "0|0|0x1274ba,-11|-9|0x00c8ff,209|-6|0x00c7ff,308|-1|0x00c2ff",90,1018,266,1281,532}
            
function _songwuzi()
    log('物资运送')
    
    送物资次数 = 送物资次数 + 1
    if 送物资次数 > 3 then
        _UI.物资运送 = false
        return true
    end
    
    d('游戏主界面-城内',true,2)
    
    if tonumber(_UI.R位置) == '坐标' then    --地图点人
        local dt__ = {{457, 20, 0x84974e},{644, 151, 0x434c27},{807, 151, 0x494a27},{927, 152, 0x147ebb}}
        for k,v in ipairs( dt__ ) do
            click( v[1] ,v[2],3)
            if k == 2 or k == 3 then
                input(_UI.坐标[k-1])
                d('联盟-地图输入-完成',true,1,2)
            end
        end
        click(654,360,2)
        d("联盟-地图输入-资源援助",true,1,2)
    else
        
        if not(d('联盟-展开联盟-联盟')) then
            d('联盟-展开联盟',true,1)
        end
        
        --查看一下是否要召回
        --查询是否要采集
        local swztimeline = os.time()
        while d('采集-已经有队伍') and d('采集-已经有队伍-正确')  and os.time() - swztimeline < 120 do
            if d('采集-已经有队伍-3')then
                if d('队例-有休息的队伍',true,1,4) or d('队例-有采集中队伍',true,1,4) then
                    d('队例-有休息的队伍-召回',true,1,2)
                    d('队例-有采集中队伍-召回',true,1,2)
                else
                    log('正召回 or 在路上')
                end
            elseif d('采集-已经有队伍-2') then
                break
            elseif d('采集-已经有队伍-1') then
                break
            end
        end
        
        if d('联盟-展开联盟-联盟',true,1,4)then
            
            d('联盟-人员',true,1,2)
            d('联盟-人员-r4-未展开',true,2)
            --41
            local ren = {{343, 370, 0x064f71},{596, 368, 0x045d82},{844, 366, 0x05597c},{1095, 368, 0x034a65}
                ,{336, 497, 0x054d6b},{585, 498, 0x05597f},{844, 491, 0x06587a},{1079, 496, 0x055476}}
            click(ren[_UI.R位置+0][1],ren[_UI.R位置+0][2],2)
            d('联盟-人员-资源援助',true,1,2)
            d('联盟-人员-资源援助-phone7',true,1,2)
        end
    
    end --地图点人end
    
    local mo = {{971, 237, 0x0a2b39},{620, 233, 0xb2f8fc},{620, 325, 0xb6f7fb},{620, 418, 0xb1f9fc},{620, 508, 0xb1f9fc}}
    if d('联盟-人员-资源援助-资源面板') then
        for i=1,4 do
            moveTo(mo[i+1][1],mo[i+1][2],mo[1][1],mo[i+1][2],5)
        end
        d('联盟-人员-资源援助-资源面板-运输',true,1,3)
        if d('联盟-人员-资源援助-资源面板-运光了') then
            _UI.物资运送 = false
        end
    end
end


t['设置-执正官资料-设置']={0xf3e9d1, "0|0|0xf3e9d1,44|36|0xdabfb9,-676|-21|0xf3d321",90,242,479,1094,643}
    t['设置-执正官资料-通用设置']={0xf1e5cf, "0|0|0xf1e5cf,-244|-7|0xfef7a9,7|394|0xff3842",90,207,91,667,686}
        t['设置-执正官资料-通用设置-设置界面']={0xd2d1ca, "0|0|0xd2d1ca,-1016|-4|0xb5b2a6,-1023|88|0x05445e,28|86|0x044661",90,116,6,1232,231}
            t['设置-执正官资料-通用设置-设置界面-帮助']={0xa6f0ff, "0|0|0xa6f0ff,-22|-107|0xfafcfd,-216|-106|0x81e430,-374|-104|0x77d1ff,-570|-103|0xc05cff,-728|-102|0xffa92e",90,187,90,1171,646}
            t['设置-执正官资料-通用设置-设置界面-开通帮助']={0x08a001, "0|0|0x08a001,-22|-107|0xfafcfd,-216|-106|0x81e430,-374|-104|0x77d1ff,-570|-103|0xc05cff,-728|-102|0xffa92e",90,187,90,1171,646}

function _开帮助()
    log('开帮助')
    click(50,50,2)
    d('设置-执正官资料-设置',true,1,3)
    d('设置-执正官资料-通用设置',true,1,3)
    local i = 0;
    while i < 100  and d('设置-执正官资料-通用设置-设置界面') do
        if d('设置-执正官资料-通用设置-设置界面-开通帮助') then
            return
        elseif d('设置-执正官资料-通用设置-设置界面-帮助',true,1,2) then
        else
            moveTo(500,500,500,100,2)
        end
        delay(1)
        i=i+1
    end
end


t['菜单-统帅-管理界面']={0x969696, "0|0|0x969696,2|-68|0xd5d2cc",90,4,4,86,122}
t['菜单-统帅-布狄卡']={0xef503c, "0|0|0xef503c,-6|-32|0xdb3931,-27|19|0xfceb6b,-4|19|0x668490",90,10,133,257,732}
    t['菜单-统帅-可以升星']={0xbf7104, "0|0|0xbf7104,16|9|0xffa700,13|88|0x007201",90,1202,153,1322,357}
        t['菜单-统帅-可以升星-自动培养']={0x1274ba, "-164|4|0x00c3ff,-1126|-608|0xd5d2cc",90,2,4,1331,701}
        
    t['菜单-统帅-可以加天赋的英雄']={0x70eb00, "0|0|0x70eb00,1|5|0x4fe100",90,8,131,268,676}
        t['菜单-统帅-技能升级']={0x00c7ff, "0|0|0x00c7ff,16|-17|0xde0000",90,1110,572,1320,687}
            t['菜单-统帅-技能升级-升级']={0x1274ba, "0|0|0x1274ba,-51|-10|0x00ccff",90,825,547,1121,666}
        t['菜单-统帅-天赋升级']={0x00c1ff, "0|0|0x00c1ff,20|-23|0xde0000",90,896,579,1114,682}

function _加天赋()
    log('加天赋')
    if not(d('联盟-展开联盟-联盟')) then
        d('联盟-展开联盟',true,1)
    end
    
    if d('联盟-展开联盟-天赋',true,1,3) then
        local 加天赋位置= {{480, 504, 0xfffffc},{470, 692, 0xfffff1},{353, 686, 0xccb167},{353, 686, 0xccb167},{353, 686, 0xccb167},
            {314, 415, 0xfffffb},{314, 415, 0xfffffb},{264, 517, 0xf0e1b7},{192, 344, 0xd8bd71}}
        local i = os.time()
        local bdk = true
        while ( os.time() - i < 60 ) do
            if d('酒馆-返回按钮') and d('菜单-统帅-管理界面') then
            
                if d('天赋-召唤英雄',true,1,3)then
                    d('弹窗-招到英雄',true,1,3)
                end
                
                if bdk then
                    d("菜单-统帅-布狄卡",true,1,3)
                    if d('菜单-统帅-可以升星',true,1,3)then
                        d('菜单-统帅-可以升星-自动培养',true,1,3)
                        d('菜单-统帅-可以升星-自动培养',true,2,3)
                    end
                end
                
                local ii = 0
                while ii < 60 do
                    ii = ii + 1
                    if d('菜单-统帅-可以加天赋的英雄',true,3,2) then  break end
                end
                
                if d('菜单-统帅-技能升级',true,1,2)then
                    d('菜单-统帅-技能升级-升级',true,1,2)
                    click(50,50)
                    d('酒馆-返回按钮',true,1,2)
                elseif d('菜单-统帅-天赋升级',true,1,3)then
                    if d('英雄管理-天赋升级界面') then
                        local fx,fy,fx1,fy1 = 100, 350 , 800, 350
                        touchDown(1,fx,fy);
                        mSleep(30);
                        touchDown(2,fx1,fy1);
                        mSleep(30);
                        for iii = 1,30 do
                            fx = fx + 10
                            fx1 = fx1 - 10
                            touchMove(1, fx,fy)
                            touchMove(2, fx1,fy1)
                            mSleep(50);
                        end
                        touchUp(1,fx,fy)
                        touchUp(2, fx1,fy1)
                        delay(2)
                        
                        t['天赋-通用']={0xfefcf6, "0|0|0xfefcf6,13|0|0xfefdfb,0|12|0xfffffe,14|12|0xfdfbf6,6|17|0xdba400",90,406,374,498,467}
                        t['天赋-打野']={0xfdfbf7, "0|0|0xfdfbf7,-4|8|0xcf9700,-8|3|0xfefdfb,-12|11|0xfefdfa,-3|25|0x985e0b",90,423,374,495,461}
                        t['天赋-采集']={0xffffff, "0|0|0xffffff,-1|5|0xd7a000,5|-1|0xc78e00,10|10|0xfdfbf5,2|22|0x985e0b",90,413,352,504,475}
                        
                        local threeA = {'天赋-通用','天赋-打野','天赋-采集'}
                        local threeAs ={}
                        threeAs[1]={{416, 440, 0xfffff8},{408, 519, 0xfffff9},{404, 575, 0xfbf9ef},{359, 548, 0xfbf3d8},{281, 554, 0xfcf7eb},{267, 658, 0xfaefd8},{344, 408, 0x999888},{290, 383, 0x929292},{291, 439, 0x525252}}
                        threeAs[2]={{415, 440, 0x99987b},{352, 424, 0x565656},{391, 612, 0x969696},{342, 519, 0x949494},{309, 465, 0x6d6d6d},{260, 577, 0x818181},{225, 503, 0x717171},{189, 569, 0x676767}}
                        threeAs[3]={{304, 375, 0x787878},{329, 449, 0x979797},{365, 510, 0x969696},{158, 460, 0x949494},{158, 460, 0x949494},{158, 460, 0x949494},{413, 573, 0x6c6c6c},{315, 574, 0x7c7c7c}}
                        
                        for k,v in ipairs(threeA) do
                            if d( v )then
                                log(v..'->准备加点')
                                for k__,v__ in ipairs(threeAs[k])do
                                    log(v__)
                                    click(v__[1],v__[2],2)
                                    d('英雄管理-天赋升级-升级',true)
                                    d('英雄管理-天赋升级-强制升级',true)
                                end
                                d('酒馆-返回按钮',true,1,2)
                                break
                            end
                        end
                    end
                end
            elseif d('酒馆-返回按钮',true,1,2) then
            else
                click(50,50)
            end
        end--60秒内的加天赋
        _UI.英雄升级加点 = false
    end
end

t['联盟采集-联盟界面-领地']={0xe92b21, "0|0|0xe92b21,-4|44|0x67ff1d",90,865,359,985,489}
    t['联盟采集-联盟界面-领地-领地建筑']={0x81b7d4, "0|0|0x81b7d4,0|-7|0x0d75ac,-823|-7|0xfefffe,-922|30|0x47c1fd,-923|-37|0x58d6ff",90,150,177,1187,287}
    t['联盟采集-联盟界面-领地-联盟资源中心']={0xe0a700, "0|0|0xe0a700,-7|-30|0xfeff00,30|-13|0x8c4106",90,143,187,1196,570}
        t['联盟采集-联盟界面-领地-联盟资源中心-采集中']={0x033043, "0|0|0x033043,-19|25|0x3ac0f8,18|25|0x3ac0f8",90,171,475,959,680}
        t['联盟采集-联盟界面-领地-联盟资源中心-建造中']={0x022c3e, "0|0|0x022c3e,-9|24|0x06fe2f,14|26|0x06fe2f",90,147,419,989,711}
        
    t['联盟采集-采集']={0x1274ba, "0|0|0x1274ba,-56|-22|0x00d1ff,91|24|0x00b3ef",90,158,105,1244,649}
    t['联盟采集-点击加入']={0x255273, "0|0|0x255273,-74|1|0x8eabbd,-32|-30|0x88cae2,-9|33|0x8ccce2",90,187,287,376,414}
         
function _联盟采矿()
    log('_联盟采矿')
    _UI.采集.联盟矿场 = false
    if not(d('联盟-展开联盟-联盟')) then
        d('联盟-展开联盟',true,1)
    end
    if d('联盟-展开联盟-联盟',true,1,5) then
        d("联盟采集-联盟界面-领地",true,1,2)
        d("联盟采集-联盟界面-领地-领地建筑",true,1,2)
        d("联盟采集-联盟界面-领地-联盟资源中心",true,1,2)
        d("联盟采集-联盟界面-领地-联盟资源中心-采集中",true,1,2)
        d("联盟采集-联盟界面-领地-联盟资源中心-建造中",true,1,2)
        click(671,387,1)
        d("联盟采集-采集",true,1,2)
        if( d("联盟采集-点击加入",true,1,2)) then
            return true
        end
    end
end


t['联盟-加入按钮']={0x00c1ff, "0|0|0x00c1ff,-14|-32|0x00d1ff,-5|135|0xffb100",90,913,424,1033,680}
    t['联盟-搜索框']={0x003c54, "0|0|0x003c54,1|5|0x5088a0",90,513,110,619,127}
    t['联盟-搜索-按钮']={0x06587e, "0|0|0x06587e,-7|5|0x1c81ae",90,913,88,988,145}
        t['联盟-搜索-申请加入']={0xb67016, "0|0|0xb67016,-58|-24|0xfebf00",90,891,577,1167,680}
    
    t['联盟-领地资源-提示']={0xde8d10, "0|0|0xde8d10,45|-50|0xe20000",90,881,353,988,483}
        t['联盟-领地资源-提示-领取RMB']={0x00c20e, "0|0|0x00c20e,-28|-17|0x00d40e,32|14|0x00ae0d",90,853,166,1148,343}
        t['联盟-领地资源-提示-领取']={0x00bffd, "71|-102|0xd4d2ca",90,963,18,1202,173}
    t['联盟-联盟礼物-大奖']={0xffffff, "0|0|0xffffff,108|-67|0xe20000",90,241,301,493,548}
        
function _lm()
    log('联盟研究')
    联盟次数 = 联盟次数 + 1
    if 联盟次数 > 2 then
        _UI.联盟捐助 = false
        return
    end
    if not(d('联盟-展开联盟-联盟')) then
        d('联盟-展开联盟',true,1)
    end
    if d('联盟-展开联盟-联盟',true,1,5) then
        
        if d('联盟-加入按钮',true,1,2) then
            d('联盟-搜索框',true,1,2)
            inputStr('TM-G')
            delay(1)
            d('联盟-搜索-按钮',true,1,2)
            d('联盟-搜索-按钮',true,1,2)
            if d('联盟-搜索-申请加入',true,1,2)then
                _UI.联盟捐助 = false
            end
             _UI.联盟捐助 = false
        elseif d('联盟-礼物',true,1,3)then
            local i = 0
            while (d("联盟-领地资源-提示-领取RMB",true,1)  or d('联盟-礼物-领取',true,1,2) )and i<15 do
                i=i+1
            end
            click(1160, 44)
            d('联盟-联盟礼物-大奖',true,1,2)
        end
        
        if d("联盟-领地资源-提示",true,1,3) then
            d("联盟-领地资源-提示-领取",true,1,2)
            d("联盟-领地资源-提示-领取",true,2,2)
        end
        
        if d('联盟-联盟帮助+',true,2) then
            d('联盟-联盟帮助',true)
        end
        
        if d('联盟-联盟科技',true,1,5) then
            if d('联盟-联盟科技+官员推荐',true,1,5) or d('联盟-联盟科技+可研科技',true,1,5)then
                local i =0
                while d('联盟-联盟科技+捐献',true,1,0.5) and i< 22 do
                    i=i+1
                end
                if d('联盟-联盟科技+捐献完成') or d('联盟-联盟科技+研究科技') then
                    _UI.联盟捐助 = false
                end
            end
        end
    end
end


t['城墙修复']={0x1190cd, "0|0|0x1190cd,-141|5|0x5acc3e,-139|52|0x009406,-287|5|0x0c7cb2",90,723,500,1231,742}
    t['城墙修复-维修']={0x1274ba, "0|0|0x1274ba,-44|-15|0x00caff",90,724,518,952,642}
function _wall()
    修理城墙 = 修理城墙+1
    if 修理城墙 >= 1 then
        _UI.修城墙 = false
    end
    click(1214, 715)--城墙位置
    if d('城墙修复',true,1,2)then
        d('城墙修复-维修',true)
    end
end

-- 1232, 421    研究院的位置
t['研究院-正在升级']={0xe0a40f, "0|0|0xe0a40f,-15|-28|0xf6f2ed,-157|-1|0x097fb6",90,788,314,1328,656}
t['研究院-正在研究']={0xe6aa14, "0|0|0xe6aa14,-21|-25|0xf0f0ef,-166|-21|0x097cb3,116|-52|0x59c1f0,92|-23|0xcfe3eb",90,840,207,1324,743}
t['研究院-药瓶']={0x016da7, "0|0|0x016da7,-20|-18|0xd8eaf1,-134|-6|0x4bc331,-285|-14|0x0b7eb8",90,730,178,1326,743}
    t['研究院-科技面板']={0xd2d1ca, "0|0|0xd2d1ca,-442|-6|0x858278,-443|2|0x858278,-433|-3|0xc6c6b8",90,586,49,1190,100}
    t['研究院-未升的科技']={0x3e7080, "0|0|0x3e7080,0|-4|0x376979,-1|4|0x467788",90,154,116,1183,711}
    t['研究院-研究按钮']={0x1176bc, "0|0|0x1176bc,-28|3|0x00caff,-170|26|0xffaa00",90,618,470,1133,628}

function _study()
    log('准备研究')
    研究次数 = 研究次数 + 1
    if 研究次数 > 3 then
        _UI.研究 = false
        return
    end
    
    click(1232, 421,2)
    if d('研究院-正在升级') or d('研究院-正在研究') then
        _UI.研究 = false
        return true
    elseif d('研究院-药瓶',true,1,2) then
        local i = 0
        while i < 10 and d('研究院-科技面板') do
            i = i + 1
            if d('研究院-未升的科技',true,1,2) then
                if d('研究院-研究按钮',1,2)then
                    _UI.研究 = false
                    return true
                end
            else
                moveTo(800,300,500,300,5)
                delay(1)
            end
        end
    end
end


t['菜单-战役']={0xf5fefe, "11|22|0x044975",90,831,666,892,720}
    t['菜单-远征-收集奖励']={0xfffa9d, "0|0|0xfffa9d",90,106,203,160,266}
    t['菜单-远征-可以购买']={0xfc9a4f, "0|0|0xfc9a4f,33|-31|0xe30000",90,87,76,198,156}
        t['菜单-远征-可以购买-科斯坦察']={0xfdc202, "0|0|0xfdc202,23|4|0x00baf5",90,763,261,898,312}
    
    t['菜单-战役-挑战']={0xb67016, "0|0|0xb67016,-78|-15|0xffb900",90,948,624,1209,738}
        t['远征-任务目标-界面']={0xd6d1ce, "0|0|0xd6d1ce,1259|48|0x00c0fc",90,4,4,1331,127}
            t['远征-任务目标-界面-增加部队']={0x3c3d3a, "0|0|0x3c3d3a,-45|-1|0xfff76b,44|2|0xffff61",90,1198,120,1329,417}
                t['远征-任务目标-界面-增加部队-准备']={0xb67016, "0|0|0xb67016,-84|-14|0xffb700",90,821,599,1118,706}
                t['远征-任务目标-界面-增加部队-部队不足']={0xd3d2cb, "0|0|0xd3d2cb,-150|611|0xf5a800",90,718,23,1239,707}
            t['远征-任务目标-界面-胜券在握']={0xffaf00, "0|0|0xffaf00,18|-54|0x06ff2f",90,500,504,777,620}
        t['远征-战斗界面']={0xd4d0cc, "0|0|0xd4d0cc,155|135|0x19c6f0",90,5,4,220,205}
            t['远征-战斗界面-有空闲部队']={0xffffff, "0|0|0xffffff,2|5|0x008cc5",90,1223,156,1329,499}
                t['远征-战斗界面-有空闲部队-驻扎']={0x008fc3, "0|0|0x008fc3,-5|4|0xffffff,-9|4|0x008ec2",90,1201,8,1327,734}
            t['远征-战斗界面-左侧敌人']={0xcdc8c4, "0|0|0xcdc8c4,6|0|0xd9d6d3",90,98,155,168,542}
            t['远征-战斗界面-中间攻击']={0xee3838, "0|0|0xee3838,-1|22|0xfaecec",90,285,45,1179,740}
                t['远征-战斗界面-有多个部队']={0x008fc3, "0|0|0x008fc3,0|138|0x008ec2",90,1239,90,1323,665}
                t['远征-战斗界面-有多个部队-行军']={0xffa800, "0|0|0xffa800,-18|-12|0xb67016",90,939,657,1157,749}
                t['远征-战斗界面-单个部队-行军']={0xfeaf00, "0|0|0xfeaf00,-7|-18|0xb67016,-2|-27|0xb67016",90,942,10,1191,744}
            t['远征-战斗界面-部队行军中']={0xfeffff, "0|0|0xfeffff,-5|1|0x109c00,9|0|0x0d9900",90,1274,203,1321,487}
            t['远征-战斗界面-部队战斗中']={0xb10000, "0|0|0xb10000,-1|1|0xb40303",90,1266,204,1324,510}
        t['远征-战斗界面-结束']={0xffffff, "0|0|0xffffff,25|18|0xffff64",90,731,136,882,288}
    t['菜单-战役-打不过-时间到']={0x1274ba, "0|0|0x1274ba,236|-4|0xffb100,105|-305|0xffffff",90,343,119,973,634}
    
t['日落峡谷-红点']={0xe20000, "0|0|0xe20000,-94|23|0xfefffe",90,734,374,919,488}
    t['日落峡谷-挑战界面']={0x00c2fe, "0|0|0x00c2fe,454|-593|0x7d5337,-595|-630|0xd6d3cf",90,4,3,1273,728}
        t['日落峡谷-红点-历史']={0xf9e9ac, "0|0|0xf9e9ac,30|-15|0xe20000",90,28,272,118,378}
        t['日落峡谷-红点-历史-x']={0xe0d3c5, "0|0|0xe0d3c5,-30|71|0x1274ba",90,1063,5,1215,148}
        t['日落峡谷-挑战界面-挑战对象']={0x00c2fe, "-16|-85|0x00bdfb,-14|-174|0x00bdfb,-19|-266|0x00bffd,-18|-355|0x00bdfb,156|-520|0x006e03,-666|-514|0x00bdfb",90,146,75,1116,690}    
            t['日落峡谷-挑战界面-挑战对象-跳过']={0x098b08, "-3|-10|0x5ff834,37|56|0x1274ba",90,585,600,716,707}
                t['日落峡谷-挑战界面-挑战对象-跳过-确定']={0x1274ba, "0|0|0x1274ba,-37|-3|0x00c3ff",90,573,651,764,706}
            t['日落峡谷-挑战界面-挑战对象-无次数']={0xe0d4c6, "0|0|0xe0d4c6,-51|67|0x006e03,-40|54|0x46ff6e",90,1060,15,1197,136}
            t['日落峡谷-挑战界面-挑战对象-无队伍']={0x730000, "0|0|0x730000,0|-4|0xff6641,0|4|0xe73d28",90,55,129,125,519}
                t['日落峡谷-挑战界面-挑战对象-无队伍-准备']={0xb67016, "0|0|0xb67016,-34|-9|0xffb300",90,601,582,1068,708}
                
function _远征()
    远征次数 =  远征次数 + 1
    if 远征次数 > 10 then
        _UI.远征 = false
        return
    end
    if not(d('联盟-展开联盟-联盟')) then
        d('联盟-展开联盟',true,2,3)
    end
    d('菜单-战役',true,1,3)
    
    --如果可以打日落峡谷
    if _UI.日落峡谷 and 日落峡谷次数 < 3 then
        日落峡谷次数 = 日落峡谷次数 + 1
        d("日落峡谷-红点",true,1,2)
        local 日落挑战次数 = 0
        local rltimeline = os.time()
        while ( os.time() - rltimeline < 120  and d("日落峡谷-挑战界面") ) do
            if d( "日落峡谷-红点-历史",true,1,2 ) then
                d("日落峡谷-红点-历史-x",true,1,2)
            elseif d("日落峡谷-挑战界面",true,1,2) then
                if d("日落峡谷-挑战界面-挑战对象",true,rd(1,5),5) then
                    if ( d("日落峡谷-挑战界面-挑战对象-无次数",true,1,2) )then
                       _UI.日落峡谷 = false
                       break
                    end
                end
                
                if not(d("日落峡谷-挑战界面-挑战对象-无队伍"))then
                    local duiwu = {{566, 188, 0xcaa084},{463, 177, 0x727292},{451, 271, 0x574f50},{288, 270, 0x776047},{249, 385, 0xd3a67f}}
                    for k,v in ipairs( duiwu )do
                       click(v[1],v[2])
                       d("日落峡谷-挑战界面-挑战对象-无队伍-准备",true,1,2)
                    end
                end
                
                if not( d("日落峡谷-挑战界面-挑战对象-跳过") ) then
                    click(614,620)
                end
                d("日落峡谷-挑战界面-挑战对象-跳过-确定",true,1,5)
                click(40,40)
            end
        end
        return
    end
    
    click(214, 332,2)
    d('菜单-远征-收集奖励',true,1,2)
    -- if d('菜单-远征-可以购买',true,1,2) then
    --     d('菜单-远征-可以购买-科斯坦察',true,1,2)
    --     d('菜单-远征-可以购买-科斯坦察',true,1,2)
    -- end
    
    local i = 0
    while i < 10 and ( d('菜单-战役-挑战',true,1,3) or d('远征-任务目标-界面')) do
        i= i+ 1
        if d('远征-任务目标-界面-增加部队',true,1,2) then
            d('远征-任务目标-界面-增加部队-准备',true,1,2)
            if d('远征-任务目标-界面-增加部队-部队不足',true,1,2)then
                --部队不足
                if not( d('远征-任务目标-界面-胜券在握',true,1,5) )then
                    _UI.远征 = false
                    return 
                end
            end
        else
            --部队不足
            if not( d('远征-任务目标-界面-胜券在握',true,1,5) )then
                _UI.远征 = false
                return 
            end
        end
        
        if d('远征-任务目标-界面-胜券在握',true,1,5) then
            
        end

        local i = 0
        while i < 120 and d('远征-战斗界面') do
            i= i+ 1
            if d('远征-战斗界面-有空闲部队') then
                d('远征-战斗界面-左侧敌人',true,1,2)
                d('远征-战斗界面-中间攻击',true,1,3)
                
                if d("远征-战斗界面-有多个部队")then
                    click(1227,710)
                    d("远征-战斗界面-有多个部队-行军",true,1,3)
                else
                    d('远征-战斗界面-有空闲部队-驻扎',true,1,1)
    		        d('远征-战斗界面-单个部队-行军',true,1,3)
                end

            elseif d('远征-战斗界面-部队行军中') or d('远征-战斗界面-部队战斗中') then
            elseif d('远征-战斗界面-结束',true,1,5)then
            end
            delay(1)
        end
    end
    
    if d('菜单-战役-打不过-时间到',true,1,2)then
        _UI.远征 = false
        log('远征结束-正常')
    end
end

t['铁匠铺-生产']={0x006193, "0|0|0x006193,-148|0|0xda9c08,-278|-26|0x0a7bb4",90,907,348,1330,554}
t['铁匠铺-生产2']={0x0074ad, "0|0|0x0074ad,-137|25|0xda9b07,-272|-3|0xe2f2f7",90,903,278,1330,581}
function _铁匠铺()
    log("铁匠铺")
    click(1125,292,2)
    click(1125,292,2)
    if d("铁匠铺-生产",true,1,2) or d("铁匠铺-生产2",true,1,2) then
        
        local 材料位置 = { {803, 246, 0x62351e},{895, 249, 0x7a8198},{993, 252, 0x2f120e},{1089, 249, 0xeae8ea} }
        click( 1089 - (os.time() % 4)*97,246, 1)
        
    end
    _UI.铁匠铺 = false
end





t['游戏未绑定']={0x09bf07, "0|0|0x09bf07,-729|-10|0x09c107,-482|-517|0xfbe4c5,77|-450|0xfef2e5",90,304,55,1289,670}
function game()
    
    打野降低key = false;
    打野增长key = true;
    采矿调低一次 = true
    任务记数 = 0
    打野次数记数 = 0;
    收集次数 = 0
    读邮件次数 = 0
    日历奖励 = 0
    除草次数 = 0
    建造次数 = 0
    采矿次数 = 0
    升级次数 = 0
    斥候次数 = 0
    领邮件奖励 = 0
    修理城墙 = 0
    研究次数 = 0
    造兵次数 = 0
    联盟次数 = 0
    送物资次数 = 0
    远征次数 = 0
    英雄次数 = 0
    arrowKey = 0
    日落峡谷次数 = 0
    
	local timeline = os.time()
	while os.time()-timeline < 60 * 40 do
		if active(_app.bid,5)then
			if d('游戏主界面') or d('游戏主界面-夜')then
				if d("游戏主界面-城内")then
					d('弹窗_绑定帐号',true,1)
					--每次都点帮助
					d('收集-帮助',true,2)
					
					if _UI.除草 and _glass() then end
					if _UI.VIP奖励 and _SignIn() then end
					if _UI.收集资源 and _Collect() then end
					if _UI.读邮件 and _mail() then end
					if _UI.日历奖励 and _book() then end
					
					if _init() then
					    
					    if _UI.神秘商人 and d("神秘商人来了",true,1,2) then
					        _神秘商店()
					    elseif _UI.铁匠铺 then
					        _铁匠铺()
						elseif _Hospital() then
						elseif _UI.英雄升级加点 then
						    _加天赋()
						elseif _UI.远征 then
						    _远征()
						elseif _UI.修城墙 then
						    _wall()
						elseif _UI.建造 then
							_NewBuild()
						elseif _UI.研究 then
						    _study()
						elseif _UI.英雄 then
							_Hero()
						elseif _UI.升级 then
							_build()
						elseif _UI.建筑列队 then
						    _build_two()
						elseif _UI.搜索村庄 then
						    read_mail()
						elseif true and _UI.奖励 then
							_Award()
						elseif _UI.任务 then
							_task()
						elseif _UI.造兵.key  then
							_soldier()
						elseif _UI.斥候 then
							_Acouts()
						elseif _UI.送物资 then
						    _songwuzi()
						elseif _UI.打野 then
						    if d("游戏主界面-城内",true,1,2)then
						        _monster()
						    end
						elseif _UI.采集.key then
							if d("游戏主界面-城内",true,1,2)then
								_Collection()
							end
						elseif _UI.联盟捐助 then
						    _lm()
						else
							return 'next'
						end
					end
				elseif d("游戏主界面-野外")then
					click(65,681,2)
				end
			elseif d('游戏未绑定')then
			    return false
			else
				if _Evevnt() then
				    arrowKey = arrowKey + 1
				    
				    if _Tips() == '封号' then
				        return 
				    end
		
					
				end
			end
		end
	end
	return 'next'
end
	


function main()
	
	while true do
	    
	    --拉取帐号
    	if AccountInfoBack() then
    	    --读出token
            __game.token = llsGameToken()[1]
            --初始化UI设置
            __UI = __game.wei_ui
            --完全格式化
            --小功能
            _UI.除草 = __UI['小功能']['除草']
            _UI.VIP奖励 = __UI['小功能']['VIP奖励']
            _UI.收集资源 = __UI['小功能']['收集资源']
            _UI.读邮件 = __UI['小功能']['读邮件']
            _UI.日历奖励 = __UI['小功能']['日历奖励']
            
            --支线功能
            _UI.远征 = __UI['支线功能']['远征']
            _UI.英雄升级加点 = __UI['支线功能']['英雄升级加点']
            _UI.日落峡谷 = __UI['支线功能']['日落峡谷']
            _UI.神秘商人 = __UI['支线功能']['神秘商人']
            _UI.铁匠铺 = __UI['支线功能']['铁匠铺']
            
            --主线功能
            _UI.修城墙 = __UI.主线功能.修城墙
            _UI.建造 = __UI.主线功能.建造
            _UI.英雄 = __UI.主线功能.酒馆召唤
            _UI.升级 = __UI.主线功能.升级
            _UI.搜索村庄 = __UI.搜索村庄
            _UI.奖励 = __UI.主线功能.奖励
            _UI.任务 = __UI.主线功能.任务
            
            --造兵功能
            _UI.造兵 = {}
            _UI.造兵.key = __UI.主线功能.造兵key
            _UI.造兵.步兵 = __UI.主线功能.步兵
            _UI.造兵.骑兵 = __UI.主线功能.骑兵
            _UI.造兵.弓兵 = __UI.主线功能.弓兵
            _UI.造兵.车兵 = __UI.主线功能.车兵
            
            --其它功能
            _UI.斥候 = __UI.主线功能.斥候
            _UI.打野 = __UI.主线功能.打野
            _UI.打野次数 = tonumber(__UI.打野次数)
            _UI.打野吃体力 = __UI.主线功能.吃体力
            _UI.monsterlevel = __UI.monsterlevel or 1
            _UI.monsteDW = __UI.monsteDW or '默认'
            
            --采集设置
            _UI.采集 = {}
            _UI.采集.key = __UI.主线功能.采集key
            _UI.采集.种类 = __UI.采集种类
            _UI.采集.联盟矿场 = __UI.主线功能.联盟矿场
            if __UI.主线功能.采矿等级 then
                _UI.采集.采矿等级 = tonumber(__UI.主线功能.采矿等级)
            else
                _UI.采集.采矿等级 = 1
            end
            --联盟科技捐助
            _UI.联盟捐助 = __UI.主线功能.联盟捐助
            _UI.建筑列队 = false
            
            --物资运送
            _UI.物资运送 = __UI.主线功能.物资运送
            if __UI.R位置 == '坐标' then
                _UI.坐标 = split(__UI.坐标,',')
            end
            
            --是否截图
            upimg = true
            allimg = true
            log(_UI);
            game()
            --清理帐号
            clearOneAccount();
            delay(1)
            
        else
            toast('帐号休息中',9)
            delay(10);
            closeApp(_app.bid,1);
        end
	end
end


function all()

    local sz=require('sz')
    __game = {}
    __game.imei = getDeviceID()
    __game.phone_name = getDeviceName()
    main()
    
end

if not(__reg)  then
    while (true) do
    	local ret,errMessage = pcall(all)
    	if ret then
    	else
    	    vpnx();
    		log(errMessage)
    		dialog(errMessage, 10)
    		mSleep(2000)
    	end
    end
end














	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	