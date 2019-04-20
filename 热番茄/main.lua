






require("tsp")
local sz = require("sz")
require("awz")

bid={}
var={}
var.channel = "whaso"


--全局变量

function upIdfa888(name,other)
	local urls = 'http://idfa888.com/Public/idfa/'
	local arr ={}
	arr.service = 'idfa.idfa'
	arr.phonename = phonename or getDeviceName()
	arr.imei = phoneimei or sz.system.serialnumber()
	arr.phoneos = phoneos or getOSVer()
	arr.name = name
	arr.idfa = idfa
	arr.ip = ip or get_ip() or '192.168.1.1'
	arr.account = keyword or account
	arr.password = password
	arr.phone = phone
	arr.other = other
	local res = get(urls,arr)
	if res ~= nil then
		if res['ret'] == 200 then
			log('idfa888-上传成功',true)
			return res
		end
	end
end

function back_pass(task_id,success)
	local url = 'http://wenfree.cn/api/Public/tjj/'
	local postArr = {}
	postArr.service = 'Tjj.backpass'
	postArr.task_id = task_id
	postArr.success = success
	local res = get(url,postArr)
	if res ~= nil then
		if res['ret'] == 200 then
			log('wenfree-上传成功',true)
		end
	end
end


function checkidfa(name)
	
	log('准备排重')
	local url = "http://api.refanqie.com/1/hlw-coreapi/channel/checkIdfa.json"
	local postArr = {}
	postArr.appid =bid[name]['appid']
	postArr.idfa=idfa
	postArr.ip=ip or get_ip() or rd(1,255)..'.'..rd(1,255)..'.'..rd(1,255)..'.'..rd(1,255)
	postArr.channel = var.channel
	postArr.keyword = bid[name]['keyword']

	local getdata = get(url,postArr)
	if getdata ~= nil then
		log(getdata or "nil")
		if getdata[idfa] == 0 then
			log("idfa: OK.",true)
			return true
		else
			log("idfa------排重失败",true)
		end
	end
end

function clickidfa(name)
	local url = "http://api.refanqie.com/1/hlw-coreapi/channel/reportClick.json"
	local postArr = {}
	postArr.appid = bid[name]['appid']
	postArr.idfa = idfa
	postArr.ip   = ip or get_ip() or rd(1,255)..'.'..rd(1,255)..'.'..rd(1,255)..'.'..rd(1,255)
	postArr.channel = var.channel
	----------------------
	postArr.model = model
	postArr.version = phoneos or getOSVer()
	postArr.keyword = bid[name]['keyword']
	
	if callbackid then
		postArr.callbackurl  = "http://idfa888.com/Public/idfa/?service=idfa.callback&id="..callbackid
	end
	
	local getdata = get(url,postArr)
	if getdata ~= nil then
		log(getdata or "nil")
		if getdata["message"] == "ok" then
			log("点击成功: OK.",true)
			return true
		else
			log("idfa-点击失败",true)
		end
	end
end


function activeidfa(name)
	local url = "http://api.refanqie.com/1/hlw-coreapi/channel/submitIdfa.json"
	local postArr = {}
	postArr.appid=bid[name]['appid']
	postArr.idfa=idfa
	postArr.ip=ip or get_ip() or rd(1,255)..'.'..rd(1,255)..'.'..rd(1,255)..'.'..rd(1,255)
	postArr.channel =var.channel
	----------------------
	postArr.model=model
	postArr.version = phoneos or getOSVer()
	postArr.keyword = bid[name]['keyword']
	if callbackid then
		postArr.callbackurl  = "http://idfa888.com/Public/idfa/?service=idfa.callback&id="..callbackid
	end
	
	local getdata = get(url,postArr)
	if getdata ~= nil then
		log(getdata or "nil")
		if getdata['message'] == "ok" then
			log("激活成功: OK.",true)
			return true
		else
			log("idfa-激活失败",true)
		end
	end
end

function checkip()
	log('查询ip地址是否可用')
	ip = get_ip()
	if ip ~= nil then
		local url = 'http://idfa888.com/Public/idfa/'
		local getdata = {}
		getdata.service = 'idfa.checkip'
		getdata.ip = ip
		local getdata = get(url,getdata)
		if getdata ~= nil then
			log(getdata or "nil")
			if getdata.data.state == "ok" then
				log("ip可以用:OK.",true)
				return true
			else
				log("ip, 排重失败",true)
			end
		end
	else
		log("取ip失败")
	end
end

function callbackapi(name)
	if awzNew()then
		model,idfa = getTrueName_awz()
		local callbackdata = upIdfa888(name,bid[name]['keyword'])
		
		log(callbackdata)
		
		if callbackdata ~= nil then
			callbackid = callbackdata['data']['id']
			if callbackid ~= nil then
				if checkidfa(name)then
					if clickidfa(name)then
						delay(rd(10,20))
						newidfa(name,1)
					end
				end
			end
		end
	end
end


function newidfa(name,times)
	local TIMEline = os.time()
	local OUTtime = rd(180,185)
	while os.time()- TIMEline < OUTtime do
		if active(bid[name]['appbid'],4)then
			moveTo(600,300,100,100,30,50)
			delay(1)
			click(321, 978)
			delay(1)
			click(462, 666)
			delay(1)
		else
			log("启动一次")
		end
	end
	upIdfa888(name,bid[name]['keyword'])
end

function get_task()
	local url = 'http://wenfree.cn/api/Public/tjj/'
	local postArr = {}
	postArr.service = 'Tjj.gettask'
	postArr.phonename = phonename or getDeviceName()
	postArr.imei = phoneimei or sz.system.serialnumber()
	log('imei-' .. sz.system.serialnumber())
	local taskData = get(url,postArr)
	if taskData ~= nil then
		log(taskData)
		if taskData.data == "新增手机" or taskData.data == "暂无任务" then
			log(taskData.data,true)
			delay(30)
			return false
		else
			return taskData.data
		end
	end
end

function main()
while true do
	log("vpn-key")

	-----------------------------------
			local TaskDate = ( get_task() )
			if TaskDate then
				for i,v in ipairs(TaskDate) do
					
					log(v)
					
					if false or vpn.on() then
						if true or checkip()then
							work = v.work
							task_id = v.task_id
							bid[work]={}
							bid[work]['keyword']=v['keyword']
							if string.len(v.appbid)>5  then	bid[work]['appbid']=v.appbid end
							if string.len(v.appid)>5  then	bid[work]['appid']=v.appid	end
							callbackapi(work)
						end
						vpn.off()
						delay(3)
					end
					
				end
			end
	------------------------------------

end
end

while (true) do
	local ret,errMessage = pcall(main)
	if ret then
	else
		dialog(errMessage,60)
		delay(5)
	end
end




















































































