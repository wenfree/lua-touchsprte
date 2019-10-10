
--[[

格式说明：

{
	下拉选项标题,
	{
		customKeyMap = 自定义快捷键映射表,
		singlePosFormatRule = 单点取色生成格式函数,
		multiPosFormatRule = 多点取色生成格式函数,
		currentPosInfo = 鼠标所指当前点的格式生成函数（面板上那个随着鼠标移动时刻在变化的内容）,
		makeScriptRule = { -- 自定义脚本规则
			生成第 1 个文本框内容的函数,
			生成第 2 个文本框内容的函数,
			生成第 3 个文本框内容的函数,
			testRule = { -- [+ 1.7.7]
				第 1 个文本框的内容的测试函数,
				第 2 个文本框的内容的测试函数,
				第 3 个文本框的内容的测试函数,
			},
		},
	},
}

customKeyMap 说明：
	可参考 scripts/config/colorpicker/keymap.lua 的返回值


singlePosFormatRule、multiPosFormatRule 参数说明：
	p：		当前点信息，包括 x、y、c、r、g、b、num
	a：		坐标缓冲位 A 的信息，包括 x、y
	s：		坐标缓冲位 S 的信息，包括 x、y
	x：		坐标缓冲位 X 的信息，包括 x、y
	c：		坐标缓冲位 C 的信息，包括 x、y
	set:	扩展设置列表


makeScriptRule 参数说明：
	poslist: {
		p,
		p,
		p,
		...
		a = {x, y},
		s = {x, y},
		x = {x, y},
		c = {x, y},
	}

	set: 扩展设置列表

如需自定义格式，可以复制当前文件的考备份重命名然后做修改
修改完成后，可以在文件 scripts/config/colorpicker/cf_enabled.lua 应用添加自定义格式

--]]
function make_FMC(poslist)
	local ret = ""
	local firstPos
	for i,currentPos in ipairs(poslist) do
		if i==1 then
			firstPos = currentPos
			ret = ret..string.format("0x%06x, \"", firstPos.c)
		else
			ret = ret..string.format("%d|%d|0x%06x", currentPos.x - firstPos.x, currentPos.y - firstPos.y, currentPos.c)
			if i~=#poslist then
				ret = ret..","
			end
		end
	end
	return ret..'"'
end

local function is_same_0(n)
	return (tonumber(n) or 0)==0
end

return 
{"杨 - By wenfree", -- 感谢桃子共享格式
	{
		settingsRule = {
			title = "自定义格式 [精简去空格版Hex - By 桃桃] 的参数设置",
			caption = {"参数名", "参数值"},
			args = {
				{"相似度(1-100 空为100%)", 	"85"},
				{"当前isColor函数定义（直接复制使用）", 	isColorCodeDefine}
			},
		},
		singlePosFormatRule = (function(p, a, s, x, c, set)
			return string.format("%d,%d,0x%06x", p.x, p.y, p.c)
		end),
		multiPosFormatRule = (function(p, a, s, x, c, set)
			return string.format("%d,%d,0x%06x\n", p.x, p.y, p.c)
		end),
		currentPosInfo = (function(p, a, s, x, c, set)
			return string.format("X:%d Y:%d \r\nR:%d G:%d B:%d \r\nC:0x%06x", p.x, p.y, p.r, p.g, p.b, p.c)
		end),
		makeScriptRule = {
			(function(poslist, set)
				local ret = "t['']={"
				for _,currentPos in ipairs(poslist) do
					ret = ret..string.format("{%d,%d,0x%06x},", currentPos.x, currentPos.y, currentPos.c)
				end
				return ret.."}  --多点取色"
			end),
			(function(poslist)
				local ax, ay, sx, sy = poslist.a.x, poslist.a.y, poslist.s.x, poslist.s.y
				if is_same_0(ax) and is_same_0(ax) and is_same_0(sx) and is_same_0(sy) then
					sx, sy = getImageSize()
					if sx~=0 or sy~=0 then
						sx, sy = sx-1, sy-1
					end
				end
				return string.format("t['']={ %s, 90, %d, %d, %d, %d } --多点找色",
																		make_FMC(poslist),
																		ax,
																		ay,
																		sx,
																		sy)
			end),
			make_findMultiColorInRegionFuzzy,
			testRule = { -- [+ 1.7.7]
				(function(s)
					return multiColorCodeDefine..[[
					if multiColor(]]..s..[[, 80) then
						nLog("相似度80以上")
					else
						nLog("相似度80以下")
					end
					]]
				end),
				(function(s)
					return isColorCodeDefine..s..[[ 
						nLog("匹配")
					else
						nLog("不匹配")
					end
					]]
				end),
				(function(s)
					return s..[[ 
						nLog("多点找色结果："..tostring(x).." ,"..tostring(y))
					]]
				end),
			},
		},
	},
}