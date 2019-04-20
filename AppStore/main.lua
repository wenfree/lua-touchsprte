
function getKeyRank(keyword,rank)
	local url = "http://awzcydia.com/wp-api/Public/ks/?service=Appstore.getKey&keyword="
	local url = url..keyword
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(url);
	if code == 200 then
		if res ~= nil then
			local json = sz.json
			res = json.decode(res)
			
--			print_r(res.data.pageData.bubbles[1]['results'])
			return res.data.pageData.bubbles[1]['results'][rank]['id']
		end
	end
end

--深度打印一个表
function print_r(t)
	local print_r_cache={}
	local function sub_print_r(t,indent)
		if (print_r_cache[tostring(t)]) then
			nLog(indent.."*"..tostring(t))
		else
			print_r_cache[tostring(t)]=true
			if (type(t)=="table") then
				for pos,val in pairs(t) do
					if (type(val)=="table") then
						nLog(indent.."["..pos.."] = "..tostring(t).." {")
						sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
						nLog(indent..string.rep(" ",string.len(pos)+6).."},")
					elseif (type(val)=="string") then
						nLog(indent..'["'..pos..'"] = "'..val..'",')
					else
						nLog(indent..'["'..pos..'"] = "'..tostring(val)..'"')
					end
				end
			else
				nLog(indent..tostring(t))
			end
		end
		mSleep(20)
	end
	if (type(t)=="table") then
		nLog(tostring(t).." {")
		sub_print_r(t,"  ")
		nLog("}")
	else
		nLog(t)
	end
end

nLog("start")


keyword = "神话"
rank = 100
print_r(getKeyRank(keyword,rank))
mSleep(1000)
















