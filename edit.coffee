################################################
# MINDAY 0.009Tu
# edit.coffee
# Работа с меню Правка
################################################

# Устанавливаем ссылки на меню
setMenuEdit = ->
	$(".edit_undo").click editUndo
	$(".edit_redo").click editRedo
	$(".edit_cut").click editCut
	$(".edit_copy").click editCopy
	$(".edit_paste").click editPaste
	$(".edit_duplicate").click editDuplicate
	$(".edit_delete").click editDelete
	$(".edit_select_all").click editSelectAll
	$(".edit_text").click editText
	$(".edit_forma").click editForma
	$(".edit_scheme").click editScheme
	$(".edit_place").click editPlace
	$(".edit_kind").click editKind
	$(".edit_find").click editFind

# Меню по умолчанию
editUndo = ->
	alert "Эта функция программы будет реализована в следующих версиях"

editRedo = ->
	alert "Эта функция программы будет реализована в следующих версиях"

editCut = ->
	sidea.cutIdea()

editCopy = ->
	sidea.copyIdea()

editPaste = ->
	sidea.pa.pasteIdea(sidea,sidea.ix,sidea.ix,true)

editDuplicate = ->
	sidea.duplicateIdea()

editDelete = ->
	sidea.del()

editSelectAll = ->
	alert "Эта функция программы будет реализована в следующих версиях"

editText = ->
	startEdit(false)

editForma = ->
	if sidea.forma?
		fi = shapes.indexOf(sidea.forma)
		if fi < -1 then fi = 0
	else
		fi = 0
#	console.log  fi
	sidea.forma = shapes[(fi+1) % shapes.length]
	redraw()

# TODO: Доделать, чтобы работал
editScheme = ->
	shh = [WHITE,BLUE,LIGHTBLUE,GREEN,YELLOW,RED,BLACK]
	if sidea.scheme?
		fi = shh.indexOf(sidea.scheme)
		if fi < -1 then fi = 0
	else
		fi = 0
#	console.log  fi
	sidea.scheme = shh[(fi+1) % shh.length]
	redraw()

editPlace = ->
	if sidea.place?
		if sidea.place is TXT then sidea.place = BAG
		else if sidea.place is BAG then sidea.place = TBL
		else if sidea.place is TBL then sidea.place = TXT
		else delete sidea.place
	else
		sidea.place = TXT
	redraw()

editKind = ->
	ki = kkind.indexOf(sidea.kind)
	if ki < 0 then ki = 0
	else ki = (ki+1) % kkind.length

	sidea.kind = kkind[ki]
	redraw()
	$('#bag'+sidea.id).qtip 
		content:kkindname[ki]
		show:
			event:false
			ready:true

editKindReverse = ->
	ki = kkind.indexOf(sidea.kind)
	if ki <= 0 then ki = kkind.length-1
	else ki = (ki-1) % kkind.length

	sidea.kind = kkind[ki]
	redraw()
	$('#bag'+sidea.id).qtip 
		content:kkindname[ki]
		show:
			event:false
			ready:true
			solo:yes

editFind = ->
		$('#input_search').focus()
