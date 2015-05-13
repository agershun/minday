################################################
# MINDAY 0.010 Tokyo
# tick.coffee
# Процедуры для работы с галочками
################################################

#=============================
# 1. ОСНОВНЫЕ ПАРАМЕТРЫ 
#=============================

keyp[TICK] = {}
childkind[TICK] =-> null
notxt[TICK] = yes

#============================
# 2. KIND
#============================

Idea::kindTick = ->
	@kind = TICK

#############################
# 5. DRAW
#############################

drtxt[TICK] = (level) -> 
	s = ""
	unless @val? then s += "<span id='tik"+@id+"' class='tick-undefined'></span>"
	else if @val is yes then s += "<span id='tik"+@id+"' class='tick-yes'></span>"
	else if @val is no then s += "<span id='tik"+@id+"' class='tick-no'></span>"
	s

#draw[TICK] = (level) ->	@simpleIdeaTxt(level)

clas[TICK] = "tick" 	# Нельзя называть класс icon-bag и icon-txt, так как срабатывает
											# правило из Bootstrap

############################
# 6. Клавиатура
############################

keyp[TICK][KEY_ENTER] =->
	if @kind is TICK 
		unless sidea.val? then sidea.val = yes
		else if sidea.val is yes then sidea.val = no
		else sidea.val = null

		# TODO: А можно просто сделать redraw()
		$tik = $('#tik'+sidea.id)
		$tik.removeClass "tick-yes"
		$tik.removeClass "tick-no"
		$tik.removeClass "tick-undefined"

		unless @val? then $tik.addClass "tick-undefined"
		else if @val is yes then $tik.addClass "tick-yes"
		else if @val is no then $tik.addClass "tick-no"

keyp[TICK][KEY_F2] = keyp[TICK][KEY_ENTER] 


