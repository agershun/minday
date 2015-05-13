################################################
# MINDAY 0.009 Ly
# circle.coffee
# Процедуры для работы с круглыми сегментами
################################################

canvastype[PIE] =-> ACTIVE

keyp[PIE] = {}
keyp[PIEPART] = {}

childkind[PIE] =-> PIEPART
childkind[PIEPART] =-> IDEA

# TODO Разобраться, почему не работает?
afterinsert[PIE] =->
	@pa.kindPie()

Idea::kindPie = ->
	@kind = PIE
	for ia,i in @data
		ia.pa = @
		ia.ix = i
		ia.kind = PIEPART
		unless ia.val? then ia.val = 0.1

draw[PIE] = (level) ->
	s = @startIdeaTxt(level)
	# TODO Надписи стоит делать как html или SVG?
	for ia in @data
		s += ia.draw(level+1)
	s += @endIdeaTxt(level)

paint[PIE] = (level,ppr) ->
#	ppr[@id] = Raphael "pap"+@id,400,400
#	g[@id] = ppr[@id].path shape[OVAL](200,200,350,350)
#	g[@id].attr
#		"stroke":"#888"
#		"stroke-opacity": 0.5
#		"stroke-width":1
#		"fill":"90-#FF9-#FFE"
#		"fill-opacity": 1
	ppr.setSize(400,400)	
	v[@id] = {}
	v[@id].x = 200
	v[@id].y = 200
	start = 0
	for ia,i in @data
		ia.paintPiePart(i,start,ia.val,ppr)
		start += ia.val

Idea::paintPiePart = (n,start,value,ppr) ->
	alpha = start*2*Math.PI
	beta = (start+value)*2*Math.PI
	gamma = (start+value/2)*2*Math.PI

	$("#bag"+@id).addClass "mindbag"
	v[@id] = {}
	v[@id].w = $("#bag"+@id).outerWidth(true)
	v[@id].h = $("#bag"+@id).outerHeight(true)

	console.log  v[@id].w,v[@id].h

	x1 = v[@pa.id].x + 175 * Math.sin(alpha)
	y1 = v[@pa.id].y - 175 * Math.cos(alpha)
	x2 = v[@pa.id].x + 175 * Math.sin(beta)
	y2 = v[@pa.id].y - 175 * Math.cos(beta)

	as = "M #{v[@pa.id].x} #{v[@pa.id].y}
		L #{x1} #{y1}
		A 175 175 0 0 1 #{x2} #{y2} z"
	g[@id] = ppr.path as
	g[@id].attr
		"stroke":"#888"
		"stroke-opacity": 0.5
		"stroke-width":1
		"fill":"90-#FF9-#FFE"
		"fill-opacity": 1

	$("#bag"+@id).css "position","absolute"
	$("#bag"+@id).css "left",(v[@pa.id].x+100*Math.sin(gamma)-v[@id].w/2)
	$("#bag"+@id).css "top",(v[@pa.id].y-100*Math.cos(gamma)-v[@id].h/2)




