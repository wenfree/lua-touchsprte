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
    arr['s']='RokGetToken.NewRest'
    arr['imei'] = __game.phone_name
    arr['note'] = __game.note
    arr['phone_name']= __game.phone_name
    log( arr )
    
	local account_ = post(url,arr)
	log(account_)
	
	if account_.data.msg  == '休息' then
	    showLog(account_.data.show )
	else
	    
	    local token = account_.data.idfa
    	__game.qu = account_.data.qu
    	__game.wei_ui = json.decode( account_.data.web_ui )
    	__game.weizi = account_.data.weizi
    	__game.qus = tonumber(account_.data.qus)
    	__game.id = account_.data.id
    	__game.note = account_.data.note
    	
    	if setAWZ( __game.id  ) then
        	writeFile_( token ,'w',AccountInfo)
        	if __game.wei_ui.小功能.单号 then
        	    log('单号模式-不杀死')
            else
                closeApp(appbid,1)
            end
        	mSleep(2000);
        	return true
        end
	end
end








