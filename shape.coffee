################################################
# MINDAY 0.009 Lykia
# shape.coffee
# Процедуры для работы с фигурами
################################################

shapes = []
margins = {}
paddings = {}

Idea::margin = ->
	if @forma? and margins[@forma]? then return margins[@forma].call(@) 
	else 
		unless @place? then return	"5px"
		else if @place is TBL then return "0px"
		else if @place is BAG then return "5px"
		else if @place is TXT then return "10px"
		else return "5px"

Idea::padding = -> return if @forma? and paddings[@forma]? then paddings[@forma].call(@) else "10px"

shapes.push BUTTON
ssshape[BUTTON] = (x,y,w,h) -> return

shapes.push PANEL
ssshape[PANEL] = (x,y,w,h) -> return

shapes.push CSSOVAL
ssshape[CSSOVAL] = (x,y,w,h) -> return


# Служебная рисовальная процедура
Idea::strokefill = (x,y,w,h) ->
	ctx = v[@id].ctx
	sch = if v[@id].scheme? then schemes[v[@id].scheme] else schemes[WHITE]
	gc = ctx.createLinearGradient(0,y-h/2,0,y+h/2)
	gc.addColorStop(0,sch[1])
	gc.addColorStop(1,sch[2])
	ctx.fillStyle = gc
	ctx.strokeStyle = sch[2]
	ctx.lineWidth = 1
	ctx.fill()
	ctx.stroke()

shapes.push RRECT
ssshape[RRECT] = (x,y,w,h) ->
	rad = 10
	ctx = v[@id].ctx
	ctx.beginPath()
	ctx.moveTo x-w/2+rad,y-h/2
	ctx.lineTo x+w/2-rad,y-h/2
	ctx.arcTo x+w/2,y-h/2,x+w/2,y-h/2+rad,rad
	ctx.lineTo x+w/2,y+h/2-rad
	ctx.arcTo x+w/2,y+h/2,x+w/2-rad,y+h/2,rad
	ctx.lineTo x-w/2+rad,y+h/2
	ctx.arcTo x-w/2,y+h/2,x-w/2,y+h/2-rad,rad
	ctx.lineTo x-w/2,y-h/2+rad
	ctx.arcTo x-w/2,y-h/2,x-w/2+rad,y-h/2,rad
	ctx.closePath()
	@strokefill(x,y,w,h)


shapes.push RECT
ssshape[RECT] = (x,y,w,h) ->
	ctx = v[@id].ctx
	ctx.beginPath()
	ctx.moveTo x-w/2,y-h/2
	ctx.lineTo x+w/2,y-h/2
	ctx.lineTo x+w/2,y+h/2
	ctx.lineTo x-w/2,y+h/2
	ctx.closePath()
	@strokefill(x,y,w,h)


shapes.push OVAL
ssshape[OVAL] = (x,y,w,h) ->
	kappa = 0.5522848
	cx = w/2*kappa
	cy = h/2*kappa
	xb = x-w/2
	yb = y-h/2
	xe = x+w/2
	ye = y+h/2

	ctx = v[@id].ctx
	ctx.beginPath()
	ctx.moveTo xb,y
	ctx.bezierCurveTo xb,y-cy,x-cx,yb,x,yb
	ctx.bezierCurveTo x+cx,yb,xe,y-cy,xe,y
	ctx.bezierCurveTo xe,y+cy,x+cx,ye,x,ye
	ctx.bezierCurveTo x-cx,ye,xb,y+cy,xb,y

	ctx.closePath()
	@strokefill(x,y,w,h)

shapes.push CIRCLE
ssshape[CIRCLE] = (x,y,w,h) ->
	r = Math.min(w,h)/2
	ctx = v[@id].ctx
	ctx.beginPath()
	ctx.arc x,y,r,0,2*Math.PI
	ctx.closePath()
	@strokefill(x,y,w,h)

shapes.push AARROW
ssshape[AARROW] = (x,y,w,h) ->
	rad = 5
	ctx = v[@id].ctx
	ctx.beginPath()
	ctx.moveTo x-w/2,y-h/2
	ctx.lineTo x+w/2-rad,y-h/2
	ctx.lineTo x+w/2+rad,y
	ctx.lineTo x+w/2-rad,y+h/2
	ctx.lineTo x-w/2,y+h/2
	ctx.closePath()
	@strokefill(x,y,w,h)


shapes.push BARROW
ssshape[BARROW] = (x,y,w,h) ->
	rad = 5
	ctx = v[@id].ctx
	ctx.beginPath()
	ctx.moveTo x-w/2-rad,y-h/2
	ctx.lineTo x+w/2-rad,y-h/2
	ctx.lineTo x+w/2+rad,y
	ctx.lineTo x+w/2-rad,y+h/2
	ctx.lineTo x-w/2-rad,y+h/2
	ctx.lineTo x-w/2+rad,y
	ctx.closePath()
	@strokefill(x,y,w,h)


shapes.push CARROW
margins[CARROW] =-> return (if @ix is 0 then margins[AARROW].call(@) else margins[BARROW].call(@))
paddings[CARROW] =-> return (if @ix is 0 then paddings[AARROW].call(@) else paddings[BARROW].call(@))
ssshape[CARROW] = (x,y,w,h) ->
	if @ix is 0 
		return ssshape[AARROW].call(@,x,y,w,h)
	else
		return ssshape[BARROW].call(@,x,y,w,h)

