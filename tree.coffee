################################################
# MINDAY 0.010 Tokyo
# tree.coffee
# Процедуры для работы с деревьями
################################################

#=============================
# 1. ОСНОВНЫЕ ПАРАМЕТРЫ 
#=============================
canvastype[TREE] =-> ACTIVE # Активная канва, то есть размер задается рисунком

childkind[TREE] =-> NODE
childsd[TREE] =-> OUTSIDE
childkind[NODE] =-> NODE
childsd[NODE] =-> OUTSIDE

keyp[TREE] = {}
keyp[NODE] = {}

clas[TREE] = "tree"
clas[NODE] = "node"


#============================
# 2. KIND
#============================
# Устанавливаем тип дерево
Idea::kindTree = ->
	@kind = TREE
	# Вопрос: Стоит ли вызывать эту процедуру, так как внутри узлов дерева можно будет
	# размещать и просто идеи...
	# Поэтому пока просто номинально

# Устанавливаем тип узел дерева
Idea::kindNode = ->
	@kind = NODE

#============================
# 3. SHAPES
#============================
# Сделаем все RRECT
# По умолчанию форма узла - просто закругленный прямоугольник. Возможно стоит рисовать
# и овалы.
# TODO: Сделать замену фигуры узла
ssshape[NODE] = (x,y,w,h) -> 
	frm = if @forma? then @forma else RRECT
	ssshape[frm].call(@,x,y,w,h)

ssshape[TREE] = ssshape[NODE]


#============================
# 4. SVG и PAINT
#============================
# Создание бумаги для дерева
cvv[TREE] = (level) ->
	mms = @[OUTSIDE][0]

	mms.treesethw(0) # Устанавливаем высоты/ширины и задаем бумагу
	mms.treesetxy()

	$cvv = $("#cvv"+@id)
	$cvv.attr "width",v[mms.id].ww
	$cvv.attr "height",v[mms.id].hh
	ctx = $cvv[0].getContext("2d")

	mms.treedraw(ctx)

# Определяем высоту и ширину дерева и его узлов
Idea::treesethw = (lvl) ->
	v[@id] = {}
	v[@id].lvl = lvl
	v[@id].w = $("#bag"+@id).outerWidth(true)    # Это размер узлов, исходя из текста
	v[@id].h = $("#bag"+@id).outerHeight(true)

	v[@id].hh = v[@id].h
	v[@id].ww = -DW
	if not @frame? and @[OUTSIDE]?
		for ia in @[OUTSIDE]
			if ia.kind is NODE
				ia.treesethw(lvl+1)
				v[@id].hh = Math.max(v[@id].hh,v[@id].h+DH+v[ia.id].hh)
				v[@id].ww += v[ia.id].ww + DW
	v[@id].ww = Math.max(v[@id].w,v[@id].ww)

Idea::treesetxy = ->
		# Сначала устанавливаем координаты для старшего элемента
		if v[@id].lvl is 0
			v[@id].x = v[@id].ww/2 + 3/2*DW
			v[@id].y = v[@id].h/2 + DH

		# Далее для всех уровней
		xx = v[@id].x - v[@id].ww/2
		if not @frame? and @[OUTSIDE]?
			for ia in @[OUTSIDE]
				if ia.kind is NODE
					v[ia.id].x = xx + v[ia.id].ww/2
					v[ia.id].y = v[@id].y+v[@id].h/2+v[ia.id].h/2+DH
					xx += v[ia.id].ww+DW
					ia.treesetxy()

		if v[@id].lvl is 0
			v[@id].ww += 3*DW
			v[@id].hh += 2*DH

Idea::treedraw = (ctx) ->
	v[@id].ctx = ctx
	@ssshape(v[@id].x,v[@id].y,v[@id].w,v[@id].h)

	$("#bag"+@id).css "position","absolute"
	$("#bag"+@id).css "top",v[@id].y-v[@id].h/2
	$("#bag"+@id).css "left",v[@id].x-v[@id].w/2

	if @pa.kind is NODE
		ctx.beginPath()
		ctx.moveTo v[@id].x,v[@id].y-v[@id].h/2
		ctx.lineTo v[@id].x,(v[@id].y-v[@id].h/2+v[@pa.id].y+v[@pa.id].h/2)/2
		ctx.lineTo v[@pa.id].x,(v[@id].y-v[@id].h/2+v[@pa.id].y+v[@pa.id].h/2)/2
		ctx.lineTo v[@pa.id].x,v[@pa.id].y+v[@pa.id].h/2
		ctx.strokeStyle = "red"
		ctx.lineWidth = 1
		ctx.stroke()

	# Рисуем дочерние элементы
	if not @frame? and @[OUTSIDE]?
		for ia in @[OUTSIDE]
			switch ia.kind 
				when NODE
					ia.treedraw(ctx)


###################
#
# Навигатор
#
#####################

keyp[TREE][KEY_DOWN] =->
	if @[OUTSIDE]?[0]? then return @[OUTSIDE][0].select()


downnext[NODE] = ->
	if @ is fidea then return null
	if @pa?
		if @[OUTSIDE]?[0]? then return @[OUTSIDE][0]
		else return @pa.downnext()
	@

keyp[NODE][KEY_DOWN] =->
	if @[0]?[0]? then return @[0][0].select()
	else if @[OUTSIDE]?[0]? then @[OUTSIDE][0].select()
	else #TODO: Перейти выше
		sia = @pa
		while sia.kind is NODE
			sia = sia.pa
		ria = sia.downnext()
		if ria is null then return @select()
		else return ria.select()

keyp[NODE][KEY_RIGHT] =->
	if @pa[OUTSIDE][@ix+1]? then @pa[OUTSIDE][@ix+1].select()
	@

keyp[NODE][KEY_LEFT] =->
	if @pa[OUTSIDE][@ix-1]? then @pa[OUTSIDE][@ix-1].select()
	@


keyp[NODE][KEY_UP] =->
	@pa.select()

###

keyp[NODE][KEY_DOWN] =->
	if @length > 0 then return @[0].select()
	else
		sia = @pa
		while sia.kind is NODE
			sia = sia.pa
		ria = sia.downnext()
		if ria is null then return @select()
		else return ria.select()

keyp[NODE][KEY_ENTER] =->
	if v[@id]? and v[@id].lvl is 0
		@addIdea(@,0,0,true)
	else 
		keyp[DEFAULT][KEY_ENTER].call(@)

# TODO Переписать

keyp[NODE][KEY_LEFT] =->
	if @pa[@ix-1]? then return @pa[@ix-1].select()
	else if @pa.pa[@pa.ix-1]?[@pa.pa.length-1]? then return @pa.pa[@pa.ix-1][@pa.pa.length-1].select()
	else if @pa.pa[@pa.ix-1]? then return @pa.pa[@pa.ix-1].select()
	@

keyp[NODE][KEY_RIGHT] =->
	if @pa[@ix+1]? then @pa[@ix+1].select()
	else if @pa.pa[@pa.ix+1]?[0]? then return @pa.pa[@pa.ix+1][0].select()
	else if @pa.pa[@pa.ix+1]? then return @pa.pa[@pa.ix+1].select()
	@

keyp[NODE][KEY_UP] =->
	if @pa? then @pa.select()

