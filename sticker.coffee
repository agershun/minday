################################################
# MINDAY 0.010 Tokyo
# sticker.coffee
# Процедуры для работы со стикерами
################################################

#=============================
# 1. ОСНОВНЫЕ ПАРАМЕТРЫ 
#=============================

keyp[STICKER] = {}

childkind[STICKER] =-> IDEA

#============================
# 2. KIND
#============================

Idea::kindSticker = ->
	@kind = STICKER

#############################
# 5. DRAW
#############################


# draw[STICKER] = (level) ->	@simpleIdeaTxt(level)

clas[STICKER] = "sticker" 	# Нельзя называть класс icon-bag и icon-txt, так как срабатывает

draw[STICKER] = (level,drawshow) ->
	s = ""
	sh = if @scheme? then @scheme else WHITE
	if isNaN(@sd) then sd = 0 else sd = @sd
	ix = @ix
	angle = (-@id*3+sd*5+ix*13) % 20 - 10

	# TODO: Исправить, убрать лишнее
	@bagstyle = "background-color:"+schemes[sh][5]+";color:Black;"
	@bagstyle += "-webkit-transform:rotate(#{angle}deg)"
	s += draw[DEFAULT].call(@,level,drawshow)
	s
