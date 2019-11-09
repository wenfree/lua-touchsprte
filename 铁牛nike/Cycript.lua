dyjit = require("mt")
_appBid = 'com.nike.onenikecommerce'  --appBID
_appDataPath  = appDataPath(_appBid)
function s_getVcState(info)
	local path = _appDataPath.."/Documents/state.plist"
	local firstName = info.firstName 
	local lastName = info.lastName
	local phone = info.phone
	local code = info.code
	local password = info.password
	local brithday = info.brithday
	local email = info.email
	local gender = tonumber(info.gender)-1
	local isModify = info.isModify
	info.session = ""
	info.nowinfo = {}
	
	plist.write(path,info)
	local script = [==[
		local ffi = require("ffi")
		ffi.cdef[[
			id objc_getClass(const char * name);
			unsigned int sleep(unsigned int); 
		]]
		local dic = runtime.NSMutableDictionary:alloc():initWithContentsOfFile_(runtime.Obj("]==]..path..[==["))
		local rootVc = runtime.UIWindow:keyWindow():rootViewController()
		if rootVc:isKindOfClass_(runtime.ONCAppWireframeNavigationController:class()) then 
			local topVC = rootVc:topViewController()
			if topVC:isKindOfClass_(ffi.C.objc_getClass("SNKRS_inhouse.OnboardingLoginViewController")) then   
				local preVC =  runtime.UIWindow:keyWindow():rootViewController():presentedViewController():topViewController()
				if tostring(preVC) ~= "nil" then 
					if preVC:isKindOfClass_(ffi.C.objc_getClass("NUWebViewController")) then   
						local webView = preVC:webView()
						local html = webView:stringByEvaluatingJavaScriptFromString_(runtime.Obj("document.getElementsByTagName('html')[0].innerHTML"))
						if html:containsString_(runtime.Obj("手机号码")) then 
							local phone = webView:stringByEvaluatingJavaScriptFromString_(runtime.Obj("document.getElementsByClassName('phoneNumber')[0].value"))
							local vercode = webView:stringByEvaluatingJavaScriptFromString_(runtime.Obj("document.getElementsByClassName('code')[0].value"))
							if "]==]..phone..[==[" == "" then
								webView:stringByEvaluatingJavaScriptFromString_(runtime.Obj("document.getElementsByClassName('phoneNumber')[0].value=''"))
								dic:setObject_forKey_(runtime.Obj("waitPhone"),runtime.Obj("session"))
								dic:writeToFile_atomically_(runtime.Obj("]==]..path..[==["),1)
							elseif phone:isEqualToString_(runtime.Obj("")) then 
								webView:stringByEvaluatingJavaScriptFromString_(runtime.Obj("document.getElementsByClassName('phoneNumber')[0].value=']==]..phone..[==['"))
								webView:stringByEvaluatingJavaScriptFromString_(runtime.Obj("document.getElementsByClassName('sendCodeButton')[0].click()"))
								dic:setObject_forKey_(runtime.Obj("sendPhobe"),runtime.Obj("session"))
								dic:writeToFile_atomically_(runtime.Obj("]==]..path..[==["),1)
							elseif vercode:isEqualToString_(runtime.Obj("")) then 
								if "]==]..phone..[==[" == "" then
									webView:stringByEvaluatingJavaScriptFromString_(runtime.Obj("document.getElementsByClassName('phoneNumber')[0].value=''"))
									dic:setObject_forKey_(runtime.Obj("waitPhone"),runtime.Obj("session"))
									dic:writeToFile_atomically_(runtime.Obj("]==]..path..[==["),1)
								elseif "]==]..code..[==[" == "" then
									dic:setObject_forKey_(runtime.Obj("waitMsg"),runtime.Obj("session"))
									dic:writeToFile_atomically_(runtime.Obj("]==]..path..[==["),1)
								else
									webView:stringByEvaluatingJavaScriptFromString_(runtime.Obj("document.getElementsByClassName('code')[1].value=']==]..code..[==['"))
									webView:stringByEvaluatingJavaScriptFromString_(runtime.Obj("document.querySelector('div.mobileJoinContinue > input').click();"))
									dic:setObject_forKey_(runtime.Obj("sendMsg"),runtime.Obj("session"))
									dic:writeToFile_atomically_(runtime.Obj("]==]..path..[==["),1)
								end
							end 
						elseif html:containsString_(runtime.Obj("出错了")) then 
							dic:setObject_forKey_(runtime.Obj("error"),runtime.Obj("session"))
							dic:writeToFile_atomically_(runtime.Obj("]==]..path..[==["),1)
						elseif html:containsString_(runtime.Obj("首选产品")) then 
							webView:stringByEvaluatingJavaScriptFromString_(runtime.Obj("document.querySelector('div.firstName > input').value=']==]..firstName..[==['"))
							webView:stringByEvaluatingJavaScriptFromString_(runtime.Obj("document.querySelector('div.lastName > input').value=']==]..lastName..[==['"))
							webView:stringByEvaluatingJavaScriptFromString_(runtime.Obj("document.querySelector('div.password > input').value=']==]..password..[==['"))
							webView:stringByEvaluatingJavaScriptFromString_(runtime.Obj("document.querySelectorAll('input[type=\"button\"]')[]==]..gender..[==[].click()"))
							webView:stringByEvaluatingJavaScriptFromString_(runtime.Obj("document.querySelector('div.mobileJoinSubmit > input').click();"))
							dic:setObject_forKey_(runtime.Obj("page2"),runtime.Obj("session"))
							dic:writeToFile_atomically_(runtime.Obj("]==]..path..[==["),1)
						elseif html:containsString_(runtime.Obj("电子邮件")) then 
							webView:stringByEvaluatingJavaScriptFromString_(runtime.Obj("document.querySelectorAll('input[type=\"email\"]')[0].value=']==]..email..[==['"))
							webView:stringByEvaluatingJavaScriptFromString_(runtime.Obj("document.querySelector('div.captureEmailSubmit > input').click();"))
							dic:setObject_forKey_(runtime.Obj("page3"),runtime.Obj("session"))
							dic:writeToFile_atomically_(runtime.Obj("]==]..path..[==["),1)
						elseif html:containsString_(runtime.Obj("出生日期")) then 
							webView:stringByEvaluatingJavaScriptFromString_(runtime.Obj("document.querySelector('input[type=\"date\"]').value = ']==]..brithday..[==['"))
							webView:stringByEvaluatingJavaScriptFromString_(runtime.Obj("document.querySelector('div.mobileJoinDobEmailSubmit > input').click();"))
							dic:setObject_forKey_(runtime.Obj("page4"),runtime.Obj("session"))
							dic:writeToFile_atomically_(runtime.Obj("]==]..path..[==["),1)
						else
							dic:setObject_forKey_(runtime.Obj("loadView"),runtime.Obj("session"))
							dic:writeToFile_atomically_(runtime.Obj("]==]..path..[==["),1)
						end 
						return
					end
				else
					topVC:didSelectWithLoginAction_(0)
					dic:setObject_forKey_(runtime.Obj("page1"),runtime.Obj("session"))
					dic:writeToFile_atomically_(runtime.Obj("]==]..path..[==["),1)
				end
				dic:setObject_forKey_(runtime.Obj("none"),runtime.Obj("session"))
				dic:writeToFile_atomically_(runtime.Obj("]==]..path..[==["),1)
			elseif topVC:isKindOfClass_(runtime.ONCTabBarContainerViewController:class()) then 
				local loadingVc = topVC:loadingViewController()
				if tostring(loadingVc) ~= "nil" then 
					dic:setObject_forKey_(runtime.Obj("loadView"),runtime.Obj("session"))	 
					dic:writeToFile_atomically_(runtime.Obj("]==]..path..[==["),1) 
				else 
					local isModify ="]==]..tostring(isModify)..[==["
					if isModify == "false" then 
						topVC:setActiveTabType_animated_(0,1)
						topVC:setActiveTabType_animated_(3,1)
						local profile = runtime.ONCProfileManager:sharedInstance():profile()
						local adressInfo = runtime.NSMutableDictionary:alloc():init()
						local urlString = profile:avatar():urlString()
						if tostring(urlString)~="nil" then 
							adressInfo:setObject_forKey_(profile:avatar():urlString(),runtime.Obj("avatar"))
						end 
						adressInfo:setObject_forKey_(runtime.NSNumber:numberWithLongLong_(profile:gender()),runtime.Obj("gender"))
						adressInfo:setObject_forKey_(runtime.NSNumber:numberWithInteger_(profile:addresses():count()),runtime.Obj("addresses"))
						adressInfo:setObject_forKey_(profile:lastName(),runtime.Obj("lastName"))
						adressInfo:setObject_forKey_(profile:firstName(),runtime.Obj("firstName"))
						adressInfo:setObject_forKey_(profile:nikeShoeSize(),runtime.Obj("nikeShoeSize"))
						dic:setObject_forKey_(runtime.Obj("getProfile"),runtime.Obj("session"))
						dic:setObject_forKey_(adressInfo,runtime.Obj("nowinfo"))
						dic:writeToFile_atomically_(runtime.Obj("]==]..path..[==["),1)
					else
						local preVC = rootVc:presentedViewController()
						if tostring(preVC) ~= "nil" then   
							if preVC:isKindOfClass_(ffi.C.objc_getClass("StoryKit.StoryContainerViewController")) then   
								local StoryViewController = preVC:childViewControllers():objectAtIndex_(0)
								if StoryViewController:isKindOfClass_(ffi.C.objc_getClass("StoryKit.StoryViewController")) then 
									StoryViewController:dismissView() 
								end 
							end 
							dic:setObject_forKey_(runtime.Obj("dismissView"),runtime.Obj("session"))
							dic:writeToFile_atomically_(runtime.Obj("]==]..path..[==["),1)
						else
							local navigationVC = topVC:childViewControllerForStatusBarStyle() 
							if string.find(tostring(navigationVC:description()),"ONCFeedNavigationController")~=nil then 
								local tabTopVC = navigationVC:topViewController()
								if tabTopVC:isKindOfClass_(runtime.ONCFeedContainerViewController:class()) then 
									local childVC = tabTopVC:visibleChildViewController()
									local collectionView = childVC:rootView():collectionView()
									local nowRow = collectionView:indexPathsForVisibleItems():firstObject():row()
									local indexPath
									if nowRow+2>=collectionView:numberOfItemsInSection_(0) then
										indexPath = runtime.NSIndexPath:indexPathForRow_inSection_(0,0)
									else
										indexPath = runtime.NSIndexPath:indexPathForRow_inSection_(nowRow+2,0)
									end 
									collectionView:scrollToItemAtIndexPath_atScrollPosition_animated_(indexPath,2,1)
									local rnd = math.random(1,100)
									if rnd<=50 then 
										local threadId = childVC:displayItemAtIndexPath_(indexPath):threadId()
										childVC:didSelectItemWithThreadId_(threadId)
										if rnd <=30 then childVC:userDidTapLikeForCardAtIndexPath_(indexPath) end 
										dic:setObject_forKey_(runtime.Obj("clickView"),runtime.Obj("session"))	 
										dic:writeToFile_atomically_(runtime.Obj("]==]..path..[==["),1)    
									else
										dic:setObject_forKey_(runtime.Obj("drawView"),runtime.Obj("session"))	 
										dic:writeToFile_atomically_(runtime.Obj("]==]..path..[==["),1)    
									end 
								elseif tabTopVC:isKindOfClass_(runtime.ONCThreadViewController:class()) then 
									for i = 1,5 do
										local collectionView = tabTopVC:rootView():collectionView() 
										local nowRow = collectionView:indexPathsForVisibleItems():firstObject():row()
										local rows = collectionView:numberOfItemsInSection_(0)
										if nowRow+4>=rows then
											if i==1 then topVC:setActiveTabType_animated_(0,1) end 
											break
										else
											local indexPath = runtime.NSIndexPath:indexPathForRow_inSection_(nowRow+2,0)
											collectionView:scrollToItemAtIndexPath_atScrollPosition_animated_(indexPath,2,1)
										end 
									end  
									dic:setObject_forKey_(runtime.Obj("drawView"),runtime.Obj("session"))	 
									dic:writeToFile_atomically_(runtime.Obj("]==]..path..[==["),1)  
								end 
							else
								topVC:setActiveTabType_animated_(0,1)
								dic:setObject_forKey_(runtime.Obj("none"),runtime.Obj("session"))	 
								dic:writeToFile_atomically_(runtime.Obj("]==]..path..[==["),1)   
							end 
						end 
					end
				end 
			else
				dic:setObject_forKey_(runtime.Obj("waitView"),runtime.Obj("session"))	 
				dic:writeToFile_atomically_(runtime.Obj("]==]..path..[==["),1) 
			end 
				 
		else
			dic:setObject_forKey_(runtime.Obj("mainView"),runtime.Obj("session"))
			dic:writeToFile_atomically_(runtime.Obj("]==]..path..[==["),1)
		end 
	]==]
	dyjit.run(_appBid,script) mSleep(400)
	local session = ""
	for i = 1,3 do
		session =  plist.read(path).session
		if session~="" then break end 
		mSleep(1000)
	end 
	return plist.read(path)
end 

function s_ClickTSAlertButton() --点掉触动错误窗体
	local script = [==[
		pcall(function()
			local windows = runtime.UIApplication:sharedApplication():windows()
			local wCount = runtime.NSNumber:numberWithInt_(windows:count()):intValue()
			if wCount then 
				for i = 0,wCount-1 do
					local window = windows:objectAtIndex_(i)
					if window:isKindOfClass_(runtime.UIWindow:class()) then 
						local TSUserAlertRootViewController = window:rootViewController()
						if TSUserAlertRootViewController then 
							if TSUserAlertRootViewController:isKindOfClass_(runtime.TSUserAlertRootViewController:class()) then 
								local TSUserAlertView = TSUserAlertRootViewController:presentedViewController()
								if TSUserAlertView then 
									if TSUserAlertView:isKindOfClass_(runtime.TSUserAlertView:class()) then 
										local actions = TSUserAlertView:actions()
										local count = runtime.NSNumber:numberWithInt_(actions:count()):intValue()
										if count then 
											for i = 0,count-1 do
												local action = actions:objectAtIndex_(i)
												TSUserAlertView:__dismissWithAction_(action)
											end 
										end 
									end 
								end
							end
						end 
					end 
				end 
			end 
		end)
	]==]
	dyjit.run("com.apple.springboard",script) sys.msleep(500)
end  
function s_viewsinfo() --打印UI层级关系
	local path = _appDataPath.."/Documents/Nike.txt" 
	if appIsRunning(_appBid) == false then return nil end
	os.execute('rm -rf '..path)
	dyjit.run(_appBid,[==[
		local UIApp = runtime.UIApplication:sharedApplication()
		local c = UIApp:keyWindow():recursiveDescription() 
		if c~=nil then c:writeToFile_atomically_encoding_error_(runtime.Obj("]==]..path..[==["),1,4,nil) end
	]==])
	sys.msleep(300)
    if file.exists(path) then
		local vc=file.reads(path);
		if vc ==nil then return nil end 
		if vc ~="" then return vc else return nil end
	else 
		return nil
	end
end 

--[[
require("Function")
require("Common")
local info = {}
info.isModify = true 
info.firstName = "12"
 info.lastName = "23"
info.phone = ""
info.code = "12"
info.password = "12"
info.brithday = "12"
info.email = "12"
info.gender = "12"
local vs = s_getVcState(info)
Showlog(vs.session)

require("Function")
require("Common")
local info = {}
info.isModify = true 
info.firstName = "12"
 info.lastName = "23"
info.phone = "12"
info.code = "12"
info.password = "12"
info.brithday = "12"
info.email = "12"
info.gender = "12"
local vs = s_getVcState(info)
Showlog(vs.session)



require("Function")
require("Common")
local info = {
	phone = "13610238793",
	code ="613308",
	firstName = "西",
	lastName = "湖面",
	password = "123123Cc",
	gerden = "1",
	nikeShoeSize = "8.5",
	email = "772931415@qq.com",
	brithday = "1986-04-27",
	isModify = true,
	avatar = "https://tpc.googlesyndication.com/simgad/9221216781670028002?sqp=4sqPyQQ7QjkqNxABHQAAtEIgASgBMAk4A0DwkwlYAWBfcAKAAQGIAQGdAQAAgD-oAQGwAYCt4gS4AV_FAS2ynT4&rs=AOga4qkXfqToEs1uiWJASwg93zHWub0SsQ",
	adressInfo = {
		["code"] = "313000",
		["country"] = "CN",
		["code"] = "313000",
		["country"] = "CN",
		["label"] = "Shipping Address 2",
		["line1"] = "罗湖机场",
		["line2"] = "罗湖新苑",
		["line3"] = "",
		["gender"] = 1,
		["locality"] = "深圳市",
		["email"] = "lkajsdi124@183.com",
		["name"] = {
			["alternate"] ={
				["family"] = "",
				["given"] = "",
			},
			["primary"] ={
				["family"] = "波",
				["given"] = "施工",
			},
		},
		["phone"] =  {
			["primary"] = "18673539917",
		},
		["preferred"] = "0",
		["province"] = "CN-44",
		["region "]= "小地方",
		["type"] = "SHIPPING",
		["zone"] = "小地方",
		["email"] = "",
	}
}

local infos = {
	avatar = "https://source.unsplash.com/random/20*20",
	gerden = "1",
	nikeShoeSize = "11.5",
	firstName = "fa",
	lastName = "xiao",
}
local s_url = "http://127.0.0.1:9999/modifyinfo"
pdata = json.encode(infos)
local c,h,b = http.tspost(s_url,10,{},pdata)
dialog(c)
if c == 200 then dialog(b) end 
--]]

--
--[==[
//注册界面
NUWebViewController
var wv = #0x1063d9930
[wv stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('phoneNumber')[0].value='17018020466'"] //填写手机号码

[wv stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('sendCodeButton')[0].click()"] //发送验证码

[wv stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('code')[1].value='757363'"] //填写验证码

[wv stringByEvaluatingJavaScriptFromString:@"document.querySelector('div.mobileJoinContinue > input').click();"] //继续

[wv stringByEvaluatingJavaScriptFromString:@"var lastName = document.querySelector('div.lastName > input');lastName.value='鹏'"] //姓

[wv stringByEvaluatingJavaScriptFromString:@"var firstName = document.querySelector('div.lastName > input');firstName.value='陈'"] //名

[wv stringByEvaluatingJavaScriptFromString:@"document.querySelector('div.lastName > input').value='陈';document.querySelector('div.firstName > input').value='鹏';document.querySelector('div.password > input').value='123123Cp';"] //姓名

[wv stringByEvaluatingJavaScriptFromString:@"document.querySelectorAll('input[type=\"button\"]')[0].click();"] //选性别 0/男 1/女

[wv stringByEvaluatingJavaScriptFromString:@"document.querySelector('div.mobileJoinSubmit > input').click();"] //注册

[wv stringByEvaluatingJavaScriptFromString:@"document.querySelectorAll('input[type=\"email\"]')[0].value='roc666@qq.com'"] //输入电子邮件

[wv stringByEvaluatingJavaScriptFromString:@"document.querySelector('div.captureEmailSubmit > input').click();"] //保存电子邮件

[wv stringByEvaluatingJavaScriptFromString:@"document.querySelector('input[type=\"date\"]').value = '1986-04-27'"] //输入出生日期

[wv stringByEvaluatingJavaScriptFromString:@"document.querySelector('div.mobileJoinDobEmailSubmit > input').click();"] //保存出生日期



// 选择国家地区
// 移动到底部
[#ONCTabBarContainerViewController setActiveTabType:0 animated:YES] --切换主页TAB

[[[[[[[UIWindow keyWindow] rootViewController] topViewController] viewControllerMap] objectForKey:0] topViewController] visibleChildViewController]  分页1的主控制器
[[[[[[UIWindow keyWindow] rootViewController] topViewController]  viewControllerMap] objectForKey:1] topViewController] 分页2的主控制器
[[[[[[UIWindow keyWindow] rootViewController] topViewController]  viewControllerMap] objectForKey:2] topViewController] 分页4的主控制器
[[[[[[UIWindow keyWindow] rootViewController] topViewController]  viewControllerMap] objectForKey:3] topViewController] 分页4的主控制器

分页1 控制器  ONCFeedContainerViewController or ONCThreadViewController

底层主页控制器  ONCFeedContainerViewController visibleChildViewController =ONCFeedViewController
[vc collectionView:#0x106064c00 didSelectItemAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]] 进入详情页
var threadId = [[vc displayItemAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]] threadId] 获取单品ID
[vc didSelectItemWithThreadId:threadId] 根据ID进入详情页

var collectionView = [[vc rootView] collectionView]
[collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] atScrollPosition:1 animated:YES] 分页1 滑动

详情页控制器 ONCThreadViewController //topViewController
var collectionView = [[vc rootView] collectionView]
[collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:[collectionView numberOfSections]  inSection:0] atScrollPosition:1 animated:YES] 详情页 滑动
[vc userDidTapLikeForCardAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]] --收藏这个商品

var navVc = [[[[[UIWindow keyWindow] rootViewController] topViewController] viewControllerMap] objectForKey:0]
[navVc popToViewController:[vc bottomViewController] animated:YES] --导航控制器返回到底层控制器

分页4 控制器 ONCProfileViewController or 

个人主页控制器 ONCProfileViewController

换头像
var url = [NSURL URLWithString: @"https://image.baidu.com/search/detail?ct=503316480&z=undefined&tn=baiduimagedetail&ipn=d&word=UIImage%20&step_word=
&ie=utf-8&in=&cl=2&lm=-1&st=undefined&hd=undefined&latest=undefined&copyriht=ndefined&cs=3806547475,570102247&os=561112789,3202358382&simid=0,0&pn=99
&rn=1&di=80410&ln=1508&fr=&fmq=1566755759392_R&fm=&ic=undefined&s=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&is=0,0&ist
ype=0ist=jit=&bdtype=0&spn=0&pi=0&gsm=3c&objurl=http%3A%2F%2Fimg-blog.csdnimg.cn%2F20190309113305425.jpg&rpstart=0&rpnum=0&adpicid=0&force=undefined&ctd=1566755769188^3_1377X964%1"]
var image = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]]
var pManger = [ONCProfileManager sharedInstance]
[pManger saveAndPersistAvatar:image withCompletionBlock:nil]
[pManger saveProfileToKeychain:[[ONCProfileManager sharedInstance] profile]]
[pManger refreshProfileWithCompletion:nil]

var adress = [[_TtC13SNKRS_inhouse11AddressForm alloc] initWithCountry:@"CN"] 
var addressID = [adress addressID]

local adreesinfo = dic:valueForKey_(runtime.Obj("adressInfo"))
local adressID = runtime._TtC13SNKRS_inhouse11AddressForm:alloc():initWithCountry_(runtime.Obj("CN")):addressID()
adreesinfo:setObject_forKey_(adressID,runtime.Obj("guid"))
local oncAddress = runtime.ONCAddress:addressFromProfileDictionary_(adreesinfo)
local adrDict = runtime.NSMutableDictionary:alloc():init()
adrDict:setObject_forKey_(oncAddress,adressID)
pManger:profile():setAddresses_(adrDict)
--]==]

nLog('Cycript')
