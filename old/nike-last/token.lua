

--require("TSLib")


function local_token()
	local appbid = 'com.nike.onenikecommerce'
	local localPath = appDataPath(appbid).."/Documents/ifkc.plist" --设置 plist 路径
	return readFileString(localPath)
end

--nLog(local_token())