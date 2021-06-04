require("TSLib")
main_path = '/var/mobile/awzdata/com.lilithgame.sgame/'
--遍历文件
function getList(path)
    local a = io.popen("ls "..path);
    local f = {};
    for l in a:lines() do
        table.insert(f,l)
    end
    a:close()
    return f
end

local list = getList(main_path)	--文件夹例表
local sonlist={
	'/Documents/head/',
	'/Documents/blocktexcache/',
	'/tmp/',
	'/Library/Caches/',
	"/Library/'Application Support'/'Art of Conquest'",
	}

function delFile(path)--帮你玩平台禁用此函数
    os.execute("rm -rf "..path);
end

function 清理()
	nLog("准备清理")
	for i,v in ipairs(sonlist) do
		for k,vv in pairs(list)do
			local all = main_path..vv..v
			nLog(all)
			delFile(all)
		end
	end
end

function clearOneAccount()
	log('简单清理')
	for k,v in ipairs(sonlist)do
		local dataPath = appDataPath(app)
		local AllPath = dataPath..v
		log(AllPath)
		delFile(AllPath)
	end
end


--清理()
--[[

清理()
path = 'private/var/module/Library/Caches/'
function delFile(path)--帮你玩平台禁用此函数
    os.execute("rm -rf "..path);
end
delFile(path)

--]]


--[[
for k,v in ipairs(list) do
	local new_path = main_path .. v .."/Documents/"
	nLog(new_path)
	txtlist = getList(new_path)
	for i,vv in ipairs(txtlist) do
		local i,j = string.find(vv, '.txt')
		if i ~= nil and j ~= nil then
			nLog(vv)
			local all = new_path..vv
			nLog(all)
			delFile(all)
		end
	end
end
--]]
















