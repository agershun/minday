###########################################################
# Minday 0.008 CI
# idea.coffee
# Операции с идеями
###########################################################

# Основной массив идей

idea = []
label = []
refs = [] # Пока представляем в виде массива и подмассива. Первый элемент - главный.

models = {}
currentModel = "minday"
readonly = no

# Создать новую модель
createNewModel = (modelName="minday") ->
#	unless models[modelName]?
	model = {}
	currentModel = modelName
	model.name = modelName
	model.idea = []
	model.label = []
	model.refs = []
	model.sidea = 0
	model.fidea = 0
	model.length = 0
	model.readonly = no
	models[modelName] = model
	model

# Выбрать модель
selectModel = (modelName="minday",refresh=false) ->
#	console.log "was:",models[currentModel].name, models[currentModel].idea.length

	if models[modelName]?
#		console.log "exists"
		currentModel = modelName
		idea = models[modelName].idea
		label = models[modelName].label
		refs = models[modelName].refs
		sidea = models[modelName].sidea
		fidea = models[modelName].fidea
		readonly = models[modelName].readonly
		if refresh
			fidea.fhtml(sidea)

#	console.log "now:",models[currentModel].name, models[currentModel].idea.length

updateModel = (modelName="minday",fid=idea[0],sid=idea[0],ro=false) ->
	if models[modelName]?
		models[modelName].idea = idea
		models[modelName].label = label
		models[modelName].refs = refs
		models[modelName].fidea = fid
		models[modelName].sidea = sid
		models[modelName].length = idea.length
		models[modelName].readonly = ro


newIdea = ->
	ia = new Idea()
	ia.id = -idea.length
#	ia.sd = 0
	idea.push ia
	ia

# Удалить все идеи (используется в fileNew и fileLoad)
deleteIdea = ->
	idea.splice(0,idea.length)

initIdea = (len) ->
	for i in [0..len-1]	
		newIdea()

# Главный класс
class Idea

	# Основной конструктор
	constructor: ->
		@length = 0
		@kind = IDEA

# Тоже самое, что и add, только с добавлеием фрейма
adf = ->
	ia = add.apply(@,arguments)
	ia.frame = yes
	ia

# Основная процедура создания идей
# add - создать пустую идею
# add "название" - создать идею с названием
# add [массив] - создать идею с пустым названием и элементами массива
# add "название", [массив] - создать идею с названием и аргументами
# add "название", {параметры} - создать идею с параметрами
# add "название", [массив], {параметры} - создать идею с параметрами

add = ->
	ia = newIdea()
	switch arguments.length
		when 1
			if isString(arguments[0])
				ia.txt = arguments[0]
			else if isArray(arguments[0])
				for arg,i in arguments[0]
					arg1 = arg
					if arg1?
						if isString(arg) # Если это строка, то создать новую идею
							arg1 = add arg
						arg1.ix = i
						arg1.pa = ia
					ia[i] = arg1
				ia.length = arguments[0].length

		when 2
			# add "название", [массив]
			if isString(arguments[0])and isArray(arguments[1])
				ia.txt = arguments[0]
				for arg,i in arguments[1]
					arg1 = arg
					if arg1?
						if isString(arg) # Если это строка, то создать новую идею
							arg1 = add arg
						arg1.ix = i
						arg1.pa = ia
					ia[i] = arg1
				ia.length = arguments[1].length

			# add "название", {название}
			else # if typeof arguments[0] is "string" and typeof arguments[1] is "object" and not arguments[1] instanceof Array
				ia.txt = arguments[0]
				for key,val of arguments[1]
					if key is "label" then label[val] = ia # Добавление адреса по метке
					ia[key] = val

		when 3
			# if typeof arguments[0] is "string" and typeof arguments[1] is "object" and arguments[1] instanceof Array and typeof arguments[3] is "object"
				ia.txt = arguments[0]
				for arg,i in arguments[1]
					arg1 = arg
					if arg1?
						if isString(arg) # Если это строка, то создать новую идею
							arg1 = add arg
						arg1.ix = i
						arg1.pa = ia
					ia[i] = arg1
				ia.length = arguments[1].length
				for key,val of arguments[2]
					if key is "label" then label[val] = ia # Добавление адреса по метке
					arg1 = val
					if arg1?
						if isString(arg) # Если это строка, то создать новую идею
							arg1 = add arg
						arg1.ix = key
						arg1.pa = ia
					ia[key] = val

	ia # Возвращаем пустую идею


#
# Процедура для создания массива ссылок
# adr [idea1,idea2,...]
# Главное отличие - создается идея с типом LINK
# Второе: не обновляются pa и ix в ссылочных элементах
# TODO: Возможно, что нужно будет организовать нормальные ссылки через refs
adr = ->
	ia = newIdea()
	ia.kind = LINK
	switch arguments.length
		when 1
			if isArray(arguments[0])
				for arg,i in arguments[0]
					# TODO: Добавить проверку, что тип arg - всегда только идея
					ia[i] = arg
				ia.length = arguments[0].length
	ia

# Клонирование идеи. Клонируем только название, но сохраняем ссылку
Object.defineProperty Idea.prototype, "clone", 
	enumerable: no
	get: ->
		bi = newIdea()
		bi.txt = @txt
		if @ref?
			bi.ref = @ref
			refs[@ref].push bi
		else 
			@ref = refs.length
			bi.ref = @ref
			refs.push [@,bi]
		bi

# Добавление дочернего элемента в конец
# идея.push идея, идея, идея
Idea::push = ->
	for a in arguments
		if a is null then a = add ""
		if isString(a) then a = add a
		else if isIdea(a) and a.pa? then a = a.clone # Если существует как часть чего-то, то клонируем
		@[@length] = a
		a.ix = @length
		a.pa = @
		@length++
	@[@length-1]

# Установить параметры идеи
Idea::set = (par) ->
#	for key,val of par
#		if key is "label" 
#			if @label? then delete label[@label]
#			label[val] = ia # Добавление адреса по метке
#		@[key] = val
	$.extend @,par
	@

# Найти идею по названию
find = (a) ->
	for ia in idea
		if ia.txt is a then return ia
	null

# Найти все идеи с заданным названием
findall = (a) ->
	ret = []
	for ia in idea
		if ia.txt is a then ret.push ia
	ret

# Найти все идеи с заданным ссылками
findref = (a) ->
	ret = []
	if a.ref? then ret = refs[a.ref]
	ret

# Это массив? 
isArray = (a) -> Object.prototype.toString.call(a) == '[object Array]'

# Это идея?
isIdea = (a) -> a instanceof Idea

# Это адрес?
isId = (a) -> (not isNaN(a)) and a[0] is "-"

# Это адрес?
isAd = (a) -> (not isNaN(a)) and a[0] isnt "-"

# Это строка?
isString = (a) -> typeof a is "string"

# Возможно, пригодятся функции
Object.defineProperty Idea.prototype, "data", 
	get: ->
		ret = []
		if @length > 0
			for i in [0..@length-1]
				ret.push @[i]
		ret

# Специальная процедура для вытаскивания дочерних элементов определенного типа
Idea::dta = (side=INSIDE) ->
	ret = []
	if @length > 0
		for i in [0..@length-1]
			ia = @[i]
			sd = if ia.side? then ia.side else INSIDE
			if sd is side
				ret.push ia
	ret

Object.defineProperty Idea.prototype, "prop", 
	get: ->
		res = {}
		for k,v of @
			if @hasOwnProperty(k) and isId(k) then res[k]=v
		res


# Фильтрация для объектов
Object.filter = (obj, predicate) ->
	res = {}
	for key of obj
		if obj.hasOwnProperty(key) and not predicate(obj[key])
			res[key] = obj[key]
	res

# 
Idea::has = ->
	switch arguments.length
		when 1
			@arguments[0] = yes
		when 2
			unless @[arguments[0].id]?
				@[arguments[0].id] = arguments[1]
			else if isArray(@[arguments[0].id])
				for a in @[arguments[0].id]
					@push a
			else 
				@[arguments[0].id] = [@[arguments[0].id]]
				for a in @[arguments[0].id]
					@push a
	@

# Индекс идеи
Idea::indexOf = (a,fromIndex=0) ->
	i = fromIndex
	pos = -1
	while i<@length
		if @[i] is a
			pos = i
			break
		i++
	pos

# Установить связь
Idea::set = ->
	switch arguments.length
		when 1
			if @indexOf(arguments[0]) < 0 then @push arguments[0]
		when 2
			@[arguments[0].id] = arguments[1]
	@

# Очистить все связи
Idea::clear = ->
	pos = @indexOf(arguments[0]) 
	if pos >= 0 then @remove(pos)
	if @[arguments[0].id]? then delete @[arguments[0].id]
	@

Idea::remove = (pos) ->
	delete @[i]
	if pos < @length-1
		for i in [pos..@length-2]
			@[i] = @[i+1]
			@[i].ix = i
	delete @[@length-1]
	@length--
	@


# Доделать процедуру, чтобы была правильнее 
Idea::splice = (start,deleteCount) ->
# Сначала удаляем
	delArray = []
	if deleteCount < 0 then deleteCount = 0
	if deleteCount > 0
		for ix in [start..start+deleteCount-1]
			delArray.push @[ix]
			delete @[ix] # Надо посмотреть, может быть лучше использовать дополнительно другой метод deleteIdea
		if start <= @length-1-deleteCount
			for ix in [start..@length-1-deleteCount]
				@[ix] = @[ix+deleteCount]
		@length -= deleteCount

#Теперь добавляем
	addCount = arguments.length-2
	if addCount > 0
		newlength = @length + addCount
		for ix in [@length-1..start] by -1
			@[ix+addCount] = @[ix]
		for aix in [0..addCount-1]
			@[start+aix] = arguments[2+aix]
		@length = newlength
	delArray


# Процедура добавления идеи к существующим идеям в конец списка
# idea.add "Идея"
# idea.add (add "Идея",kind:TAG)
# idea.add 0,"Идея"
# idea.add AFTER,"Идея"

# Добавление идеи вправо от последней
Idea::adr = (ia,par) ->
	ret = ia
	if arguments.length is 0
		ret = @add null
	else if arguments.length is 1
		if (typeof ia is "string") or (ia is null) or isIdea(ia)
			if @length > 0
				ret = @add @length-1,ia
			else
				ret = @add ia
		else if typeof ia is "object"
			if @length > 0
				ret = @add @length-1,null,ia
			else
				ret = @add null,ia
	else if arguments.length is 2
		ret = @add @length-1,ia,par
	ret

Idea::adf = (side,ia,par={}) ->
	ia = @add side,ia,par
	ia.frame = true
	ia

Idea::ado = (ia,par) ->
	ia = @add OUTSIDE,ia,par
	ia


Idea::add = (side,ia,par={}) ->
	# Проверяем аргументы
	if arguments.length is 0
		side = @length
		ia = null
	else if arguments.length is 1
		if (typeof side is "object") and not (side instanceof Idea)
			par = side
			side = @length
			ia = null
		else if (typeof side is "string") or ((typeof side is "object") and (side instanceof Idea))
			ia = side
			side = @length
	else if arguments.length is 2
		if ((typeof side is "string") or (side is null)) and ((typeof ia is "object") and not (ia instanceof Idea))
			par = ia
			ia = side
			side = @length
		else if (typeof side is "number")	and (typeof ia is "object") and not (ia instanceof Idea)
			par = ia
			ia = null
	else if arguments.length > 3
			console.log "Idea::add(side,ia): Число аргументов должно быть 1, 2 или 3"
			return @

	# Создаем идею, если передана строка
	if (typeof ia is "string") or (ia is null)
		ia = add ia
	# Создаем массив, если передано свойство		
	unless @[side]?
		@[side] = []

	# Заполняем массив
	if not isNaN(side) and side >= 0
		if side >= @length
			for i in [@length..side]
				@[i] = []
			@length = side+1

	# Добавляем элемент
	ia.ix = @[side].length
	ia.pa = @
	ia.sd = side
	@[side].push ia

#	ia.set par # Устанавливаем параметры
	$.extend ia,par

	ia
