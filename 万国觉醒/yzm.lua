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
	
function _yzmsb()
	require('tsp')
	init(1)
	local _time1 = os.time()
	url = 'http://api.ttshitu.com/imageXYPlus'
	postData = {}
	postData['username'] = 'ouwen000'
	postData['password'] = 'AaDd112211'
	postData['typeid'] = '27'
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
		local _clickArr = strSplit(imgRes.data.result,"|");
		for i,v in ipairs(_clickArr) do
			_clickArr[i]= strSplit(v,",");
			click(_clickArr[i][1]*2+400+10,_clickArr[i][2]*2+21+10)
		end
		log(_clickArr)
		return true
	end
end
	
function uploadqu()
    local url = 'http://rok.honghongdesign.cn/public/'
	local postData = {}
    snapshot("qu.png", 277,8,312,31);
    -- snapshot("qu.png", 0,0,100,100);
	path = userPath();
	imagepath = path .. "/res/qu.png"
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
	postData['img'] = encodeURI( base64s() )
	postData['token'] = llsGameToken()[1]
	postData['s'] = 'Img.base64'
	local imgRes = post(url,postData)
end


function uploadimg()
    local url = 'http://rok.honghongdesign.cn/public/'
	local postData = {}
    snapshot("img.jpg", 0,0,1334,750,0.4);
    -- snapshot("qu.png", 0,0,100,100);
	path = userPath();
	imagepath = path .. "/res/img.jpg"
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
	postData['img'] = encodeURI( base64s() )
	postData['token'] = llsGameToken()[1]
-- 	postData['token'] = 'XXOqTKt6jksv8bXXkPnosje4EAttdgTR'
	postData['s'] = 'Img.All'
	local imgRes = post(url,postData)
end

-- init(1)
-- uploadimg()
-- log('end')


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	