################################################
# MINDAY 0.009 Ly
# ishikawa.coffee
# Процедуры для работы с диаграммой Ишикава
################################################

#=============================
# 1. ОСНОВНЫЕ ПАРАМЕТРЫ 
#=============================

canvastype[ISHIKAWA] =-> ACTIVE

keyp[ISHIKAWA] = {}
keyp[BONE] = {}

childkind[ISHIKAWA] =-> BONE
childkind[BONE] =-> BONE

#============================
# 2. KIND
#============================

Idea::kindIshikawa = ->
	@kind = ISHIKAWA
	for ia,i in @data
		ia.pa = @
		ia.ix = i
		ia.kind = BONE
		ia.kindBone()

Idea::kindBone = ->
	if @length > 0
		for ia,i in @data
			if ia.kind is BONE
				ia.pa = @
				ia.ix = i
				ia.kind = BONE

#============================
# 3. SHAPES
#============================

# Голова
shape[BONE] = (x,y,w,h) -> shape[RRECT].call(@,x,y,w,h)
#shape[ISHIKAWA] = shape[RRECT]


#============================
# 4. SVG и PAINT
#============================

stdFill = (fig) ->
	fig.attr
		"stroke":"#888"
		"stroke-opacity": 0.5
		"stroke-width":1
		"fill":"90-#FF9-#FFE"
		"fill-opacity": 1

paint[ISHIKAWA] = (level,ppr) ->
	v[@id] = {}
	v[@id].ppr = ppr
	v[@id].w = 400
	v[@id].h = 400
	ppr.setSize v[@id].w,v[@id].h
	@[0].paintMainBone(ppr)

Idea::paintMainBone = (ppr) ->
	$("#bag"+@id).addClass "mindbag"
	v[@id] = {}
	v[@id].w = $("#bag"+@id).outerWidth(true)
	v[@id].h = $("#bag"+@id).outerHeight(true)
	v[@id].x = v[@id].w/2
	v[@id].y = v[@pa.id].h/2

	g[@id] = ppr.path @shape(v[@id].x,v[@id].y,v[@id].w,v[@id].h)
	stdFill(g[@id])
	$("#bag"+@id).css "position","absolute"
	$("#bag"+@id).css "left",v[@id].x-v[@id].w/2
	$("#bag"+@id).css "top",v[@id].y-v[@id].h/2

	as = "M #{v[@id].w} #{v[@id].y}
				H #{v[@pa.id].w }"
	g[@id+"b"] = ppr.path as
	stdFill(g[@id+"b"])


	for ia in @data
		ia.paintEvenBone(1,ppr)

Idea::paintEvenBone = (lvl,ppr) ->

	$("#bag"+@id).addClass "mindbag"
	v[@id] = {}
	v[@id].w = $("#bag"+@id).outerWidth(true)
	v[@id].h = $("#bag"+@id).outerHeight(true)
	v[@id].x = v[@pa.id].x + v[@pa.id].w/2 + 50*@ix + 50
	v[@id].y = v[@pa.id].y + 100*(@ix%2) - 50

	if @ix % 2 is 0
		$("#bag"+@id).css "-webkit-transform", "rotate(-45deg)"
	else 
		$("#bag"+@id).css "-webkit-transform", "rotate(+45deg)"
	
	$("#bag"+@id).css "position","absolute"
	$("#bag"+@id).css "left",v[@id].x-v[@id].w/2
	$("#bag"+@id).css "top",v[@id].y-v[@id].h/2

	x1 = v[@pa.id].x + v[@pa.id].w/2 + 50*@ix + 50
	x2 = x1 + 100
	y1 = v[@pa.id].y
	y2 = y1 + 200*(@ix%2) - 100

	as = "M #{x1} #{y1}
				L #{x2} #{y2}"

	g[@id+"b"] = ppr.path as
	stdFill(g[@id+"b"])


	for ia in @data
		ia.paintOddBone(lvl+1,ppr)

Idea::paintOddBone = (lvl,ppr) ->
	for ia in @data
		ia.paintOddBone(lvl+1,ppr)


#############################
# 5. DRAW
#############################

Idea::simpleIdeaTxtChildren = (level) ->
	s = @simpleIdeaTxt(level)
	for ia in @data
		s += ia.draw(level+1)
	s

draw[ISHIKAWA] = (level) ->
	s = @startIdeaTxt(level)
	for ia in @data
		s += ia.draw(level+1)
	s += @endIdeaTxt(level)
	s

draw[BONE] = (level) -> @simpleIdeaTxtChildren(level)

#############################
# 6. NAVIGATOR
#############################
