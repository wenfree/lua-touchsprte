--[[
1. 选中 App, 多个 app 以 "," 分割
http://127.0.0.1:1234/cmd?fun=selectapp&params=包名1,包名2

2. 备份 App, 多个 app 以 "," 分割，name不传会自动生成一个
http://127.0.0.1:1234/cmd?fun=backup&params=包名1,包名2&name=备份名

3. 删除备份, 多条备份以 "," 分割, 参数是备份名称。
http://127.0.0.1:1234/cmd?fun=deleteBackup&params=备份名

4. 获取所有备份记录
http://127.0.0.1:1234/cmd?fun=getBackupList

5. 恢复某条备份,参数是备份名
http://127.0.0.1:1234/cmd?fun=recovery&params=备份名

6. 重命名某条备份
http://127.0.0.1:1234/cmd?fun=renameBackup&params=老名字&name=新名字

7. 已经选中的 App
http://127.0.0.1:1234/cmd?fun=hasSelectedApp

8. 删除所有的备份
http://127.0.0.1:1234/cmd?fun=deleteAllBackup

9. 生效第一条备份
http://127.0.0.1:1234/cmd?fun=validFirst

10. 生效最后一条备份
http://127.0.0.1:1234/cmd?fun=validLast

1. 一键新机
http://127.0.0.1:1234/cmd?fun=newmachine

以上接口都是：
成功是{"status" : 1}
失败是{"status" : 0}


12. 生效下一条备份
http://127.0.0.1:1234/cmd?fun=validNext

返回结果:
成功:
{"status":1}
失败:
{"status":-1, "error":"已到达最后一条备份"} 
{"status":0, "error":"当前没有被恢复的备份"}，这个时候需要先恢复一条，才好进行生效下一条

13. 获取当前激活的备份名
http://127.0.0.1:1234/cmd?fun=getCurrentBackupName
返回结果:
成功:
{"status":1, "data":"备份名"}
失败:
{"status":-1, "error":"没有取到当前的备份"}
{"status":0, "error":"当前没有被恢复的备份"}
--]]
require("tsp")

function xz(bid)
	abl_bid = 'com.beibeijia.Apollon'
	--采用 cjson 构造请求头部 json
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	local first_url = "http://127.0.0.1:1234/cmd?fun=selectapp&params="..bid
	active(abl_bid,3)
	delay(3)
	status, headers, body =  http.get(first_url)
	nLog(body)
	local success, result = pcall(function(str) return cjson.decode(str) end, body)
	if success then
		return true
	else
		return false 
	end
end

--   一键新机
function abl()
	abl_bid = 'com.beibeijia.Apollon'
	--采用 cjson 构造请求头部 json
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	local first_url = "http://127.0.0.1:1234/cmd?fun=newmachine"
	active(abl_bid,3)
	delay(3)
	status, headers, body =  http.get(first_url)
	nLog(body)
	local success, result = pcall(function(str) return cjson.decode(str) end, body)
	if success then
		return true
	else
		return false 
	end
end

--   生成备份 并一键新机
function abl_backup(bundler_id)
	abl_bid = 'com.beibeijia.Apollon'
	active(abl_bid,3)
	delay(3)
	--采用 cjson 构造请求头部 json
	local sz = require("sz")
	local cjson = sz.json
	local first_url = "http://127.0.0.1:1234/cmd?fun=backup&params=" .. bundler_id
	local http = require("szocket.http")
	http.TIMEOUT = 30
	local body, code = http.request(first_url);
	toast(body,3)
	delay(3)
	return true
end

--   获取IDFA
function get_idfa222(bundler_id)
	--采用 cjson 构造请求头部 json
	abl_bid = 'com.beibeijia.Apollon'
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	local first_url = "http://127.0.0.1:1234/cmd?fun=getfakeparams&params=" .. bundler_id
	active(abl_bid,3)
	status, headers, body =  http.get(first_url)
	nLog(body)
	
	local success, result = pcall(function(str) return cjson.decode(str) end, body)
	if success then
	
	
	
	
	end
--[[
	local success, result = pcall(function(str) return cjson.decode(str) end, body)
	if success then
		local res_json = result
		idfa = res_json["data"][bundler_id]["idfa"]
		nLog("获取idfa : " .. idfa)
		return true
	else
	nLog("获取idfa fail" .. status)
	return false 
	end
--]]
end

function get_idfa(bundler_id)
	--采用 cjson 构造请求头部 json
	abl_bid = 'com.beibeijia.Apollon'
	active(abl_bid,3)
	delay(2)  
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	local first_url = "http://127.0.0.1:1234/cmd?fun=getfakeparams&params=" .. bundler_id

	status, headers, body =  http.get(first_url)
	nLog(body,3)
	local success, result = pcall(function(str) return cjson.decode(str) end, body)
	if success then
		local res_json = result
		idfa = res_json["data"][bundler_id]["idfa"]
		nLog("获取idfa : " .. idfa)
		toast(idfa)
		return true
	else
		nLog("获取idfa fail" .. status)
		return false 
	end

end



-- 获取备份列表
function get_backup_list()
	abl_bid = 'com.beibeijia.Apollon'
	active(abl_bid,3)
	delay(3)  
	local sz = require("sz")
	local cjson = sz.json

	local first_url = "http://127.0.0.1:1234/cmd?fun=getBackupList"
	local http = require("szocket.http")
	http.TIMEOUT = 30
	local body, code = http.request(first_url);
	local success, result = pcall(function(str) return cjson.decode(str) end, body)
	toast(result,3)
	delay(3)
	return result.data
end




--激活第一个备份

function active_first_backup()
	abl_bid = 'com.beibeijia.Apollon'
	active(abl_bid,3)
	delay(1)  
	local sz = require("sz")
	local cjson = sz.json

	local first_url = "http://127.0.0.1:1234/cmd?fun=validFirst"
	local http = require("szocket.http")
	http.TIMEOUT = 30
	local body, code = http.request(first_url);
	local success, result = pcall(function(str) return cjson.decode(str) end, body)

	return result.status
end


-- 激活最后一个备份
function active_last_backup()
	abl_bid = 'com.beibeijia.Apollon'
	active(abl_bid,3)
	delay(1)  
	local sz = require("sz")
	local cjson = sz.json

	local first_url = "http://127.0.0.1:1234/cmd?fun=validLast"
	local http = require("szocket.http")
	http.TIMEOUT = 30
	local body, code = http.request(first_url);
	local success, result = pcall(function(str) return cjson.decode(str) end, body)
	--toast(result,3)
	delay(3)
	return result.status
end

-- 激活下一个备份
function active_next_backup()
	abl_bid = 'com.beibeijia.Apollon'
	active(abl_bid,3)
	delay(1)  
	local sz = require("sz")
	local cjson = sz.json

	local first_url = "http://127.0.0.1:1234/cmd?fun=validNext"
	local http = require("szocket.http")
	http.TIMEOUT = 30
	local body, code = http.request(first_url);
	local success, result = pcall(function(str) return cjson.decode(str) end, body)
	delay(5)
	dialog(body)
	delay(3)
	return result.status
end

--	按名字激活备份
function active_backup(name)

	abl_bid = 'com.beibeijia.Apollon'
	active(abl_bid,3)
	delay(3)  
	local sz = require("sz")
	local cjson = sz.json

	local first_url = "http://127.0.0.1:1234/cmd?fun=recovery&params=" .. name
	local http = require("szocket.http")
	http.TIMEOUT = 30
	local body, code = http.request(first_url)
	local success, result = pcall(function(str) return cjson.decode(str) end, body)
	toast(body,3)
	delay(3)
	return true
	
end

--	删除所有备份
function deleteAllBackup()

	abl_bid = 'com.beibeijia.Apollon'
	active(abl_bid,3)
	delay(2)  
	local sz = require("sz")
	local cjson = sz.json

	local first_url = "http://127.0.0.1:1234/cmd?fun=deleteAllBackup"
	local http = require("szocket.http")
	http.TIMEOUT = 30
	local body, code = http.request(first_url)
	local success, result = pcall(function(str) return cjson.decode(str) end, body)
	toast(body,3)
	delay(3)
	return true
	
end

--http://127.0.0.1:1234/cmd?fun=getBackupList  4. 获取所有备份记录
function getBackupList()

	abl_bid = 'com.beibeijia.Apollon'
	active(abl_bid,3)
	mSleep(2000)  
	local sz = require("sz")
	local cjson = sz.json

	local first_url = "http://127.0.0.1:1234/cmd?fun=getBackupList"
	local http = require("szocket.http")
	http.TIMEOUT = 30
	local body, code = http.request(first_url)
	local success, result = pcall(function(str) return cjson.decode(str) end, body)
	toast(body,3)
	nLog(body)
	mSleep(2000)

	local json = sz.json
	backall = json.decode(body)
	if backall.status == 1 then
		nLog(#backall.data)
		return #backall.data
	end

end














