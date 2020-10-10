require("tsp")
require('api')
require('token')
require("AWZ")
require('main')

init(1)
info = {}
info.api = 'http://sms.wenfree.cn/public/'
_app = {}
_app.bid = 'com.lilithgames.rok.ios.offical'
if t == nil then
    t ={}
end


--取帐空闲帐号
function AccountInfoBack_qu()

	local sz = require("sz")
	local json = sz.json
	local appbid = 'com.lilithgames.rok.ios.offical'
	local AccountInfo = appDataPath(appbid).."/Documents/AccountInfo.json"

    local url = 'http://rok.honghongdesign.cn/public/';
    local arr = {}
    arr['s']='RokGetToken.Qu'

	local account_ = post(url,arr)
	log(account_)
	local token = account_.data.idfa
	writeFile_( token ,'w',AccountInfo)
	closeApp(appbid,1)
	mSleep(2000)
end

t['弹窗-网络问题']={0x007aff, "0|0|0x007aff,31|-1|0x007aff,39|-152|0x000000,38|-161|0x000000",90,564,281,770,480}
function tips()
    if d('弹窗-网络问题',true)then
        vpnx()
        closeApp(frontAppBid(),1)
        delay(2)
    end
end



t['王国选择-继续']={0xb67016, "0|0|0xb67016,83|6|0xffb000,-29|-579|0xf3a544,-394|-591|0xffffff",90,486,41,1267,733}
t['王国选择-创建角色界面']={0xe43b00, "0|0|0xe43b00,223|-1|0xeee500,439|0|0x00e40b",90,361,128,884,166}
    t['王国选择-推荐激活']={0x013658, "0|0|0x013658,-40|-113|0x22a1df",90,47,141,148,365}
    t['王国选择-所有激活']={0x169cdc, "0|0|0x169cdc,29|-140|0x00375e",90,51,138,151,377}
    t['王国选择-51-65']={0x54ed2f, "189|8|0x012330",90,178,179,532,222}
    t['王国选择-1-50']={0x021b27, "189|8|0x8de383",90,178,179,532,222}
        t['王国选择-目标15']={0xece300, "0|0|0xece300,-247|-8|0xffffff,-490|93|0xccc500,-315|89|0x1e96ce",90,180,407,895,666}
        t['王国选择-目标16']={0xffffff, "0|0|0xffffff,2|3|0x1c95cb,246|7|0xf5eb00,-247|96|0xfcf300",90,200,241,961,670}
        t['王国选择-目标18']={0xf7ed00, "0|0|0xf7ed00,246|82|0xffffff,713|174|0xffffff,490|181|0xede200",90,172,360,979,665}
        t['王国选择-目标19']={0xede500, "0|0|0xede500,-247|171|0xffffff,220|263|0xffffff,-3|270|0xede200",90,182,256,1009,671}
        t['王国选择-目标20']={0xf7ee00, "0|0|0xf7ee00,688|-7|0xffffff,245|172|0xffffff,-1|180|0xf5eb00",90,184,244,1013,665}
        t['王国选择-目标21']={0xe4dd01, "0|0|0xe4dd01,219|349|0xffffff,-248|260|0xffffff,-494|358|0xf4ea00",90,212,186,972,657}
        t['王国选择-目标22']={0xfef500, "0|0|0xfef500,713|352|0xffffff,491|361|0xf4ea00,246|263|0xffffff",90,211,242,968,653}
        t['王国选择-目标23']={0xf5ec00, "0|0|0xf5ec00,197|-8|0xffffff,-315|-7|0x1e96ce,-318|-7|0xffffff,-491|0|0xf5ec00,221|-186|0xffffff,223|-187|0x279acf",90,171,215,1157,667}
        t['王国选择-目标24']={0xfcf200, "0|0|0xfcf200,23|9|0xffffff,27|-2|0x127fb7,42|0|0x1685bc,46|9|0xffffff,92|-4|0x188cc6,94|-6|0xfcfefe,96|7|0x2495c9,86|9|0xffffff",90,223,252,369,652}
        t['王国选择-目标37']={0xfbf200, "0|0|0xfbf200,45|-3|0x1484bc,46|-6|0xffffff,142|-4|0x1a93cc,144|0|0xffffff",90,696,278,883,681}
        t['王国选择-目标25']={0xfbf100, "0|0|0xfbf100,41|3|0x1384bc,39|-6|0xffffff,45|-3|0x1484bc,45|-6|0xffffff,36|-5|0x1482ba,140|-4|0x1a93cc,141|0|0xf2f9fc",90,713,242,963,669}
t['王国选择-邀请']={0xffb000, "0|0|0xffb000,90|-2|0xffb100,-84|-2|0xfcb400,-850|-480|0x000000",90,30,12,1258,610}
t['王国选择-新手村']={0xffd957, "0|0|0xffd957,126|-63|0xffdc57,-28|-168|0xffd752,374|-70|0xffe55a,372|-82|0xfe9f68",90,179,35,1022,572}
t['王国选择-大号跳过']={0x2075a2, "0|0|0x2075a2,47|17|0xdaa249,90|41|0xf9f9f9,-25|31|0x84e6ff",90,9,624,180,743}
    
function xuanqu()
    local trueQU = false
	local timeline = os.time()
	local 向下滑动 = 0
	
	while os.time()-timeline < 60 * 3 do
		if active(_app.bid,8)then
		    if trueQU and d('王国选择-继续') then
		        qu={631,663,670,685}
                log("-----------------------" .. ocr(qu[1],qu[2],qu[3],qu[4]))
		        __game.qu = 16
                local arr ={}
                arr['s']='Rok.token'
                arr['qu'] = __game.qu
                arr['token'] = __game.token
                _api_rok(arr)
                d('王国选择-继续',true,1,2)
		    elseif d('王国选择-继续') then
		        click(916, 675)
		    elseif d('王国选择-邀请',true,1,10) or d('王国选择-新手村')or d('王国选择-大号跳过') then
		           reg__()
		           return true
		    elseif d('王国选择-创建角色界面')then
		        if d('王国选择-所有激活')then
		            if d('王国选择-1-50')then
		                if d('王国选择-目标16',true)then
		                    trueQU = true
		                else
		                    moveTo(668, 595,667, 309,10,50)
		                    向下滑动 = 向下滑动 + 1
		                end
		            elseif d('王国选择-51-65',true,2)then
		            end
		        elseif d('王国选择-推荐激活',true)then
		        end
		    end
		end
		tips()
		delay(1)
	end
end
	
	
clearOneAccount();
AccountInfoBack_qu()
-- vpnx()

iii = 0
function all()
    -- vpn()
    __game = {}
    __game.token = llsGameToken()[1]
    xuanqu()
    AccountInfoBack_qu()
    vpnx()
    delay(2)
    iii = iii + 1
    if iii > 30 then
        lua_exit()
    end
end

while (true) do
	local ret,errMessage = pcall(all)
	if ret then
	else
	    vpnx();
		log(errMessage)
		dialog(errMessage, 10)
		mSleep(2000)
	end
end














