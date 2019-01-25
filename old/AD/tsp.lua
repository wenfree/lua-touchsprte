function print_r(t)
	local print_r_cache={}
	local function sub_print_r(t,indent)
		if (print_r_cache[tostring(t)]) then
			nLog(indent.."*"..tostring(t))
		else
			print_r_cache[tostring(t)]=true
			if (type(t)=="table") then
				for pos,val in pairs(t) do
					if type(pos) == "string" then
						pos = "'"..pos.."'"
					end
					if (type(val)=="table") then
						nLog(indent.."["..pos.."] = {   --"..tostring(t))
						sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
						nLog(indent..string.rep(" ",string.len(pos)+6).."},")
					elseif (type(val)=="string") then
						nLog(indent.."["..pos.."] = ".."'"..val.."',")
					else
						nLog(indent.."["..pos.."] = "..tostring(val)..",")
					end
				end
			else
				nLog(indent..tostring(t))
			end
		end
	end
	if (type(t)=="table") then
		nLog("{  --"..tostring(t))
		sub_print_r(t,"	")
		nLog("}")
	elseif (type(t)=="string") then
		nLog(t)
	end
end




--[[
--开始备份keychain
    local key = {}
	require("TSLib")
	local sz = require("sz")
    local sqlite3 = require('sqlite3')
    local db = sqlite3.open('/private/var/Keychains/keychain-2.db')
    do
      --local stmt = db:prepare('select cdat,mdat,acct,svce,pdmn,sha1,UUID,data from genp where agrp =?;')
      local stmt = db:prepare('select cdat,mdat,acct,svce,pdmn,sha1,UUID,data from genp where agrp =? and (pdmn =? or pdmn =?)')
      stmt:bind(1,'532LCLCWL8.com.tencent.xin')
      stmt:bind(2,'ak')
      stmt:bind(3,'cku')
      while (stmt:step() ~= sqlite3.DONE) do
        key[#key + 1] = {
          cdat  =  stmt:get_value(0),
          mdat  =  stmt:get_value(1),
          acct_h  =  stmt:get_value(2):to_hex(),
          svce_h  =  stmt:get_value(3):to_hex(),
          pdmn  =  stmt:get_value(4),
          sha1_h  =  stmt:get_value(5):to_hex(),
          UUID  =  stmt:get_value(6),
          data_h  =  stmt:get_value(7):to_hex(),      
        }
      end
      stmt:finalize()
      plist.write(pathNum..'/keychain',key)
    end
--]]
--    --开始写入keychain
--    local sqlite3 = require('sqlite3')
--    local db = sqlite3.open('/private/var/Keychains/keychain-2.db')
--    db:execute([[delete from genp where agrp = '532LCLCWL8.com.tencent.xin']])
--    db:execute([[VACUUM]])
--    db:close()
 
--    local db = sqlite3.open('/private/var/Keychains/keychain-2.db')
--    local t = plist.read(pathNum..'/keychain')
--    do
--      local stmt = db:prepare('INSERT INTO genp(agrp,cdat,mdat,acct,svce,pdmn,sha1,UUID,data,musr,persistref,vwht,tkid,sysb) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)')
--      for i,v in ipairs(t) do
--        stmt:bind(1, '532LCLCWL8.com.tencent.xin')
--        stmt:bind(2, v.cdat)
--        stmt:bind(3, v.mdat)
--        stmt:bind(4, v.acct_h:from_hex())
--        stmt:bind(5, v.svce_h:from_hex())
--        stmt:bind(6, v.pdmn)
--        stmt:bind(7, v.sha1_h:from_hex())
--        stmt:bind(8, v.UUID)
--        stmt:bind(9, v.data_h:from_hex())
--        stmt:bind(10, '')
--        stmt:bind(11, '')
--        stmt:bind(12, '')
--        stmt:bind(13, '')
--        stmt:bind(14, NULL)
--        if (stmt:step() ~= sqlite3.DONE) then
--          return false
--        end
--        stmt:reset()
--      end
--    end



a = {
	['a']={'bbbbb'},
	['c']='sdsfsdf',
	['d']=123123,
	"123123",
	12313123,
	1231,
	666,
	
}
	
print_r(a )

