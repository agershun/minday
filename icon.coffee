################################################
# MINDAY 0.010 Tokyo
# icon.coffee
# Процедуры для работы с иконками
################################################

#=============================
# 1. ОСНОВНЫЕ ПАРАМЕТРЫ 
#=============================

keyp[ICON] = {}
childkind[ICON] =->null
notxt[ICON] = yes

#============================
# 2. KIND
#============================

Idea::kindIcon = ->
	@kind = ICON

#############################
# 5. DRAW
#############################

icons=[]
icons.push "pencil"
icons.push "pencil-2"
icons.push "home"
icons.push "home-2"
icons.push "home-3"
icons.push "newspaper"

drtxt[ICON] = (level) -> 
	s = ""
	if @val?
		s += "<span class='nicon-"+icons[@val]+"'></span>"
	else
		s += "<span class='nicon-home'></span>"
	s


draw[ICON] = (level) ->	@simpleIdeaTxt(level)

clas[ICON] = "iicon" 	# Нельзя называть класс icon-bag и icon-txt, так как срабатывает
											# правило из Bootstrap

keyp[ICON][KEY_ENTER] =->
	#alert @val
	unless @val? then @val=-1
	@val = (@val+1) % icons.length
	#alert @val
	fidea.fhtml(sidea)

keyp[ICON][KEY_F2] = keyp[ICON][KEY_ENTER]
