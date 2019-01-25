



--inputText('e6k20wkt88@icloud.com')

txt = '1:id-11178716 1128区 这首单曲 2:2018年10月18日 设备型号iphone6 设备系统10.1 网络4g 或者 wifi 3:无充值经历4:主城37级、人族、紫色国家5:L币12.44k 金币	4902K 水4261K 木材72.44K 血钻40.08K 密银38.73K水晶34.54K 6无充值记录'


txt = 23346619
inputText(txt)





require("tsp")
--读取键值
local sz = require("sz")
local plist = sz.plist
local app = 'com.lilithgame.sgame'
local dataPath = appDataPath(app)
local plfilename = dataPath.."/Library/Preferences/com.lilithgame.sgame.plist" --设置 plist 路径
local tmp2 = plist.read(plfilename)           --读取 PLIST 文件内容并返回一个 table


log(dataPath)