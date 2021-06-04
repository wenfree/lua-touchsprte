


--unlockDevice()
require("TSLib")
--require("tsp")

--res, code = http.request("http://ip.chinaz.com/getip.aspx");
--用http.get实现下载文件功能
function downFile(url, path)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(url);
--	nLog(res)
    if code == 200 then
		local body = res
        local file = io.open(path, "w+")
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

function delFile(path)--帮你玩平台禁用此函数
    os.execute("rm -rf "..path);
end

--检测指定文件是否存在
function file_exists(file_name)
    local f = io.open(file_name, "r")
    return f ~= nil and f:close()
end

game_lua = {

	{"AWZ",'https://img.wenfree.cn/snkrs/AWZ.lua'},
	{"AXJ",'https://img.wenfree.cn/snkrs/AXJ.lua'},
	{"UIs",'https://img.wenfree.cn/snkrs/UIs.lua'},
	{"api",'https://img.wenfree.cn/snkrs/api.lua'},
	{"re-login",'https://img.wenfree.cn/snkrs/re-login.lua'},
	{"tsp",'https://img.wenfree.cn/snkrs/tsp.lua'},
	{"ui",'https://img.wenfree.cn/snkrs/ui.lua'},
	{"main",'https://img.wenfree.cn/snkrs/main.lua'},
	{"snkrs",'https://img.wenfree.cn/snkrs/snkrs.lua'},

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


dialog('请用snkrs启动',3)
require('snkrs')






























































