require("TSLib")
require("tsp")




t={}


var = {}
var.appbid = 'com.ss.iphone.ugc.Aweme'



function dy_task_get()
	local url_task_get = 'http://wenfree.cn/api/Public/tjj/?service=Dy.dy_task_get'
	local data = get(url_task_get)
	if data ~= nil then
		return data
	end
end

function dy_task_back()
	local url_task_get = 'http://wenfree.cn/api/Public/tjj/?service=Dy.dy_task_back'
	local postArr = {}
	postArr.task_id = dyTask.data[1]['id']
	postArr.success = 'ok'
	local data = post(url_task_get,postArr)
	if data ~= nil then
		return data
	end
end




log(dy_task_get())





t['首页红绿']={ 0xff3b61, "0|15|0xff3b61,-69|0|0x25f4ee,-69|17|0x25f4ee", 90, 260, 1047, 375, 1132 } --
t['搜索页面']={ 0xa1a2a6, "526|-16|0xe9e9ea,552|-12|0x161823,554|18|0xe9e9ea", 90, 12, 38, 628, 128 } --
t['搜索取消']={ 0xfe2c55, "-2|7|0x161823,47|21|0x161823", 90, 517, 52, 633, 111 } --
	t['搜索取消_搜索']={ 0xffffff, "-2|0|0x007aff", 90, 489, 957, 637, 1133 } --多点找色
t['搜索结果界面']={ 0x9c9da2, "84|128|0xfbd227,87|125|0xfbce15", 90, 10, 42, 630, 530 } --
	t['搜索结果界面_关注']={ 0xffffff, "1|0|0xff4065,-67|-18|0xff2c55,67|17|0xff2c55", 90, 399, 231, 629, 526 } --
	t['搜索结果界面_已关注']={ 0xececed, "-68|-20|0x393a44,74|21|0x393a44,75|-24|0x393a44", 90, 334, 236, 629, 583 } --

function follow(dyid)
	local Timeline = os.time()
	local usedTime = 60
	while (os.time()- Timeline < usedTime) do
		if active(var.appbid)then 
			if d('首页红绿',true,{590,79})then
			elseif d('搜索页面',true,{494,86})then
			elseif d('搜索取消')then
				input[1]('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
				input[1](dyid)
				if d('搜索取消_搜索',true,1,3)then
				end
			elseif d('搜索结果界面')then
				if d('搜索结果界面_关注',true,1,3)then
				elseif d('搜索结果界面_已关注',true,{41,83})then
					return true
				else
					click(41,83)
				end
			end
		end
		delay(1)
	end
end



while (true) do
	dyTask = dy_task_get()
	if dyTask ~= nil and dyTask.data ~= 'no_task' then
		if follow(dyTask.data[1]['task_target'])then
			dy_task_back()
		end
	else
		log('暂无任务',10)
		delay(20)
	end
end
















































