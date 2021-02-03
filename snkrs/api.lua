require("tsp")

--重构一个get
function get_(url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(url);
	if code == 200 then
		return res
	else
	    log( res )
	end
end
--取手机号
function getPhone() 
    local postArr = {};
    postArr['s']="App.SmsNikeReg.GetPhone";
    local data = post('http://sms.wenfree.cn/public/',postArr);
    if (data) then
        local url = data['data']['url'];
        info.smsname = data['data']['name'];
        local res = get_(url);
        log(res)
        
        postArr['s']="App.SmsNikeReg.MakeGetPhone";
        postArr['name']=info.smsname;
        postArr['arr']=res ;
        
        log(postArr);
        
        local datas = post('http://sms.wenfree.cn/public/',postArr);
        if ( datas )then
            log('datas')
            log(datas)
            if ( datas.data )then
                info.phone = datas.data;
                return true;
            end
        end
    end
    log("取手机号出错");
end
-- //取短信
function getMessage()
    local postArr = {};
    postArr['s']="App.SmsNikeReg.GetSms";
    postArr['name']=info.smsname;
    postArr['phone']=info.phone;
    local data = post('http://sms.wenfree.cn/public/',postArr);
    if (data) then
        local url = data['data']['url'];
        local res = get_(url);
        -- log(res.."=>"..#res)
        if res then
            log("res-准备上传");
            postArr['s']="App.SmsNikeReg.MakeGetSms";
            postArr['name']=info.smsname;
            postArr['arr']= res ;
            local datas = post("http://sms.wenfree.cn/public/",postArr);
            if datas  then
                log(datas)
                if datas.data  then
                    info.yzm = datas.data;
                    return true;
                end
            end
        end
    end
    log("取手短信出错");
end

-- info={}
-- info.phone = "17728609851"
-- info.smsname = "飞猪"

sys = {
	clear_bid = (function(bid)
		closeApp(bid)
		delay(1)
		os.execute("rm -rf "..(appDataPath(bid)).."/Documents/*") --Documents
		os.execute("rm -rf "..(appDataPath(bid)).."/Library/*") --Library
		os.execute("rm -rf "..(appDataPath(bid)).."/tmp/*") --tmp
		clearPasteboard()
		--[[
		local path = _G.const.cur_resDir
		os.execute(
			table.concat(
				{
					string.format("mkdir -p %s/keychain", path),
					'killall -SIGSTOP SpringBoard',
					"cp -f -r /private/var/Keychains/keychain-2.db " .. path .. "/keychain/keychain-2.db",
					"cp -f -r /private/var/Keychains/keychain-2.db-shm " .. path .. "/keychain/keychain-2.db-shm",
					"cp -f -r /private/var/Keychains/keychain-2.db-wal " .. path .. "/keychain/keychain-2.db-wal",
					'killall -SIGCONT SpringBoard',
				},
				'\n'
			)
		)
		]]
		clearAllKeyChains()
		clearIDFAV() 
		--clearCookies()
	end)
}
--url解码
function decodeURI(s)
    s = string.gsub(s, '%%(%x%x)', function(h) return string.char(tonumber(h, 16)) end)
    return s
end
--url编码
function encodeURI(s)
    s = string.gsub(s, "([^%w%.%- ])", function(c) return string.format("%%%02X", string.byte(c)) end)
    return string.gsub(s, " ", "+")
end
--提取token
function local_token_()
	local appbid = 'com.nike.onenikecommerce'
	local localPath = appDataPath(appbid).."/Documents/ifkc.plist" --设置 plist 路径
	local toketext = readFile_(localPath)
    
	return encodeURI(toketext)
end
--读文件
function readFile_(path)
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
--上传token
function update_token()
    local url = 'http://nikeapi.honghongdesign.cn'
    local arr ={}
    arr['s']='App.NikeToken.Token'
    arr['token'] = local_token_()
    arr['email'] = var.account.email
    log( post(url,arr) )
end
--上传帐号
function updateNike()
	local sz = require("sz")
	local json = sz.json
	local url = 'http://nikeapi.honghongdesign.cn'
	local Arr={}
	Arr.s = 'App.NikeSelect.NikeInserts'
	Arr.email = var.account.email
	Arr.password = var.account.password
	Arr.phone = var.account.phone
	local address_ = {}
	address_['姓'] = first_name_
	address_['名'] = last_names_
	address_['省'] = '广东省'
	address_['市'] = '深圳市'
	address_['区'] = '罗湖区'
	address_['街道'] = var.account.address_area
	Arr.adress = json.encode(address_)
	Arr.iphone = getDeviceName()
	Arr.note = UIv.note
	log( post(url,Arr) )
end

function address_rd()
    local 地址 = {
        "延芳路4038号",
        "罗沙路4099号",
        "延芳路600号",
        "延芳路588号",
        "罗湖广岭小区",
        "罗沙路新世界四季御园",
        "大澎花园",
        "中震大厦",
        "通发花园",
        "罗芳苑",
        "银丰花园",
        "龙泉花园",
        "芳春花园",
        "深港新村",
        "锦绣新村",
        "兴华苑",
        "华兴花园",
        "赤龙新村",
        "经二路1号",
        "经二路3号",
        "罗芳路190号",
        "经二路19号名太轩",
        "广陵家园",
        "罗湖党校",
        "西岭花园",
        "安业花园",
    }
    local 地址描述 = {"栋","阁","小区","路"}
    local 地址L = {"室","号","层",""}
    local res = ''
    res = 地址[rd(1,#地址)]..rd(1,9)..rd(1,99)..地址描述[rd(1,#地址描述)]..rd(1,9)..rd(0,100)..地址描述[rd(1,#地址描述)]
    return res
end


-- local_token_()







