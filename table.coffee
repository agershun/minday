################################################
# MINDAY 0.008BI 
# table.coffee
# Процедуры обработки таблиц (рисование и клавиши)
################################################

#
# Утилита: установить типы для матрицы
#
Idea::kindTable = ->
	@kind = TABLE
	if @field?
		@field.kind = FIELDS
		@field.pa = @
		@field.ix = 'field'
		for ca,i in @field
			ca.kind = FIELD
			ca.pa = @field
			ca.ix = i
	for ra,i in @data
		ra.kind = RECORD
		ra.pa = @
		ra.ix = i
		for ca,j in ra
			ca.kind = VALUE
			ca.pa = ra
			ca.ix = j


#
# Навигатор таблицы
#

navi[TABLE] = (eo) ->
	if $txt.attr("contentEditable") is "true" then return navi[IDEA](eo)
	switch eo.which
		when 40, 39 # Down, Right
			if (sidea is fidea) or (not sidea.frame)
				if sidea[0]?[0]? then sidea[0][0].select() # Если нет, то идем на первую ячейку
			else
				sia = sidea 
				while sia isnt fidea and not (sia.pa[sia.ix+1]?)
					sia = sia.pa
				if sia isnt fidea then sia.pa[sia.ix+1].select()
		else navi[IDEA](eo)

navi[FIELD] = (eo) ->
	if $txt.attr("contentEditable") is "true" then return navi[IDEA](eo)
	switch eo.which
		when 40 # Down
#			if sidea.pa.pa[sidea.pa.ix][0]? then sidea.pa.pa[sidea.pa.ix][0].select()
			if ((not sidea.frame) or (sidea is fidea)) and sidea[0]? then sidea[0].select()
			else if sidea.pa.pa[0][sidea.ix]? then sidea.pa.pa[0][sidea.ix].select()
		when 38 # Up
			sidea.pa.pa.select()	
		when 37 # Left
			if sidea.pa[sidea.ix-1]? then sidea.pa[sidea.ix-1].select()
			else sidea.pa.pa.select()	
		when 39 # Right
			if sidea.pa[sidea.ix+1]? then sidea.pa[sidea.ix+1].select()
		else navi[IDEA](eo)

navi[VALUE] = (eo) ->
	if $txt.attr("contentEditable") is "true" then return navi[IDEA](eo)
	switch eo.which
		when 40 # Down
			if ((not sidea.frame) or (sidea is fidea)) and sidea[0]? then sidea[0].select()
			else if sidea.pa.pa[sidea.pa.ix+1]?[sidea.ix]? then sidea.pa.pa[sidea.pa.ix+1][sidea.ix].select()
			else if sidea.pa.pa.pa[sidea.pa.pa.ix+1]? then sidea.pa.pa.pa[sidea.pa.pa.ix+1].select()
		when 38 # Up
			if sidea.pa.pa[sidea.pa.ix-1]?[sidea.ix]? then sidea.pa.pa[sidea.pa.ix-1][sidea.ix].select()
			else if sidea.pa.pa.field?[sidea.ix]? then sidea.pa.pa.field[sidea.ix].select()
			else sidea.pa.pa.select()	
		when 37 # Left
			if sidea.pa.pa[sidea.pa.ix][sidea.ix-1]? then sidea.pa.pa[sidea.pa.ix][sidea.ix-1].select()
			else sidea.pa.pa.select()	
		when 39 # Right
			if sidea.pa.pa[sidea.pa.ix][sidea.ix+1]? then sidea.pa.pa[sidea.pa.ix][sidea.ix+1].select()
		else navi[IDEA](eo)

#
# Презентер таблицы
#

draw[TABLE] = (level) ->
	s = @htmlIdeaTxt(level)

	if (level is 0) or (level > 0 and not @frame?)

		# Начинается таблица
		s += "<table id='bag"+@id+"'>"

		# Заголовки колонок
		if @field?
			s += "<thead>"

			for ca in @field
				s += "<th id='tbl"+ca.id+"'>" 
				s += ca.draw(level+1)
				s += "</th>"
			s += "</thead>"

		# Строки с ячейками
		for ra,ri in @data
			s+="<tr>"
			# Заголовки строк

			# Ячейки
			for ca,ci in ra
				s += "<td id='tbl"+ca.id+"' "
				if @field?[ci]?.keyfield? then s+= "class='keyfield'"
				s += ">" 
				s += ca.draw(level+1)
				s += "</td>"

			s+="</tr>"
		s += "</table>"
	s += "</div>"
	s
