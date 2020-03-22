-- nike-mac
-- zl.lua  

-- Create By TouchSpriteStudio on 20:35:53   
-- Copyright © TouchSpriteStudio . All rights reserved.
	
	
require('tsp')
	
function zl_init()
	runApp("zorro")
end

function zl_choice(bids)
	
	local sz = require("sz");
	local http = require("szocket.http");
	local res, code = http.request("http://127.0.0.1:8844/cmd?fun=setparam&backupapps="..bids);
	
	if code == 200 then
		log(res)
		local resJson = sz.json.decode(res);
		log(resJson)
		local result = resJson.retcode;
		if res.retcode == "1" then
			log("清理成功")
			return true
		end
	end
	
end

function zl_new()
	zl_init()
	-- http://127.0.0.1:8844/cmd?fun=newrecord
	local sz = require("sz");
	local http = require("szocket.http");
	local res, code = http.request("hhttp://127.0.0.1:8844/cmd?fun=newrecord");
	
	if code == 200 then
		log(res)
		local resJson = sz.json.decode(res);
		log(resJson)
		local result = resJson.retcode;
		if res.retcode == "1" then
			log("清理成功")
			return true
		end
	end
	
end

--zl_init()
--zl_new()
--local bids = 'com.nike.onenikecommerce'
--local bids = 'com.ss.iphone.ugc.Aweme'
--zl_choice(bids)
