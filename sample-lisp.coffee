################################################
# MINDAY 0.008BI 
# sample-checklist.coffee
# Пример текста
################################################


sample.lisp = ->
		# ЛИСП
	# Добавляем списки

	ls = "(define idea (quote ("
	for ia in idea
		ls+= " ##{-ia.id}"
	ls+= ")))"

	lans = p(lispvalue(s(ls)))

	qls = "(car idea)"
#	tt = lispvalue(s(qls))
#	console.log tt
#	bt = []
#	while tt.length > 1
#		if tt[0][0] is "#" then tt[0] = Number(tt[0].substr(1))
#		bt.push tt[0]
#		tt = tt[1]
#	alp = add "Ответ", bt
	lans = p(lispvalue(s(qls)))

	rst = lans.match /^(.*)([#][0-9]*)(.*)$/
	while rst
		lans = rst[1] + "'"+idea[rst[2].substr(1)].txt+"'" + rst[3]
		rst = lans.match /^(.*)([#][0-9]*)(.*)$/
		
	window.wlisp = adf "Программа на языке Лисп"
	wzap = add "Запрос"
	wzap.push add qls
	wansw = add "Ответ"
	wansw.push add lans

	window.wlisp.push wzap,wansw



	