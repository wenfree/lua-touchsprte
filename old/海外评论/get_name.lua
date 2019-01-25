

function getName()
	get_task_url = 'http://test1.oupag.com/Public/aso/?service=Aso.get_name'
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(get_task_url);
	--nLog(res)
	if code == 200 then
		local json = sz.json
		data = json.decode(res)
		nLog(data.data)
		return true
	end
end

--[[

for var= 1, 1000 do
	getName()
end

--]]