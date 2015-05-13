################################################
# MINDAY 0.008BI 
# navi.coffee
# Навигаторы
################################################

window.shiftKey = no
prevKey = KEY_SPACE
navi = {}

redrawEvent = (eo) ->
	fidea.fhtml(sidea)


redraw = (sia) ->
	if arguments.length is 0
		sia = sidea
	if sia?
		fidea.fhtml(sia)

$(window).keyup (eo) ->
	prevKey = eo.which # Сохраняем для реакции на двойное нажатие Enter
	if (KEY_0 <= eo.which <= KEY_Z or 185 < eo.which < 223 or eo.which is KEY_BACKSPACE or eo.which is KEY_SPACE or eo.which is KEY_DELETE) and (not eo.altKey) and (not eo.ctrlKey)
		if searchStatus is on
			ss = $('#input_search').val()
			s = ''
			for ia in idea
				if ia.txt?
					pos = ia.txt.search(ss)
					if pos > -1
						s += "<p><a href='#' id='a"+ia.id+"' class='aidea'>"
						s += ia.txt.substr(0,pos)+"<b>"+ia.txt.substr(pos,ss.length)+"</b>"+ia.txt.substr(pos+ss.length)
						s += " ("+ia.upperFrame().txt+")"+"</p>"
			$("#dialog_open").html s
			$('.aidea').click (eo) ->
				sia = idea[-eo.srcElement.id.substr(1)]
				sia.upperFrame().fhtml(sia)

$(window).keydown (eo) ->
	if sidea? and navi[sidea.kind]? then ret = navi[sidea.kind](eo) 
	else if sidea.sd? and navi[sidea.sd]? then ret = navi[sidea.sd](eo) 
	else ret = navi[IDEA](eo)
	ret

stateEdit =-> $txt.attr("contentEditable") is "true"

navi[IDEA] = (eo) ->
	if searchStatus is on
		return true

	window.shiftKey = eo.shiftKey # Нужно для выделения со стрелочками

	# Новый алгоритм обработки нажатий клавиш
	kcode = eo.which
	kcode += SHIFT if eo.shiftKey
	kcode += CTRL if eo.ctrlKey
	kcode += ALT if eo.altKey

	if stateEdit()
		if keye[sidea.kind]?[kcode]? 
			keye[sidea.kind][kcode].call(sidea) 
			eo.preventDefault()
			return false
		else if keye[DEFAULT]?[kcode]? 
			keye[DEFAULT][kcode].call(sidea) 
			eo.preventDefault()
			return false
	else
		if keyp[sidea.kind]?[kcode]? 
			finishEdit()
			keyp[sidea.kind][kcode].call(sidea) 
			eo.preventDefault()
			return false
		else if keyp[DEFAULT][kcode]? 
			finishEdit()
			keyp[DEFAULT][kcode].call(sidea) 
			eo.preventDefault()
			return false

	# Старый алгоритм обработки клавиш

	# Если это буква или цифра, то начинаем редактирование. 
	# Два диапазона даны для цифр, латинских и русских букв
	if (KEY_0 <= eo.which <= KEY_Z or 185 < eo.which < 223) and (not eo.altKey) and (not eo.ctrlKey)
		if $txt.attr("contentEditable") isnt "true"
			if not sidea.readonly? and not sidea.pa?.childreadonly?
				startEdit(true)

startEdit = (selectText=false) ->
	if sidea.txt is "" or sidea.txt is null
		$txt.html "&nbsp;"
	else
		$txt.html sidea.txt
	$("#lvl"+sidea.id).removeClass "display-none"
	$txt.addClass "edit-txt"
	$txt.attr "contentEditable", "true"
	$txt.focus()
	if selectText 
		if window.getSelection and document.createRange
			range = document.createRange()
			range.selectNodeContents($txt[0])
			sel = window.getSelection()
			sel.removeAllRanges()
			sel.addRange(range)
		else if (document.body.createTextRange)
			range = document.body.createTextRange()
			range.moveToElementText($txt[0])
			range.select()
		
finishEdit = ->
	if $txt.attr("contentEditable") is "true"
		$txt.attr("contentEditable","false")
		$txt.blur()
		$txt.removeClass "edit-txt"
		if $txt.html is "&nbsp;"
			if sidea.txt is null then sidea.txt = null
			else if sidea.txt is "" then sidea.txt = ""
			else sidea.txt = ""
		else
			sidea.txt = $txt.html()

		s = ""
		s += sidea.txt if sidea.txt isnt null
		s += "&nbsp;" if sidea.txt is "" 
		$txt.html s
		
		if not (sidea.txt?) and notxt[@kind]?
			$("#lvl"+sidea.id).addClass "display-none"

		if sidea.run? then sidea.run()
		if sidea.pa?.runchild? then sidea.pa.runchild()
		if sidea.goto? then sidea.goto.upperFrame.fhtml(sidea.goto)
		if sidea.refresh? then fidea.fhtml(sidea)

		for aa in @cvva
			aa.cvv()

