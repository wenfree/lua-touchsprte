
require("TSLib")
require("tsp")



function get(url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(url);
	if code == 200 then
		local json = sz.json
		if res ~= nil then
			return json.decode(res)
		end
	end
end

function get_(url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(url);
	if code == 200 then
		if res ~= nil then
			return res
		end
	end
end

--get函数
function get_lx(url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(url);
	if code == 200 then
		return res
	end
end

function checkPhone(phone)
	local url____ = 'http://zzaha.com/phalapi/public/?s=App.Nikecheck.Checkphone&phone='..phone
	log(url____)
	local self_phone = get(url____)
	log(self_phone)
	log(self_phone.data)
	return self_phone.data
end

function _vCode_bm() --班马平台
	local User = 'api-43502-rO6j2eO'
	local Pass = 'shuai888'
	local PID = '175'
    local token,number = "6klqv7mnkm50knvwmqkbwbkq6l6anw0p",""
    return {
	    login=(function() 
            local RetStr
			for i=1,5,1 do
				toast("获取token\n"..i.."次共5次")
                mSleep(1500)
				local lx_url = 'http://api.banma1024.net/api/do.php?action=loginIn&name='..User..'&password='..Pass
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
			local url___ = "http://api.banma1024.net/api/do.php?action=getPhone&sid="..PID.."&token="..token
			log(url___)
			RetStr = get_lx(url___)
			if RetStr ~= "" and  RetStr ~= nil then
				log(RetStr)
				RetStr = strSplit(RetStr,"|")
			end
			if RetStr[1] == 1 or RetStr[1]== '1' then
				number = RetStr[2]
				log(number)
				local phone_title = (string.sub(number,1,3))
				local blackPhone = {'165','144','141','142','143','144','145','146','147'}
				for k,v in ipairs(blackPhone) do
					if phone_title == v then
						local lx_url =	'http://api.banma1024.net/api/do.php?action=addBlacklist&sid='..PID..'&phone='..number..'&token='..token
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
				RetStr = get_lx("http://api.banma1024.net/api/do.php?action=getMessage&sid="..PID.."&token="..token.."&phone="..number)
				log(RetStr);
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
			local lx_url =	'http://api.banma1024.net/api/do.php?action=addBlacklist&sid='..PID..'&phone='..number..'&token='..token
			log("拉黑"..number..'\n'..lx_url);
            return get_lx(lx_url);
        end),
    }
end

function _vCode_reyne() --reyne
	local User = 'shuaishuaiPYh'
	local Pass = 'shuai888'
	local PID = '29456'
	local apiurl = 'http://api.reyne.cn/api/do.php'
    local token,number = "",""
    return {
	    login=(function() 
            local RetStr
			for i=1,5,1 do
				toast("获取token\n"..i.."次共5次")
                mSleep(1500)
				local lx_url = apiurl..'?action=loginIn&name='..User..'&password='..Pass
				log(lx_url)
                RetStr = get_lx(lx_url)
				if RetStr then
					RetStr = strSplit(RetStr,"|")
					if RetStr[1] == 1 or RetStr[1] == '1' then
						token = RetStr[2]
						log('token='..token,true)
						return 'token='..token
					end
				else
					log(RetStr)
				end
			end
			return RetStr;
        end), 
		getPhone=(function()
            local RetStr=""
			local url___ = apiurl .. "?action=getPhone&sid="..PID.."&token="..token
			log(url___)
			RetStr = get_lx(url___)
			if RetStr ~= "" and  RetStr ~= nil then
				log(RetStr)
				RetStr = strSplit(RetStr,"|")
			end
			if RetStr[1] == 1 or RetStr[1]== '1' then
				number = RetStr[2]
				log(number)
				local phone_title = (string.sub(number,1,3))
				local blackPhone = {'165','144','141','142','143','144','145','146','147'}
				for k,v in ipairs(blackPhone) do
					if phone_title == v then
						local lx_url =	apiurl .. '?action=addBlacklist&sid='..PID..'&phone='..number..'&token='..token
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
				RetStr = get_lx( apiurl .."?action=getMessage&sid="..PID.."&token="..token.."&phone="..number)
				log(RetStr);
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
			local lx_url =	apiurl .. '?action=addBlacklist&sid='..PID..'&phone='..number..'&token='..token
			log("拉黑"..number..'\n'..lx_url);
            return get_lx(lx_url);
        end),
    }
end

--165
function _vCode_dm()
	local User = 'shuaishuai'
	local Pass = 'shuai888'
	local PID = '3215'
    local token,uid,number = "",""
	local api_url = "http://api.yyyzmpt.com/index.php/"
    return {
	    login=(function() 
            local RetStr
			for i=1,5,1 do
				toast("获取token\n"..i.."次共5次")
                mSleep(1500)
				local urls = api_url..'reg/login?username='..User..'&password='..Pass
				nLog(urls)
                RetStr = get(urls)
				if RetStr then
					if RetStr['errno'] == 0 then
						token = RetStr['ret']['token']
--						log('token='..token,true)
						nLog('token='..token)
						break
					else
						toast(RetStr.errmsg)
						mSleep(2000)
					end
				end
			end
			return RetStr;
        end), 
		getPhone=(function()
            local RetStr=""
			local urls = api_url..'clients/online/setWork?token='..token..'&t=1&pid='..PID
			nLog(urls)
			RetStr = get(urls)
			if RetStr then
				if RetStr['errno'] == 0 then
					number = RetStr['ret']['number']
					toast('number='..number)
					nLog('number='..number)
					return number
				else
					toast(RetStr.errmsg)
					mSleep(2000)
				end
			end

        end),
	    getMessage=(function()
			local Msg
            for i=1,25,1 do
                mSleep(3000)
				local urls = api_url..'clients/sms/getSms?type=1&token='..token..'&project='..PID..'&number='..number
				nLog(urls)
				RetStr = get(urls)
				if RetStr then
					if RetStr['errno'] == 0 then
						Msg = RetStr['ret']['tst']
	--					log('token='..token,true)
						nLog('Msg='..Msg)
						local i,j = string.find(Msg,"%d+")
						Msg = string.sub(Msg,i,j)
						return Msg
					else
						toast(RetStr.errmsg)
						mSleep(2000)
					end
				end
                toast(i.."次共25次")
            end
            return ""
        end),
        addBlack=(function()
            return httpGet( api_url.."?action=getMessage&sid="..PID.."&token="..token.."&phone="..number)
        end),
    }
end

--code = _vCode_hy()
--code.login()
--delay(3)
--log(
--code.getPhone() )




