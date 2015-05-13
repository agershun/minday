################################################
# MINDAY 0.008BI 
# sample-checklist.coffee
# Пример текста
################################################


sample.leadkpi = ->
	#
	# Пример из лекции АГ
	#

	leadinstr = add "Подберите для стратегических целей по одному ведущему и одному
		запаздывающему показателю. Обратите внимание, что для каждого показателя
		обязательно необходимо указать единицы измерения. ",
		plain: yes

	leadcol0 = add "Стратегические цели"
	leadcol1 = add "Ведущие показатели (ед.изм.)"
	leadcol2 = add "Запаздывающие показатели (ед.изм.)"

	leadcol = add [leadcol0,leadcol1,leadcol2]

	leadkpi = add null,
		readonly:yes
		nochildren:yes
		column: leadcol
	leadkpi.push add [(add "",motivator:(add "Цель...")),(add "",motivator:(add "Показатель...")),(add "",motivator:(add "Показатель..."))]
	leadkpi.push add [(add ""),(add ""),(add "")]
	leadkpi.kindMatrix()

	window.kpi = adf "Ведущие и запаздывающие показатели"

	window.kpi.push leadinstr, leadkpi
