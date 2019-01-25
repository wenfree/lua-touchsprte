
require("tsp")


local apiurl = 'http://39.106.100.198:1900/do'
user = 'admin'
function GET_Phone()
	get_task_url = 'http://39.106.100.198:1900/do?action=getMobilenum1&user=admin&time=1'
	nLog(get_task_url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(get_task_url);
	nLog(res)
	if code == 200 then
		local phonelist = split(res,"|")
		phone = phonelist[2]
		writeFile(phonelist,phone)
		return true
	end
end



function GET_messages()
	phone = readFile(phonelist)[1]
	get_task_url = 'http://39.106.100.198:1900/do?action=getVcodeAndReleaseMobile1&mobile='..phone..'&user=admin&time=1'
	nLog(get_task_url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(get_task_url);
	nLog(res)
	if code == 200 then
		local phonelist = split(res,"|")
		sms = phonelist[2]
		return true
	end
end

--文件按行写入--------------
function writeFile(file_name,string,way)
	way = way or 'a'   --w or a
	local f = assert(io.open(file_name, way))
	f:write(string)
	f:close()
end
--将指定文件中的内容按行读取
function readFile(path)
    local file = io.open(path,"r");
    if file then
        local _list = {};
        for l in file:lines() do
            table.insert(_list,l)
        end
        file:close();
        return _list
    end
end

phonelist = "/User/Media/TouchSprite/lua/phone.txt"

GET_Phone()
--GET_messages()