require('tsp')
-- require('AWZ')
-- require('ZZBase64')
-- require("yzm")
-- require('api')
-- require('token')
init(0)
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

input("45.195.9.230")
click(684,1293)
input("1080")
click(684,1293)
input("a3621d4f-0fda-4109-8db2-8b59a565892e")
click(684,1293)
input("财代付")

-- log( appDataPath("com.saurik.Cydia") )












