

account = {
{"twoculokfj6182safwaa@hotmail.com","Ww556655",},
{"prophnnrtpqik6643elddl@hotmail.com","Ww556655",},
{"ojoldgfvsgvu6597anlva@hotmail.com","Ww556655",},
{"sgbpgsdjsjcjsq6954jbstob@hotmail.com","Ww556655",},
{"ulojnnjdpcskou6902tmisl@hotmail.com","Ww556655",},
{"spsbsgkrlgghib6978khsksd@hotmail.com","Ww556655",},
{"tcckdsgsonuoo6650nseub@hotmail.com","Ww556655",},
{"ssmguasuwoescm6996fshrp@hotmail.com","Ww556655",},
{"tprvbtnosoprt6690istkmd@hotmail.com","Ww556655",},
{"pfsgeqdgolkge6662geotwl@hotmail.com","Ww556655",},
{"thureasbllupfd6827gkvrpm@hotmail.com","Ww556655",},
{"peqbacrqnwsls6656omkmlk@hotmail.com","Ww556655",},
}





function inputword(key)
	for i = 1,string.len(key) do
		nLog(string.sub(key,i,i))
		inputkey = string.sub(key,i,i)
		inputkey = tonumber(inputkey)
		if type(inputkey) == 'number' then
			--nLog('munber->'..inputkey)
		else
			inputkey = string.sub(key,i,i)
			inputkey = string.lower(inputkey)
		end
		keyDown(inputkey)
		keyUp(inputkey)
		mSleep(100)
	end
end


inputword('4FKH6YZFJ6T0UUGN44OD0RVMMZVDHI13QJ6QYSMS')







--[[

phoneName = getDeviceAlias();

s={

["京东1"]="A7C86BF069545F9DC698",
["京东2"]="9F31BBF77F543317F221",
["京东3"]="6C80FDBFD755F39A5FCB",
["京东4"]="9A4C16C2B23D8CCBCBF8",
["京东5"]="86F39D8BD165EBDE6653",
["京东6"]="D91E4464389483BB6687",
["京东7"]="07FCE790228C9B28C509",
["京东8"]="A912B8977C8D3E7D6994",
["京东9"]="848CEC6A8A68B008069C",
["京东10"]="AE1836F50B1FFB000A21",

}


inputword(s[phoneName])
--]]