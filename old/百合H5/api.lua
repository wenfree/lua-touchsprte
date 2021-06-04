appinfo={}
require("tsp")



function getPhone()
    local url = 'http://sms.wenfree.cn/public/?s=App.Sms.GetPhone&imei='.. getDeviceName() ..'&name=' .. getDeviceName()
    local data = get(url)
    log( data )
    if ( data.data.meg == "success" ) then
        appinfo.phone = data.data.phone
        return data.data.phone
    end
end


function getMessage()
    local url = 'http://sms.wenfree.cn/public/?s=App.Sms.getMessage&imei='.. getDeviceName() ..'&name=' .. getDeviceName()
    local data = get(url)
    log( data )
    if ( data.data.meg == "success" ) then
        appinfo.sms, _ = string.match(data.data.sms, "%d+")
        return data.data.sms
    end
end

function Idfa()
    local url = 'http://hb.wenfree.cn/api/Public/idfa/'
    local postarr = {}
    postarr['service'] = 'Idfa.Idfa'
    postarr['name'] = '百合网H5'
    postarr['idfa'] = appinfo.phone
    postarr['phonename'] = getDeviceName()
    postarr['phone'] = appinfo.phone
    post( url, postarr )
end






























