require("TSLib")
require("tsp")
local sz = require("sz")

--传入数据
api={}
function api.wechat()
	local url = "http://wenfree.cn/api/Public/user/?service=User.wechat"
	local postarr = {}
	postarr.imei = sz.system.serialnumber()
	postarr.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")  --设备名
	postarr.whos = UIvalues.whos
	local data = post(url,postarr)
	if data ~= nil then
		print_r(data)
		return data
	end
end

function api.upqtt()
	local url = "http://wenfree.cn/api/Public/user/?service=Qtt.save"
	local postarr = {}
	postarr.imei = sz.system.serialnumber()
	postarr.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")  --设备名
	postarr.whos = UIvalues.whos
	postarr.bankphone = '签到成功'
	postarr.money = arr.qtt.money
	postarr.golds = arr.qtt.golds
	local data = post(url,postarr)
	if data ~= nil then
		print_r(data)
		return data
	end
end

function api.updftt()
	local url = "http://wenfree.cn/api/Public/user/?service=Dftt.save"
	local postarr = {}
	postarr.imei = sz.system.serialnumber()
	postarr.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")  --设备名
	postarr.whos = UIvalues.whos
	postarr.bankphone = '签到成功'
	postarr.money = arr.dftt.money
	postarr.golds = arr.dftt.golds
	local data = post(url,postarr)
	if data ~= nil then
		print_r(data)
		return data
	end
end

function api.yuett()
	local url = "http://wenfree.cn/api/Public/user/?service=Yuett.save"
	local postarr = {}
	postarr.imei = sz.system.serialnumber()
	postarr.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")  --设备名
	postarr.whos = UIvalues.whos
	postarr.bankphone = '签到成功'
	postarr.money = arr.yuett.money
	postarr.golds = arr.yuett.golds
	local data = post(url,postarr)
	if data ~= nil then
		print_r(data)
		return data
	end
end

function api.wulitt()
	local url = "http://wenfree.cn/api/Public/user/?service=Wulitt.save"
	local postarr = {}
	postarr.imei = sz.system.serialnumber()
	postarr.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")  --设备名
	postarr.whos = UIvalues.whos
	postarr.bankphone = '签到成功'
	postarr.money = arr.wulitt.money
	postarr.golds = arr.wulitt.golds
	local data = post(url,postarr)
	if data ~= nil then
		print_r(data)
		return data
	end
end


































