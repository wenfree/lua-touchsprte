
local sz = require("sz")

var={}
var.bid='com.nike.onenikecommerce'

function UpFtp()

	local localPath = appDataPath(var.bid).."/Documents/ifkc.plist" --设置 plist 路径
--	local NewPath = appDataPath(var.bid).."/Documents/"..var.account.login..".plist" --设置 plist 路径
	local NewPath = appDataPath(var.bid).."/Documents/ifkc.plist" --设置 plist 路径
--	copyfile(localPath,NewPath);
	
	nLog(NewPath)
	local ftp = sz.ftp--使用 FTP 模块前一定要插入这一句
	nLog('准备上传')
	_, err = ftp.upload(NewPath, "ftp://admin:AaDd112211@39.108.184.74/")--文件名不可使用中文字符
	if err then
		dialog(err, 0)
	else
		dialog("token 文件已上传成功", 0)
		return true
	end
end

--[[
UpFtp()
--]]
--local ts = require("ts")
--status = ts.ftp.connect("39.108.184.74","admin","AaDd112211");


--if status then

--	dialog('登录成功', 2)
	
--end

--local NewPath = appDataPath(var.bid).."/Documents/ifkc.plist" --设置 plist 路径
--upStatus = ts.ftp.upload(NewPath,"/token/ifkc.plist@qq.com.plist") 

--if upStatus then
--    dialog("上传完成", 0)
--else
--    dialog("上传失败", 0)
--end
--ts.ftp.close()  --操作完成后，断开 FTP 服务器连接