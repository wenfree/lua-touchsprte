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
	local appbid = bid
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

require('ui');

function _api_rok(info)
    local url = 'http://rok.honghongdesign.cn/public/';
    log(post(url,info));
end

--上传帐号专用
function update_token_new()
    local RokToken = llsGameToken();
    local info_ ={}
    info_['token']=RokToken[1]
    info_['idfa']=RokToken[2]
    info_['fighting']=__game.fighting
    info_['red']=__game.red
    info_['user_id'] = UIv.user_id
    info_['s']='Rok.Token'
    info_['note']= getDeviceName() .. '新上传'
    info_['locals'] = lcoalsBid[UIv.locals+1]
    _api_rok(info_)
end

lcoalsBid = {"国服","国际服","台服","日服"}

local bidarr = {}
bidarr['国际服'] = "com.lilithgame.roc.ios"
bidarr['国服'] = "com.lilithgames.rok.ios.offical"
bidarr['台服'] = "com.lilithgame.roc.ios.tw"
bidarr['日服'] = "com.lilithgames.rok.ios.jp"


bid = bidarr[lcoalsBid[UIv.locals+1]]


if update_account then
    log('正式启动不上传')
else
    log('单独启动上传帐号')
    __game={}
    update_token_new()
    log('上传帐号完成',"all")
end








