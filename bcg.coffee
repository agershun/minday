################################################
# MINDAY 0.010 Tokyo
# bcg.coffee
# Процедуры для работы с матрицей БКГ
################################################

#=============================
# 1. ОСНОВНЫЕ ПАРАМЕТРЫ 
#=============================
canvastype[BCG] =-> ACTIVE # Активная канва, то есть размер задается рисунком

childkind[BCG] =-> BCGENTITY

keyp[BCG] = {}
keyp[BCGENTITY] = {}

#============================
# 2. KIND
#============================
# Устанавливаем тип дерево
Idea::kindBCG = ->
	@kind = BCG

	@row.kind = BCGROWS
	@row.pa = @
	@row.ix = "row"

	@column.kind = BCGCOLUMNS
	@column.pa = @
	@column.ix = "column"

	if @row?
		for ia,i in @row.data
			ia.kind = BCGROW
			ia.pa = @row
			ia.ix = i

	if @column?
		for ia,i in @column.data
			ia.kind = BCGCOLUMN
			ia.pa = @column
			ia.ix = i

	for ra,r in @data
		ra.kind = BCGROWCELL
		ra.pa = @
		ra.ix = r
		for ia,i in ra.data
			ra.kind = BCGCELL
			ra.pa = @
			ra.ix = i

	for ia,i in @entity.data
		ia.kind = BCGENTITY
		ia.pa = @
		ia.ix = i

	@

#============================
# 3. DRAW
#============================

# Заголовки колонок и рядов нужно вывести без дочерних элементов
draw[BCGCOLUMNS] = (level) -> @simpleIdeaTxt(level)
draw[BCGROWS] = (level) -> @simpleIdeaTxt(level)

# Будем рисовать на канве
#draw[BCGENTITY] = (level) ->
#	s = @htmlIdeaTxt(level)
#	s += "</div>"
#	s


draw[BCG] = (level) ->
	s = @startIdeaTxt(level)
	if (level is 0) or (level > 0 and not @frame?)
		cvva.push @ # Сохраняем текущий элемент для прорисовки
		s += "<div style='position:relative'>"

		s += "<div id='bcg"+@id+"'  class='bcgbag' style='position:absolute;top:0px;left:0px;vertical-align:bottom'>"

		# Начинается таблица
		s += "<table id='bag"+@id+"'>"
		# Заголовки колонок
		if @column?
			# Два угла
			# TODO Нужно будет сделать классы, чтобы углы были невидимыми
			s += "<thead>"
			s += "<tr>"
			if @row?
				s += "<th>" 
				s += "</th>"
				s += "<th>" 
				s += "</th>"

			s += "<th id='tbl"+@column.id+"' colspan="+@column.length+" style='text-align:center;'>" 
			s += @column.draw(level+1)
			s += "</th>"
			s += "</tr>"

			s += "<tr>"
			if @row?
				s += "<th>" 
				s += "</th>"
				s += "<th>" 
				s += "</th>"
			for ca in @column
				s += "<th id='tbl"+ca.id+"'>" 
				s += ca.draw(level+1)
				s += "</th>"
			s += "</thead>"

		# Строки с ячейками
		for ra,ri in @data
			s+="<tr>"
			# Заголовки строк
			if @row?
				if ri is 0
					s += "<th id='tbl"+@row.id+"' rowspan="+@row.length+" style=''>" 
					s += @row.draw(level+1)
					s += "</th>"

				s += "<th id='tbl"+@row[ri].id+"'>" 
				s += @row[ri].draw(level+1)
				s += "</th>"

			# Ячейки
			for ca in ra
				s += "<td id='tbl"+ca.id+"'>" 
				s += ca.draw(level+1)
				s += "</td>"

			s+="</tr>"
		s += "</table>"
		s += "</div>"	#Paper

#		s += "<div id='pap"+@id+"'  style='position:absolute;top:0px;left:0px'>"
#		s += "</div>"	#Paper

		# Теперь выписываем entitites
		s += "<div style='position:absolute;top:0px;left:0px'>"
#		for ie in @entity.data
#			console.log ie.txt
#			s += ie.draw(level+1)
#		s += "</div>"

#		s += "</div>"
#	s += "</div>"
	s += @endIdeaTxt(level)

	s

# По умолчанию форма узла - просто закругленный прямоугольник. Возможно стоит рисовать
# и овалы.
# TODO: Сделать замену фигуры узла
shape[BCGENTITY] = (x,y,w,h) ->
	s = "M #{x} #{y}	
			m #{-w/2} 0 a #{w/2} #{h/2} 0 0 0 #{w} 0 a #{w/2} #{h/2} 0 0 0 #{-w} 0 z"	

# Создание бумаги для дерева
svg[BCG] = (level) ->
	console.log $("#bcg"+@id).outerWidth(true),$("#bcg"+@id).outerHeight(true)
	ppr[@id] = Raphael "pap"+@id,$("#bcg"+@id).outerWidth(true),$("#bcg"+@id).outerHeight(true)
	# TODO: Надо будет рассчитывать вышину и ширину дерева как в mindmap
	# TODO: Разобраться, что ставить bag-100 или tree-100

	v[@id] = {}
	v[@id].ppr = ppr[@id]
	v[@id].ww = $("#bcg"+@id).outerWidth(true)
	v[@id].hh = $("#bcg"+@id).outerHeight(true)
#	v[@id].ppr.setSize(v[@id].w,v[@id].h) # Изменяем размер бумаги - уже установлен

	v[@id].sw = $("#tbl"+@row.id).outerWidth(true)+$("#tbl"+@row[0].id).outerWidth(true)
	v[@id].sh = $("#tbl"+@column.id).outerHeight(true)+$("#tbl"+@column[0].id).outerHeight(true)

	console.log v[@id].sh,v[@id].hh

	v[@id].w = v[@id].ww-v[@id].sw
	v[@id].h = v[@id].hh-v[@id].sh

	for ie in @entity
		v[ie.id] = {}
		v[ie.id].ppr = ppr[@id]
		v[ie.id].x = ie.x*v[@id].w + v[@id].sw
		v[ie.id].y = ie.y*v[@id].h + v[@id].sh
		v[ie.id].w = ie.r*v[@id].w
		v[ie.id].h = ie.r*v[@id].h
		ie.bcgdraw()

Idea::bcgdraw = ->
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
		$("#bag"+@id).css "position","absolute"
		$("#bag"+@id).css "top",v[@id].y-v[@id].h/2
		$("#bag"+@id).css "left",v[@id].x-v[@id].w/2


# Допустимые дочерние элементы
childkind[BCGCELL] =-> IDEA
childkind[BCGROW] =-> IDEA
childkind[BCGCOLUMN] =-> IDEA
childkind[BCGROWS] =-> BCGROW
childkind[BCGCOLUMNS] =-> BCGCOLUMNS
childkind[BCGENTITY] =-> null   #TODO Надо сделать так, чтобы не добавлялось

# Клавиатура
keyp[BCG] = {} # Инициализируем массив клавиш
keyp[BCGROWS] = {} # Инициализируем массив клавиш
keyp[BCGROW] = {} # Инициализируем массив клавиш
keyp[BCGCOLUMNS] = {} # Инициализируем массив клавиш
keyp[BCGCOLUMN] = {} # Инициализируем массив клавиш
keyp[BCGCELL] = {} # Инициализируем массив клавиш
keyp[BCGENTITY] = {} # Инициализируем массив клавиш

