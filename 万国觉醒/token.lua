require('tsp')


--读文件
function readFile_(path)
	local path = path or '/var/mobile/Media/TouchSprite/lua/account.txt'
    local file = io.open(path,"r");
    if file then
        local _list = '';
        for l in file:lines() do
            _list = _list..l
        end
        file:close();
        return _list
    end
end
--取帐号token
function llsGameToken()
	local appbid = 'com.lilithgames.rok.ios.offical'
	local AccountInfo = appDataPath(appbid).."/Documents/AccountInfo.json"
	local account = readFile_(AccountInfo)
	if (account) then
	    local allinfo = account
    	local sz = require("sz")
        local json = sz.json
        account = json.decode(account)
        if(account[1]['app_token'])then
            return {account[1]['app_token'],allinfo}
        end
	end
	return account
end

function update_token()
    local RokToken = llsGameToken();
    local info_ ={}
    info_['token']=RokToken[1]
    info_['idfa']=RokToken[2]
    -- info_['city']=__game.city
    info_['fighting']=__game.fighting
    info_['red']=__game.red
    info_['s']='Rok.Token'
    _api_rok(info_)
end

--写入
function writeFile_(info,way,path)
	local path = path or '/var/mobile/Media/TouchSprite/lua/account.txt'
	local way = way or 'a'
	local f = assert(io.open(path, way))
    f:write(info)
	f:write('')
    f:close()
end

--取帐空闲帐号
function AccountInfoBack()

    log('准备取帐号')
	local sz = require("sz")
	local json = sz.json
	local appbid = 'com.lilithgames.rok.ios.offical'
	local AccountInfo = appDataPath(appbid).."/Documents/AccountInfo.json"

    local url = 'http://rok.honghongdesign.cn/public/';
    local arr = {}
    arr['s']='RokGetToken.Rest'
    if __game.phone_name == "wenyi-02" then
        arr['imei'] = '73'
    else
        arr['imei'] = getDeviceID()
    end
    arr['note'] = __game.note
    arr['phone_name']= __game.phone_name
    log( arr )
    
	local account_ = post(url,arr)
	log(account_)
	if account_.data  == '暂无帐号' then
	    return false
	else
	    local token = account_.data.idfa
    	__game.qu = account_.data.qu
    	__game.wei_ui = json.decode( account_.data.web_ui )
    	__game.weizi = account_.data.weizi
    	__game.qus = account_.data.qus
    	__game.id = account_.data.id
    	writeFile_( token ,'w',AccountInfo)
    	closeApp(appbid,1)
    	mSleep(2000);
    	return true
	end
end





