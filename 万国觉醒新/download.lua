--unlockDevice()
require("TSLib")
--require("tsp")

--res, code = http.request("http://ip.chinaz.com/getip.aspx");
--用http.get实现下载文件功能
function downFile(path)
	local sz = require("sz")
	local http = require("szocket.http")
	local url = "https://img.wenfree.cn/rok/new.lua"
	local res, code = http.request(url);
    if code == 200 then
        local file = io.open("/User/Media/TouchSprite/lua/new.lua", "w+")
        if file then
            file:write(res)
            file:close()
            return status;
        else
            return -1;
        end
    else
        return status;
    end
end

function delFile(path)--帮你玩平台禁用此函数
    os.execute("rm -rf "..path);
end

--检测指定文件是否存在
function file_exists(file_name)
    local f = io.open(file_name, "r")
    return f ~= nil and f:close()
end

game_lua = {
    {"download",'https://img.wenfree.cn/rok/download.lua'},
    {"UIs",'https://img.wenfree.cn/rok/UIs.lua'},
	{"ZZBase64",'https://img.wenfree.cn/rok/ZZBase64.lua'},
	{"api",'https://img.wenfree.cn/rok/api.lua'},
	{"token",'https://img.wenfree.cn/rok/token.lua'},
	{"tsp",'https://img.wenfree.cn/rok/tsp.lua'},
	{"yzm",'https://img.wenfree.cn/rok/yzm.lua'},
	{"new",'https://img.wenfree.cn/rok/new.lua'},
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

dialog('请用main启动脚本',10)






























































