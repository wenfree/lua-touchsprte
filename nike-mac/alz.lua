
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


function _vCode_ym() --爱尚平台
	local User = 'shuaishuai87'
	local Pass = 'shuai888'
	local PID = '1059'
    local token,number,pid = "","",""
	local Urls = 'http://v6.aishangpt.com:88/yhapi.ashx'
    return {
        login=(function() 
            local RetStr
			for i=1,5,1 do
				toast("获取token\n"..i.."次共5次")
                mSleep(1500)
				local urls = Urls..'?act=login&ApiName='..User..'&PassWord='..Pass
				log(urls)
                RetStr = get_(urls)
				if RetStr then
					nLog(RetStr)
					RetStr = strSplit(RetStr,"|")
					if RetStr[1] == '1' then
						token = RetStr[2]
						log('token='..token,true)
						break
					else
						toast("fail--"..RetStr[1])
						mSleep(1500)
					end
				end
			end
			return RetStr;
        end),
	    getPhone=(function()
            local RetStr=""
			local lx_url = Urls.."?act=getPhone&iid="..PID.."&token="..token
			log(lx_url)
			RetStr = get_(lx_url)
			if RetStr ~= "" and  RetStr ~= nil then
				log(RetStr,true)
				RetStr = strSplit(RetStr,"|")
			end
			if RetStr[1]== '1' then
				pid =  RetStr[2]
				number = RetStr[5]
				log(number)
				local phone_title = (string.sub(number,1,3))
				local blackPhone = {'165','144','141','142','143','144','145','146','147'}
				for k,v in ipairs(blackPhone) do
					if phone_title == v then
						local lx_url =	Urls..'?act=addBlack&pid='..pid..'&token='..token.."&reason=%E4%B8%8D%E8%83%BD%E4%BD%BF%E7%94%A8"
						get_(lx_url);
						log("拉黑->"..number)
						return false
					end
				end
				local self_phone = get('http://39.108.184.74/api/Public/tjj/?service=Nike.Checkphone&phone='..number)
				if self_phone.data then
					log("手机号可以使用")
					return number
				else
					toast('自己顶号\n准备拉黑');
					local lx_url =	Urls..'?act=addBlack&pid='..pid..'&token='..token.."&reason=%E4%B8%8D%E8%83%BD%E4%BD%BF%E7%94%A8"
					get_(lx_url);
					log("拉黑->"..number)
				end
			else
				log(RetStr[1],true)
			end
        end),
	    getMessage=(function()
			local Msg
            for i=1,25,1 do
                mSleep(3000)
				local urls = Urls.. "?act=getPhoneCode&pid="..pid.."&token="..token
				log(urls)
                RetStr = get_(urls)
				if RetStr then
					local arr = strSplit(RetStr,"|") 
					if arr[1] == '1' then 
						Msg = arr[2]
						log(Msg,true)
					end
					if type(tonumber(Msg))== "number" then return Msg end
				end
                toast(tostring(RetStr).."\n"..i.."次共25次")
            end
            return ""
        end),
        addBlack=(function()
			local lx_url =	Urls..'?act=addBlack&pid='..pid..'&token='..token.."&reason=%E4%B8%8D%E8%83%BD%E4%BD%BF%E7%94%A8"
            return get_(lx_url)
        end),
    }
end


--来信平台
function _vCode_lx() --来信
	local User = 'yxs123456'
	local Pass = 'a123456789'
	local PID = '1018'
    local token,uid,number = "",""
    return {
	    login=(function() 
            local RetStr
			for i=1,5,1 do
				toast("获取token\n"..i.."次共5次")
                mSleep(1500)
				local lx_url = 'http://api.smskkk.com/api/do.php?action=loginIn&name='..User..'&password='..Pass
				log(lx_url)
                RetStr = httpGet(lx_url)
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
			local urls = "http://api.smskkk.com/api/do.php?action=getPhone&sid="..PID.."&token="..token
			log(urls)
			RetStr = httpGet(urls)
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
						httpGet(lx_url);
						log("拉黑->"..number)
						return false
					end
				end
				local self_phone = get('http://39.108.184.74/api/Public/tjj/?service=Nike.Checkphone&phone='..number)
				if self_phone.data then
					log("手机号可以使用")
					return number
				else
					toast('自己顶号\n准备拉黑');
					local lx_url =	'http://api.smskkk.com/api/do.php?action=addBlacklist&sid='..PID..'&phone='..number..'&token='..token
					httpGet(lx_url);
					log("拉黑->"..number)
				end
			end
        end),
	    getMessage=(function()
			local Msg
            for i=1,25,1 do
                mSleep(3000)
				local urls = "http://api.smskkk.com/api/do.php?action=getMessage&sid="..PID.."&token="..token.."&phone="..number
				log(urls)
                RetStr = httpGet(urls)
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
			local lx_url =	'http://api.smskkk.com/api/do.php?action=addBlacklist&sid='..PID..'&phone='..number..'&token='..token
            return httpGet(lx_url)
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




