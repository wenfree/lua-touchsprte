local sz = require("sz")
local cjson = sz.json
local http = sz.i82.http
function downFile(url, path)
	status, headers, body = http.get(url)
	if status == 200 then
		file = io.open(path, "wb")
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
url = {}
url.a = "http://luawarehouse.applinzi.com/AD/file/007gaiji.plist"
url.b = "http://luawarehouse.applinzi.com/AD/file/007gaiji-pb.plist"
url.c = "http://luawarehouse.applinzi.com/AD/file/191gaiji.plist"
url.d = "http://luawarehouse.applinzi.com/AD/file/191gaiji-pb.plist"
url.e = "http://luawarehouse.applinzi.com/AD/file/192gaiji.plist"
url.f = "http://luawarehouse.applinzi.com/AD/file/192gaiji-pb.plist"
url.g = "http://luawarehouse.applinzi.com/AD/file/193gaiji.plist"
url.h = "http://luawarehouse.applinzi.com/AD/file/193gaiji-pb.plist"
path = {}
path.a = "/Library/MobileSubstrate/DynamicLibraries/007gaiji.plist"
path.b = "/Library/MobileSubstrate/DynamicLibraries/007gaiji-pb.plist"
path.c = "/Library/MobileSubstrate/DynamicLibraries/191gaiji.plist"
path.d = "/Library/MobileSubstrate/DynamicLibraries/191gaiji-pb.plist"
path.e = "/Library/MobileSubstrate/DynamicLibraries/192gaiji.plist"
path.f = "/Library/MobileSubstrate/DynamicLibraries/192gaiji-pb.plist"
path.g = "/Library/MobileSubstrate/DynamicLibraries/193gaiji.plist"
path.h = "/Library/MobileSubstrate/DynamicLibraries/193gaiji-pb.plist"
for k,v in pairs(url) do
	downFile(v,path[k])
	nLog(path[k])
	mSleep(200)
end
dialog('脚本更新重新启动手机', 5)
lua_exit();