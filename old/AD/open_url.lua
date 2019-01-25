require("tsp")
require("AWZ")








url = 'http://jump.iso234.com/B?c=dsp181&to=aHR0cHM6Ly9sbmswLmNvbS9oRVJKZGM='
--openURL(url)





count = 0
for i = 1,100 do
	if VPN()then
		openURL(url)
		mSleep(1000*15)
	end
	close_VPN()
	awzNew()
end