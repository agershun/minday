################################################
# MINDAY 0.008BI 
# matrix.coffee
# Процедуры обработки матрицы (рисование и клавиши)
################################################

#
# Утилита: установить типы для матрицы
#
Idea::kindMatrix = ->
	@kind = MATRIX
	if @corner?
		@corner.kind = CORNER
		@corner.pa = @
		@corner.ix = 0
	if @row?
		@row.kind = ROWS
		@row.pa = @
		@row.ix = 'row'
		for ra,i in @row
			ra.kind = ROW
			ra.pa = @row
			ra.ix = i
	if @column?
		@column.kind = COLUMNS
		@column.pa = @
		@column.ix = 'column'
		for ca,i in @column
			ca.kind = COLUMN
			ca.pa = @column
			ca.ix = i
	for ra,i in @data
		ra.kind = ROWCELL
		ra.pa = @
		ra.ix = i
		for ca,j in ra
			ca.kind = CELL
			ca.pa = ra
			ca.ix = j


#
# Презентер матрицы
#

draw[MATRIX] = (level) ->
	s = @startIdeaTxt(level)

	if (level is 0) or (level > 0 and not @frame?)

		# Начинается таблица
		s += "<table id='bag"+@id+"' class='normaltable'>"

		# Заголовки колонок
		if @column?
			s += "<thead>"
			if @row
				if @corner
					s += "<th id='tbl"+@corner.id+"'>" 
					s += @corner.draw(level+1)
					s += "</th>"
				else
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
	s += "</div>"
	s

# Клавиши для матрицы
down[MATRIX] = ->
	if sidea[0]?[0]? 
		return sidea[0][0] 
	else
		ria = sidea.downnext()
		if ria is null then return sidea
		else return ria
	sidea
right[MATRIX] = -> down[MATRIX].call(@)

# Клавиши для ячейки
down[CELL] = ->
	if ((not sidea.frame) or (sidea is fidea)) and sidea[0]? then return sidea[0]
	else if sidea.pa.pa[sidea.pa.ix+1]?[sidea.ix]? then return sidea.pa.pa[sidea.pa.ix+1][sidea.ix]
	else
		ria = sidea.pa.pa.downnext()
		if ria is null then return sidea
		else return ria
up[CELL] = ->
	if sidea.pa.pa[sidea.pa.ix-1]?[sidea.ix]? then return sidea.pa.pa[sidea.pa.ix-1][sidea.ix]
	else if sidea.pa.pa.column?[sidea.ix]? then return sidea.pa.pa.column[sidea.ix]
	else return sidea.pa.pa
left[CELL] = ->
	if sidea.pa.pa[sidea.pa.ix][sidea.ix-1]? then return sidea.pa.pa[sidea.pa.ix][sidea.ix-1]
	else if sidea.pa.pa[sidea.pa.ix-1]?[sidea.pa.length-1]? then return sidea.pa.pa[sidea.pa.ix-1][sidea.pa.length-1]
	else if sidea.pa.pa.row?[sidea.pa.ix]? then return sidea.pa.pa.row[sidea.pa.ix]
	else return sidea.pa.pa
right[CELL] = ->
	if sidea.pa.pa[sidea.pa.ix][sidea.ix+1]? then return sidea.pa.pa[sidea.pa.ix][sidea.ix+1]
	else if sidea.pa.pa.row?[sidea.pa.ix+1]? then return sidea.pa.pa.row[sidea.pa.ix+1]
	else if sidea.pa.pa[sidea.pa.ix+1]?[0]? then return sidea.pa.pa[sidea.pa.ix+1][0]
	else
		ria = sidea.pa.pa.downnext()
		if ria is null then return sidea
		else return ria

# Навигатор для колонки
down[COLUMN] = ->
	if ((not sidea.frame) or (sidea is fidea)) and sidea[0]? then return sidea[0]
	else if sidea.pa.pa[0]?[sidea.ix]? then return sidea.pa.pa[0][sidea.ix]
	else
		ria = sidea.pa.pa.downnext()
		if ria is null then return sidea
		else return ria
up[COLUMN] =->
	return sidea.pa.pa
left[COLUMN] =->
	if sidea.pa[sidea.ix-1]? then return sidea.pa[sidea.ix-1]
	else if sidea.pa.pa.corner? then return sidea.pa.pa.corner
	else return sidea.pa.pa
right[COLUMN] =->
	if sidea.pa[sidea.ix+1]? then return sidea.pa[sidea.ix+1]
	else if sidea.pa.pa.row?[0]? then return sidea.pa.pa.row?[0]
	else if sidea.pa.pa[0]?[0]? then return sidea.pa.pa[0][0]
	else 
		ria = sidea.pa.pa.downnext()
		if ria is null then return sidea
		else return ria

# Навигатор для строки
down[ROW] =->
	if ((not sidea.frame) or (sidea is fidea)) and sidea[0]? then return sidea[0]
	else if sidea.pa[sidea.ix+1]? then return sidea.pa[sidea.ix+1]
	else 
		ria = sidea.pa.pa.downnext()
		if ria is null then return sidea
		else return ria
up[ROW] =->
	if sidea.pa[sidea.ix-1]? then return sidea.pa[sidea.ix-1]
	else if sidea.pa.pa.corner? then return sidea.pa.pa.corner
	else return sidea.pa.pa
left[ROW] =->
	if sidea.pa.pa[sidea.ix-1]?[sidea.pa.pa.length-1]? then return sidea.pa.pa[sidea.ix-1][sidea.pa.pa.length-1]
	else if sidea.pa.pa.column?[sidea.pa.pa.column.length-1]? then return sidea.pa.pa.column[sidea.pa.pa.column.length-1]
	else if sidea.pa.pa.corner? then return sidea.pa.pa.corner
	else return sidea.pa.pa
right[ROW] =->
	if sidea.pa.pa[sidea.ix][0]? then return sidea.pa.pa[sidea.ix][0]
	else if sidea.pa[sidea.ix+1]? then return sidea.pa[sidea.ix+1]
	else 
		ria = sidea.pa.pa.downnext()
		if ria is null then return sidea
		else return ria

# Угол
up[CORNER] =-> return sidea.pa
left[CORNER] =-> 	return sidea.pa
down[CORNER] =->
	if ((not sidea.frame) or (sidea is fidea)) and sidea[0]? then return sidea[0]
	if sidea.pa.row?[0]? then return sidea.pa.row?[0]?
	else 
		ria = sidea.pa.pa.downnext()
		if ria is null then return sidea
		else return ria
right[CORNER] =->
	if sidea.pa.column?[0]? then return sidea.pa.column[0]

# Вставка
enter[CELL] =->
	sidea.ins()

# Процедурыы работы с матрицами
# Вставляем колонки после текущей
tab[CELL] =-> 
	sidea.pa.pa.insertColumn(sidea.ix+1)
	sia = sidea.pa[sidea.ix+1]
	sia.upperFrame().fhtml(sia)
# Вставить колонку до текущей
shifttab[CELL] =-> 
	sidea.pa.pa.insertColumn(sidea.ix)
	sia = sidea.pa[sidea.ix-1]
	sia.upperFrame().fhtml(sia)

# Вставляем строчки
ctrlenter[CELL] =->
	sidea.pa.pa.insertRow(sidea.pa.ix+1)
	sia = sidea.pa.pa[sidea.pa.ix+1][sidea.ix]
	sia.upperFrame().fhtml(sia)
shiftctrlenter[CELL] =->
	sidea.pa.pa.insertRow(sidea.pa.ix)
	sia = sidea.pa.pa[sidea.pa.ix-1][sidea.ix]
	sia.upperFrame().fhtml(sia)

# Очистить ячейку
del[CELL] =->
	sidea.txt = ""
	for ia in sidea.data
		ia.deleteIdea()
	sidea.upperFrame().fhtml(sidea)

ctrldel[CELL] =->
	sidea.pa.pa.deleteRow(sidea.pa.ix)
	if sidea.pa.pa[sidea.pa.ix]?[sidea.ix]? then sia = sidea.pa.pa[sidea.pa.ix][sidea.ix]
	else if sidea.pa.pa[sidea.pa.ix-1]?[sidea.ix]? then sia = sidea.pa.pa[sidea.pa.ix-1][sidea.ix]
	else if sidea.pa.pa.column?[sidea.ix]? then sia = sidea.pa.pa.column[sidea.ix]
	else sia = sidea.pa.pa
	sia.upperFrame().fhtml(sia)

altdel[CELL] =->
	sidea.pa.pa.deleteColumn(sidea.ix)
	if sidea.pa[sidea.ix] then sia = sidea.pa[sidea.ix]
	else if sidea.pa[sidea.ix-1] then sia = sidea.pa[sidea.ix-1]
	else if sidea.pa.pa.row?[sidea.pa.ix]? then sia = sidea.pa.pa.row[sidea.pa.ix]
	else sia = sidea.pa.pa
	sia.upperFrame().fhtml(sia)

Idea::deleteRow = (row) ->
	@splice(row,1)
	@kindMatrix()

Idea::deleteColumn = (col) ->
	for ri in @data
		ri.splice(col,1)
	@kindMatrix() # Устанавливаем всякие значения

Idea::insertRow = (row) ->
	# Сначала добавляем колонки
	if @row?
		@row.splice(row,0,(add ""))
	# Для каждого ряда добавляем по ячейке
	ri = add ""
	for i in [0..@[0].length-1]
		ri.push add ""
	@splice(row,0,ri)
	@kindMatrix() # Устанавливаем всякие значения


Idea::insertColumn = (col) ->
	# Сначала добавляем колонки
	if @column?
		@column.splice(col,0,(add ""))
	# Для каждого ряда добавляем по ячейке
	for ri in @data
		ri.splice(col,0,(add ""))
	@kindMatrix() # Устанавливаем всякие значения

# Изменение таблицы
Idea::addColumnHeaders = () ->
	unless @column?
		c = add ""
		for i in [0..@[0].length-1]
			c.push add ""
		@column = c
		@kindMatrix()
		sidea.upperFrame().fhtml(sidea)

Idea::addRowHeaders = () ->
	unless @row?
		r = add ""
		for i in [0..@length-1]
			r.push add ""
		@row = r
		@kindMatrix()
		sidea.upperFrame().fhtml(sidea)
	
navi[MATRIX] = (eo) ->
	if eo.which is 72 and eo.ctrlKey and eo.altKey then sidea.addColumnHeaders() # Ctrl-Alt-H
	else if eo.which is 81 and eo.ctrlKey and eo.altKey then sidea.addRowHeaders() # Ctrl-Alt-R
	else navi[IDEA](eo)

navi[CELL] = (eo) ->
	if eo.which is 72 and eo.ctrlKey and eo.altKey then sidea.pa.pa.addColumnHeaders() # Ctrl-Alt-H
	else if eo.which is 81 and eo.ctrlKey and eo.altKey then sidea.pa.pa.addRowHeaders() # Ctrl-Alt-R
	else navi[IDEA](eo)

downnext[CELL] = ->
	if @ is fidea then return null
	if @pa?.pa?[@pa.ix+1]?[@ix]? then return @pa.pa[@pa.ix+1][@ix]
	else
		return @pa.pa.downnext()
	@

childkind[CELL] =-> IDEA