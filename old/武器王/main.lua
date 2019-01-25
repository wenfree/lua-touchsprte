


require("tsp")

t={}
t['left_red']={{240,757,0xff16ff},} --多点比色
t['right_red']={{401,756,0xff16ff},} --多点比色
t['green']={{268,780,0x0effff},} --多点比色
t['green_left']={{240,757,0x8dc35e},} --多点比色
t['green_right']={{243,757,0x8dc35e},} --多点比色

timeLine = os.time()

function __click(x,y)
	touchDown(1, x, y)
	mSleep(25)
	touchUp(1, x, y)
end


while (true) do
	keepScreen(true)
	if d('green_left')then
		__click(105,971)
	elseif d('green_right')then
		__click(545,973)
	elseif d('left_red')then
		__click(105,971)
	elseif d('right_red')then
		__click(545,973)
	end
	keepScreen(false)
	if os.time()-timeLine > 60*2 then
		mSleep(80)
	else
		mSleep(120)
	end
end















