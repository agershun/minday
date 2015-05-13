################################################
# MINDAY 0.010 Tokyo
# gem.coffee
# Процедуры для работы с камешками
################################################

#=============================
# 1. ОСНОВНЫЕ ПАРАМЕТРЫ 
#=============================

keyp[GEM] = {}
childkind[GEM] =->null
notxt[GEM] = yes

#============================
# 2. KIND
#============================

Idea::kindGem = ->
	@kind = GEM

#############################
# 5. DRAW
#############################

drtxt[GEM] = (level) -> 
	s = ""
	s += "<div class='gem'>&nbsp;</div>"
	console.log "gem"
	s


draw[GEM] = (level) ->	@simpleIdeaTxt(level,DRAWALL)

# clas[GEM] = "gem"

#clas[GEM] = "iicon" 	# Нельзя называть класс icon-bag и icon-txt, так как срабатывает
#											# правило из Bootstrap

#keyp[ICON][KEY_ENTER] =->
	#alert @val
#	unless @val? then @val=-1
#	@val = (@val+1) % icons.length
	#alert @val
#	fidea.fhtml(sidea)

#keyp[ICON][KEY_F2] = keyp[ICON][KEY_ENTER]
