require("tsp");

function _api_rok(info)
    local url = 'http://rok.honghongdesign.cn/public/';
    log(post(url,info));
end

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

--取手机号
function getPhone() 
    local postArr = {};
    postArr['s']="App.SmsWenfree.GetPhone";
    local data = post('http://sms.wenfree.cn/public/',postArr);
    if (data) then
        local url = data['data']['url'];
        info.smsname = data['data']['name'];
        local res = get(url);
        log(res)
        
        postArr['s']="SmsWenfree.MakeGetPhone";
        postArr['name']=info.smsname;
        postArr['arr']=json.encode(res) ;
        
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

function get_(url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(url);
	if code == 200 then
		return res
	end
end
-- //取短信
function getMessage()
    local postArr = {};
    postArr['s']="App.SmsWenfree.GetSms";
    postArr['name']=info.smsname;
    postArr['phone']=info.phone;
    local data = post(info.api,postArr);
    if (data) then
        local url = data['data']['url'];
        local res = get_(url);
        log(res.."=>"..#res)
        if #res > 50 then
            log("res-准备上传");
            postArr['s']="SmsWenfree.MakeGetSms";
            postArr['name']=info.smsname;
            postArr['arr']= res ;
            local datas = post(info.api,postArr);
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

function ocr(x1,y1,x2,y2)
	local ress = ocrText(x1,y1,x2,y2, 10) or 0
	if ress == '' then
		nLog('nil')
		return 0
	end
	return ress
end

-- init(1)
-- qu={631,663,660,685}
-- qu = ocr(qu[1],qu[2],qu[3],qu[4])
-- log(qu)


















