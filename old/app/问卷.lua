require("tsp")
init(0,0)
m={}
m.选项 = { 0xe7e7e7, "5|0|0x737373,-3|-4|0x777777,0|5|0x767676", 90, 0, 0, 639, 1135}










web_url = 'https://dkr1.ssisurveys.com/projects/internal?psid=94mUddoHeet4yhngAI-tBA**&subpanelid=2'
openURL(web_url)


function cho()
	choise = {}
	n = 1
	m.选项[5] = 0
	while f_pic(m.选项,'选项') do
		choise.x = x
		choise[n] = y
		m.选项[5] = y + 12
		n = n + 1
	end
end



cho()
for k,v in pairs(choise) do
	log(k..'~'..v)
end
	
