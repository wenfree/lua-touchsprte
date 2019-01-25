

function ip()
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request("http://www.parkmm.top:8080/localip.php");
	--nLog(res)
	if code == 200 then
		local i,j = string.find(res, "%d+%.%d+%.%d+%.%d+")
		local ipaddr =string.sub(res,i,j)
		return ipaddr
	else
		return code
	end
end




nLog(ip())