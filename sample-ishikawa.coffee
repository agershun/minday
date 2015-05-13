################################################
# MINDAY 0.009 Ly 
# sample-ishikawa.coffee
# Пример применения диаграммы ишикава
################################################

sample.ishikawa = ->
	mtr = adf "Использоваение диаграммы Ишикава"
		description: add "Пример использования деревьев"
		guide: add "Используйте клавиши со стрелками для перемещения по дереву"
	mtr.push add "Программа позволяет проводить мозговые штурмы с использованием
		диаграммы Ишикава (рыбья кость).", plain:yes
	mtr.push tr=add "Анализ прибыли"
		kind: ISHIKAWA

	tr.push tr0=add "Прибыль",kind:BONE
	tr0.push tr1=add "Люди",kind:BONE
	tr0.push tr2=add "Машины",kind:BONE
	tr0.push tr3=add "Система управления",kind:BONE
	tr0.push tr4=add "География",kind:BONE
	tr0.push tr5=add "Технологии",kind:BONE

	tr1.push tr11=add "Мотивация",kind:BONE
	tr1.push tr12=add "Знания и навыки",kind:BONE
	tr1.push tr12=add "Личные цели",kind:BONE

	tr2.push tr12=add "Износ",kind:BONE
	tr2.push tr12=add "Соответствие стандартам качества",kind:BONE
	tr.kindIshikawa()

	library.push mtr
	mtr


