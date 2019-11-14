

require("tsp")
ts = require("ts")

function downloadurl(url,path) --下载文件到指定路径
	local download = function(url,path)
		return ts.tsDownload(path,url) 
	end
	for i = 1 ,5 do 
		local code, info =download(url, path) 
		if code == 200 then 
			if info == "success" then 
				return true 
			else 
				Showlog("[downloadurl] err info ="..info)
			end 
		else
			Showlog("[downloadurl] err c ="..code)
		end 
	end 
	return false 
end 

file = {    --文件处理模块
	exists = function(file_name)
		local f = io.open(file_name, "r")
		return f ~= nil and f:close()
	end,
	
	reads = function(file_name)
		local f = io.open(file_name,"r")
		if f then
			local c = f:read("*a")  
			f:close()  
			return c
		else
			return nil
		end
	end,
	writes = function(file_name,str,mode)
		mode =  mode or "w"
		local f = io.open(file_name, mode)
		if f == nil then return "" end 
		local ret = f:write(str)
		f:close()
		--[[
		mode =  mode or "w+"
		writeFileString(file_name,str,mode)
		--]]
	end,
}
function Showlog(s)
	toast(s)
end 
function runOs(script)
	script ="Clutch -i"
	local p = io.popen(script)
	for v in p:lines() do nLog(v) end
	nLog("end")
end

_appBid = 	'com.nike.onenikecommerce'   --appBID 这里写入你要砸壳的BID	
_appDataPath = appDataPath(_appBid).."/Documents/" --沙盒路径
log(_appDataPath)

if _appDataPath  then 
	local pathData		=	'/usr/bin/Clutch'
	os.execute("rm -rf "..pathData)
	if file.exists(pathData) == false then 
		local url = "http://code-55331.oss-cn-shenzhen.aliyuncs.com/tool/Clutch"
		if downloadurl(url,pathData) == false then  dialog("Clutch 下载失败",2)lua_exit()  end
	end 
	mSleep(1000)
	os.execute("chmod a+x /usr/bin/Clutch")
	local script ="Clutch -i"
	local p = io.popen(script)
	
	log(script)
	
	local item = "0"
	for v in p:lines() do 
		if string.find(v,_appBid) ~=nil then 
			item = string.match(v,"(.-):.-")
			if item == nil then dialog("Clutch 未检测到安装1") lua_exit() end 
		end 
	end
	if item == "0" then dialog("Clutch 未检测到安装2") lua_exit() end 
	script ="Clutch -d "..item
	p = io.popen(script)                   
	for v in p:lines() do 
		Showlog(v)
		if string.find(v,"Finished dumping") ~=nil then 
			dialog("砸壳成功 math-o文件位置:/private/var/mobile/Documents/Dumped/ 此目录下查找")
		end 
	end
--DYLD_INSERT_LIBRARIES=dumpdecrypted.dylib /var/containers/Bundle/Application/B8416315-EF7E-4464-8F7F-4C1B92CBF1AF/WeChat.app/WeChat
--DONE: /private/var/mobile/Documents/Dumped/cn.dxwt.Community10000-iOS10.0-(Clutch-2.0.4).ipa
else
	dialog("未安装应用",2)
	os.exit()
end 
--[[


--]]













