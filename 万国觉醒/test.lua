require('tsp')
require('AWZ')
require('ZZBase64')
require("yzm")
require('api')
require('token')


sz = require('sz')
__game = {}
__game.imei = sz.system.serialnumber();
__game.phone_name = getDeviceName()

--取帐空闲帐号
function AccountInfoBackad(i)

	local sz = require("sz")
	local json = sz.json
	local appbid = 'com.lilithgames.rok.ios.offical'
	local AccountInfo = appDataPath(appbid).."/Documents/AccountInfo.json"

    local url = 'http://rok.honghongdesign.cn/public/';
    local arr = {}
    arr['s']='RokGetToken.Qu'
    arr['qus']=i

	local account_ = post(url,arr)
	log(account_)
	local token = account_.data.idfa
	__game.qu = account_.data.qu
	__game.wei_ui = json.decode( account_.data.web_ui )
	__game.weizi = account_.data.weizi
	__game.qus = account_.data.qus
	writeFile_( token ,'w',AccountInfo)
	closeApp(appbid,1)
	mSleep(2000)
end

log( getOnlineName() )
    
    
    
    
    
    
