################################################
# MINDAY 0.009 Lykia 
# sample-ishikawa.coffee
# Пример применения диаграммы ишикава
################################################

sample.gantt = ->

	gg = adf "Диаграмма Гантта"
	g=add "План работ",start:1,finish:10
	gg.push g
	g.push add "Обследование",start:1,finish:3,result:(add "Отчет об обследовании")
	g.push add "Анализ",start:2,finish:4,result:(add "Отчет об анализе")
	g.push add "Дизайн",start:3,finish:5,result:(add "Прототип системы")
	g.push add "Разработка",start:4,finish:6,result:(add "Разработанная система")
	g.push add "Подготовка к запуску",start:5,finish:7,result:(add "План запуска")
	g.push add "Запуск",start:6,finish:8,result:(add "Работающая система")
	g.push add "Сопровождение",start:7,finish:9
	g.push add "Поддержка",start:7,finish:10

	g.phase = (gp=add "")
	gp.push add "Фаза 1",start:1,finish:5
	gp.push add "Фаза 2",start:6,finish:10

	g.kindGantt()

	gg



