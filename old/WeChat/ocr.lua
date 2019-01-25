
function ocr(x1,y1,x2,y2)
	local text = nil
	text = ocrText(x1,y1,x2,y2,10)
	if  text ~= '' then
		nLog(text)
		return text
	else
		text = 'nil'
		nLog(text)
		return text
	end
end

