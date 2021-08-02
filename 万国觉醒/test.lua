require('tsp')
-- require('AWZ')
-- require('ZZBase64')
-- require("yzm")
-- require('api')
-- require('token')
init(1)
-- t={}
-- t['弹窗-兵营详情-x']={0xd3d1ca, "0|0|0xd3d1ca,0|34|0x04445f,-44|3|0xbdbbae",90,996,45,1201,149}
-- t['头衔-头衔冠']={0x995300, "0|0|0x995300,-12|-6|0xffa800,402|2|0x42c6ee",90,23,91,1273,622}

-- d("头衔-头衔冠",true,1,2)

-- input("Ax112211")
-- input("jhjjvh@163.com")

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

-- sys.clear_bid("com.lilithgames.rok.ios.offical")
-- log( readPasteboard() )

-- input("3625858761")
-- input("dbc9204d-ffbb-49ed-bab7-c8d7f02d541e")



-- log( appDataPath("com.saurik.Cydia") )

-- openURL("https://web.lanshuapi.com/aff/pWVx")

a={"W4-139497720210726152248343",
"W5-135751720210726150211542",
"W4-135092020210726150028192",
"W5-139629820210726145615610",
"W4-68015420210726145521853",
"W5-139737220210726145457276",
"W3-139668920210726145445508",
"W5-138393920210726145227720",
"W4-137163520210726144959644",
"W4-139739520210726144947393",
"W3-129265420210726144847660",
"W4-139564020210726144834095",
"W3-119946420210726143901554",
"W4-134917520210726143839275",
"W5-61486220210726143836559",
"W5-136534220210726131408579",
"W5-117415520210726131250651",
"W4-139594320210726131248080",
"W4-139599720210726131157059",
"W5-32368820210726124659073",
"W3-27020620210726123307548",
"W5-138540320210726114908213",
"W3-71147620210726114848504",
"W5-138146720210726114645150",
"W3-137048020210726114636368",
"W5-137764820210726114619783",
"W4-137201020210726113625506",}

for k,v in ipairs(a) do
    url = "http://phalapi.888cydf.com/?s=App.Callback.Merchant"
    data = { }
    data['status'] = 20
    data['merchant_sn'] = v
    data['key'] = "28b777ad2d6d5ba32bc4b9d53019cc8f"
    post(url,data)
end








