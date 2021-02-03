require("tsp");
require('token');
require('ZZBase64');
require('yzm');

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
    postArr['s']="App.SmsRokReg.GetPhone";
    local data = post('http://sms.wenfree.cn/public/',postArr);
    if (data) then
        local url = data['data']['url'];
        info.smsname = data['data']['name'];
        local res = get_(url);
        log(res)
        
        postArr['s']="SmsRokReg.MakeGetPhone";
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
    postArr['s']="App.SmsRokReg.GetSms";
    postArr['name']=info.smsname;
    postArr['phone']=info.phone;
    local data = post(info.api,postArr);
    if (data) then
        local url = data['data']['url'];
        local res = get_(url);
        log(res.."=>"..#res)
        if #res > 50 then
            log("res-准备上传");
            postArr['s']="SmsRokReg.MakeGetSms";
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

function isimgupload()
    local RokToken = llsGameToken();
    local url = 'http://rok.honghongdesign.cn/public/'
    local arr = {}
    arr['s']='Img.Img'
    arr['token'] = RokToken[1]
    local data = post(url,arr)
    if data.data == '需要截图' then
        return true
    end
end

function ocr(x1,y1,x2,y2)
	local ress = ocrText(x1,y1,x2,y2, 10) or 0
	if ress == '' then
		nLog('nil')
		return 0
	end
	return ress
end

function ocrInfo()
    local infos={}
    -- infos.city = {654,432,686,451}
    infos.fighting = {121,7,263,38}
    infos.red = {1240,12,1290,36}
    if __game == nil then
        __game = {}
    end
    for k,v in pairs(infos) do
        __game[k] = ocr(v[1],v[2],v[3],v[4])
    end
end

function uploadquBaiDu()
    local token = llsGameToken()[1]
    local url = 'http://rok.honghongdesign.cn/public/'
	local postData = {}
    -- snapshot("qu.png", 277,8,312,31);
    snapshot("qu.png", 277,12,1333,33);
	path = userPath();
	imagepath = path .. "/res/qu.png"
	require("ZZBase64")
	function base64s(imagepath)
		local files
		local file = io.open(imagepath,"rb")
		if file then
			files = file:read("*a")
			file:close()
			return encodeURI( ZZBase64.encode(files) );
		else
			return "";
		end
	end
	local imadata = base64s(imagepath)
	postData['img'] = imadata
	postData['token'] = token
	postData['s'] = 'Img.base64'
	local imgRes = post(url,postData)
	log(imgRes)
end


function uploadqu()
    local url = 'http://rok.honghongdesign.cn/public/'
	local postData = {}
    snapshot("qu.png", 281,11,1325,34);
    -- snapshot("qu.png", 0,0,100,100);
	path = userPath();
	imagepath = path .. "/res/qu.png"
	require("ZZBase64")
	function base64s()
		local files
		local file = io.open(imagepath,"rb")
		if file then
			files = file:read("*a")
			file:close()
			return ZZBase64.encode(files);
		else
			return "";
		end
	end
	postData['img'] = encodeURI( base64s() )
	postData['token'] = llsGameToken()[1]
	postData['s'] = 'Img.base64'
	local imgRes = post(url,postData)
end

function uploadimg()
    local url = 'http://rok.honghongdesign.cn/public/'
	local postData = {}
    snapshot("img.jpg", 0,0,1334,750,0.4);
    -- snapshot("qu.png", 0,0,100,100);
	path = userPath();
	imagepath = path .. "/res/img.jpg"
	require("ZZBase64")
	function base64s()
		local files
		local file = io.open(imagepath,"rb")
		if file then
			files = file:read("*a")
			file:close()
			return ZZBase64.encode(files);
		else
			return "";
		end
	end
	postData['img'] = encodeURI( base64s() )
	postData['token'] = llsGameToken()[1]
	postData['s'] = 'Img.All'
	local imgRes = post(url,postData)
end


__game={}
update_token()






