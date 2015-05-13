################################################
# MINDAY 0.009 Lykia 
# sample-circle.coffee
# Пример применения круговой диаграммы
################################################

sample.circle = ->

	cco = adf "Круговая диаграмма"
	cco.push co=add "Рынок напитков"
	co.push add "Пиво",val:0.3
	co.push add "Водка",val:0.2
	co.push add "Шампанское",val:0.1
	co.push add "Коньяк",val:0.4
	co.kindPie()

	cco
