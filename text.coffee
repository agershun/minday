################################################
# MINDAY 0.009Tu
# text.coffee
# Работа с меню Текст
################################################

# Устанавливаем ссылки на меню
setMenuText = ->
	$(".text_left").click textLeft
	$(".text_center").click textCenter
	$(".text_right").click textRight
	$(".text_justify").click textJustify
	$(".text_bottom").click textBottom
	$(".text_middle").click textMiddle
	$(".text_Top").click textTop

	$(".text_schemewhite").click textSchemeWhite
	$(".text_schemeblue").click textSchemeBlue
	$(".text_schemelightblue").click textSchemeLightBlue
	$(".text_schemegreen").click textSchemeGreen
	$(".text_schemeyellow").click textSchemeYellow
	$(".text_schemered").click textSchemeRed
	$(".text_schemeblack").click textSchemeBlack

	$(".text_childrenleft").click textChildrenLeft
	$(".text_childrencenter").click textChildrenCenter
	$(".text_childrenright").click textChildrenRight
	$(".text_childrenjustify").click textChildrenJustify
	$(".text_clearalign").click textClearAlign
# Второе меню
	$(".text2_background").click text2Background
	$(".text2_tableclass").click text2TableClass


text2Background =->
	if fidea.background? 
		fidea.background = (fidea.background+1) % bkgStyle.length
	else 
		fidea.background = 1
	redraw()

text2TableClass =->
	#TODO: Сделать так, чтобы можно было ставить класс таблицы не только из первой ячейки	
	if sidea.tableclass? 
		sidea.tableclass = (sidea.tableclass+1) % tblClass.length
	else 
		sidea.tableclass = 1
	redraw()





textClearAlign = -> 
	delete sidea.align
	delete sidea.childrenalign
	delete sidea.valign
	redraw()

textLeft = -> 
	if (sidea.align? and sidea.align isnt LEFT) or (not sidea.align?) then sidea.align = LEFT
	else delete sidea.align
	redraw()

textCenter = -> 
	if (sidea.align? and sidea.align isnt CENTER) or (not sidea.align?) then sidea.align = CENTER
	else delete sidea.align
	redraw()

textRight = -> 
	if (not sidea.align?) or (sidea.align? and (sidea.align isnt RIGHT)) then sidea.align = RIGHT
	else delete sidea.align
	redraw()

textJustify = -> 
	if (sidea.align? and sidea.align isnt JUSTIFY) or (not sidea.align?) then sidea.align = JUSTIFY
	else delete sidea.align
	redraw()


textTop = -> 
	if (sidea.valign? and sidea.valign isnt TOP) or (not sidea.valign?) then sidea.valign = TOP
	else delete sidea.valign
	redraw()

textMiddle = -> 
	if (sidea.valign? and sidea.valign isnt MIDDLE) or (not sidea.valign?) then sidea.valign = MIDDLE
	else delete sidea.valign
	redraw()

textBottom = -> 
	if (sidea.valign? and sidea.valign isnt BOTTOM) or (not sidea.valign?) then sidea.valign = BOTTOM
	else delete sidea.valign
	redraw()



textSchemeWhite = -> 
	if sidea.scheme? and sidea.scheme is WHITE then delete sidea.scheme
	else sidea.scheme = WHITE
	redraw()
textSchemeBlue = -> 
	if sidea.scheme? and sidea.scheme is BLUE then delete sidea.scheme
	else sidea.scheme = BLUE
	redraw()
textSchemeLightBlue = -> 
	if sidea.scheme? and sidea.scheme is LIGHTBLUE then delete sidea.scheme
	else sidea.scheme = LIGHTBLUE
	redraw()
textSchemeGreen = -> 
	if sidea.scheme? and sidea.scheme is GREEN then delete sidea.scheme
	else sidea.scheme = GREEN
	redraw()
textSchemeYellow = -> 
	if sidea.scheme? and sidea.scheme is YELLOW then delete sidea.scheme
	else sidea.scheme = YELLOW
	redraw()
textSchemeRed = -> 
	if sidea.scheme? and sidea.scheme is RED then delete sidea.scheme
	else sidea.scheme = RED
	redraw()
textSchemeBlack = -> 
	if sidea.scheme? and sidea.scheme is BLACK then delete sidea.scheme
	else sidea.scheme = BLACK
	redraw()

textChildrenLeft = -> 
	if (sidea.childrenchildrenalign and sidea.childrenalign isnt LEFT) or (not sidea.childrenalign?) then sidea.childrenalign = LEFT
	else delete sidea.childrenalign
	redraw()

textChildrenCenter = -> 
	if (sidea.childrenalign? and sidea.childrenalign isnt CENTER) or (not sidea.childrenalign?) then sidea.childrenalign = CENTER
	else delete sidea.childrenalign
	redraw()

textChildrenRight = -> 
	if (not sidea.childrenalign?) or (sidea.childrenalign? and (sidea.childrenalign isnt RIGHT)) then sidea.childrenalign = RIGHT
	else delete sidea.childrenalign
	redraw()

textChildrenJustify = -> 
	if (sidea.childrenalign? and sidea.childrenalign isnt JUSTIFY) or (not sidea.childrenalign?) then sidea.childrenalign = JUSTIFY
	else delete sidea.childrenalign
	redraw()

