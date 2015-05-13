################################################
# MINDAY 0.008BI 
# sample-checklist.coffee
# Пример текста
################################################


sample.market = ->

	window.market = adf "Рынок сотовой связи",
		description: add "Структура рынка сотовой связи"
		readonly: yes
		nochildren: yes
		guide: add "Рассмотрите и проанализируйте рынок сотовой связи России"

	mts = add "МТС",
		readonly:yes
		nochildren:yes
	beeline = add "Билайн",
		readonly:yes
		nochildren:yes
	megafon = add "Мегафон",
		description: add "Быстрорастущий оператор связи"
	svyaz = add "Связьинвест",
		readonly:yes
		nochildren:yes
	prochie = add "Прочие",
		readonly:yes
		nochildren:yes

	opfld1 = add "Оператор",
		keyfield: yes
		readonly:yes
		nochildren:yes		
	opfld2 = add "Доля рынка",
		readonly:yes
		nochildren:yes
	opflds = add [opfld1,opfld2]

	marketop = add "Таблица операторов связи",
		field: opflds
		readonly: yes
		nochildren:yes
	marketop.push add [mts, (add "34.3",nochildren:yes,format:PERCENT,refresh:yes)]
	marketop.push add [beeline, (add "25.2",nochildren:yes, sticker:(add [add "Отметим этого оператора"]),format:PERCENT,refresh:yes)]
	marketop.push add [megafon, (add "23.2",nochildren:yes,format:PERCENT,refresh:yes)]
	marketop.push add [svyaz, (add "7.2",nochildren:yes,format:PERCENT,refresh:yes)]
	marketop.push add [prochie, (add "10.1",nochildren:yes,format:PERCENT,refresh:yes)]
	marketop.kindTable()

	marketshare = add "Доли операторов рынка",
		kind: PIECHART
		source: marketop
		nochildren: yes

	mm = add "Таблица"
	mm.push add [(ma=add ""),(ms=add "")]
	mm.kindMatrix()
	ms.push marketshare
	ma.push marketop


	window.market.push mm
	window.market.next = add "Пересчитать диаграмму",
		run: () -> fidea.fhtml()

	marketRecalculate = add "Перерисовать диаграмму",
		kind: MENUITEM
		goto: window.market
#		run: -> fidea.fhtml()

	marketMenu = add "Рынок сотовой связи", [marketRecalculate],
		kind: MENU
	window.market.menu = marketMenu


	