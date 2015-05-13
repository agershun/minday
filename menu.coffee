################################################
# MINDAY 0.008BI 
# menu.coffee
# Процедуры для рисования меню
################################################

draw[MAINMENU] = (level) ->
	s = ""

draw[MENU] = (level) ->
	s = ""
	s += "<a class='dropdown-toggle' data-toggle='dropdown' href='#'>"
	s += @txt if @txt?
	s += "<b class='caret'></b>"
	s += "</a>"

	if @length > 0
		s += "<ul class='dropdown-menu'>"
		for ia in @data
			if ia.txt? or ia.txt is ""
				s += "<li><a  id='mnu"+ia.id+"' class='menu-item'>"+ia.txt+"</a></li>"
			else
				s += "<li class='divider'></li>"
		s += "</ul>"	
	s

