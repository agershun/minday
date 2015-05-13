################################################
# MINDAY 0.009Tu
# format.coffee
# Работа с меню Вставка
################################################

# Устанавливаем ссылки на меню
setMenuFormat = ->
	$(".format_bold").click formatBold
	$(".format_italic").click formatItalic
	$(".format_underline").click formatUnderline
	$(".format_linethrough").click formatLineThrough	
	$(".format_border").click formatBorder
	$(".format_span").click formatSpan
	$(".format_th").click formatTH
	$(".format_td").click formatTD
	$(".format_sticker").click formatSticker
	$(".format_plain").click formatPlain
	$(".format_ol").click formatOL
	$(".format_ul").click formatUL
	$(".format_checkbox").click formatCheckbox
	$(".format_yesno").click formatYesNo
	$(".format_percent").click formatPercent
	$(".format_frame").click formatFrame
	$(".format_readonly").click formatReadOnly
	$(".format_listtable").click formatListTable

formatBold = -> 
	if sidea.bold? then delete sidea.bold else sidea.bold = yes
	redraw()

formatItalic = ->
	if sidea.italic? then delete sidea.italic else sidea.italic = yes
	redraw()

formatUnderline = -> 
	if sidea.underline? then delete sidea.underline else sidea.underline = yes
	redraw()

formatBorder = -> 
	if sidea.border? then delete sidea.border else sidea.border = yes
	redraw()


formatLineThrough = ->
	if sidea.linethrough? then delete sidea.linethrough else sidea.linethrough = yes
	redraw()


formatSpan = ->
	if sidea isnt fidea
		if sidea.list? and sidea.list is SPAN then delete sidea.list else sidea.list = SPAN
		sidea.upperFrame().fhtml(sidea)


formatTD = ->
	if sidea isnt fidea
		if sidea.list? and sidea.list is TD then delete sidea.list else sidea.list = TD
		sidea.upperFrame().fhtml(sidea)

formatSticker = ->
	if sidea isnt fidea
		if sidea.list? and sidea.list is STICKER then delete sidea.list else sidea.list = STICKER
		sidea.upperFrame().fhtml(sidea)


formatFrame = ->
	finishEdit()
	if sidea.frame?
		delete sidea.frame
		sidea.upperFrame().fhtml(sidea)
	else 
		sidea.frame = true
		sidea.upperFrame().fhtml(sidea)

formatReadOnly = -> 
	if sidea.readonly? then delete sidea.readonly else sidea.readonly = yes
	redraw()


formatPlain = ->
	if sidea isnt fidea
		if sidea.plain? then delete sidea.plain else sidea.plain = yes
		sidea.upperFrame().fhtml(sidea)

formatOL = ->
	if sidea isnt fidea
		if sidea.list? and sidea.list is OL then delete sidea.list else sidea.list = OL
		sidea.upperFrame().fhtml(sidea)

formatUL = ->
	if sidea isnt fidea
		if sidea.list? and sidea.list is UL then delete sidea.list else sidea.list = UL
		sidea.upperFrame().fhtml(sidea)

formatCheckbox = ->
	if sidea isnt fidea
		if sidea.format? and sidea.format is CHECKBOX then delete sidea.format else sidea.format = CHECKBOX
		sidea.upperFrame().fhtml(sidea)

formatYesNo = ->
	if sidea isnt fidea
		if sidea.format? and sidea.format is YESNO then delete sidea.format else sidea.format = YESNO
		sidea.upperFrame().fhtml(sidea)

formatPercent = ->
	if sidea isnt fidea
		if sidea.format? and sidea.format is PERCENT then delete sidea.format else sidea.format = PERCENT
		sidea.upperFrame().fhtml(sidea)

formatListTable = -> 
	if sidea.intype? 
		if sidea.intype is LIST then sidea.intype = LINE
		else if sidea.intype is LINE then sidea.intype = TABLE
		else if sidea.intype is TABLE then sidea.intype = LIST
	else 
		sidea.intype = LINE
	redraw()

formatTH = ->
	if sidea.th? then delete sidea.th else sidea.th = yes
	redraw()
