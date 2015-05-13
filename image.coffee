################################################
# MINDAY 0.010 Tokyo
# image.coffee
# Процедуры для работы с картинками
################################################

#=============================
# 1. ОСНОВНЫЕ ПАРАМЕТРЫ 
#=============================

keyp[IMAGE] = {}
childkind[IMAGE] =->null
notxt[IMAGE] = yes

#============================
# 2. KIND
#============================

Idea::kindImage = ->
	@kind = IMAGE

#############################
# 5. DRAW
#############################
images = []
images.push url:"korablik.jpg",w:600,h:598

drtxt[IMAGE] = (level) -> 
	s = "<img "
	if @val?
		s += " src='methods/"+images[@val].url+"' "
		s += " width='"+images[@val].w+"px' "
		s += " height='"+images[@val].h+"px' " 
	else 
		s += " src='methods/"+@url+"' " if @url?
		s += " width='"+@w+"px'" if @w?
		s += " height='"+@h+"px'" if @h?
		s += " style='"
		s += "width:"+@w+"px;" if @w?
		s += "height:"+@h+"px;" if @h?
		s += "'"
	s += ">"
	s


clas[IMAGE] = "image" 	# Нельзя называть класс icon-bag и icon-txt, так как срабатывает
											# правило из Bootstrap
