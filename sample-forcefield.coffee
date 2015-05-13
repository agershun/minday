################################################
# MINDAY 0.008BI 
# sample-checklist.coffee
# Пример текста
################################################


sample.forcefield = ->
	#
	# Анализ силового поля
	#
	ffan = adf "Анализ силового поля при проведении изменений",
		readonly:yes
		intype:TABLE

	ffan.add "Что помогает проведению изменений?"
		readonly:yes
		nochildren:yes
		th:yes

	ffan.adr "Что мешает проведению изменений?",
		th:yes
		readonly:yes
		nochildren:yes

	ffan.add "&nbsp;"
	ffan.adr "&nbsp;"

	ffan
