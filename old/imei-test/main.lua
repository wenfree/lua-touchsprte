local ts = require("ts")

serialnumber = ts.system.serialnumber()--获取设备的序列号，安卓不同的手机可能返回空值

mSleep(1000*4)

toast(serialnumber, 2)

mSleep(1000*2)

toast("end", 2)
mSleep(1000*2)