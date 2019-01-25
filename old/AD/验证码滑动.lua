require("TSLib")
require("tsp")
--[[  
 * RGB颜色模型转化为HSV的颜色模型数据  
 * h,s,v 色相，饱和度， 色调（明度）  
 * 返回值 hsvValue h(0-360),s(0-255) v(0-255)  
 * @param colorRGB 颜色数值{r=0,g=255,b=100,a=255}, 数值部分0-255  
]]  
function RGBConvertToHSV(colorRGB)  
    local r,g,b = colorRGB.r, colorRGB.g, colorRGB.b;  
    local h,s,v = 0,0,0;  

    local max1 = math.max(r, math.max(g,b));  
    local min1 = math.min(r, math.min(g,b));  
  
    if max1 == min1 then  
        h=0;  
    else  
        if r == max1 then  
            if g >= b then  
                h = 60 * (g-b) / (max1-min1);  
            else  
                h = 60 * (g-b) / (max1-min1) + 360;  
            end       
        end  
        if g == max1 then  
            h = 60 * (b-r)/(max1-min1) + 120;  
        end  
        if b == max1 then  
            h = 60 * (r-g)/(max1-min1) + 240;  
        end  
    end      
      
    if max1 == 0 then  
        s = 0;  
    else  
        s = (1- min1 / max1) * 255;  
    end  
      
    v = max1;  
      
    local hsvValue = {  
        h = h;  
        s = s;  
        v= v;  
    };  
  
    return hsvValue;  
end

function getHsv(x,y)
	local colorRGB ={}
	colorRGB.r,colorRGB.g,colorRGB.b = getColorRGB(x,y)
	return RGBConvertToHSV(colorRGB)
end

list ={}



function leftP(x1,y1,x2,y2)
	keepScreen(true)
	for i = y1,y2 do
		hsv1 = getHsv(x1,i)
		hsv2 = getHsv(x1,i + 1)
		if tonumber(hsv2.v) - tonumber(hsv1.v) > 100 then
			keepScreen(false)
			log('竖-->'..i)
			return i
		end
	end
	keepScreen(false)
	return 0
end

function rightP(x1,y1,x2,y2)
	keepScreen(true)
	log('模')
	for i = x1,x2 do
		hsv1 = getHsv(i,y1)
		hsv2 = getHsv(i+2,y1)
--		log('hsv1-->'..hsv1.v..'('..i..','..y1..')')
--		log('hsv2-->'..hsv2.v..'('..i+2 ..','..y1..')')
		
		if tonumber(hsv1.v) - tonumber(hsv2.v) > 45 then
			log('发现插槽')
			
			right2 = i
			计数 = 0
			for k = right2,right2+11 do
				if hsv1.v - getHsv(k,y1).v > 40 then
					计数 = 计数 + 1
				end
			end
			if 计数 > 10 then
				keepScreen(false)
				log(i)
				return i
			end
		end
	end
	keepScreen(false)
end

top = {92,237}
down = {92,484}

--第一个点
left_top = leftP(top[1],top[2],down[1],down[2])+1
left ={ 92,  left_top}

lun2 = { 300 , left_top , 607 , left_top }
right_left = rightP(lun2[1],lun2[2],lun2[3],lun2[4])
right ={ right_left, left_top}

--第二个循环
function table.print(t)  
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            log(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        log(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        log(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        log(indent.."["..pos..'] => "'..val..'"')
                    else
                        log(indent.."["..pos.."] => "..tostring(val))
                    end
					mSleep(100)
                end
            else
                log(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        log(tostring(t).." {")
        sub_print_r(t,"  ")
        log("}")
    else
        sub_print_r(t,"  ")
    end
end

--[[
table.print(getHsv(92,419).v)  
table.print(getHsv(92,420).v)  

table.print(getHsv(449,420))  
table.print(getHsv(451,420))  
--]]

table.print(right)
moveTo(92,613,right_left,613,2)














