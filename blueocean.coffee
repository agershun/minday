################################################
# MINDAY 0.009 Ly
# gantt.coffee
# Процедуры для работы с диаграммой Гантта
################################################

keyp[BLUEOCEAN] = {}
keyp[OCEAN] = {}
keyp[CHAR] = {}
canvastype[BLUEOCEAN] =-> PASSIVE
childkind[BLUEOCEAN] =-> OCEAN
childkind[OCEAN] =-> IDEA
childkind[CHARS] =-> CHAR
childkind[CHAR] =-> IDEA

Idea::kindBlueOcean = ->
	@kind = BLUEOCEAN
	for ia,i in @data
		ia.pa = @
		ia.ix = i
		ia.kind = OCEAN

	@char.pa = @
	@char.ix = "char"
	@char.kind = CHARS

	for ia,i in @char.data
		ia.pa = @
		ia.ix = i
		ia.kind = CHAR


bocol = ["Red","Green","Blue","Yellow","Brown"] # TODO Сделать массив цветов

draw[BLUEOCEAN] = (level) ->

	s = @startIdeaTxt(level)
	if @notFrame(level)
		s += "<table id='tbl"+@id+"' class='normaltable'><thead><th>"
		if @char.length > 0
			for ia in @char.data
				if ia.kind is CHAR
					s += "<th id='tbl"+ia.id+"'>"
					s += ia.draw(level+1)

		s += "<tbody>"
		if @length > 0
			s += "<tr>"
			s += "<th id='tbl"+@[0].id+"' style='color:"+bocol[0]+";'>"+@[0].draw(level+1)
			s += "<td id='cnv"+@id+"' rowspan="+@length+" colspan="+@char.length+" >"
		if @length > 1
			for i in [1..@length-1]
				ia = @[i]
				if ia.kind is OCEAN
					s += "<tr><th id='tbl"+ia.id+"' style='color:"+bocol[i]+";'>"
					s += ia.draw(level+1)

	s += @endIdeaTxt(level)

# Теперь рисуем графику
cvv[BLUEOCEAN] =->
	v[@id] = {}
	v[@id].ww = $("#tbl"+@id).outerWidth(true)
	v[@id].hh = $("#tbl"+@id).outerHeight(true)
	v[@id].sw = $("#cnv"+@id).position().left
	v[@id].sh = $("#cnv"+@id).position().top
	v[@id].w = $("#cnv"+@id).outerWidth(true)
	v[@id].h = $("#cnv"+@id).outerHeight(true)

	$cvv = $("#cvv"+@id)
	$cvv.attr "height",v[@id].hh
	$cvv.attr "width",v[@id].ww
	v[@id].ctx = $cvv[0].getContext("2d")
#	console.log v[@id].ctx

	for ia in @data
		ia.paintOcean(v[@id].ctx)

Idea::paintOcean = (ctx) ->

	bocolor = bocol[@ix] # TODO Сделать массив цветов

#	console.log bocolor
	px = $("#tbl"+@id).outerWidth(true)
	py = $("#tbl"+@id).position().top+$("#tbl"+@id).outerHeight(true)/2

#	px = 0
#	py = 0

	for ca in @pa.char
		v[ca.id] = {}
		v[ca.id].ctx = ctx
		v[ca.id].x = $("#tbl"+ca.id).position().left+$("#tbl"+ca.id).outerWidth(true)/2
		v[ca.id].y = v[@pa.id].sh + v[@pa.id].h / (ca.length) * (@[ca.id]+0.5) - 10 # Поправка на размер кружка
		# TODO Сделать размер кружков константой
	
		x = v[ca.id].x
		y = v[ca.id].y
		r = 10
		ctx.beginPath()
		ctx.arc x,y,r,0,2*Math.PI
		ctx.closePath()
		ctx.fillStyle = bocolor
		ctx.fill()

		if px > 0
			# Теперь рисуем линию
			ctx.beginPath()
			ctx.moveTo(px,py)
			ctx.lineTo(v[ca.id].x,v[ca.id].y)
			ctx.strokeStyle = bocolor
			ctx.lineWidth = 4
			ctx.stroke()

#			as = "M #{px} #{py} L #{x} #{y}"
#			g[@id+"l"+ca.id] = ppr.path as
#			g[@id+"l"+ca.id].attr
#				"stroke": bocolor
#				"stroke-opacity": 0.5
#				"stroke-width":4
#				"fill":"90-#FF9-#FFE"
#				"fill-opacity": 1

		px = v[ca.id].x
		py = v[ca.id].y

	# Завершающая линия
#	x = $("#tbl"+@pa.id).outerWidth(true)
#	y = $("#tbl"+@id).position().top+$("#tbl"+@id).outerHeight(true)/2 - 10 # Попровка на размер
#	as = "M #{px} #{py} L #{x} #{y}"
#	g[@id+"l"+ca.id] = ppr.path as
#	g[@id+"l"+ca.id].attr
#		"stroke": bocolor
#		"stroke-opacity": 0.5
#		"stroke-width":4
#		"fill":"90-#FF9-#FFE"
#		"fill-opacity": 1

draw[OCEAN] = (level) -> @simpleIdeaTxt(level)
draw[CHAR] = (level) -> @simpleIdeaTxt(level)

#keyp[BLUEOCEAN][KEY_DOWN] =->
#	if @[0]? then return @[0].select()
#	@

