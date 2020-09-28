require("TSLib")
require("tsp")


--get函数
function get_lx(url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(url);
	if code == 200 then
		return res
	end
end
--来信平台
function _vCode_lx() --来信
	local User = 'APIak7LKwM4sSFAj'
	local Pass = 'AaDd112211'
	local PID = '32431'
    local token,number = "6klqv7mnkm50knvwmqkbwbkq6l6anw0p","15232533495"
    return {
	    login=(function() 
            local RetStr
			for i=1,5,1 do
				toast("获取token\n"..i.."次共5次")
                mSleep(1500)
				local lx_url = 'http://api.smskkk.com/api/do.php?action=loginIn&name='..User..'&password='..Pass
				log(lx_url)
                RetStr = get_lx(lx_url)
				if RetStr then
					RetStr = strSplit(RetStr,"|")
					if RetStr[1] == 1 or RetStr[1] == '1' then
						token = RetStr[2]
						log('token='..token,true)
						break
					end
				else
					log(RetStr)
				end
			end
			return RetStr;
        end), 
		getPhone=(function()
            local RetStr=""
			local lx_url = "http://api.smskkk.com/api/do.php?action=getPhone&sid="..PID..","..PID.."&token="..token
			log(lx_url)
			RetStr = get_lx(lx_url)
			if RetStr ~= "" and  RetStr ~= nil then
				RetStr = strSplit(RetStr,"|")
			end
			if RetStr[1] == 1 or RetStr[1]== '1' then
				number = RetStr[2]
				log(number)
				local phone_title = (string.sub(number,1,3))
				local blackPhone = {'144','141','142','143','144','145','146','147'}
				for k,v in ipairs(blackPhone) do
					if phone_title == v then
						local lx_url =	'http://api.smskkk.com/api/do.php?action=addBlacklist&sid='..PID..'&phone='..number..'&token='..token
						get_lx(lx_url);
						log("拉黑->"..number)
						return false
					end
				end
				return number
			end
        end),
	    getMessage=(function()
			local Msg
			for i_ = 1,2 do
				for i=1,25,1 do
					mSleep(3000)
					local lx_url = "http://api.smskkk.com/api/do.php?action=getMessage&sid="..PID.."&token="..token.."&phone="..number
					log(lx_url)
					RetStr = get_lx(lx_url)
					if RetStr then
						local arr = strSplit(RetStr,"|") 
						if arr[1] == '1' then 
							Msg = arr[2]
							local i,j = string.find(Msg,"%d+")
							Msg = string.sub(Msg,i,j)
							if type(tonumber(Msg))== "number" then 
								log(Msg); 
								if i_ == 2 then return Msg end
								break
							end
						end
					end
					toast(tostring(RetStr).."\n"..i.."次共25次")
				end
			end
            return false
        end),
        addBlack=(function()
			local lx_url =	'http://api.smskkk.com/api/do.php?action=addBlacklist&sid='..PID..'&phone='..number..'&token='..token
			log("拉黑"..number..'\n'..lx_url);
            return get_lx(lx_url);
        end),
    }
end



DM = _vCode_lx()

DM.login()

--inputText(DM.getPhone())
inputText(DM.getMessage())

































