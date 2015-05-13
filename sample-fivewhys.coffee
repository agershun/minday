################################################
# MINDAY 0.008BI 
# fivewhys.coffee
# Описание методики "5 почему"
################################################

sample.fivewhys = ->

	window.fivewhys = adf "Анализ '5 почему'"

	window.five0 = add "Какую ситуацию вы хотите обдумать?",
		readonly: yes
		example: [(add "Снижается выручка компании"),(add "Из компании уходят лучшие сотрудники")]
		runchild: ->
			if window.fivewhys.length < 2
				fivewhys.push window.five1
			fivewhys.fhtml(window.five1)

	window.fivewhys.push window.five0

	window.five1 = add "Почему это так?",
		readonly: yes
		example: [add "Невысокая заработная плата"]
		runchild: ->
			if window.fivewhys.length < 3
				fivewhys.push window.five2
			fivewhys.fhtml(window.five2)


	window.five2 = add "В чем истинная причина?",
		readonly: yes
		example: [add "Низкая производительность труда"]
		runchild: ->
			if window.fivewhys.length < 4
				fivewhys.push window.five3
			fivewhys.fhtml(window.five3)

	window.five3 = add "В чем истинная причина?",
		readonly: yes
		example: [add "Низкая мотивация"]
		runchild: ->
			if window.fivewhys.length < 5
				fivewhys.push window.five4
			fivewhys.fhtml(window.five4)

	window.five4 = add "И все-таки, зачем?",
		readonly: yes
		example: [add "Шумное помещение"]
		runchild: ->
			if window.fivewhys.length < 6
				fivewhys.push window.five5
			fivewhys.fhtml(window.five5)

	window.five5 = add "Почему?",
		readonly: yes
		example: [add "Дешевый офис"]
