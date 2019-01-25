

require("tsp")
local sz = require("sz")

function get_task()
	local url = 'http://wenfree.cn/api/Public/tjj/?service=Tjj.gettask'
	local postArr = {}
	postArr.imei = sz.system.serialnumber()
	postArr.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
	local taskData = post(url,postArr)
	
	if taskData ~= nil then
		if taskData.data == "新增手机" or taskData.data == "暂无任务" then
			return false
		else
			return taskData.data
		end
	end
end

function upIdfa(name,other)
	local url = 'http://idfa888.com/Public/idfa/?service=idfa.idfa'
	local tb ={}
	tb.phonename = phonename or getDeviceName()
	tb.phoneimei = phoneimei or getDeviceType(); 
	tb.phoneos = phoneos or getOSType(); 
	tb.name = name
	tb.idfa = idfa or phone
	tb.ip = ip() or "192.168.1.1" 
	tb.account = account
	tb.password = password
	tb.phone = phone
	tb.other = other
	return post(url,tb)
end