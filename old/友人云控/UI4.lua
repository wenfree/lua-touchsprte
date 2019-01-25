w,h=getScreenSize()
require("tsp")

page={}
page['首页']={}
page['首页']['微信'] = {"微信",200, 58,359, 102}
page['首页']['搜索图标'] = {"搜索图标",259, 149,316, 196}
page['首页']['电脑已经登录'] = {"电脑已经登录",5, 137,109, 312}
page['首页']['有弹窗']={{63,115,0xededed},{91,115,0xededed},{124,114,0xededed},}

page['发现']={}
page['发现']['发现'] = {"发现",364, h-94,434, h-26}
page['发现']['发现激活'] = {"发现激活",364, h-94,434, h-26}
page['发现']['发现激活6.5.8']={{405,911,0x1aad19},}
page['发现']['附近的人'] = {"附近的人",12, 143,116, 855}
page['发现']['附近的人列表'] = {"附近的人列表",232, 53,410, 112}
page['发现']['详细资料'] = {"详细资料",231, 58,407, 118}
page['发现']['打招呼'] = {"打招呼",215, 440,415, 958}
page['发现']['发消息'] = {"发消息",215, 440,415, 958}
page['发现']['打招呼界面'] = {"打招呼界面",239, 50,400, 115}

page['初始化']={}
page['初始化']['back']={ 0xffffff, "", 90, 11, 52, 50, 116}
page['初始化']['搜索icon']={ 0x8e8e93, "0|-9|0xffffff,9|-9|0x8e8e93,-8|-9|0x8e8e93", 90, 261, 155, 308, 196}
page['初始化']['chat']={ 0x1aad19, "", 80, 58, 885, 104, 925}

page['v1加人']={}
page['v1加人']['加人按钮']={ 0xffffff, "2|-4|0x121213,5|-5|0xfdfdfd", 90, 50, 78, 67, 93}
page['v1加人']['确定']={ 0x007aff, "-6|-8|0x007aff", 90, 410, 351, 495, 396}
page['v1加人']['开启了验证']={ 0x000000, "0|-2|0xeeeeee,13|-2|0x000000", 90, 163, 113, 201, 125}
page['v1加人']['发送']={ 0x007aff, "16|2|0x007aff", 90, 414, 385, 497, 439}
page['v1加人']['已经加过']={ 0x007aff, "-2|-9|0xf5f5f5", 90, 320, 569, 354, 595}


function add_V1()
	计时 = os.time()
	超时 = 60 * 5
	toast('V1加人中',5)
	for i,v in pairs(tasks.task.phones)do
		if c_pic(page['v1加人']['加人按钮'],'加人按钮')then
			delay(2)
			input(v)
			if c_pic(page['v1加人']['确定'],'确定')then
				toast('添加一次',2)
				delay(2)
			end
			if c_pic(page['v1加人']['开启了验证'],'开启了验证')then
				input(tasks.task.words[math.random(1,#tasks.task.words)])
			end
			c_pic(page['v1加人']['发送'],'发送')
			delay(2)
			if c_pic(page['v1加人']['已经加过'],'已经加过')then
				delay(2)
			end
		end
	end
	return true
end


function readFile(path)
    local file = io.open(path,"r");
    if file then
        local _list = {};
        for l in file:lines() do
            table.insert(_list,l)
        end
        file:close();
        return _list
    end
end
--移动文件
function movefile(path,to)--帮你玩平台禁用此函数
    os.execute("mv "..path.." "..to);
end
--删除文件
function delFile(path)--帮你玩平台禁用此函数
    os.execute("rm -rf "..path);
end
--遍历文件
function getList(path)
    local a = io.popen("ls "..path);
    local f = {};
    for l in a:lines() do
        table.insert(f,l)
    end
    return f
end
--查找文件
function findFile(path)
    local a = io.popen("find "..path.." -prune");
    local f = {};
    for l in a:lines() do
        table.insert(f,l)
    end
    return f
end

function v1()
	require("Api")
	path = '/var/mobile/Library/Preferences/'
	file = findFile(path..'*.txt');
	if #file == 1 then
		list = readFile(file[1])
	else
		list = readFile(file[#file])
	end
	for i,v in pairs(list)do
		nLog(v)
		if v == nil then
			toast("采集出错,等待数据确认",3)
		else
			up_V1(v)
		end
		mSleep(1000)
		toast('上传'..i,1)
	end
	return true
end

function getV1()
	计时 = os.time()
	超时 = 60 * 6
	
	while (os.time()-计时<超时) do
		if c_tu(page['首页']['微信'],false)then
			click(402,897)
			
		elseif c_tu(page['发现']['发现激活'],false)or done(page['发现']['发现激活6.5.8'],'发现激活6.5.8')then
			c_tu(page['发现']['附近的人'],true)
			mSleep(1000* 15)
		elseif c_tu(page['发现']['附近的人列表'],false)then
			toast('正在上传数据,约3分钟,请等待',10)
			v1()
			toast('上传完成',2)
			return true
		else
			log('getV1')
		end
		
		mSleep(1000* 1)
	end
end


function click(x,y,times)
	times = times or 2
--	log("准备点击("..x..","..y..")")
	touchDown(1, x+math.random(-3,3), y+math.random(-3,3))
	mSleep(50)
	touchUp(1, x+math.random(-3,3), y+math.random(-3,3))
	mSleep(1000*times)
end
function OK()
	
	if c_p(page['初始化']['back'],"back")then
	elseif done(page['首页']['有弹窗'],'有弹窗')then
		click(  193,  368)
	elseif f_p(page['初始化']['chat'],"chat")~=true then
		click(82,900)--iphone4
		log('没有chat')
	elseif f_p(page['初始化']['chat'],"chat") and f_pic(page['初始化']['搜索icon'],'搜索icon')then
		log('微信首页-->发现麦克风')
		return true
	else
		click(319,34) --返回顶部
	end
	log('微信初始化')
	
end
 
function Near4()
	步骤 = 1
	打招呼次数 = 0
	点击位置 = 0
	UpKey = false

	nearBack = true
	超时 = os.time()
	while os.time() - 超时 < 60 * 20 do
		
		if c_tu(page['首页']['微信'],false)then
			c_tu(page['发现']['发现'],true)
		elseif c_tu(page['发现']['发现激活'],false)then
			c_tu(page['发现']['附近的人'],true)
			toast('等15秒显示内容',15)
			mSleep( 1000 * 15 )
			c_p(m.站街提示_知道了,'知道了')
			c_p({ 0x0b71ef, "", 90, 438, 606, 474, 637},'好')
			c_pic(m.站街被人加了提示,'站街被人加了提示')
			
		elseif 	打招呼次数 >= tonumber(tasks.task.max_num) then
			return true
		elseif c_tu(page['发现']['附近的人列表'],false)then
			
			if 打招呼次数 > 1 and 打招呼次数%6 == 0 then
				UpKey = true
				点击位置 = 0
			end
			if UpKey then
				moveUp(319,781,285,462)
				moveUp(319,781,285,462)
				moveUp(319,781,285,462)
				mSleep(2000)
				UpKey = false
			end
			nearBack = true
			click(313,185 + (点击位置 * 130) )	--点击附近的人
		
		elseif c_tu(page['发现']['详细资料'],false)then
			if nearBack then
				if c_tu(page['发现']['打招呼'],true)then
					toast('准备打招呼',1)
					nearBack = false
				elseif c_tu(page['发现']['发消息'],false)then
					nearBack = false
				else
					moveUp(319,781,285,462)
					mSleep( 1000 )
				end
			else
				if c_tu(page['发现']['附近的人列表'],false)then
					nearBack = true
				else
					click(59,80) --点击返回
				end
			end
		elseif c_tu(page['发现']['打招呼界面'],false)then
			mSleep( 1000 )
			input(tasks.task.chat_words[math.random(1,#tasks.task.chat_words)]) --输入喊话
			click(577,82)
			mSleep(1000 * 8)
			点击位置 = 点击位置 + 1
			log("第"..打招呼次数)
			打招呼次数 = 打招呼次数 + 1
		else
			click(59,80) --点击返回
		end
	end
	closeX(app)
end
function addbook1()
	closeX(app)
	removeAllContactsFromAB();
	toast("清除旧通讯录",3)
	mSleep(1000)
	addAB = {}
	for i,v in ipairs(tasks.task.phones)do
		addAB[i] = {lastname,firstname,mobile}
		addAB[i].lastname = i             --生成姓
		addAB[i].firstname = i            --生成名
		addAB[i].mobile = v               --生成电话号码
	end
	toast('生成新电话本',5)
	for _,v in ipairs(addAB) do
		addContactToAB(v)                 --添加到联系人
	end
	mSleep(15000)
	if active(app)then
		delay(5)
	end
	if OK() and AddBook()then
		up_Task('yes')
	end
end
nLog('UI4加载完成')


