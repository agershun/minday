################################################
# MINDAY 0.010 Hanioti
# sample-start.coffee
# Стартовый экран
################################################

library = null

sample.start = ->
	m = createNewModel("start")
	m.readonly = yes
	selectModel("start")
	md = adf "Minday: Методики и инструменты анализа"
		background: 1
		canvas: CANVASJS
		intype:TABLE
		tableclass:1

	md1 = md.add null,rowspan:3,tableclass:1,valign:TOP
	md2 = md.adr "Методы",valign:TOP,
	md3 = md.add "Инструменты анализа",valign:TOP
	md4 = md.add "Как пользоваться программой?"

	md11 = md1.add "Новая модель"
		forma: BUTTON
		place: BAG
		scheme: BLUE
#		valign:TOP
		plain:yes
		run: ->
			updateModel("start")
			createNewModel("minday")
			selectModel("minday")
			m=adf "Новая модель"
			m.fhtml()

	md12 = md1.add "Открыть модель..."
		forma: BUTTON
		place: BAG
		scheme: WHITE
		plain:yes
		run: ->
			updateModel("start")
			createNewModel("mymodels")
			selectModel("mymodels")
			mm=adf "Мои модели"
			for k,v of models
				xa = add v.name
				xa.run = "selectModel('"+v.name+"',true);"
				mm.add xa
			mm.fhtml()
			updateModel("mymodels")

	library = md1.add "Библиотека моделей"
		forma: BUTTON
		place: BAG
		scheme: GREEN
		plain:yes
		frame:yes

	md14 = md1.add "Показать меню"
		forma: BUTTON
		place: BAG
		scheme: RED
		plain:yes
		run: ->
			viewFullScreen()

	md21 = md2.add intype:TABLE,tableclass:1,forma:BUTTON,scheme:WHITE,place:BAG
	md21.add kind:IMAGE, url:"icon-swot-64-64.png",w:64,h:64#
	md211 = md21.adr "SWOT-анализ",goto:sample.swot()
	md211.add "Анализ сильных<br>и слабых сторон",plain:yes

	md22 = md2.adr intype:TABLE,tableclass:1,forma:BUTTON,scheme:WHITE,place:BAG
	md22.add kind:IMAGE, url:"icon-businessmodel-64-64.png",w:64,h:64#
	md221 = md22.adr "Бизнес-модель"
	md221.add "Описание стратегии<br>предприятия",plain:yes

#	md22.add "",forma:BUTTON,place:BAG,scheme:BLUE,image:(add "icon-businessmodel-64-64.png"),imageplace:TOP,list:TD,tableclass:1,plain:yes,align:CENTER,goto:sample.businessmodel()


	md
	###


	md2.push md22=add "Списки<br>дел",forma:BUTTON,place:BAG,scheme:BLUE,image:(add "icon-check-64-64.png"),imageplace:TOP,list:TD,tableclass:1,plain:yes,align:CENTER,goto:sample.checklist()
	md2.push md23=add "Пирамида<br>Маслоу",forma:BUTTON,place:BAG,scheme:BLUE,image:(add "icon-pyramid-64-64.png"),imageplace:TOP,list:TD,tableclass:1,plain:yes,align:CENTER,goto:sample.maslow()
	md2.push md23=add "Голубые<br>океаны",forma:BUTTON,place:BAG,scheme:BLUE,image:(add "icon-blueocean-64-64.png"),imageplace:TOP,list:TD,tableclass:1,plain:yes,align:CENTER,goto:sample.blueocean()
	md2.push md23=add "Матрица<br>БКГ",forma:BUTTON,place:BAG,scheme:BLUE,image:(add "icon-bcg-64-64.png"),imageplace:TOP,list:TD,tableclass:1,plain:yes,align:CENTER,goto:sample.bcg()

	md3.push md31=add "Интеллектуальные<br>карты",forma:BUTTON,place:BAG,scheme:BLUE,image:(add "icon-mindmap-64-64.png"),imageplace:TOP,list:TD,tableclass:1,plain:yes,align:CENTER,goto:sample.mmap()
	md3.push md32=add "Деревья<br>&nbsp;",forma:BUTTON,place:BAG,scheme:BLUE,image:(add "icon-tree-64-64.png"),imageplace:TOP,list:TD,tableclass:1,plain:yes,align:CENTER,goto:sample.tree()
	md3.push md33=add "Матрицы<br>и таблицы",forma:BUTTON,place:BAG,scheme:BLUE,image:(add "icon-table-64-64.png"),imageplace:TOP,list:TD,tableclass:1,plain:yes,align:CENTER,goto:sample.matrix()
	md3.push md33=add "Анкеты и<br>опросники",forma:BUTTON,place:BAG,scheme:BLUE,image:(add "icon-check-64-64.png"),imageplace:TOP,list:TD,tableclass:1,plain:yes,align:CENTER,goto:sample.anketa()

	md3.push md34=add "Стратегические<br>карты",forma:BUTTON,place:BAG,scheme:BLUE,image:(add "icon-map-64-64.png"),imageplace:TOP,list:TD,tableclass:1,plain:yes,newline:yes,align:CENTER,goto:sample.maps()
	md3.push md35=add "Диаграмма<br>Ишикава",forma:BUTTON,place:BAG,scheme:BLUE,image:(add "icon-ishikawa-64-64.png"),imageplace:TOP,list:TD,tableclass:1,plain:yes,align:CENTER,goto:sample.ishikawa()
	md3.push md36=add "Текст<br>&nbsp;",forma:BUTTON,place:BAG,scheme:BLUE,image:(add "icon-text-64-64.png"),imageplace:TOP,list:TD,tableclass:1,plain:yes,align:CENTER,goto:sample.text()
	md3.push md36=add "Холст<br>и графика",forma:BUTTON,place:BAG,scheme:BLUE,image:(add "icon-canvas-64-64.png"),imageplace:TOP,list:TD,tableclass:1,plain:yes,align:CENTER,goto:sample.canvas()

	md4.push md41=add "Клавиши<br>управления",forma:BUTTON,place:BAG,scheme:BLUE,image:(add "icon-key-64-64.png"),imageplace:TOP,list:TD,tableclass:1,align:CENTER,plain:yes,goto:sample.hotkey()
	md4.push md42=add "Таймер<br>&nbsp;",forma:BUTTON,place:BAG,scheme:BLUE,image:(add "icon-timer-64-64.png"),imageplace:TOP,list:TD,align:CENTER,plain:yes,goto:sample.timer()

	md.push add "(c) Андрей Гершун, 1993-2012",plain:yes

	showFullScreen()

	md

###
###
	st = adf "Добро пожаловать"
		background: 1
		align: CENTER

	st.push st0=add ""

	st0.push st1=add "С чего начать работу?"
		align: CENTER
		childrenalign: CENTER

	st1.push add "Разработка<br>стратегии"
		image: add "strategy.jpg"
		imageplace: TOP
		list:SPAN
		button: BLUE
	st1.push add "Инструменты<br>лидера"
		image:  add "leadership.jpg"
		imageplace: TOP
		list:SPAN
		button: LIGHTBLUE
#	st1.push add "Командная<br>работа"
#		image:  add "team.jpg"
#		imageplace: TOP		
#		list:SPAN		
#		button: WHITE
	st1.push add "Управление<br>проектами"
		image:  add "project.jpg"
		imageplace: TOP		
		list:SPAN		
		button: GREEN

	st0.push st2=add ""
		align: CENTER
		childrenalign: CENTER


	st2.push add "Принятие<br>решений"
		image:  add "decision.jpg"
		imageplace: TOP		
		list:SPAN		
		button: RED
	st2.push add "Решение<br>задач"
		image:  add "solving.jpg"
		imageplace: TOP		
		list:SPAN		
		button: BLACK
	st2.push add "Техники<br>креативности"
		image: add "creativity.jpg"
		imageplace: TOP
		list:SPAN
		button: LIGHTBLUE

	st.push st5=add ""

	st5.push st6=add "Популярные инструменты"

	st6.push sw=add "SWOT-анализ"
		image: add "swot.jpg"
		button: WHITE
	st6.push bo=add "Голубые океаны"
		image: add "blueocean.jpg"
		button: WHITE

	st
