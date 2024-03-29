-- 验证码识别
-- main.lua  

-- Create By TouchSpriteStudio on 00:17:50   
-- Copyright © TouchSpriteStudio . All rights reserved.
require('tsp')
require('ZZBase64')

function decodeURI(s)
    s = string.gsub(s, '%%(%x%x)', function(h) return string.char(tonumber(h, 16)) end)
    return s
end
function encodeURI(s)
    s = string.gsub(s, "([^%w%.%- ])", function(c) return string.format("%%%02X", string.byte(c)) end)
    return string.gsub(s, " ", "+")
end

function _getYzmAccount()
    local url = 'http://rok.honghongdesign.cn/public/';
    local postArr = {}
    postArr['s']="RokYzm.GetAccount"
    postArr['token'] = llsGameToken()[1]
    local data = post(url,postArr)
    if (data ) then
        return { data.data.st_username,data.data.st_password}
    end
end
	
function _yzmsb()
	require('tsp')
	init(1)
	local _time1 = os.time()
	local url = 'http://api.ttshitu.com/imageXYPlus'
	local st_account = _getYzmAccount()
	postData = {}
	postData['username'] = st_account[1]
	postData['password'] = st_account[2]
	postData['typeid'] = '27'
	postData['softid'] = '15ebbebcee0243eea1e5e93ee5160604'
	--postData['typename'] = '万国觉醒'

	snapshot("yzm.jpg", 400,21,934,640);
	path = userPath();
	ts = require('ts')
	ts.imgSize(path.."/res/yzm.jpg",path.."/res/yzm2.jpg",259,300);
	imagepath = path .. "/res/yzm2.jpg"
	require("ZZBase64")
	function base64s()
		local files
		local file = io.open(imagepath,"rb")
		if file then
			files = file:read("*a")
			file:close()
			return ZZBase64.encode(files);
		else
			return "";
		end
	end
	postData['image'] = base64s()
	local imgRes = post(url,postData)
	log(os.time()-_time1);

	if imgRes.message == 'success' then
		log('验证码结果为：'..imgRes.data.result )
		_app.yzmid = imgRes.data.id
		local _clickArr = strSplit(imgRes.data.result,"|");
		for i,v in ipairs(_clickArr) do
			_clickArr[i]= strSplit(v,",");
			click(_clickArr[i][1]*2+400+10,_clickArr[i][2]*2+21+10)
		end
		log(_clickArr)
		return true
	end
end

	
function _yzmsb()
	require('tsp')
	init(1)
	local _time1 = os.time()
	local url = 'http://api.ttshitu.com/imageXYPlus'
	local st_account = _getYzmAccount()
	postData = {}
	postData['username'] = st_account[1]
	postData['password'] = st_account[2]
	postData['typeid'] = '47'
	postData['softid'] = '15ebbebcee0243eea1e5e93ee5160604'
	--postData['typename'] = '万国觉醒'
    path = userPath();
    imagepath = path .. "/res/yzm.jpg"
	imagetitle = path .. "/res/yzmtitle.jpg"
	
	snapshot("yzm.jpg", 400,105,933,638,0.5);
	snapshot("yzmtitle.jpg", 687,20,942,101);
	
	require("ZZBase64")
	function base64s(imagepath)
		local files
		local file = io.open(imagepath,"rb")
		if file then
			files = file:read("*a")
			file:close()
			return ZZBase64.encode(files);
		else
			return "";
		end
	end
	
	local t_img = {}
	t_img['title_image'] = base64s(imagetitle)
	local sz = require('sz')
	local json = sz.json
	postData['remark'] = json.encode(t_img)
	postData['image'] = base64s(imagepath)
	local imgRes = post(url,postData)
	log(os.time()-_time1);

	if imgRes.message == 'success' then
		log('验证码结果为：'..imgRes.data.result )
		_app.yzmid = imgRes.data.id
		local _clickArr = strSplit(imgRes.data.result,"|");
		for i,v in ipairs(_clickArr) do
			_clickArr[i]= strSplit(v,",");
			click(_clickArr[i][1]+400+5,_clickArr[i][2]+105+5)
		end
		log(_clickArr)
		return true
	end
end
	
-- init(1)
-- uploadimg()
-- log('end')


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	