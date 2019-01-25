







function renameCurrentRecord(name)
	local sz = require("sz");
	local http = require("szocket.http");
	
	nLog('即将新机')
	local res, code = http.request("http://127.0.0.1:1688/cmd?fun=renamecurrentrecord&name="..name);
	nLog(res)
	nLog(code)
	
	if code == 200 then
		local resJson = sz.json.decode(res);
		local result = resJson.result;
		dialog("the result is: " .. result, 2);
	end	
end

runApp("AWZ");
mSleep(1 * 1000);
renameCurrentRecord("wenhong");