################################################
# MINDAY 0.008BI 
# sample-checklist.coffee
# Пример текста
################################################


sample.anketa = ->

	#
	# АНКЕТА
	#
	window.ank = adf "Анкета лидера",
		description: add "Многие управленческие методики предусматривают
			анкетирование или ответы на тесты."

	anq1 = add "Я веду людей за собой", format:YESNO
	anq2 = add "Люди идут за мной", format:YESNO
	anb = add "Показать ответ",
		kind: BUTTON
		run: ->
			unless window.anan? 
				window.anan = add "Вы - лидер!"
				window.ank.push window.anan
			window.ank.fhtml(window.anan)
	window.ank.push anq1, anq2, anb

	library.push window.ank
	window.ank