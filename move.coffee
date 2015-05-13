####################################
#
# move.coffee - перемещение между ячейками
#
####################################


#afterinsert = {}


#down = {}
#up = {}
#left = {}
#right = {}
#altdown = {}
#altup = {}
#altleft = {}
#altright = {}

editenter = {}

#enter = {}
#ctrlenter = {}
#shiftctrlenter = {}
#ins = {}
#tab = {}
#shifttab = {}
#ctrltab = {}
#shiftctrltab = {}
#del = {}
#ctrldel = {}
#shiftdel = {}
#altdel = {}
#pgup = {}
#pgdn = {}
#home = {}
#end = {}
#space = {}
#backspace = {}
#f2 = {}
#f5 = {}
#shiftf5 = {}
#esc = {}

downnext = {}

childkind = {} # Какие создавать дочерние идеи по умолчанию
childsd = {} # В какую сторону ставить по-умолчанию

childkind[IDEA] =-> IDEA # Дочерний элемент по умолчанию при нажатии клавиши Ins

#Idea::down = -> if down[@kind]? then down[@kind]?.call(@) else down[IDEA]?.call(@)
#Idea::up = -> if up[@kind]? then up[@kind]?.call(@) else up[IDEA]?.call(@)
#Idea::left = -> if left[@kind]? then left[@kind]?.call(@) else left[IDEA]?.call(@)
#Idea::right = -> if right[@kind]? then right[@kind]?.call(@) else right[IDEA]?.call(@)
#Idea::altdown = -> if altdown[@kind]? then altdown[@kind]?.call(@) else altdown[IDEA]?.call(@)
#Idea::altup = -> if altup[@kind]? then altup[@kind]?.call(@) else altup[IDEA]?.call(@)
#Idea::altleft = -> if altleft[@kind]? then altleft[@kind]?.call(@) else altleft[IDEA]?.call(@)
#Idea::altright = -> if altright[@kind]? then altright[@kind]?.call(@) else altright[IDEA]?.call(@)
#Idea::enter = -> if enter[@kind]? then enter[@kind]?.call(@) else enter[IDEA]?.call(@)
#Idea::ctrlenter = -> if ctrlenter[@kind]? then ctrlenter[@kind]?.call(@) else ctrlenter[IDEA]?.call(@)
#Idea::shiftctrlenter = -> if shiftctrlenter[@kind]? then shiftctrlenter[@kind]?.call(@) else shiftctrlenter[IDEA]?.call(@)
#Idea::ins = -> if ins[@kind]? then ins[@kind]?.call(@) else ins[IDEA]?.call(@)
#Idea::tab = -> if tab[@kind]? then tab[@kind]?.call(@) else tab[IDEA]?.call(@)
#Idea::shifttab = -> if shifttab[@kind]? then shifttab[@kind]?.call(@) else shifttab[IDEA]?.call(@)
#Idea::ctrltab = -> if ctrltab[@kind]? then ctrltab[@kind]?.call(@) else ctrltab[IDEA]?.call(@)
#Idea::shiftctrltab = -> if shiftctrltab[@kind]? then shiftctrltab[@kind]?.call(@) else shiftctrltab[IDEA]?.call(@)
#Idea::del = -> if del[@kind]? then del[@kind]?.call(@) else del[IDEA]?.call(@)
#Idea::ctrldel = -> if ctrldel[@kind]? then ctrldel[@kind]?.call(@) else ctrldel[IDEA]?.call(@)
#Idea::altdel = -> if altdel[@kind]? then altdel[@kind]?.call(@) else altdel[IDEA]?.call(@)
#Idea::shiftdel = -> if shiftdel[@kind]? then shiftdel[@kind]?.call(@) else shiftdel[IDEA]?.call(@)
#Idea::pgdn = -> if pgdn[@kind]? then pgdn[@kind]?.call(@) else pgdn[IDEA]?.call(@)
#Idea::pgup = -> if pgup[@kind]? then pgup[@kind]?.call(@) else pgup[IDEA]?.call(@)
#Idea::home = -> if home[@kind]? then home[@kind]?.call(@) else home[IDEA]?.call(@)
#Idea::end = -> if end[@kind]? then end[@kind]?.call(@) else end[IDEA]?.call(@)
#Idea::f2 = -> if f2[@kind]? then f2[@kind]?.call(@) else f2[IDEA]?.call(@)
#Idea::f5 = -> if f5[@kind]? then f5[@kind]?.call(@) else f5[IDEA]?.call(@)
#Idea::shiftf5 = -> if shiftf5[@kind]? then shiftf5[@kind]?.call(@) else shiftf5[IDEA]?.call(@)
#Idea::space = -> if space[@kind]? then space[@kind]?.call(@) else space[IDEA]?.call(@)
#Idea::backspace = -> if backspace[@kind]? then backspace[@kind]?.call(@) else backspace[IDEA]?.call(@)
#Idea::esc = -> if esc[@kind]? then esc[@kind]?.call(@) else esc[IDEA]?.call(@)
Idea::childkind = -> if childkind[@kind]? then childkind[@kind]?.call(@) else childkind[IDEA]?.call(@)

#Idea::afterinsert = -> if afterinsert[@kind]? then afterinsert[@kind]?.call(@) else afterinsert[IDEA]?.call(@)
#afterinsert[IDEA] =->

# Специальный случай
#Idea::editenter = -> if editenter[@kind]? then editenter[@kind]?.call(@) else editenter[DEFAULT]?.call(@)
# Для перемещения по ячейкам
Idea::downnext = -> if downnext[@kind]? then downnext[@kind]?.call(@) else downnext[DEFAULT]?.call(@)

keyp[DEFAULT][ALT+KEY_LEFT] =->
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

keyp[DEFAULT][ALT+KEY_RIGHT] =->
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

keyp[DEFAULT][ALT+KEY_DOWN] =->
	if @ isnt fidea
		if @pa[@sd+1][@ix]? 
			ia = @
			sd = @sd
			pa = @pa
			ix = @ix

			ia2 = @pa[@sd+1][@ix]

			pa[sd+1][ix] = ia
			pa[sd][ix] = ia2
			pa.normalizeIdea()
			redraw(ia)

keyp[DEFAULT][ALT+KEY_UP] =->
	if @ isnt fidea
		if @pa[@sd-1][@ix]? 
			ia = @
			sd = @sd
			pa = @pa
			ix = @ix

			ia2 = @pa[@sd-1][@ix]

			pa[sd-1][ix] = ia
			pa[sd][ix] = ia2
			pa.normalizeIdea()
			redraw(ia)


###
keyp[DEFAULT][ALT+KEY_DOWN] =->
#altdown[IDEA] = ->
	if @ isnt fidea and @pa.length > 1 and @ix < @pa.length-1
		ix = @ix
		ia = @pa[ix+1]
		@pa[ix+1] = @
		@pa[ix] = ia
		@pa[ix].ix = ix 
		@pa[ix+1].ix = ix+1
	@ 

keyp[DEFAULT][ALT+KEY_UP] =->
#altup[IDEA] = ->
	if @ isnt fidea and @pa.length > 1 and @ix > 0
		ix = @ix
		ia = @pa[ix-1]
		@pa[ix-1] = @
		@pa[ix] = ia
		@pa[ix].ix = ix 
		@pa[ix-1].ix = ix-1
	@ 

keyp[DEFAULT][ALT+KEY_LEFT] =->
#altleft[IDEA] = ->
	if @ isnt fidea and @pa isnt fidea
		if @frame? and @ix isnt @pa.length-1 then return @	# Если это фрейм, то можно переносить только последний элемент
																				# Чтобы не переносить детей
		ia = @
		iapa = @pa
		iapapa = @pa.pa
		ix = @ix
		paix = @pa.ix

		# Освобождаем место под текущую идею сверху
		if paix < iapapa.length-1
			for i in [iapapa.length-1..paix+1] by -1
				iapapa[i+1] = iapapa[i]
				iapapa[i+1].ix = i+1
				iapapa[i+1].pa = iapapa
		iapapa.length++

		# Берем форматирование из предыдущего элемента
		iapapa[paix+1] = ia
		ia.pa = iapapa
		ia.ix = paix+1
		if iapapa[paix]?
			if iapapa[paix].plain? then ia.plain = iapapa[paix].plain else delete ia.plain
			if iapapa[paix].list? then ia.list = iapapa[paix].list else delete ia.list

		# Переносим оставшиеся элементы как дочерние в текущий элемент
		if ix < iapa.length-1
			j = ia.length
			for i in [ix+1..iapa.length-1]
				ia[j]=iapa[i]
				ia[j].pa = ia
				ia[j].ix = j
				j++
				iapa[i] = null
				delete iapa[i]
			ia.length = j
		iapa.length = ix
	@

keyp[DEFAULT][ALT+KEY_RIGHT] =->
#altright[IDEA] = ->
	if @ isnt fidea 
		if @ix > 0 and not @pa[@ix-1].frame? # Мы не переносим первый элемент, так как он и так уже дочерний
			ix = @ix
			mia = @pa[@ix-1] 	# Предыдущий элемент, под который мы переносим текущий
			j = mia.length 		# Позиция для элемента
			pa = @pa

			# Копируем форматирование у последноего дочернего элемента предыдущего элемента
			if mia[j-1]?
				if mia[j-1].plain? then @plain = mia[j-1].plain else delete @plain
				if mia[j-1].list? then @list = mia[j-1].list else delete @list

			# Переносим элемент
			mia[j] = @
			@.pa = mia
			@.ix = j
			mia.length++
			j++

			# Теперь решаем, что делать с хвостом...
			if ix < pa.length-1
				for i in [ix..pa.length-2]
					pa[i] = pa[i+1]
					pa[i].ix = i
			pa.length--

			# Делаем дочерние элементы - дочерними элементами предыдущего
			if @length > 0 
				for i in [0..@length-1]
					mia[j] = @[i]
					mia[j].pa = mia
					mia[j].ix = j
					mia.length++
					j++
					delete @[i]
				@length = 0
	@

# TODO: Разобраться, нужны ли эти процедуры

Idea::top = () ->
	if @[TOP]?[0]? then @[TOP][0].top() else @

Idea::bottom = ->
	if @[BOTTOM]?[@[BOTTOM].length-1]? then @[BOTTOM][@[BOTTOM].length-1].bottom()
	else if @length > 0 and @[@length-1]?[0]? then @[@length-1][0].bottom()
	else if @[INSIDE]?[@[INSIDE].length-1]? then @[INSIDE][@[INSIDE].length-1].bottom()
	else @
###
downnext[DEFAULT] = ->
	if @ is fidea then return null
	if @pa?
		if @pa.intype is TABLE then	return @tbxDown()
		else if @pa[@sd+1]?[@ix]? then return @pa[@sd+1][@ix]
		else if @pa[@sd+1]?[@pa[@sd+1].length-1]? then return @pa[@sd+1][@pa[@sd+1].length-1]
		else return @pa.downnext()
	@

keyp[DEFAULT][KEY_DOWN] =->
	if sidea is fidea
		if @[0]?[0]? then return @[0][0].select() else return @
	else
		if not @frame? and @[0]?[0]? then return @[0][0].select()
		else if (dnn=@downnext())? then return dnn.select()
	@

#keyp[DEFAULT][KEY_DOWN] =->
#	if sidea is fidea
#		if @[INSIDE]? and @[INSIDE].length > 0 then return @[INSIDE][0].top().select() else return @
#	else
#		if not @frame? and @[INSIDE]?[0]? then return @[INSIDE][0].top().select()
#		else if @[0]?[0]? then return @[0][0].top().select()
#		else if @[OUTSIDE]?[0]? then return @[OUTSIDE][0].top().select()
#		else return @next().select()
#	@

#Idea::prev = ->
#	if @sd < 0 and @pa[@sd]?[@ix-1]? then return @pa[@sd][@ix-1].bottom()
#	else if @[TOP]?[@[TOP].length-1]? then return @[TOP][@[TOP].length-1].bottom()
#	else if @sd is TOP then return @pa.pa
#	else if @sd is INSIDE 
#		return @pa
#	else if @sd is LEFT or @sd is RIGHT or @sd is BEFORE or @sd is AFTER
#		if @pa[TOP]?[@pa[TOP].length-1]? then return @pa[TOP][@pa[TOP].length-1].bottom()
#		else return @pa
#	else if @sd is BOTTOM
#		if @pa.length? and @pa[@pa.length-1]?[0]? then return @pa[@pa.length-1][0]
#		else if @pa[INSIDE]?[@pa[INSIDE].length-1]? then return @pa[INSIDE][@pa[INSIDE].length-1].bottom()
#		else if @pa[TOP]?[@pa[TOP].length-1]? then return @pa[TOP][@pa[TOP].length-1].bottom()
#		else return @pa
#	else if @sd >= 0
#		if @pa[@sd-1]?[@ix]? then return @pa[@sd-1][@ix]
#		else if @pa[INSIDE]?[@pa[INSIDE].length-1]? then return @pa[INSIDE][@pa[INSIDE].length-1].bottom()
#		else if @pa[TOP]?[@pa[TOP].length-1]? then return @pa[TOP][@pa[TOP].length-1].bottom()
#		else return @pa.prev()
#	else if @sd is OUTSIDE
#		return @pa.pa.bottom()
#	@

Idea::bottommost = () ->
	if @frame? then return @
#	else if @[@length-1]?[@[@length-1].length-1]? then return @[@length-1]?[@[@length-1].length-1].bottommost()
	else if @[@length-1]?[0]? then return @[@length-1]?[0].bottommost()
	else return @

keyp[DEFAULT][KEY_UP] =->
	if sidea is fidea then return @
	else
		if @sd >= 0
			if @pa.intype is TABLE and (up=@tbxUp())? then	return up.select()
			else if @pa[@sd-1]?[@ix]? then return @pa[@sd-1][@ix].bottommost().select()
			else if @pa[@sd-1]? then return @pa[@sd-1][@[@sd-1].length-1].bottommost().select()
			else return @pa.select()
		else
			if @pa.pa? then return @pa.pa.select()

	@

#Idea::rightmost = () ->
#	if @[AFTER]?[@[AFTER].length-1]? then return @[AFTER][@[AFTER].length-1].rightmost()
#	else return @

Idea::bottomrightmost = () ->
	if @length > 0
		return @[@length-1][@[@length-1].length-1].bottomrightmost()
	else return @

keyp[DEFAULT][KEY_LEFT] =->
	if @ is fidea then return @
	else if @pa.intype is TABLE then return @tbxLeft().select()
	else if @sd is 0 and @ix is 0 then return @pa.select()
	else if @sd >= 0
		# TODO: Нужно ли здесь bottommost? 
		# Может быть сделать флаг?
#		if @pa[@sd]?[@ix-1]? then return @pa[@sd][@ix-1].bottommost().rightmost().select() 
		if @pa[@sd]?[@ix-1]? then return @pa[@sd][@ix-1].select() 
		else if @pa[@sd-1]?[@pa[@sd-1].length-1]? then return @pa[@sd-1][@pa[@sd-1].length-1].bottomrightmost().select()
		else return @pa.select()
	else return @pa.select()

#	else if @[LEFT]?[@[LEFT].length-1]? then return @[LEFT][@[LEFT].length-1].select() #righttest
#	else if @sd is TOP or @sd is LEFT or @sd is OUTSIDE then return @pa.pa.bottom().select()
#	else if @sd is RIGHT
#		if @pa[AFTER]?[@pa[AFTER].length-1]? then return @pa[AFTER][@pa[AFTER].length-1].select() #righttest
#		else @pa.select()
#	else if @sd is BOTTOM 
#		if @pa[RIGHT]?[@pa[RIGHT].length-1]? then return @pa[RIGHT][@pa[RIGHT].length-1].select() #righttest
#		if @pa[AFTER]?[@pa[AFTER].length-1]? then return @pa[AFTER][@pa[AFTER].length-1].select() #righttest
#		else return @pa.select()
#	else if @sd >= 0
#		if @pa[@sd]?[@ix-1]? then return @pa[@sd][@ix-1].select() #righttest
#		else if @pa[@sd-1]?[@pa[@sd-1].length-1]? then return @pa[@sd-1][@pa[@sd-1].length-1].select()
	@

Idea::rightnext = () ->
	if @pa?
		if @pa.intype is TABLE and (rn=@tbxRight())? then	return rn
		else if @pa[@sd]?[@ix+1]? then return @pa[@sd][@ix+1]
		else if @pa[@sd+1]?[0]? then return @pa[@sd+1][0]
		else if @pa[@sd+1]? then return @pa[@sd+1][@pa[@sd+1].length-1]
		else return @pa.rightnext()
	null

Idea::leftnext = () ->
	if @pa?
		if @pa.intype is TABLE and (rn=@tbxLeft())? then	return rn
		else if @pa[@sd]?[@ix-1]? then return @pa[@sd][@ix-1]
		else if @pa[@sd-1]?[0]? then return @pa[@sd-1][0]
		else if @pa[@sd-1]? then return @pa[@sd+1][@pa[@sd-1].length-1]
		else return @pa.leftnext()
	@


keyp[DEFAULT][KEY_RIGHT] =->
	if @ is fidea
		if @[0]?[0]? then return @[0][0].select()
		else return @
	else if @pa.intype is TABLE and (rn=@tbxRight())? then return rn.select()
	else if @pa[@sd]?[@ix+1]? then return @pa[@sd][@ix+1].select()
	else if @[0]?[0]? then return @[0][0].select()
	else if @sd >= 0
		if @pa[@sd]?[@ix+1]? then return @pa[@sd][@ix+1].select()
		else if @pa[@sd+1]?[0]? then return @pa[@sd+1][0].select() #righttest
		else if @pa.rightnext()? then return @pa.rightnext().select()
	else if @[0]?[0]? then return @[0][0].select() # Непонятно, надо ли?
	@



###
#down[IDEA] = ->
#	if (sidea is fidea) or not @frame? and @length > 0
#		return @[0]
#	else if @list? and @list is SPAN and @pa[@ix+1]?
#		if @pa[@ix+1].list? and @pa[@ix].list is SPAN
#			return down[IDEA].call(@pa[@ix+1])
		else
			return @pa[@ix+1]
	else 
		ria = @downnext()
		if ria is null then return @
		else return ria
	@


#up[IDEA] = -> keyp[DEFAULT][KEY_UP].call(@)

#	keyp[DEFAULT][KEY_UP] = -> 
up[IDEA] = ->
	unless sidea is fidea
		if @list? and (@list is SPAN or @list is TD or @list is TH) then return @pa
		if @pa?
			if @ix > 0
				ret = @pa[@ix-1].uplast()
				if ret.kind is CELL then return ret.pa[0]  # Специальная поправка для матрицы
				return ret
			else
				return @pa
	@
###

Idea::uplast = ->
	if not @frame and @length>0 then return @[@length-1].uplast()
	@

###
left[IDEA] = ->
	unless sidea is fidea
#		if @list? and @list is SPAN then return @pa
		if @pa?
			if @ix > 0
				ret = @pa[@ix-1].uplast()
				if ret.kind is CELL then return ret.pa[0]  # Специальная поправка для матрицы
				return ret
			else
				return @pa
	@

right[IDEA] = ->
	if (sidea is fidea) or not @frame? and @length > 0
		return @[0]
#	else if @list? and @list is SPAN
#		ria = @pa.downnext()
#		if ria is null then return @
#		else return ria
	else 
		ria = @downnext()
		if ria is null then return @
		else return ria
	@

enter[IDEA] = ->
	keyp[DEFAULT][KEY_ENTER].call(@)  # TODO: Удалить потом


tab[IDEA] =-> 
	# TODO: Ничего не делать, может быть потом создавать матрицу

###

editenter[IDEA] =-> keye[DEFAULT][KEY_ENTER].call(@)

editenter[DEFAULT] =->
	finishEdit()

# Редактирование
keyp[DEFAULT][KEY_F2] =->
#f2[IDEA] =->
	if $txt.attr("contentEditable") is "true"
		finishEdit()
	else
		if not sidea.readonly?
			if not sidea.pa? or not sidea.pa.childreadonly?
				startEdit()

#keyp[DEFAULT][KEY_PGUP] =->
#pgup[IDEA] =->
#	if fidea isnt idea[0]
#		fidea.upperFrame(sidea).fhtml(sidea)

#keyp[DEFAULT][KEY_PGDN] =->
#pgdn[IDEA] =->
#	if sidea.frame?
#		sidea.fhtml()
	

# Новая обработка клавиш
keyp[DEFAULT][KEY_F2] = -> editText() 
keyp[DEFAULT][KEY_F3] = -> editForma() 
keyp[DEFAULT][SHIFT+KEY_F3] =-> editScheme()
keyp[DEFAULT][ALT+KEY_F3] =-> editPlace()
keyp[DEFAULT][KEY_F4] = -> editKind() 
keyp[DEFAULT][SHIFT+KEY_F4] = -> editKindReverse() 

keyp[DEFAULT][KEY_TAB] = -> insertRightIdea()
keyp[DEFAULT][CTRL+KEY_TAB] = -> insertRightIdea()
keyp[DEFAULT][SHIFT+KEY_TAB] = -> insertLeftIdea()
keyp[DEFAULT][SHIFT+KEY_ENTER] = -> insertUpIdea()
keyp[DEFAULT][CTRL+KEY_ENTER] = -> insertDownIdea()

keyp[DEFAULT][SHIFT+ALT+TAB] = -> insertLeftColumn()
keyp[DEFAULT][CTRL+ALT+TAB] = -> insertRightColumn()
keyp[DEFAULT][SHIFT+ALT+KEY_ENTER] = -> insertUpRow()
keyp[DEFAULT][CTRL+ALT+KEY_ENTER] = -> insertDownRow()

keyp[DEFAULT][KEY_INSERT] =-> insertChildIdea()	
keyp[DEFAULT][ALT+KEY_INSERT] =-> insertAltChildIdea()	
keyp[DEFAULT][SHIFT+KEY_INSERT] =-> insertBeforeIdea()	
keyp[DEFAULT][CTRL+KEY_INSERT] =-> insertAfterIdea()	

keyp[DEFAULT][KEY_DELETE] =->	deleteIdeas() # Удаляем выделенные идеи
keyp[DEFAULT][SHIFT+KEY_DELETE] =->	sidea.deleteRow() # Удаляем выделенные идеи
keyp[DEFAULT][ALT+KEY_DELETE] =->	sidea.deleteColumn() # Удаляем выделенные идеи


keyp[DEFAULT][CTRL+KEY_1] = -> formatSpan()  		#TODO переделать в @duplicate() - если нужно
keyp[DEFAULT][CTRL+KEY_2] = -> formatTH()  		#TODO переделать в @duplicate() - если нужно
keyp[DEFAULT][CTRL+KEY_3] = -> formatTD()  		#TODO переделать в @duplicate() - если нужно
keyp[DEFAULT][CTRL+KEY_4] = -> formatSticker()  		#TODO переделать в @duplicate() - если нужно
keyp[DEFAULT][CTRL+KEY_0] = -> editDuplicate()  #TODO переделать в @duplicate() - если нужно
keyp[DEFAULT][CTRL+KEY_B] = -> formatBold()  		#TODO сделать независимым от меню
keyp[DEFAULT][CTRL+KEY_C] = -> editCopy() 	 		#TODO сделать независимым от меню
keyp[DEFAULT][CTRL+KEY_F] = -> editFind()
keyp[DEFAULT][CTRL+KEY_I] = -> formatItalic()		#TODO сделать независимым от меню
keyp[DEFAULT][CTRL+KEY_N] = -> fileNew()
keyp[DEFAULT][CTRL+KEY_O] = -> fileOpen()
keyp[DEFAULT][CTRL+KEY_S] = -> fileSave()
keyp[DEFAULT][CTRL+KEY_U] = -> formatUnderline()
keyp[DEFAULT][CTRL+KEY_V] = -> editPaste() 
keyp[DEFAULT][CTRL+KEY_X] = -> editCut() 
keyp[DEFAULT][CTRL+KEY_Z] = -> editUndo() 
keyp[DEFAULT][CTRL+KEY_Y] = -> editRedo() 

keyp[DEFAULT][CTRL+SHIFT+KEY_ENTER] = -> insertBeforeIdea()

keyp[DEFAULT][ALT+KEY_ENTER] = -> formatFrame()
keyp[DEFAULT][ALT+KEY_C] = -> formatCheckbox()
keyp[DEFAULT][ALT+KEY_E] = -> textCenter()
keyp[DEFAULT][ALT+KEY_L] = -> formatLineThrough()
keyp[DEFAULT][ALT+KEY_O] = -> formatOL()
keyp[DEFAULT][ALT+KEY_P] = -> formatPlain()
keyp[DEFAULT][ALT+KEY_R] = -> formatReadOnly()
keyp[DEFAULT][ALT+KEY_U] = -> formatUL()
keyp[DEFAULT][ALT+KEY_Y] = -> formatYesNo()

keyp[DEFAULT][CTRL+ALT+KEY_B] = -> insertTabs()
keyp[DEFAULT][CTRL+ALT+KEY_D] = -> formatBorder()
keyp[DEFAULT][CTRL+ALT+KEY_I] = -> insertMindmap()
keyp[DEFAULT][CTRL+ALT+KEY_G] = -> insertGantt()
keyp[DEFAULT][CTRL+ALT+KEY_M] = -> insertMatrix()
keyp[DEFAULT][CTRL+ALT+KEY_W] = -> insertTree()



keyp[DEFAULT][KEY_ENTER] = ->
	if @run?
		if typeof @run is "string" then return eval(@run)
		else if typeof @run is "function" then @run.call(@)
		
	if @ is idea[0] and @length is 0
		unless @noenter? or @readonly? or @pa?.childreadonly?
			if prevKey is KEY_ENTER
				insertChildIdea()

	else if @url?
		window.open @url,"_blank"
		
		# TODO: Где-то тут есть ошибка, выдает noselect
#		redraw()

	else if @goto?
		gia = @goto
		if isId(gia) then gia = idea[-gia] # Если это лишь id идеи
		if gia.frame?
			gia.fhtml(gia)
		else
			gia.upperFrame().fhtml(gia)

	else if @frame?
		if @ is fidea
			if @ is idea[0]
				if @length is 0 then insertChildIdea()
			else
				@upperFrame().fhtml(@)
		else
			@fhtml()

	else 
		unless @noenter? or @readonly? or @pa?.childreadonly? or readonly
			if prevKey is KEY_ENTER
				if @pa.intype? and @pa.intype is TABLE and @sd >= 0
					if @sd is @pa.length-1
						ia = insertDownRow()
						# TODO: Расширить список копируемых параметров						
						ia.list = sidea.list if sidea.list?
					else
						if @pa[@sd+1]?[@ix]? then @pa[@sd+1][@ix].select()
				else
					ia = insertDownIdea()  # Если не установлен флаг noenter
					ia.list = sidea.list if sidea.list?
					ia.select()

keye[DEFAULT][KEY_ENTER] = ->
	finishEdit()
	unless @noenter? or @readonly? or @pa?.childreadonly?
		if prevKey is KEY_ENTER
			insertDownIdea()  # Если не установлен флаг noenter


keyp[DEFAULT][SHIFT+KEY_F11] =->
	viewFullScreen()

keyp[DEFAULT][KEY_ESC] =->
	# Нажастие ESC вываливает из подсказки, а затем из full-screen режима
	if currentModel isnt "minday"
		selectModel("minday",true)
	else 
#	if $('#navbar').css("display") is "none"
		viewFullScreen()


#############################
# Перемещение с историей
#############################
history = []
backFlag = no

backHistory =->
	if history.length > 0
		hi = history.length-2
		while (not history[hi]?) and hi > 0
			hi--
		if history[hi]?
			his = history.pop()
			backFlag = yes
			his.upperFrame().fhtml(his)

saveHistory =->
	unless backFlag 
		history.push sidea
	backFlag = no


keyp[DEFAULT][ALT+KEY_BACKSPACE] =->
	backHistory()

# Для клавиш.
keyp[BUTTON] = {}
# TODO Создать отдельный файл

# Специальные случаи
keyp[BUTTON][KEY_ENTER] =->
	if @run? then @run()
	if @goto? then @goto.upperFrame().fhtml(@goto)


# Для SVG объектов
ideaClick = (eo) ->
	id = @data("id")
	alert id
	finishEdit()
	idea[id].select()
	if id is sidea.id
		startEdit()
	eo.preventDefault()

# Переход на начало модели
keyp[DEFAULT][CTRL+KEY_HOME] =-> 
	idea[0].fhtml()

keyp[DEFAULT][ALT+KEY_F1] =->
	if currentModel is "minday"
		updateModel("minday",fidea,sidea)
	selectModel("help-interface",true)

