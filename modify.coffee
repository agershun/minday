####################################
# Minday 0.010 Tokyo
# modify.coffee
# Утилиты для модификации идей
#####################################

#
# Clipboard - клипборд
#

clipboard = {}


#
# Добавить идею
#
# TODO: Перенести копирование атрибутов
###
Idea::addIdea = (cia, start,focus,refresh=true,child=false) ->
	unless cia? then cia = {}
	ia = add ""	# Копируем основные параметры
	ia.plain = cia.plain if cia.plain?
	ia.style = cia.style if cia.style?
	ia.class = cia.class if cia.class?
	unless child
		ia.forma = cia.forma if cia.forma?
		ia.scheme = cia.scheme if cia.scheme?
		ia.place = cia.place if cia.place?
		ia.list = cia.list if cia.list?
		ia.kind = cia.kind if cia.kind?
	else
		ia.kind = cia.childkind()

#	ia.panel = cia.panel if cia.panel?
#	ia.panelplace = cia.panelplace if cia.panelplace?
#	ia.span = cia.span if cia.span?
	ia.pa = @
#	ia.sd = side
	ia.ix = start

	if start <= @length-1
		for i in [@length..start+1] by -1
			@[i] = @[i-1]
			@[i].ix = i

	@[start] = ia
	@length++

#	@afterinsert()

	if refresh
		fia = @[focus]
		fia.upperFrame().fhtml(fia)
	ia
###
Idea::normalizeIdea = ->
	if @[BEFORE]? and @[BEFORE].length is 0 then delete @[BEFORE]
	if @[BEFORE]?
		for a,i in @[BEFORE]
			a.pa = @
			a.sd = BEFORE
			a.ix = i

	if @[AFTER]? and @[AFTER].length is 0 then delete @[AFTER]
	if @[AFTER]?
		for a,i in @[AFTER]
			a.pa = @
			a.sd = AFTER
			a.ix = i

	if @[OUTSIDE]? and @[OUTSIDE].length is 0 then delete @[OUTSIDE]
	if @[OUTSIDE]?
		for a,i in @[OUTSIDE]
			a.pa = @
			a.sd = OUTSIDE
			a.ix = i

	if @length > 0
		for aa,i in @data
			for a,j in aa
				a.pa = @
				a.sd = i
				a.ix = j
	@

deleteIdeas = (refresh=true,cut=false) ->
#	last = sidea
#	for sia in ssidea
#		if sia? 
#			last = sia.deleteIdea(false,cut)
#	if refresh
#		fidea.fhtml(last)
	sidea.deleteIdea(refresh,cut)

Idea::clearIdea = (refresh=true,cut=false) ->
	if not cut
		if @[BEFORE]?	and @[BEFORE].length > 0
			bl = @[BEFORE].length-1
			for i in [bl..0] by -1
				@[BEFORE][i].deleteIdea(false)

		if @[AFTER]? and @[AFTER].length > 0
			al = @[AFTER].length-1
			for i in [al..0] by -1
				@[AFTER][i].deleteIdea(false)
			# TODO Как удалять другие виды, OUTSIDE?

		if @length > 0
			for a in @data
				dl = a.length-1
				for i in [dl..0] by -1
					a[i].deleteIdea(false)

		@.txt = ""
	@

Idea::deleteRow = () ->
	if @sd >= 0
		sd = @sd
		pa = @pa
		ix = @ix
		pa.splice(sd,1)
		pa.normalizeIdea()
		if pa.length is 0 then ret = pa
		else 
			if sd > pa.length-1 then sd = pa.length-1
			if ix > pa[sd].length-1 then ix = pa[sd].length-1
			ret = pa[sd][ix]
		fidea.fhtml(ret)
	@

Idea::deleteColumn = () ->
	if @sd >= 0
		sd = @sd
		pa = @pa
		ix = @ix
		for j in [0..@pa.length-1]
			pa[j].splice(ix,1)
		pa.normalizeIdea()
		if pa.length is 0 then ret = pa
		else 
			if sd > pa.length-1 then sd = pa.length-1
			if ix > pa[sd].length-1 then ix = pa[sd].length-1
			ret = pa[sd][ix]
		fidea.fhtml(ret)
	@


# Удалить или вырезать идею
# refresh - обновить после удаления 
# cut - сохранять в буфере текущую идею (для реализации Ctrl-X)
Idea::deleteIdea = (refresh=true,cut=false) ->
	if @txt isnt null and $.trim(@txt) isnt ""
		# Сначала удаляем надпись в сложных идеях, и лишь потом саму идею
		if @length>0 or @[OUTSIDE]? and (@[OUTSIDE].length > 0)
			@txt = null
			ret = @
	else
		@clearIdea(refresh,cut)

		ix = @ix
		sd = @sd
		pa = @pa

		ret = pa
		if @pa?
			if (sd is BEFORE) or (sd is AFTER)
				pa[sd].splice(ix,1)
				pa.normalizeIdea()
				if (not pa[sd]?) or (pa[sd].length is 0)
					delete pa[sd] # TODO: Надо ли удалять массив?
					ret = pa
				else
					if ix > pa[sd].length-1 then ix = pa[sd].length-1
					ret = pa[sd][ix]

			else if sd >= 0
				pa[sd].splice(ix,1)
				if pa[sd].length is 0
					pa.splice(sd,1)
				pa.normalizeIdea()
				if pa.length is 0 then ret = pa
				else
					if sd > pa.length-1 then sd = pa.length-1
					if ix > pa[sd].length-1 then ix = pa[sd].length-1
					ret = pa[sd][ix]
			
	if refresh
		fidea.fhtml(ret)
	ret

# Ctrl-X
Idea::cutIdea = ->
	clipboard.idea = @ # Сохранить, если Ctrl-X
	clipboard.needClone = false
	@deleteIdea(true,true)

# Ctrl-C
Idea::copyIdea = ->
	clipboard.idea = @ # Делаем копию идеи
	clipboard.needClone = true # Пометим, что при вставке надо будет клонировать идею

# Ctrl-V
Idea::pasteIdea = (cia,start,focus,refresh=true) ->
	unless cia? then cia = {}
	ia = if clipboard.needClone? and clipboard.needClone then clipboard.idea.clone else clipboard.idea
	ia.pa = @
	ia.ix = start
	ia.plain = cia.plain if cia.plain?
	ia.list = cia.list if cia.list?

	if start <= @length-1
		for i in [@length..start+1] by -1
			@[i] = @[i-1]
			@[i].ix = i

	@[start] = ia
	@length++

	if refresh
		fia = @[focus]
		fia.upperFrame().fhtml(fia)
	@

# Ctrl-Q
Idea::duplicateIdea = ->
	if @ isnt fidea
		start = @ix+1
		focus = @ix+1
		ia = @clone
		ia.pa = @pa
		ia.ix = start
		ia.plain = @plain if @plain?
		ia.list = @list if @list?

		if start <= @pa.length-1
			for i in [@pa.length..start+1] by -1
				@pa[i] = @pa[i-1]
				@pa[i].ix = i

		@pa[start] = ia
		@pa.length++

		fia = @pa[focus]
		fia.upperFrame().fhtml(fia)
	@

