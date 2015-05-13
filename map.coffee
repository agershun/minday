################################################
# MINDAY 0.009Tu 
# map.coffee
# Процедуры для работы с стратегическими картами
################################################


shape[NODE] = (x,y,w,h) ->
	rad = 5
	s = "M #{x},#{y}
		m #{-w/2} #{-h/2+rad} 
		a #{rad} #{rad} 0 0 1  #{rad} #{-rad} h #{w-2*rad}
		a #{rad} #{rad} 0 0 1  #{rad} #{rad} v #{h-2*rad} 
		a #{rad} #{rad} 0 0 1  #{-rad} #{rad} h #{-w+2*rad} 
		a #{rad} #{rad} 0 0 1  #{-rad} #{-rad} v #{-h+2*rad} z"

shape[GROUP] = (x,y,w,h) -> ""
shape[HLANE] = (x,y,w,h) -> ""


svg[MAP] = (level) ->
	ppr[@id] = Raphael "pap"+@id,$("#map"+@id).width(),$("#map"+@id).height()
	# Вместо bag-100 - map-100

	# Считаем дочерние элементы
	if not @frame?
		for ia in @data
			switch ia.kind 
				when NODE,HLANE,GROUP
					ia.mapxy(ppr[@id],@id) # Устанавливаем бумагу и рисуем дочерние элементы


	# Рисуем дочерние элементы
	if not @frame?
		for ia in @data
			switch ia.kind 
				when NODE,HLANE,GROUP
					ia.mapdraw() # Устанавливаем бумагу и рисуем дочерние элементы

Idea::mapxy = (ppr,pprId) ->
	v[@id] = {}
	v[@id].ppr = ppr
	v[@id].pprId = pprId
	v[@id].ww = $("#bag"+@id).outerWidth(true)
	v[@id].hh = $("#bag"+@id).outerHeight(true)
	v[@id].w = $("#bag"+@id).outerWidth(false)
	v[@id].h = $("#bag"+@id).outerHeight(false)
	v[@id].x = $("#bag"+@id).position().left+v[@id].ww/2
	v[@id].y = $("#bag"+@id).position().top+v[@id].hh/2

	# Считаем дочерние элементы
	if not @frame?
		for ia in @data
			switch ia.kind 
				when NODE,HLANE,GROUP
					ia.mapxy(ppr,@id) # Устанавливаем бумагу и рисуем дочерние элементы


Idea::mapdraw = (ppr,pprId) ->
	if g[@id]? 
		# Пока ничего непонятно
		# TODO: Сделать так, чтобы не надо было все перерисовывать
	else
		g[@id] = v[@id].ppr.path @shape(v[@id].x,v[@id].y,v[@id].w,v[@id].h)
		g[@id].attr
			"stroke":"#888"
			"stroke-opacity": 0.5
			"stroke-width":1
			"fill":"90-#FF9-#FFE"
			"fill-opacity": 1
		g[@id].data("id",@id)
		g[@id].click ideaClick

	# Рисуем аксоны
	if not @frame? and @axon? and @axon.length > 0
		for ia in @axon.data
			# Ищем самые ближайшие точки
			tlen1 = g[@id].getTotalLength()
			tlen2 = g[ia.id].getTotalLength()
			l1 = 10000
			l2 = 10000
			for i in [0..7]
				p1 = g[@id].getPointAtLength(tlen1/8*i)
				p2 = g[ia.id].getPointAtLength(tlen2/8*i)
				ll1 = Math.sqrt(Math.pow(p1.x-v[ia.id].x,2)+Math.pow(p1.y-v[ia.id].y,2))
				ll2 = Math.sqrt(Math.pow(v[@id].x-p2.x,2)+Math.pow(v[@id].y-p2.y,2))
				if ll1 < l1
					pp1 = p1
					l1 = ll1
				if ll2 < l2 
					pp2 = p2
					l2 = ll2

			as = "M #{v[@id].x} #{v[@id].y-v[@id].h/2} L #{v[ia.id].x} #{v[ia.id].y+v[ia.id].h/2}"
			g[@id+"a"+ia.id] = v[@id].ppr.path as
			g[@id+"a"+ia.id].attr
				"stroke-width":4
				"arrow-end":"classic"
				"stroke":"#888"

	# Рисуем дочерние элементы
	if not @frame?
		for ia in @data
			switch ia.kind 
				when NODE,HLANE,GROUP
					ia.mapdraw(ppr,@id) # Устанавливаем бумагу и рисуем дочерние элементы

draw[MAP] = (level) ->
	s = @startIdeaTxt(level)
	if (level is 0) or (level > 0 and not @frame?)

		svga.push @ # Сохраняем текущий элемент для прорисовки
		s += "<div style='position:relative'>"
		s += "<div id='pap"+@id+"'  style='position:absolute;top:0px;left:0px'>"
		s += "</div>"	#Paper
		# Обратите внимание на стиль mapbag^^^
		s += "<div id='map"+@id+"'  class='mapbag' style='position:absolute;top:0px;left:0px'>"
		if @data.length > 0
			for ia in @data
				if ia.kind is NODE
					s += ia.drawNode(level+1)
				if ia.kind is HLANE
					s += ia.drawHLane(level+1)
				if ia.kind is GROUP
					s += ia.drawGroup(level+1)
		s += "</div>" # Map
		s += "</div>" # Outer Map
		
	s += @endIdeaTxt()
	s

Idea::drawHLane = (level) ->
	s = ""
	s += "<div id='bag"+@id+"' class='"
	s += " hlanebag'>"

	s += "<div class='idea-txt"+level
	s += " hlanetxt"
	s += "'>"
	if @frame 
		if @ is fidea then s += "<span id='frm"+@id+"' class='frame'>&#x25B3;</span>"
		else s += "<span id='frm"+@id+"' class='frame'>&#x25BD;</span>"
	s += "<span id='txt"+@id+"'>"
	s += @txt if @txt?
	s += "&nbsp;" if @txt is ""
	s += "</span>"
	s += "</div>" 

	s += "<div class='hlanechild'>"
	if @data.length > 0
		for ia in @data
			if ia.kind is NODE
				s += ia.drawNode(level+1)
			else if ia.kind is HLANE
				s += ia.drawHLane(level+1)
			else if ia.kind is GROUP
				s += ia.drawGroup(level+1)
	s += "</div>"
	s += "</div>" # Важно - дивы вкладываются, так как позиционирование отдаем HTML
	s


Idea::drawNode = (level) ->
	s = ""
	s += "<div id='bag"+@id+"' class='"
	s += " nodebag'>"
	s += "<div class='idea-txt"+level
	s += " nodetxt"
	s += "'>"
	if @frame 
		if @ is fidea then s += "<span id='frm"+@id+"' class='frame'>&#x25B3;</span>"
		else s += "<span id='frm"+@id+"' class='frame'>&#x25BD;</span>"
	s += "<span id='txt"+@id+"'>"
	s += @txt if @txt?
	s += "&nbsp;" if @txt is ""
	s += "</span>"
	s += "</div>" 

	if @data.length > 0
		for ia in @data
			if ia.kind is NODE
				s += ia.drawNode(level+1)
	s += "</div>" # Важно - дивы вкладываются, так как позиционирование отдаем HTML
	s += "<br/>" if @lastnode?
	s

Idea::drawGroup = (level) ->
	s = ""
	s += "<div id='bag"+@id+"' class='"
	s += " groupbag'>"
	s += "<div class='idea-txt"+level
	s += " grouptxt"
	s += "'>"
	if @frame 
		if @ is fidea then s += "<span id='frm"+@id+"' class='frame'>&#x25B3;</span>"
		else s += "<span id='frm"+@id+"' class='frame'>&#x25BD;</span>"
	s += "<span id='txt"+@id+"'>"
	s += @txt if @txt?
	s += "&nbsp;" if @txt is ""
	s += "</span>"
	s += "</div>" 

	if @data.length > 0
		for ia in @data
			if ia.kind is NODE
				s += ia.drawNode(level+1)
			else if ia.kind is GROUP
				s += ia.drawGroup(level+1)
	s += "</div>" # Важно - дивы вкладываются, так как позиционирование отдаем HTML
	s

childkind[MAP] =-> HLANE
childkind[HLANE] =-> NODE
childkind[GROUP] =-> NODE
childkind[NODE] =-> NODE

