------------------------------------------------------------------------------------------------------------------------------------------
-- 触动精灵使用，安卓手机必须要Root，苹果手机要越狱。如果没有Root或越狱的请先自己Root或越狱。

-- 调用联众识别接口示例
-- 联众识别接口：
-- 接口1：查询余额，lzPoint(“用户名”，“密码”)
-- 接口2：上传识别，lzRecoginze("用户名", "密码", "待识别图片文件", "识别类型")
-- 接口3：识别报错，lzReportErrot("用户名", "密码", "识别时返回的验证码ID")

-- 辅助函数：
-- 截图接口，lzScreen(截图范围，比例（默认1.0）)
------------------------------------------------------------------------------------------------------------------------------------------
--主函数
--init(0);
local mp = require("lz-api");	--引用联众API源文件
lz_username = "ouwen000";		--联众打码账号
lz_password = "whoami@520";		--联众打码密码
--imgfile = "/private/var/mobile/Media/TouchSprite/res/yzm.jpg";  --验证码图片路径
--imgfile = lzScreen(0,0,100,100,1.0);					--截图保存图片及返回路径
yzmtype = "1001";				--验证码类型
yzmid = "";					--验证码ID(报错使用)
jiegou = "";
apple_yzm = "";

--查询余额
local lzYE = lzPoint(lz_username, lz_password);
--lzYE = "打码账号余额:" .. lzYE;
toast(lzYE, 2);

--[[
--上传图片识别
local lzRe, yzmid, jiegou = lzRecoginze(lz_username, lz_password, imgfile, yzmtype);
jiegou = "识别结果:" .. jiegou.."\n验证码ID:"..yzmid;
dialog(jiegou, 2);

--识别错误报错
--local lzRep = lzReportError(lz_username, lz_password, yzmid);
--dialog(lzRep, 0);
--]]

function lz_yzm()
	lzRe, yzmid, jiegou = lzRecoginze(lz_username, lz_password, imgfile, yzmtype);
	apple_yzm = jiegou
	if jiegou == "FALSE" then
		return false
	elseif jiegou then
		jiegou = "识别结果:" .. jiegou;
		nLog(jiegou)
		toast(jiegou, 2);
		mSleep(1000 * 2)
		return true
	end
end
