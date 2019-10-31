



require("TSLib")
require("tsp")



var = {}
var.appbid = "com.baihe.online";
t={}




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
	local User = '511358939'
	local Pass = '199412199412'
	local PID = '1723'
    local token,number = "6klqv7mnkm50knvwmqkbwbkq6l6anw0p",""
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
			RetStr = get_lx("http://api.smskkk.com/api/do.php?action=getPhone&sid="..PID.."&token="..token)
			if RetStr ~= "" and  RetStr ~= nil then
				RetStr = strSplit(RetStr,"|")
			end
			if RetStr[1] == 1 or RetStr[1]== '1' then
				number = RetStr[2]
				log(number)
				local phone_title = (string.sub(number,1,3))
				local blackPhone = {'165','144','141','142','143','144','145','146','147'}
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
            for i=1,25,1 do
                mSleep(3000)
                RetStr = get_lx("http://api.smskkk.com/api/do.php?action=getMessage&sid="..PID.."&token="..token.."&phone="..number)
				if RetStr then
					local arr = strSplit(RetStr,"|") 
					if arr[1] == '1' then 
						Msg = arr[2]
						local i,j = string.find(Msg,"%d+")
						Msg = string.sub(Msg,i,j)
					end
					if type(tonumber(Msg))== "number" then log(Msg); return Msg end
				end
                toast(tostring(RetStr).."\n"..i.."次共25次")
            end
            return false
        end),
        addBlack=(function()
			local lx_url =	'http://api.smskkk.com/api/do.php?action=addBlacklist&sid='..PID..'&phone='..number..'&token='..token
            return get_lx(lx_url)
        end),
    }
end




local dxcode = _vCode_lx()
dxcode.login()




t['登录界面——注册']={0xff676f, "-317|3|0xff7272,-254|8|0xffffff,-474|10|0xffffff,172|6|0xfffcfc",90,15,48,735,200} --多点找色
t['注册界面']={0xff6c6b, "-1|-1|0xffeaea,-201|-33|0xffffff,-202|0|0xf34252,-491|-38|0xffffff,-536|2|0xffffff",90,16,53,736,241} --多点找色
	t['注册界面——手机号']={0xcacacf, "43|-13|0xffffff,41|-26|0xc7c7cc",90,233,352,508,426} --多点找色
	t['注册界面——立即注册']={0xffffff, "284|-49|0xff2e6d,-317|44|0xff7330,-19|-4|0xff514f",90,30,563,720,734} --多点找色
t['输入验证码界面']={0xfc6e27, "92|-10|0xf9f9f9,94|-12|0xfc6e27,92|13|0xfc6e27,434|3|0xeeeeee,435|3|0x000000,432|8|0x000000",90,11,52,481,116} --多点找色
t['基本信息界面']={0xfc6e27, "15|-18|0xfc6e27,15|15|0xf9f9f9,390|-9|0xdedede,391|-9|0x000000,389|-6|0x161616,389|-5|0xf9f9f9",90,14,48,714,672} --多点找色


function reg()
	local timeline = os.time()
	local outTimes = 10*60
	
	while os.time()-timeline < outTimes do
		if active(var.appbid,5) then
			if d('登录界面——注册',true) then
			elseif d('注册界面')then
				if d('注册界面——手机号')then
					var.phone = dxcode.getPhone()
					if var.phone then
						d('注册界面——手机号',true)
						input[3](var.phone)
					end
				elseif d('注册界面——立即注册',true)then
				end
			elseif d('输入验证码界面')then
				var.sms = dxcode.getMessage()
				if var.sms then
					input[3](var.sms)
				end
			elseif d('基本信息界面')then
			end
		end
		
		delay(2)
	end

end




reg()














