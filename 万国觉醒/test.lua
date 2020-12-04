require('tsp')
-- require('AWZ')
-- require('ZZBase64')
-- require("yzm")
-- require('api')
-- require('token')


sz = require('sz')
__game = {}
__game.imei = sz.system.serialnumber();
__game.phone_name = getDeviceName()

function update_token(token,idfa,qq)
    local RokToken = llsGameToken();
    local info ={}
    info['token']=token
    info['idfa']=idfa
    info['qq']=qq
    info['s']='Rok.Token'
    _api_rok(info)
end


local a = {
    

}


t1 = os.time()
    
for i=1,100 do

    local url = 'http://rok.honghongdesign.cn/public/?s=Idcard.idcard'
    local arr = {}
    arr['s'] = "Idcard.idcard"
    log( get(url))
    
end

log( os.time()-t1)


url = "https://static.t3go.cn/t3-wechat-active/driver.html?type=2&channelCode=lkttup&adCode=nanjinglingkai&adid=__AID__&creativeid=__CID__&creativetype=__CTYPE__&clickid=__CLICKID__#/home?type=2&channelCode=lkttup&adCode=nanjinglingkai"


-- openURL(url)

info = {}
function getCrad()
    local url = 'http://rok.honghongdesign.cn/public/';
    local postarr={}
    postarr['s']='RokId.Id'
    local carddata = post(url,postarr)
    if(carddata) then
        info.cradid = carddata.data.id
        info.cardname = carddata.data.name
        info.cardnumber = carddata.data.number
    end
end


-- openURL(url)


getCrad()
input(info.cardnumber)
click(137, 550)
input(info.cardname)
    
    
    
    
    
    
