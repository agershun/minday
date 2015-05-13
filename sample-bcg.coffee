################################################
# MINDAY 0.009 Lykia
# sample-bkg.coffee
# Пример работы с матрицей BCG
################################################


sample.bcg = ->
	b = adf "Матрица Boston Consulting Group"

	b.push bb=add "Анализ продуктового портфеля"

	co = add "Доля рынка"
	co.push add "большая"
	co.push add "маленькая"
	bb.column = co

	ro = add "Рост рынка"
	ro.push add "высокий"
	ro.push add "низкий"
	bb.row = ro

	bb.push add [(add "<br/>Звезды<br/>"),(add "<br/>Вопросы<br/>"),]
	bb.push add [(add "<br/>Коровы<br/>"),(add "<br/>Собаки<br/>"),]

	bb.entity = add [(add "Axapta",r:0.2,x:0.5,y:0.5),(add "SunSystems",r:0.2,x:0.3,y:0.9)]

	bb.kindBCG()

	library.push b
	b


