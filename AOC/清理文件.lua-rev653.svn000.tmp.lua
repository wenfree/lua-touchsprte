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
list = getList(main_path)	--文件夹例表
son = '/Library/Caches/Snapshots/com.lilithgame.sgame/'
son2 = '/Documents/blocktexcache/gvg_03_1001/'
function delFile(path)--帮你玩平台禁用此函数
    os.execute("rm -rf "..path);
end

function 清理()
	for i,v in pairs(list)do
		all = main_path..v..son
		nLog(all)
		delFile(all)
	end
	for i,v in pairs(list)do
		all = main_path..v..son2
		nLog(all)
		delFile(all)
	end
end



--[[

path = 'private/var/module/Library/Caches/'
function delFile(path)--帮你玩平台禁用此函数
    os.execute("rm -rf "..path);
end
delFile(path)

--]]