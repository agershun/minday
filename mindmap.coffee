################################################
# MINDAY 0.010 Tokyo
# mindmap.coffee
# Процедуры для рисования интеллектуальных карт
################################################

#=============================
# 1. ОСНОВНЫЕ ПАРАМЕТРЫ 
#=============================
# Инициализируем массив клавиш
canvastype[MINDMAP] =-> ACTIVE # Активная канва, то есть размер задается рисунком

childkind[MINDMAP] =-> MINDLEAF
childsd[MINDMAP] =-> OUTSIDE
childkind[MINDLEAF] =-> MINDLEAF
childsd[MINDLEAF] =-> OUTSIDE

keyp[MINDMAP] = {}
keyp[MINDLEAF] = {}

#============================
# 2. KIND
#============================
# Устанавливаем типы данных для интеллектуальной карты
Idea::kindMindmap = ->
	@kind = MINDMAP
	@kindMindleaf()

Idea::kindMindleaf = ->
	if @[OUTSIDE]?
		for ia in @[OUTSIDE]
			ia.kind = MINDLEAF
			ia.kindMindleaf()

#============================
# 3. SHAPES
#============================

# Сделаем все RRECT

ssshape[MINDMAP] = (x,y,w,h) ->
	frm = if @forma? then @forma else RRECT
	ssshape[frm].call(@,x,y,w,h)

ssshape[MINDLEAF] = ssshape[MINDMAP]

#============================
# 4. SVG и PAINT
#============================

cvv[MINDMAP] = (level) ->
	mms = @[OUTSIDE][0]
#	mms = @

	mms.mmsethw(0) # Устанавливаем высоты/ширины и задаем бумагу
	mms.mmsetlr()
	mms.mmsetxy()

	$cvv = $("#cvv"+@id)
	$cvv.attr "width",v[mms.id].ww
	$cvv.attr "height",v[mms.id].hh

#	$("#bag"+@pa.id).css "width",v[mms.id].ww
#	console.log @pa.id

#	$pap = $("#pap"+@id)
#	$pap.css "width",v[mms.id].ww
#	$pap.css "height",v[mms.id].hh

	ctx = $cvv[0].getContext("2d")

	mms.mmdraw(ctx)

# Определяем высоту и ширину
Idea::mmsethw = (lvl) ->
	v[@id] = {}
	v[@id].lvl = lvl

	v[@id].w = $("#bag"+@id).outerWidth(true)
	v[@id].h = $("#bag"+@id).outerHeight(true)
	v[@id].ww = v[@id].w
	v[@id].hh = -DH
	if not @frame? and @[OUTSIDE]?
		for ia in @[OUTSIDE]
			if ia.kind is MINDLEAF
				ia.mmsethw(lvl+1)
				v[@id].ww = Math.max(v[@id].ww,v[@id].w+DW+v[ia.id].ww)
				v[@id].hh += v[ia.id].hh + DH
	v[@id].hh = Math.max(v[@id].h,v[@id].hh)

Idea::mmsetlr = ->
	if v[@id].lvl is 0 
		v[@id].lr = CENTER
		if not @frame?
			v[@id].hhr = 0
			v[@id].hhl = 0
			flag = yes
			if @[OUTSIDE]?
				for ia,i in @[OUTSIDE]
					if ia.kind is MINDLEAF
						if flag and (((v[@id].hhr + v[ia.id].hh <= v[@id].hh/2) and not (i is @[OUTSIDE].length-1)) or (i is 0 and @[OUTSIDE].length is 1))
							v[ia.id].lr = RIGHT
							v[@id].hhr += v[ia.id].hh
						else
							flag = no
							v[ia.id].lr = LEFT
							v[@id].hhl += v[ia.id].hh
					
				for ia in @[OUTSIDE]
					if ia.kind is MINDLEAF
						ia.mmsetlr()

			v[@id].hhr = 0
			v[@id].hhl = 0
			if @[OUTSIDE]?
				for ia in @[OUTSIDE]
					if ia.kind is MINDLEAF
						if v[ia.id].lr is RIGHT
							v[@id].hhr += v[ia.id].hh + DH
						else
							v[@id].hhl += v[ia.id].hh + DH

			if v[@id].hhr > 0 then v[@id].hhr -= DH
			if v[@id].hhl > 0 then v[@id].hhl -= DH

		# Устанавливаем наконец hh и ww верхнего элемента
		v[@id].hh = Math.max(v[@id].h,v[@id].hhl,v[@id].hhr)+DH
		v[@id].wwl = 0
		v[@id].wwr = 0
		if @[OUTSIDE]?
			for ia in @[OUTSIDE]
				if ia.kind is MINDLEAF
					if v[ia.id].lr is LEFT then v[@id].wwl = Math.max(v[@id].wwl,v[ia.id].ww)
					if v[ia.id].lr is RIGHT then v[@id].wwr = Math.max(v[@id].wwr,v[ia.id].ww)

		v[@id].ww = v[@id].wwl + v[@id].w + v[@id].wwr + 3*DW

	else
		if @[OUTSIDE]?
			for ia in @[OUTSIDE]
				if ia.kind is MINDLEAF
					v[ia.id].lr = v[@id].lr
					ia.mmsetlr()

Idea::mmsetxy = ->
		if v[@id].lvl is 0
			v[@id].x = v[@id].wwl + v[@id].w/2 + 3/2*DW
			v[@id].y = v[@id].hh / 2

			if not @frame?
				yyr = v[@id].y - v[@id].hhr/2
				yyl = v[@id].y - v[@id].hhl/2
				if @[OUTSIDE]?
					for ia in @[OUTSIDE]
						if ia.kind is MINDLEAF
							if v[ia.id].lr is RIGHT
								v[ia.id].x = v[@id].x+v[@id].w/2+v[ia.id].w/2+DW
								v[ia.id].y = yyr+v[ia.id].hh/2
								yyr += v[ia.id].hh+DH
							else 
								v[ia.id].x = v[@id].x-v[@id].w/2-v[ia.id].w/2-DW
								v[ia.id].y = yyl+v[ia.id].hh/2
								yyl += v[ia.id].hh+DH
							ia.mmsetxy()

		else # if @lvl >= 1
			yy = v[@id].y - v[@id].hh/2
			if @[OUTSIDE]?
				for ia in @[OUTSIDE]
					if ia.kind is MINDLEAF
						if v[@id].lr is RIGHT
							v[ia.id].x = v[@id].x+v[@id].w/2+v[ia.id].w/2+DW
						else
							v[ia.id].x = v[@id].x-v[@id].w/2-v[ia.id].w/2-DW
						v[ia.id].y = yy+v[ia.id].hh/2
						yy += v[ia.id].hh+DH
						ia.mmsetxy()

Idea::mmdraw = (ctx) ->
#	$("#bag"+@id).attr "align", "center"

	v[@id].ctx = ctx
	v[@id].scheme = if @scheme? then @scheme else WHITE

	@ssshape(v[@id].x,v[@id].y,v[@id].w,v[@id].h)

	$("#bag"+@id).css "position","absolute"
	$("#bag"+@id).css "top",v[@id].y-v[@id].h/2
	$("#bag"+@id).css "left",v[@id].x-v[@id].w/2

	sch = v[@id].scheme

	if v[@id].lvl > 0
		if v[@id].lr is RIGHT
			rx = v[@pa.id].x + v[@pa.id].w/2
			ry = v[@pa.id].y
			lx = v[@id].x - v[@id].w/2
			ly = v[@id].y

			ctx.beginPath()
			ctx.moveTo rx,ry-3
			ctx.bezierCurveTo (lx+rx)/2,ry-3,(lx+rx)/2,ly,lx,ly
			ctx.bezierCurveTo (lx+rx)/2,ly,(lx+rx)/2,ry+3,rx,ry+3
			ctx.closePath()
			ctx.fillStyle = sch[1]
			ctx.strokeStyle = sch[3]
			ctx.lineWidth = 1
			ctx.fill()
			ctx.stroke()
		else
			rx = v[@pa.id].x - v[@pa.id].w/2
			ry = v[@pa.id].y
			lx = v[@id].x + v[@id].w/2
			ly = v[@id].y

			as = "M #{rx},#{ry-3} 
			C #{(lx+rx)/2},#{ry-3} #{(lx+rx)/2},#{ly} #{lx},#{ly}
			C #{(lx+rx)/2},#{ly} #{(lx+rx)/2},#{ry+3} #{rx},#{ry+3} 
			z"

			ctx.beginPath()
			ctx.moveTo rx,ry-3
			ctx.bezierCurveTo (lx+rx)/2,ry-3,(lx+rx)/2,ly,lx,ly
			ctx.bezierCurveTo (lx+rx)/2,ly,(lx+rx)/2,ry+3,rx,ry+3
			ctx.closePath()
			ctx.fillStyle = sch[1]
			ctx.strokeStyle = sch[3]
			ctx.lineWidth = 1
			ctx.fill()
			ctx.stroke()

	if @[OUTSIDE]?
		for ia,i in @[OUTSIDE]
			if ia.kind is MINDLEAF
				ia.mmdraw(ctx)

#############################
# 5. DRAW
#############################

#draw[MINDMAP] = (level) ->
#	s = @startIdeaTxt(level)
#	s = @startIdeaTxt(level)

#	if @notFrame(level)
#		svga.push @ # Сохраняем текущий элемент для прорисовки
#		s += "<div id='pap"+@id+"' class='ppr' style='position:relative'>"

#	if @notFrame(level)
#		if @length is 1
#			s += @[0].htmlMindleaf(level+1)
	# TODO: Надо придумать, что делать, если корней несколько

#		s += "</div>"	#Paper
#	s += @endIdeaTxt()
#	s

Idea::htmlMindleaf = (level) ->
	###
	s = ""
	s += "<div id='bag"+@id+"' class='"
	s += " mindbag'>"
	s += "<div class='idea-txt"+level
	s += " mindleaf"
	s += "'>"
	if @frame 
		if @ is fidea then s += "<span id='frm"+@id+"' class='frame'>&#x25B3;</span>"
		else s += "<span id='frm"+@id+"' class='frame'>&#x25BD;</span>"
	s += "<span id='txt"+@id+"'>"
	s += @txt if @txt?
	s += "&nbsp;" if @txt is ""
	s += "</span>"
	s += "</div>" 
	s += "</div>" # Важно - дивы не вкладываются, чтобы было можно их свободно перемещать и позиционировать

	###

	s = @simpleIdeaTxt(level)

#	if @data.length > 0
#		for ia in @data
#			if ia.kind is MINDLEAF
#				s += ia.htmlMindleaf(level+1)
	s

#############################
# 6. NAVIGATOR
#############################

keyp[MINDMAP][KEY_DOWN] = (eo) ->
	if @[OUTSIDE]?[0]? then return @[OUTSIDE][0].select()
	else return keyp[DEFAULT][KEY_DOWN].call(@,arguments)

keyp[MINDLEAF][KEY_DOWN] = (eo) ->
	if @[0]?[0]? then return @[0][0].select()
	if v[@id]? and v[@id].lr is CENTER then return @pa.downnext().select()
	if @pa?
		if @ix < @pa[OUTSIDE].length-1 then return @pa[OUTSIDE][@ix+1].select()
		else if @pa.pa[OUTSIDE]?[@pa.ix+1]?[OUTSIDE]?[0]? then return @pa.pa[OUTSIDE][@pa.ix+1][OUTSIDE][0].select()
		else if @pa.pa[OUTSIDE]?[@pa.ix+1]? then return @pa.pa[OUTSIDE][@pa.ix+1].select()
		else return @pa.downnext().select()
	@

downnext[MINDLEAF] = ->
	if @ is fidea then return null
	if @pa?
		if @ix < @pa[OUTSIDE].length-1
			return @pa[OUTSIDE][@ix+1]
		else
			return @pa.downnext()
	@


keyp[MINDLEAF][KEY_UP] = (eo) ->
	if @lvl is 0 then return @pa.select()
	else if @pa[OUTSIDE][@ix-1]? then return @pa[OUTSIDE][@ix-1].select()
	# Добавить случай когда ветка выше

	if v[@id]? and v[@id].lr is CENTER
		return @pa.select()
	if @pa?
		if @ix > 0
			return @pa[OUTSIDE][@ix-1].select()
		else
			if @pa.pa[OUTSIDE]?[@pa.ix-1]?[OUTSIDE]?[@pa.pa[@pa.ix-1].length-1]? then return @pa.pa[OUTSIDE][@pa.ix-1][OUTSIDE][@pa.pa[@pa.ix-1].length-1].select()
			else if @pa.pa[OUTSIDE][@pa.ix-1]? then return @pa.pa[OUTSIDE][@pa.ix-1].select()
			else return @pa.select()
	@


keyp[MINDLEAF][KEY_LEFT] = (eo) ->
	if v[@id]?
		if v[@id].lr is LEFT 
			if @[OUTSIDE]? and @[OUTSIDE].length > 0 then return @[OUTSIDE][0].select()
			else 
				#TODO - сделать движение налево правильным
				@pa.leftnext().select()

		else if v[@id].lr is RIGHT 
			return @pa.select()
		else if v[@id].lr is CENTER
			for i in [0..@[OUTSIDE].length-1]
				if v[@[OUTSIDE][i].id].lr is LEFT
					return @[OUTSIDE][i].select()
	@


keyp[MINDLEAF][KEY_RIGHT] = (eo) ->
	if v[@id]?
		if v[@id].lr is RIGHT or v[@id].lr is CENTER
			if @[OUTSIDE]? and @[OUTSIDE].length > 0 then return @[OUTSIDE][0].select()
			else @pa.rightnext().select()
		else if v[@id].lr is LEFT 
			return @pa.select()
	@


keyp[MINDLEAF][KEY_ENTER] =->
	if @frame?
		if @ is fidea
			@upperFrame().fhtml(@)
		else
			@fhtml()	
	else if v[@id]? and v[@id].lr is CENTER
		ia = @add OUTSIDE,"&nbsp;",kind:MINDLEAF
		fidea.fhtml(ia)
	else
		ia = @pa.add OUTSIDE,"&nbsp;",kind:MINDLEAF
		fidea.fhtml(ia)

keyp[MINDLEAF][ALT+KEY_LEFT] =->
keyp[MINDLEAF][ALT+KEY_RIGHT] =->


keyp[MINDLEAF][ALT+KEY_UP] =->
	if @ isnt fidea
		if @pa[@sd][@ix-1]? 
			ia = @
			sd = @sd
			pa = @pa
			ix = @ix
			pa[sd].splice(ix,1)
			pa[sd].splice(ix-1,0,ia)
			pa.normalizeIdea()
			redraw(ia)

keyp[DEFAULT][ALT+KEY_DOWN] =->
	if @ isnt fidea
		if @pa[@sd][@ix+1]? 
			ia = @
			sd = @sd
			pa = @pa
			ix = @ix
			pa[sd].splice(ix,1)
			pa[sd].splice(ix+1,0,ia)
			pa.normalizeIdea()
			redraw(ia)


###
down[MINDLEAF] = ->

###
#	else 
#		keyp[DEFAULT][KEY_ENTER].call(@)


###
ctrlenter[MINDLEAF] = ->
	if v[@id]? and v[@id].lr is CENTER
		if @pa?.pa?
			return @pa.pa.addIdea(null,@pa.ix+1,@pa.ix+1,true)
	if @pa?
		sidea.pa.addIdea(sidea,sidea.ix+1,sidea.ix+1,true)



up[MINDLEAF] = ->



right[MINDLEAF] = ->

###

###
navi[MINDMAP] = (eo) ->
	if $txt.attr("contentEditable") is "true" then return navi[IDEA](eo)
	switch eo.which
		when 40 # Down
			if (sidea is fidea)
				if sidea[0]? then sidea[0].select()
			else
				if (not sidea.frame) and sidea[0]? then sidea[0].select()
				else
					sia = sidea 
					while sia isnt fidea and not (sia.pa[sia.ix+1]?)
						sia = sia.pa
					if sia isnt fidea then sia.pa[sia.ix+1].select()
		else navi[IDEA](eo)
###

