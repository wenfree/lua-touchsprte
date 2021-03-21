require('AWZ')





info = {}
info.IDFA = ''
info.IMEI = ''

function url_()
    local url = 'https://nike.onelnk.com/3CPe?pid=smzdm_int&c=Mar_Memsale&af_dp=mynike://x-callback-url/shop&af_channel=SMZDM&af_sub1=AFF&af_sub2=MEMSALE&af_sub3=CONTENT&af_prt=annalect&imei='.. info.IMEI ..'&idfa=' .. info.IDFA
    log( url )
    return url
end
awzNew()

local alsinfo = getOnlineName()
info.name = 'nike'
info.IDFA = alsinfo.IDFA
info.IMEI = alsinfo.IMEI
log(info)

openURL(url_())


function idfa_save_hb()
   local url = "http://hb.wenfree.cn/api/Public/idfa/" 
   local postarr = {}
   postarr['service'] = "Idfa.Idfa"
   postarr['idfa'] = info.IDFA
   postarr['name'] = info.name
   post(url,postarr)
end

idfa_save_hb()
