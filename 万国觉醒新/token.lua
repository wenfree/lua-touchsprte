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
	local appbid = _app.bid
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
    -- info_['fighting']=__game.fighting
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

    local url = 'http://rok.honghongdesign.cn/public/';
    local arr = {}
    arr['s']='RokGetToken.newRest'
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
        __game.locals = account_.data.locals
        __game.is_awz = tonumber(account_.data.is_awz)
        __game.is_vpn = tonumber(account_.data.is_vpn)
        __game.showText = account_.data.showText
        
        dialog(__game.showText,10)
        
        local bidarr = {}
        bidarr['国际服'] = "com.lilithgame.roc.ios"
        bidarr['国服'] = "com.lilithgames.rok.ios.offical"
        bidarr['台服'] = "com.lilithgame.roc.ios.tw"
        bidarr['日服'] = "com.lilithgames.rok.ios.jp"
        _app.bid = bidarr[__game.locals]
        local AccountInfo = appDataPath( _app.bid ).."/Documents/AccountInfo.json"
        
        if __game.is_awz == 0 or setAWZ( __game.id  ) then
            writeFile_( token ,'w',AccountInfo)
            if __game.wei_ui.小功能.单号 then
                log('单号模式-不杀死')
            else
                closeApp(_app.bid,1)
            end
            mSleep(2000);
            return true
        end
	end
end








