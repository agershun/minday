################################################
# MINDAY 0.010SPb
# pyramid.coffee
# Процедуры обработки пирамиды (рисование и клавиши)
################################################

canvastype[PYRAMID] =-> ACTIVE
keyp[PYRAMID] = {}
keyp[LAYER] = {}
childkind[PYRAMID] =-> LAYER
childkind[LAYER] =-> IDEA

Idea::kindPyramid = ->
	@kind = PYRAMID
	for ia in @data
		ia.kind = LAYER

cvv[PYRAMID] =->
	v[@id] = {}
	maxh = 0
	for ia in @data
		v[ia.id] = {}
		v[ia.id].w = $("#bag"+ia.id).outerWidth(true)
		v[ia.id].h = $("#bag"+ia.id).outerHeight(true)
		# TODO: Сделать пирамиду в зависимости от высоты лейеров
		maxh = Math.max(maxh,v[ia.id].h)

	v[@id].h = maxh*(@length+2)
	v[@id].w = v[@id].h*Math.SQRT2
	v[@id].x = v[@id].w/2
	v[@id].y = v[@id].h/2
	$cvv = $("#cvv"+@id)
	$cvv.attr "height",v[@id].h
	$cvv.attr "width",v[@id].w
	v[@id].ctx = $cvv[0].getContext("2d")

	for ia in @data
#		v[ia.id] = {}
		v[ia.id].ctx = v[@id].ctx
		v[ia.id].scheme = [WHITE,BLUE,LIGHTBLUE,GREEN,YELLOW,RED,BLACK][ia.ix % @length]
		ia.ssshape(v[@id].x,v[@id].y,v[@id].w,v[@id].h)
		$("#bag"+ia.id).css "position","absolute"
		$("#bag"+ia.id).css "left",v[@id].x-v[ia.id].w/2
		$("#bag"+ia.id).css "top",v[@id].y-v[@id].h/2+v[@id].h/(@length+2)*(ia.ix+1.5)-v[ia.id].h/2


#
# Для пирамиды. Слои рисуются в зависимости от их номера в пирамиде
#
ssshape[LAYER] = (x,y,w,h) ->
	ctx = v[@id].ctx
	if @ix is 0
		ctx.beginPath()
		ctx.moveTo x,y-h/2
		ctx.lineTo x-w/(@pa.length+2),y-h/2+h/(@pa.length+2)*2
		ctx.lineTo x+w/(@pa.length+2),y-h/2+h/(@pa.length+2)*2
		ctx.closePath()
	else 
		ctx.beginPath()
		ctx.moveTo x-w/2*(@ix+1)/(@pa.length+2),y-h/2+h/(@pa.length+2)*(@ix+1)
		ctx.lineTo x+w/2*(@ix+1)/(@pa.length+2),y-h/2+h/(@pa.length+2)*(@ix+1)
		ctx.lineTo x+w/2*(@ix+2)/(@pa.length+2),y-h/2+h/(@pa.length+2)*(@ix+2)
		ctx.lineTo x-w/2*(@ix+2)/(@pa.length+2),y-h/2+h/(@pa.length+2)*(@ix+2)
		ctx.closePath()
	@strokefill(x,y,w,h)




