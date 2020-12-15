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

for k,v in ipairs( a ) do
    url = 'http://nikeapi.honghongdesign.cn/'
    arr = {}
    arr['s']='App.IndexAddress.Update'
    arr['email']=v[1]
    arr['password']=v[2]
    post(url,arr)
end

    
    
    
