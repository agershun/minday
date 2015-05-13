################################################
# MINDAY 0.010 Tokyo 
# draw.coffee
# Вывод на экран - основная процедура
################################################

# Глобальные переменные

sidea = null 	# Текущая выбранная идея
fidea = null 	# Верхняя идея фрейма
ssidea = [] 	# Массив с выбранными идеями
							# TODO: Доделать работу с выделенными идеями

$txt = null		# Закэшированные часто используемые jquery элементы
$bag = null
$tbl = null
$tab = null		# Для TABS
$tbs = null		# TODO: Нужны ли эти элементы?

cvva = []			# Список элементов с канвой
ggg = {}			# Графические элементы. Нужны только для того, чтобы на них ссылаться? Возможно не нужны
v = {} 				# Параметры графических объектов
ctx = {}			# Контексты холстов
cvv = {}			# Холсты

notxt = {}		# Нужно ли показывать txt

# Специальная буферная строка для активной канвы
acss = []

shape = {}		# TODO: Убрать, как только будут переделаны другие элементы - это костыль
svg = {}
paint = {}

draw = {}			# Массив процедур с html-отрисовкой
ssshape = {}	# Фигуры для холста
pppaint = {}		# Массив для рисования canvas
canvastype = {} # Нужна ли для данного типа канва? По умолчанию - нет

lastFidea = null # Для кэширования последнего вызова
lastBackground = 0 # Для кэширования фона

# TODO: Разобраться с табло
tbx = {} # Это обратные ссылки на табло

clas = {} # Класс по умолчанию для элементов
drtxt = {} # Собственно текст

# Рисование фигуры по умолчанию
Idea::ssshape = (x,y,w,h) -> 
	if @kind? then ssshape[@kind].call(@,x,y,w,h) else ssshape[DEFAULT].call(@,x,y,w,h)

ssshape[DEFAULT] = (x,y,w,h) -> 
	if @forma?
		if ssshape[@forma]? then return ssshape[@forma].call(@,x,y,w,h)
		else return ssshape[RRECT].call(@,x,y,w,h)  # TODO: Переделать на RRECT
	null

Idea::draw = (level=0,drawshow) -> 
	if draw[@kind]? then draw[@kind].call(@,level,drawshow) else draw[DEFAULT].call(@,level,drawshow)

Idea::pppaint = (level=0,ctx) -> 
	if pppaint[@kind]? then pppaint[@kind].call(@,level,ctx) else pppaint[DEFAULT].call(@,level,ctx)

Idea::canvastype =-> 
	if canvastype[@kind]? then canvastype[@kind].call(@) else canvastype[DEFAULT].call(@)

canvastype[DEFAULT] =-> no 
#	if @kind is IDEA and @[OUTSIDE]? and @[OUTSIDE].length > 0 then NATIVE else no

# Вспомогательная процедура, чтобы не мучаться с call
# ia.htmlIdea() => стандартный вывод
# Используется для графических элементов
# TODO: Проверить, насколько она нужна?
Idea::drawIdea = (level=0) -> 
	draw[DEFAULT].call(@, level)

Idea::cvv = (level=0) -> 
	if cvv[@kind]? then cvv[@kind].call(@, level) else cvv[DEFAULT].call(@, level)

Idea::drtxt = (level=0) -> 
	if drtxt[@kind]? then drtxt[@kind].call(@, level) else drtxt[DEFAULT].call(@, level)

cvv[DEFAULT] = (level) ->
	$pap = $("#pap"+@id)
	$cvv = $("#cvv"+@id)
	$map = $("#map"+@id)

	if @canvas? and @canvas is CANVASJS 
		$pap.width $map.width()
		$pap.height $map.height()
		$cvv.attr "width",$map.width()
		$cvv.attr "height",$map.height()

		ctx[@id] = $cvv[0].getContext("2d")
		@pppaint(level,ctx[@id])
#	else if @canvastype() is NATIVE
#		$pap.width "200px"
#		$pap.height "200px"
#		@ppnpaint(level)

#Idea::ppnpaint = (level) ->
#	if level is 0
#		$("#bag"+@id).css "top","100px"
#		$("#bag"+@id).css "left","100px"
#	else
#		$("#bag"+@id).css "top",@ix*50+"px"
#		$("#bag"+@id).css "left",@ix*50+"px"

#	if @canvastype() is NATIVE
#		for ia in @[OUTSIDE]
#			ia.ppnpaint(level+1)

#	return

# Основная процедура графического рисования идеи
pppaint[DEFAULT] = (level,ctx) ->
	if @forma? 
		v[@id] = {}
		v[@id].ctx = ctx
		v[@id].scheme = if @scheme? then @scheme else WHITE


		if @place? and @place is TBL
			$tag = $("#tbl"+@id)
			v[@id].ww = $tag.outerWidth(true)
			v[@id].hh = $tag.outerHeight(true)
			v[@id].w = $tag.outerWidth(false)
			v[@id].h = $tag.outerHeight(false)
			v[@id].x = $tag.position().left+v[@id].ww/2
			v[@id].y = $tag.position().top+v[@id].hh/2
			@ssshape(v[@id].x,v[@id].y,v[@id].w,v[@id].h)
		else if @place? and  @place is TXT
			$tag = $("#txt"+@id)
			v[@id].ww = $tag.outerWidth(true)
			v[@id].hh = $tag.outerHeight(true)
			v[@id].w = $tag.outerWidth(false)+10
			v[@id].h = $tag.outerHeight(false)+10
			v[@id].x = $tag.position().left+v[@id].ww/2
			v[@id].y = $tag.position().top+v[@id].hh/2
			@ssshape(v[@id].x,v[@id].y,v[@id].w,v[@id].h)
		else
			$tag = $("#bag"+@id)
#				unless $tag.position()? then console.log @id, "is empty"
			v[@id].ww = $tag.outerWidth(true)
			v[@id].hh = $tag.outerHeight(true)
			v[@id].w = $tag.outerWidth(false)
			v[@id].h = $tag.outerHeight(false)
			v[@id].x = $tag.position().left+v[@id].ww/2
			v[@id].y = $tag.position().top+v[@id].hh/2
			@ssshape(v[@id].x,v[@id].y,v[@id].w,v[@id].h)


	if @notFrame(level)
		for aa in @data
			for ia in aa
				ia.pppaint(level+1,ctx) 

# Разобраться с аксонами по умолчанию
# Рисуем аксоны
#	if not @frame? and @axon? and @axon.length > 0
#		for ia in @axon.data

#			ctx.beginPath()
#			ctx.moveTo v[@id].x, v[@id].y-v[@id].h/2
#			ctx.lineTo v[ia.id].x,v[ia.id].y+v[ia.id].h/2
#			ctx.strokeStyle = "black"
#			ctx.lineWidth = 4
#			ctx.stroke()


#
# Служебная процедура (после вызова обязательно надо добавить '</div>')
#

# Процедура расстановки таблицы
Idea::createTableau = () ->
	t = []
	for i in [0..@length-1]
		unless t[i]? then t[i] = []
		jj = 0
		for j in [0..@[i].length-1]
			ia = @[i][j]

			while t[i][jj]?
				jj++
			cs = if @[i][j].colspan? then @[i][j].colspan else 1
			rs = if @[i][j].rowspan? then @[i][j].rowspan else 1
			ia.ii = i
			ia.jj = jj
			for ii in [i..i+rs-1]
				unless t[ii]? then t[ii] = []
				for jjj in [jj..jj+cs-1]
					t[ii][jjj] = ia.id

#			jj += cs
	tbx[@id]=t

Idea::tbxDown = () ->
	t = tbx[@pa.id]
	i = @ii
	while i < t.length and t[i][@jj] is @id
		i++
	if i < t.length then return idea[-t[i][@jj]] else return @pa.downnext()

Idea::tbxUp = () ->
	t = tbx[@pa.id]
	i = @ii
	while i >= 0 and t[i][@jj] is @id
		i--
	if i >= 0 then return idea[-t[i][@jj]] else return @pa

Idea::tbxLeft = () ->
	t = tbx[@pa.id]
	j = @jj
	while j >= 0 and t[@ii][j] is @id
		j--
	if j >= 0 
		return idea[-t[@ii][j]] 
	else
		rs = if @rowspan then @rowspan else 1
		if @ii-rs >= 0 then return idea[-t[@ii-rs][t[@ii-rs].length-1]]
		else return @pa

Idea::tbxRight = () ->
	t = tbx[@pa.id]
	j = @jj
	while j < t[@ii].length and t[@ii][j] is @id
		j++
	if j < t[@ii].length
		return idea[-t[@ii][j]] 
	else
		rs = if @rowspan then @rowspan else 1
		if @ii+rs < t.length then return idea[-t[@ii+rs][0]]
		else return @pa.rightnext()


# Можно рисовать детей
Idea::notFrame = (level) -> (level is 0) or (level > 0 and not @frame?)

# true - если это не заголовок страницы
# Для заголовков можно рисовать только элементы типа INSIDE, для всех остальных
# frame - все, кроме INSIDE, для прочих - рисуется все
Idea::notHeader = (level) -> (level isnt 0)

# TODO - было переименование, надо будет заменить везде на startIdeaTxt
Idea::htmlIdeaTxt = (level) -> return @startIdeaTxt(level)
# Просто вывод идеи без детей
Idea::simpleIdeaTxt = (level,drawshow) ->	@startIdeaTxt(level,drawshow)+@endIdeaTxt(level,drawshow)

#
# Вывод строки из названия
#
ideatxt = (s) ->
	if typeof s is "string" then return s 
	else if isIdea(s) then return s.txt
	else console.error "ideatxt(s): Тип s - не строка и не идея"


# Надпись
drtxt[DEFAULT] = (level) -> 
	s = ""
	if @txt? and @txt isnt ""
		if @ is fidea
			s = @txt.replace(/(<([^>]+)>)/ig,"");
		else
			s += @txt

	else if @placeholder?
		s += "<div id='mot"+@id+"' class='idea-mot"+(level)+"'>"
		s += ideatxt(@placeholder)
		s += "</div>"
	else if @pa? and @pa.childplaceholder?
		s += "<div id='mot"+@id+"' class='idea-mot"+(level)+"'>"
		s += ideatxt(@pa.childplaceholder)
		s += "</div>"
	s


# Начальная часть идеи
Idea::startIdeaTxt = (level,drawshow) ->
	s = ""

	### 
	# TODO: Перенести все align в нормальный текст
	unless @ is fidea and @list?

		if (@list is INLINE) and @notHeader(level)
				s += "<div class='idea-inline'"  
				s += ">"

		if (@list is SPAN) or (@list is STICKER) 
			prevexist = @pa?[@ix-1]?.list?
			if (not prevexist) or (prevexist and @pa[@ix-1].list isnt SPAN and @pa[@ix-1].list isnt STICKER)
				s += "<div style='display:inline-block;' "  
				s += ">"

		else if @list is TD or @list is TH
			prevexist = @pa?[@ix-1]?.list?
			if (not prevexist) or (prevexist and (@pa[@ix-1].list isnt TD) and (@pa[@ix-1].list isnt TH))
				@createTableau()
				s += "<table style='display:inline-block;' class='"
				if @tableclass?
					s += tblClass[@tableclass]
				else 
					s += tblClass[0]
				s += "'"  
				s += "><tbody>"
			if @newline then s+="<tr>"
			s += "<td " if @list is TD
			s += "<th " if @list is TH
#			s += " class='"+panelClass[@panel]+"' " if @panel? and @place? and @place is TBL
			s += " rowspan="+@rowspan if @rowspan?
			s += " colspan="+@colspan if @colspan?
			if @valign?
				s += " style='vertical-align:"
				switch (@valign)
					when TOP then s+="top"
					when MIDDLE then s+="middle"
					when BOTTOM then s+="bottom"
				s += "'"
			if @align?
				s += " style='text-align:"
				switch (@align)
					when LEFT then s+="left"
					when CENTER then s+="center"
					when RIGHT then s+="right"
					when JUSTIFY then s+="justify"
				s += "' "
			if @place? and @place is TBL and @ isnt fidea
				if @forma? and (@forma is BUTTON or @forma is PANEL)
					s += " class='"
					s += " button" if @forma is BUTTON
					s += " panel" if @forma is PANEL
					s += " scheme-"+schemes[@scheme][0] if @scheme?
					s += "' "
			s += " id='tbl"+@id+"'>"
	###

	# TODO Переписать
	if (@list is OL) or (@list is UL) and (@ isnt fidea)
		# Заголовок блока
		if @list is OL
			if @pa?[@sd-1]?[@ix]?.list? and (@pa[@sd-1][@ix].list is OL) and @pa[@sd-1][@ix].start? 
				@start = @pa[@sd-1][@ix].start+1
			else 
				@start = 1
			s += "<ol id='olt"+@id+"' start='"+@start+"' class='idea-ol" 
		else if @list is UL
			s += "<ul id='ult"+@id+"' class='idea-ul "
		# Размер шрифта
		if @plain?
			s += " idea-oul-plain"
		else if @level?
			s += " idea-oul"+@level
		else
			s += " idea-oul"+level
		# Элемент
		s +=	"'><li id='lit"+@id+"'><div style='display:block'>"



#	if @canvastype() is NATIVE
#		cvva.push @ # Сохраняем текущий элемент для прорисовки
#		s += "<div id='pap"+@id+"' class='ppr' style='position:relative'>"
#			s += "<canvas id='cvv"+@id+"'>"
#			s += "</canvas>"	#Paper
#		acss.push ""

	s += "<div"


# TODO: Samples не делаем
#	if @sample?
#		s += " title='"
#		if isArray(@sample)
#			for sm in @sample
#				s += sm+", "
#		else if typeof @sample is string
#			s += sm
#		s += "'"

	if @level?
		s += " id='bag"+@id+"' class='idea-bag"+@level
	else
		s += " id='bag"+@id+"' class='idea-bag"+level

	s += " drop" unless @nodrop? or (@pa? and @pa.childnodrop?)
	s += " drag" unless @nodrag? or (@pa? and @pa.childnodrag?)

	s += " pyramid" if @kind is LAYER # TODO: Сделать универсальное решение
	s += " btn" if @kind is BUTTON # TODO: Сделать универсальное решение

	if ((@place? and @place is BAG) or (not @place?)) and @ isnt fidea
		if @forma? and (@forma is BUTTON or @forma is PANEL or @forma is CSSOVAL or @forma is CSSRECT or @forma is CSSRRECT )
			s += " button" if @forma is BUTTON
			s += " panel" if @forma is PANEL
			s += " cssoval" if @forma is CSSOVAL
			s += " cssrect" if @forma is CSSRECT
			s += " cssrrect" if @forma is CSSRRECT
			s += " scheme-"+schemes[@scheme][0] if @scheme?

	s += " slide" if @kind is SLIDE and @ is fidea # TODO: Сделать универсальное решение
	s += " bordered" if @border? and @ isnt fidea # TODO: Сделать универсальное решение
#	s += " idea-span" if @list? and @list is SPAN and @ isnt fidea
#	s += " idea-sti" if @list? and @list is STICKER and @ isnt fidea
#	s += " "+panelClass[@panel] if @panel? and @place? and @place is BAG and @ isnt fidea
#	s += " "+btnClass[@button] if @button? and @ isnt fidea
	s += " "+clas[@kind]+"-bag" if clas[@kind]?

	s += " mindbag" if @kind is MINDLEAF # TODO: Сделать универсальное решение для всех типов
	s += " "+@class.txt if @class?
	s += "' "
	
	s += " style='"+@bagstyle+"'" if @bagstyle?
	s += " style='-webkit-columns:"+@columns+";' " if @columns?
#	s += " style='display:inline-block'" if @sd is BEFORE or @sd is AFTER

	if @childrenalign?
		s += " style='text-align:"
		switch (@childrenalign)
			when LEFT then s+="left"
			when CENTER then s+="center"
			when RIGHT then s+="right"
			when JUSTIFY then s+="justify"
		s += "'"

	# TODO - Наверное надо убрать, так как не используется
	if @forma? and @place? and @place is BAG and @ isnt fidea
		s += " style='padding:"+@padding()+"; margin:"+@margin()+";' " 	
	s += ">"

	if drawshow? and ((drawshow is DRAWALL) or (drawshow is DRAWHEADER))

		if @plain? and (@ isnt fidea)
			s += "<div  id='lvl"+@id+"' class='idea-plain"
		else if @level?
			s += "<div  id='lvl"+@id+"' class='idea-txt"+@level
		else 
			s += "<div  id='lvl"+@id+"' class='idea-txt"+level
		s += " display-none" if not(@txt?) and not notxt[@kind]
		s += "' "


		if @align?
			s += " style='text-align:"
			switch (@align)
				when LEFT then s+="left"
				when CENTER then s+="center"
				when RIGHT then s+="right"
				when JUSTIFY then s+="justify"
			s += "'"

		s += ">"

		s += "<span style='text-decoration:line-through;'>" if @linethrough?
		s += "<b>" if @bold?
		s += "<i>" if @italic?
		s += "<u>" if @underline?


		s += "<span id='txt"+@id+"'"
		s += " class='frame-head'" if @frame and @ is fidea and (@id is 0 or @id is -1) and not @goto
		s += " class='frame-up'" if @frame and @ is fidea and not (@id is 0 or @id is -1) and not @goto
		s += " class='frame-down'" if @frame and @ isnt fidea and not @goto
		s += " class='frame-run'" if @run?
		s += " class='frame-goto'" if @goto?
		s += " class='frame-url'" if @url?
		
		s += " class='frame-txt'" if @frame? or @goto? or @url?
		s += " class='"+clas[@kind]+"-txt'" if clas[@kind]?
		s += " class='"+panelClass[@panel]+"'" if @panel? and @place? and @place is TXT
		#s += " style='color:"+schemes[@scheme][4]+"'" if @scheme?
		# Для отображения картинок - наверное костыль?
		s += " style='"
		s += "width:"+@w+"px;" if @w?
		s += "height:"+@h+"px;" if @h?
		s += "'"

		if @place? and @place is TXT and @ isnt fidea
			if @forma? and (@forma is BUTTON or @forma is PANEL or @forma is CSSOVAL or @forma is CSSRECT or @forma is CSSRRECT )
				s += " class='"
				s += " button" if @forma is BUTTON
				s += " panel" if @forma is PANEL
				s += " cssoval" if @forma is CSSOVAL
				s += " cssrect" if @forma is CSSRECT
				s += " cssrrect" if @forma is CSSRRECT
				s += " scheme-"+schemes[@scheme][0] if @scheme?
				s += "' "
		s +=">"

		# Новый подход к типам
		# TODO: Выделить в отдельный тип
		s += @drtxt(level)

		s += "</span>" #txt-id
		
		s += "</u>" if @underline?
		s += "</i>" if @italic?
		s += "</b>" if @bold?
		s += "</span>" if @linethrough?

		s += "</div>" # lvl-id

	# Добавляем канву, если нужно
	if @notFrame(level)
		if (@canvas? and @canvas is CANVASJS) or (@canvastype() is PASSIVE)
			cvva.push @
			s += "<div id='par"+@id+"' style='position:relative'>"
			s += "<div id='pap"+@id+"'  style='position:absolute;top:0px;left:0px'>"
			s += "<canvas id='cvv"+@id+"'>"
			s += "</canvas>"	#Paper
			s += "</div>"	#Paper
			s += "<div id='map"+@id+"'  class='mapbag' style='position:absolute;top:0px;left:0px'>"
		else if @canvastype() is ACTIVE
			cvva.push @ # Сохраняем текущий элемент для прорисовки
			s += "<div id='pap"+@id+"' class='ppr' style='position:relative'>"
			s += "<canvas id='cvv"+@id+"'>"
			s += "</canvas>"	#Paper
			acss.push ""
	s

# Код для html
# Параметры drawshow:
# null - показ и заголовка и тела
# show - показ заголовка
# показ тела
draw[DEFAULT] = (level,drawshow=DRAWALL) ->
	s = @startIdeaTxt(level,drawshow)

	# TODO Надо решить, как изображать логические правила...
#	for pk,pv of @prop
#		if pk? and @hasOwnProperty(pk) and isId(pk)
#			s += "<div class='idea-txt"+(level+1)+"'>"+idea[-Number(pk)].txt+": "
#			if pv.length > 0
#				for i in [0..pv.length-1]
#					s += pv[i].txt + "; "
#			s += "</div>"

	if (drawshow is DRAWALL or drawshow is DRAWCHILDREN) and @notFrame(level) and @length? and @length > 0  # На них не распространяется ограничение @frame
		if @intype? and (@intype is TABLE or @intype is TABLEAU)
			@createTableau()
			s += "<table class='"
			if @tableclass?
				s += tblClass[@tableclass]
			else
				s += tblClass[0]
			s += "'><tbody>"
			for i in [0..@length-1]
				s += "<tr>"
				for j in [0..@[i].length-1]
					ia = @[i][j]
					unless ia? then console.error "not defined ",i,j
					s += if ia.th? then "<th" else "<td"
					s += " id='tbl"+ia.id+"'"
					s += " rowspan="+ia.rowspan if ia.rowspan?
					s += " colspan="+ia.colspan if ia.colspan?
					s += " width="+ia.w if ia.w?
					s += " height="+ia.h if ia.h?
					s += " style='"+ia.tblstyle+"'" if ia.tblstyle?

					if (ia.place? and ia.place is TBL) and @ isnt fidea
						s += " style='"
						if ia.forma? and (ia.forma is BUTTON or ia.forma is PANEL or ia.forma is CSSOVAL or ia.forma is CSSRECT or ia.forma is CSSRRECT )
							s += " button" if ia.forma is BUTTON
							s += " panel" if ia.forma is PANEL
							s += " cssoval" if ia.forma is CSSOVAL
							s += " cssrect" if ia.forma is CSSRECT
							s += " cssrrect" if ia.forma is CSSRRECT
							s += " scheme-"+schemes[ia.scheme][0] if ia.scheme?
						s += "' "
					s += ">"
					if @txt is null 
						s += ia.draw(level)					
					else
						s += ia.draw(level+1)
			s += "</table>"
		else # if (not @intype?) or @intype is LIST @intype is LIST
			for i in [0..@length-1]
				if @[i].length > 0
#					if @[i][0].list?
#						if @[i][0].list is UL and not (@[i-1]?[0]?.list? and @[i-1][0].list is UL) then s += "<ul class='idea-ul"+(level+1)+" idea-txt"+(level+1)+"'>"
#						else if @[i][0].list is OL and not (@[i-1]?[0]?.list? and @[i-1][0].list is OL) then s += "<ol class='idea-ol"+(level+1)+" idea-txt"+(level+1)+"'>"

#						if @[i][0].list is UL or @[i][0].list is OL
#							s += "<li>"

					s += "<div id='cha"+@id+"' style='display:block;'>" if @[i].length > 1
					for j in [0..@[i].length-1]
						ia = @[i][j]
						if @intype is LIST or (not @intype?)
							s += "<div id='chb"+ia.id+"'>" if @[i].length is 1
							s += "<div id='chc"+ia.id+"' style='display:inline-block;vertical-align:top'>" #if @[i].length > 1
						else #if @intype is LINE
							s += "<div id='chb"+ia.id+"' style='display:inline;'>" if @[i].length is 1
							s += "<div id='chc"+ia.id+"' style='display:inline;'>" #if @[i].length > 1

						unless @txt? 
							s += ia.draw(level,drawshow)					
						else
							s += ia.draw(level+1,drawshow)

						s += "</div>" #if @[i].length > 1  #chc
						s += "&nbsp;" if j isnt @[i].length-1
						s += "</div>" if @[i].length is 1  #chb

					s += "</div>"  if @[i].length > 1 #cha
#					if @[i][0].list?
#						if @[i][0].list is UL or @[i][0].list is OL
#							s += "</li>"

#						if @[i][0].list is UL and not (@[i+1]?[0]?.list? and @[i+1][0].list is UL) then s += "</ul>"
#						else if @[i][0].list is OL and not (@[i+1]?[0]?.list? and @[i+1][0].list is OL) then s += "</ol>"

	# TODO: Заменить на отдельные картинки
	
	s += @endIdeaTxt(level)	
	s

Idea::endIdeaTxt = (level)	->
	s = ""

	if @notHeader(level) and @[OUTSIDE]? and @[OUTSIDE].length > 0  # На них не распространяется ограничение @frame
		for ia in @[OUTSIDE]
			ass = ia.draw(level+1)
			acss[acss.length-1] += ass

	# TODO: Надо переделать на рисование кастомное для mindmap

	if @notFrame(level)
		if @canvas? or (@canvastype() is PASSIVE)
			s += "</div>" # Map
			s += "</div>" # Outer Map
		else if @canvastype() is ACTIVE
			s += acss.pop()
			s += "</div>" # Outer Map

	s += "</div>" #bag

#	if @notHeader(level) and @canvastype() is NATIVE
#		s += acss.pop()
#		s += "</div>" # Outer Map


	s += "</div></li></ol>" if @list is OL and @ isnt fidea
	s += "</div></li></ul>" if @list is UL and @ isnt fidea

	s

# Рисовать графические элементы
Idea::drawGraphics = ->
	if cvva.length > 0
		for i in [cvva.length-1..0] by -1
			cvva[i].cvv()


# Вывести весь фрейм
# Пример: ia.fhtml() 
Idea::fhtml = (sia = @) ->
	t1 = new Date().getTime() # Замеряем время

	# Закрываем dropdown
	$('.dropdown.open .dropdown-toggle').dropdown('toggle');

	# Стираем все старые SVG фигуры
	ggg = {}
	v = {}
	ctx = {}
	cvva = []

	fidea = @
	drs = @draw()
	$desk.html drs
#	$desk.html drs
#	$desk.html drs

	# TODO: Разобраться, почему выделяет родительский элемент, а не текущий
	shiftKey = no # Если перерисовываем экран, то снимаем все выделения
	sia.select()

	if fidea.next?
		s = "<button id='next-step' class='step btn btn-primary'>"
		s += fidea.next.txt 
		s += "</button>"
	else
		s = ""
	$step.html s

	if fidea.next?
		$('#next-step').click (eo) ->
			if fidea.next.run? then fidea.next.run()
			if fidea.next.goto? then fidea.next.goto.fhtml()

	# Добавить меню, соответствующее
	if fidea.menu?
		$menu.html fidea.menu.draw()
	else
		$menu.html defaultMenu.draw()
	$('.dropdown-toggle').dropdown() # Вызываем jQuery для того, чтобы обновить вызов dropdown

	$('a.menu-item').click (eo) ->
		midea = idea[-Number(eo.srcElement.id.substr(3))]
		if eo.srcElement.id.substr(0,3) is "mnu"
			if midea.run? then midea.run()
			if midea.goto? then midea.goto.fhtml()

	# Запустить табы
	if tbs.length > 0
		for tb in tbs
			$('#tbs'+tb.id+' a:first').tab('show')

	# Если в режиме презентации, то раскрываем весь экран
	if @kind is SLIDE and statePresentation
		showFullScreen()
		f = (s) -> s.substr(0,s.length-2)
		hhh = window.innerHeight
		hhh -= f($("#bag"+fidea.id).css("margin-bottom"))
		hhh -= f($("#bag"+fidea.id).css("margin-top"))
		hhh -= f($("#bag"+fidea.id).css("border-top-width"))
		hhh -= f($("#bag"+fidea.id).css("border-bottom-width"))
		hhh -= 40
		$("#bag"+fidea.id).height hhh

	if fidea.background? 
		if fidea.background isnt lastBackground or fidea isnt lastFidea
			$("body").css "background",bkgStyle[fidea.background]
			lastBackground = fidea.background
	else
		$("body").css "background",bkgStyle[0]
		lastBackground = 0

	lastFidea = fidea

	@drawGraphics()

	t2 = new Date().getTime()
	# Скорость вывода на экран
	# console.log  t2-t1

	@

Idea::unselect = ->
	$("#txt"+@id).removeClass "selected-txt"
# TODO: Сделать селект графической фигуры на CANVAS

# Выбрать текущую идею
# Пример: ia.select()
#
Idea::select = ->
	unless @? then return 
	if sidea?
		# Заканчиваем редактирование старой идеи
		finishEdit()	

		$txt.removeClass "active-txt"
		$bag.removeClass "active-bag"
		$tbl.removeClass "active-tbl"

	# TODO: Надо переписать, чтобы в цикле снимались все табы
	if @pa? and @pa.kind is TABS
		@pa.activetab = @ix
		for ta in @pa[0]
			$("#tab"+ta.id).addClass "inactive-tab"
			$("#tab"+ta.id).removeClass "active-tab"
			$("#tbs"+ta.id).removeClass "active-tbs"
		$("#tbs"+@id).addClass "active-tbs"
		$("#tab"+@id).addClass "active-tab"
		$("#tab"+@id).removeClass "inactive-tab"

	# Обрабатываем нажатие с shift
	unless window.shiftKey
		sia.unselect() for sia in ssidea	# Снимаем выделение со старых идей
		ssidea = []
	else
		found = -1
		if ssidea.length > 0
			for sia,si in ssidea
				if sidea is sia
					found = si
		if found isnt -1
			$txt.addClass "selected-txt"

	# Сохраняем для истории, чтобы можно было вернуться с помощью клавиш Backspace
	saveHistory()

	# Изменяем
	sidea = @

	found = -1
	if ssidea.length > 0
		for sia,si in ssidea
			if sidea is sia
				found = si
	if found is -1
		ssidea.push sidea
	else
		ssidea[found].unselect()
		ssidea.splice(found,1) # Удаляем из списка нажатый элемент

	# Устанавливаем выделение новой выбранной идеи
	$txt = $("#txt"+sidea.id)
	$bag = $("#bag"+sidea.id)
	$tbl = $("#tbl"+sidea.id)

	if sidea.motivator? or sidea.pa?.childmotivator? and sidea.txt.length is 0
		$txt.addClass "active-txt-mot"
		$txt.addClass "active-txt-exa"
	else
		$txt.addClass "active-txt"

	$bag.addClass "active-bag"
	$tbl.addClass "active-tbl"

	# Скролл для центрирования
	# TODO: Определить оптимальные параметры
	# Проверяем, если оно на бумаге
	if $bag? and $bag.offset()?
		tpp = $bag.offset().top
		if tpp - $("body").scrollTop() < 100 or tpp - $("body").scrollTop() > (window.innerHeight-100)
			$('body').scrollTop tpp-window.innerHeight/2
	
# TODO: Сделать скролл на активный объект

	cometFocusPublish() #TODO: Доделать мультиюзер
	if v[@id] and v[@id].prj? then v[@id].prj.view.draw()

	@showTooltip() # Показать подсказку

	#Добавляем драг-и-дроп
	$(".drag").draggable
		distance:25
#		cursor:"crosshair"
#		revert:yes #,zIndex:10,
#		start: (eo,ui) -> 
#			n = Number(eo.srcElement.id.substr(3))
#			if n is 0 then return
#			$("#bag"+n).addClass "idea-drag"
#		stop: (event,ui) -> 
#			ui.removeClass "idea-drag"

	$(".drop").droppable
		accept: ".drag"
		hoverClass: "idea-hover"
		greedy: yes
		drop: dropIdea
		tolerance: "pointer"
	@

dropIdea = (eo,ui) ->
	# Получаем номера
#	id1 = Number(ui.helper[0].id.substr(3)) 
	#console.log ui.draggable[0].id
	id1 = Number(ui.draggable[0].id.substr(3)) 
	ia1 = idea[-id1]
	#ia1 = sidea
	pa1 = ia1.pa
	sd1 = ia1.sd
	ix1 = ia1.ix
	# To
#	id2 = Number(eo.srcElement.id.substr(3)) # Idea To
	id2 = Number(@id.substr(3)) # Idea To
	ia2 = idea[-id2]
	pa2 = ia2.pa
	sd2 = ia2.sd
	ix2 = ia2.ix

	# Удаляем старую идею
	pa1[sd1].splice(ix1,1)

	# Вставляем новую идею
	if sd1 is OUTSIDE and ((ia2[OUTSIDE]? and ia2[OUTSIDE].length > 0) or (sd2 is OUTSIDE))
		ia2.ado ia1
	else
		ia2.add ia1

	pa1.normalizeIdea()
	pa2.normalizeIdea()
	redraw(ia2)

# Утилита для поиска родительского фрейма
Idea::upperFrame = ->
	unless @pa? then return @
	sia = @pa
	while sia.pa? and (not sia.frame?)
		sia = sia.pa
	sia



Idea::showTooltip = () ->
	s = ""
	if @tooltip? or @childtooltip? or (@pa? and @pa.childtooltip?)
		if @tooltip?
			s = ideatxt(@tooltip)
		else if @pa? and @pa.childtooltip?
			s = ideatxt(@pa.childtooltip)
		else if @childtooltip?
			s = ideatxt(@childtooltip)

	$tooltip = if @txt? then $('#txt'+sidea.id) else $('#bag'+sidea.id)

	#TODO Разобраться со скрытием тултипов
	$tooltip.qtip 
		content:s
		show:
			events:no
			ready:true
			solo:yes

# TODO: Доделать fadeIn
#		$("#tooltip").fadeIn "slow"
#		setInterval hideTooltip,1000
#	else
#		$("#tooltip").html ""
#		$("#tooltip").css "display","none"
# hideTooltip =->	$("#tooltip").fadeOut "slow"


