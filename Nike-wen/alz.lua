function _vCode_gx(User,Pass,PID) --共享平台
    local token,uid,number = "",""
    return {
        login=(function() 
            local RetStr
			for i=1,5,1 do
				toast("获取token\n"..i.."次共5次")
                mSleep(1500)
                RetStr = httpGet('http://api.ndd001.com/do.php?action=loginIn&name='..User..'&password='..Pass.."&author=yangmian")
				if RetStr then
					nLog(RetStr)
					RetStr = strSplit(RetStr,"|")
					if RetStr[1] == 1 or RetStr[1] == '1' then
						token = RetStr[2]
						log('token='..token,true)
						break
					end
				end
			end
			return RetStr;
        end),
	    getPhone=(function()
            local RetStr=""
			RetStr = httpGet("http://api.ndd001.com/do.php?action=getPhone&sid="..PID.."&token="..token.."&author=yangmian")
			if RetStr ~= "" and  RetStr ~= nil then
				RetStr = strSplit(RetStr,"|")
			end
			if RetStr[1] == 1 or RetStr[1]== '1' then
				number = RetStr[2]
				return number
			end
        end),
	    getMessage=(function()
			local Msg
            for i=1,25,1 do
                mSleep(3000)
                RetStr = httpGet("http://api.ndd001.com/do.php?action=getMessage&token="..token.."&phone="..number.."&sid="..PID.."&author=yangmian")
				if RetStr then
					local arr = strSplit(RetStr,"|") 
					if arr[1] == '1' then 
						Msg = arr[2]
						local i,j = string.find(Msg,"%d+")
						Msg = string.sub(Msg,i,j)
					end
					if type(tonumber(Msg))== "number" then return Msg end
				end
                toast(tostring(RetStr).."\n"..i.."次共25次")
            end
            return ""
        end),
        addBlack=(function()
            return httpGet("http://api.ndd001.com/do.php?action=addBlacklist&token="..token.."&phone="..number.."&sid="..PID)
        end),
    }
end