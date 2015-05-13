################################################
# MINDAY 0.008BI 
# sample-checklist.coffee
# Пример текста
################################################


sample.quotes = ->
	#
	# СЛУЧАЙНЫЕ ЦИТАТЫ
	#
	window.quotes = adf "Случайные цитаты",
		description: add "Хорошая случайная цитата может подтолкнуть к хорошей идее."
	window.quobut = add "Нажмите, чтобы прочитать случайную цитату",
		kind:BUTTON
		run: ->
			qo=[]
			qo[0] = "Хорошо-то хорошо, да ничего хорошего" 
			qo[1] = "Хотели как лучше, получили как всегда"
			qo[2] = "Хорошо смеется последний"
			window.quota.txt = qo[Math.floor(Math.random()*10)%3]
			quotes.fhtml(window.quobut)
	window.quota = add "Сосредоточьтесь!"

	window.quotes.push quota, quobut


