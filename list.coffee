################################################
# MINDAY 0.010 Tokyo
# list.coffee
# Процедуры для работы со списками
################################################

#=============================
# 1. ОСНОВНЫЕ ПАРАМЕТРЫ 
#=============================

keyp[OLIST] = {}
childkind[OLIST] =-> null
notxt[OLIST] = yes

keyp[ULIST] = {}
childkind[ULIST] =-> null
notxt[ULIST] = yes

#############################
# 5. DRAW
#############################

drtxt[OLIST] = (level) -> 
	s = ""
	@val=1
	if @pa[@sd-1]?[@ix]?.kind is OLIST and @pa[@sd-1]?[@ix]?.val? 
		@val = @pa[@sd-1][@ix].val+1
	s += @val+"."
	s

clas[OLIST] = "olist" 	# Нельзя называть класс icon-bag и icon-txt, так как срабатывает
											# правило из Bootstrap

#############################
# ULIST
#############################
drtxt[ULIST] = (level) -> 
	s = ""
	s += "&nbsp;\u2022&nbsp;"
	s

clas[ULIST] = "list" 	# Нельзя называть класс icon-bag и icon-txt, так как срабатывает
											# правило из Bootstrap
