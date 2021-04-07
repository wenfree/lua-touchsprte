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
    postArr['name'] = info.smsname;
    local data = post('http://sms.wenfree.cn/public/',postArr);
    if (data) then
        local url = data['data']['url'];
        info.smsname = data['data']['name'];
        local res = get_(url);
        if res then
            log(res)
            local resArr = split(res,"|")
            if resArr[1] == "1" then
                info.phone = resArr[5]
                info.pid = resArr[2]
                return true
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
    postArr['phone']=info.pid;
    local data = post('http://sms.wenfree.cn/public/',postArr);
    if (data) then
        local url = data['data']['url'];
        local res = get_(url);
        -- log(res.."=>"..#res)
        if res then
           log(res)
            local resArr = split(res,"|")
            if resArr[1] == "1" then
                info.yzm = resArr[2]
                return true
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
	address_['firstName'] = first_name_
	address_['lastName'] = last_names_
	address_['country'] = "中国"
	address_['state'] = '广东省'
	address_['city'] = '深圳市'
	address_['county'] = '罗湖区'
	address_['address1'] = var.account.address_area 
	address_['address2'] = var.account.address_class
	Arr.address = json.encode(address_)
	Arr.iphone = getDeviceName()
	Arr.note = UIv.note
	log( post(url,Arr) )
end
--地址
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

--取帐号
function get_account()
    local getIdUrl = 'http://nikeapi.honghongdesign.cn/?s=App.NikeSelect.NikeFetch&re_login='..UIv.re_login..'&note='..UIv.note
    log( getIdUrl )
	local data 	= get(getIdUrl);
	if data ~= nil and data~= '' and data ~= 'timeout' then
		log(data)
		if type(data.data) == "table" then
		    
			var.account.login = data.data.email
			var.account.pwd = data.data.password
			var.account.phone = data.data.phone
			var.account.id = data.data.id
			var.account.token = data.data.token
			
			var.account.address = data.data.data.address
			
            log('var.account.token')
            log(var.account.token)
            log('var.account.token-end')
            
            if var.account.token then
                if #var.account.token >2 then
                    AccountInfoBack()
                end
            end
            
			local account_txt = "执行至 "..var.account.id .."\n账号 = "..var.account.login.."\n密码 = "..var.account.pwd
			dialog(account_txt,2)
			log(account_txt)
		else
			dialog("暂无帐号", 60*3)
			return false
		end
	end
    delay(2)
end

--还原取到的帐号
function AccountInfoBack()
	local sz = require("sz")
	local json = sz.json
	local appbid = 'com.nike.onenikecommerce'
	local AccountInfo = appDataPath(appbid).."Documents/ifkc.plist"
    log(AccountInfo);
	local url = 'http://nikeapi.honghongdesign.cn/' .. var.account.token
	log( url )
	downFile(url, AccountInfo)
	toast('下载完成',1)
	mSleep(2000)
end
--返回复登信息
function backId()
	local postUrl = 'http://nikeapi.honghongdesign.cn/'
	local postArr = {}
	postArr.s = 'NikeBack.back'
	postArr.id = var.account.id
	log(post(postUrl,postArr))
end

function updateNikeLog(txt)
	adbox = adbox or 0
	if adbox == 0 then
		adbox = 1
		--创建文本视图
		fwShowWnd("window1",0,0,200,30,1);
		mSleep(500)
	end
	fwShowTextView("window1","text1",txt,"center","FF0000","FFDAB9",10,0,0,0,200,30,0.8);
	--fwShowTextView("window1","text1","文本视图","center","FF0000","FFDAB9",10,0,0,0,200,30,0.5);
end

-- local_token_()
-- sys.clear_bid("com.nike.onenikecommerce")
-- getPhone()





