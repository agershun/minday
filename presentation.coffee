################################################
# MINDAY 0.008BI 
# presentation.coffee
# Процедуры для работы с презентациями
################################################

keyp[PRESENTATION] = {}
keyp[SLIDE] = {}

keyp[SLIDE][KEY_SPACE] =->
	sidea.right()

statePresentation = off

presentationToggle = (flag=on) ->
	statePresentation = flag

# TODO: Разобраться, что происходит и почему не работает презентаций
# TODO: Понять, что не так со изображением слайдов

# Начать презентацию с начала
keyp[PRESENTATION][ALT+KEY_F5] =->
	if @[0].kind is SLIDE
		statePresentation = on
		@[0].fhtml()

keyp[SLIDE][ALT+KEY_F5] =->
	statePresentation = on
	@fhtml()

right[SLIDE] = ->
	if sidea is fidea 
		sia = sidea
		if sidea.pa[sidea.ix+1]? then sia = sidea.pa[sidea.ix+1]
		sia.fhtml(sia)
		return sia
	else 
		ria = @downnext()
		if ria is null then return @
		else return ria

left[SLIDE] =->
	if sidea is fidea 
		sia = sidea
		console.log sidea.ix-1
		if sidea.pa[sidea.ix-1]? then sia = sidea.pa[sidea.ix-1]
		sia.fhtml(sia)
		return sia
	else 
		if @ix > 0
			ret = @pa[@ix-1].uplast()
			if ret.kind is CELL then return ret.pa[0]  # Специальная поправка для матрицы
			return ret
		else
			return @pa

down[SLIDE] = right[SLIDE]
pgdn[SLIDE] = right[SLIDE]
up[SLIDE] = left[SLIDE]
pgup[SLIDE] = left[SLIDE]
space[SLIDE] = right[SLIDE]
backspace[SLIDE] = left[SLIDE]

home[SLIDE] =->
	sidea.pa[0].upperFrame().fhtml(sidea.pa[0])

end[SLIDE] =->
	sidea.pa[sidea.pa.pa.length-1].upperFrame().fhtml(sidea.pa[sidea.pa.pa.length-1])

esc[SLIDE] =->
	sidea.pa.upperFrame().fhtml(sidea)	