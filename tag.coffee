################################################
# MINDAY 0.010 Tokyo
# tag.coffee
# Процедуры для работы с тэгами
################################################

#=============================
# 1. ОСНОВНЫЕ ПАРАМЕТРЫ 
#=============================

keyp[TAG] = {}

childkind[TAG] =->null

#============================
# 2. KIND
#============================

Idea::kindTag = ->
	@kind = TAG

#############################
# 5. DRAW
#############################

draw[TAG] = (level) ->
	s = @simpleIdeaTxt(level)
	s

clas[TAG] = "tag"