init('0',1)
	
	
function readQQ()
	function getList(path)
		local a = io.popen("ls "..path);
		local f = {};
		for l in a:lines() do
			table.insert(f,l)
		end
		a:close()
		return f
	end
	dataPath = appDataPath("com.tencent.mqq");   --
	if dataPath ~= "" then                    --如果获取到路径
		dataPath = dataPath..'/Documents/'
	end
	qqlist = getList(dataPath)
	for k,v in pairs(qqlist)do
		res = tonumber(v)
		if type(res) == "number" then
			return res
		end
	end
end



nLog(
	readQQ()
	)





