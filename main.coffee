################################################
# MINDAY 0.008BI 
# main.coffee
# Главная часть программы
################################################

$desk = null
$description = null
$guide = null
$step = null
$menu = null

defaultDescription = null
defaultGuide = null
defaultStep = null
defaultMenu = null

searchStatus = off

# для HTML объектов
deskClick = (eo) ->
		n = Number(eo.srcElement.id.substr(3))
		if n is 0 then return
		cidea = idea[-n]
		if cidea?
			if eo.srcElement.id.substr(0,3) is "frm"
				if cidea is fidea
					cidea.upperFrame().fhtml(cidea)
				else
					cidea.fhtml(cidea)
			else
				if cidea is sidea
					if cidea.frame?
						if cidea is fidea
							cidea.upperFrame().fhtml(cidea)
						else
							cidea.fhtml(cidea)
					else if cidea.goto? then cidea.goto.fhtml(cidea.goto)
					else if cidea.run? then cidea.run()
					else 
						sidea.pa.select()
				else
					cidea.select()


setDefaults = () ->	
	#
	# Значения по умолчанию
	#

	# Комментарии по умолчанию
	defaultDescription = add '''
	Внимательно прочтите описание. <br/>
	По всем вопросам пишите на адрес <a href="mailto:agershun@gmail.com">agershun@gmail.com</a>
	'''

	defaultGuide = add "Используйте стрелки для перемещения, F2 для редактирования,
		Ins - для вставки новых идей, PgDn - для перехода на нижний уровень, 
		PgUp - для перехода на верхний уровень, текст можно вводить."

	defaultStep = add null

	# TODO: Убрать баг с тем, что нельзя добавить add null в массив
	defaultMenu = add "Меню", [(add "Пример1"), (add "Пример2"), (add null), (add "Пример3")],
		kind: MENU


		
# Тесты на клиенте
$(document).ready ->
	# Инициализируем paper.js
	# paper.install(window)

	#
	# Начальные установки
	#
	createNewModel()
	selectModel()
	updateModel()


	# Кэшируем экранные элементы
	$desk = $("#desk")
	$description = $("#description")
	$guide = $("#guide")
	$step = $("#step")
	$menu = $("#menuframe")

	$(window).on "resize",redrawEvent
	$desk.click deskClick 						# Выбор текущей идеи по нажатию на идею
	$('.dropdown-toggle').dropdown()	# Нужно для инициализации меню
	setMenuFile()											# Устанавливаем меню Файл
	setMenuServer()										# Устанавливаем меню Файл
	setMenuEdit()											# Устанавливаем меню Правка
	setMenuFormat()										# Устанавливаем меню Формат
	setMenuText()										# Устанавливаем меню Формат
	setMenuInsert()										# Устанавливаем меню Вставка
	setMenuView()											# Устанавливаем меню Вид
	setMenuHelp()											# Устанавливаем меню Помощь

	setTimer()												# Устанавливаем процедуру для таймера
	cometStart()											# Инициализируем comet-сервер

	$("#input_search").bind "focusin", ->
		searchStatus = on

	$("#input_search").bind "focusout", ->
		searchStatus = off


	#
	# Загрузка примера главной модели
	#
#	model = sample.start()

#	model = adf "Minday - описание программы и примеры",
#		readonly:yes
#		align:CENTER

	###
	model.push aa1=add "Стратегический<br>анализ"
		list:SPAN
		image: add "icon-css3.png"
		imageplace: TOP
		button: YELLOW
		plain:yes

	model.push aa2=add "Мозговые<br>штурмы"
		list:SPAN
		image: add "icon-css3.png"
		imageplace: TOP
		button: RED
		plain:yes

	model.push aa2=add "Управление<br>проектами"
		list:SPAN
		image: add "icon-css3.png"
		imageplace: TOP
		button: GREEN
		plain:yes

	model.push aa2=add "Личностный<br>рост"
		list:SPAN
		image: add "icon-css3.png"
		imageplace: TOP
		button: BLUE
		plain:yes



	mt0 = add "Эта модель разработана для демонстрации возможностей
			программы Minday. Модель содержит несколько общеупотребительных
			моделей, на примере которых можно понять особенности работы
			программы, в частности модели стратегического анализа, анкеты,
			интеллектуальные карты и другие.", plain:yes, readonly:yes
	mt00 = add "Подробнее о программе можно посмотреть в следующей презентации:", plain:yes, readonly:yes

	mt01 = add "Minday - презентация возможности программы",plain:yes,list:UL

	mt01a = add "Подведите курсор к предыдущей строке с помощью <b>клавиш стрелок</b>
		и нажмите клавишу <b>Enter</b>. Маленький треугольник &#x25B7;, направленный вправо означает,
		что это ссылка, по которой можно сделать переход. А закрашенный треугольник &#x25B6; означает,
		что нажатие на этой идее приведет к выполнению скрипта (мини-программы).",plain:yes

	mt0a = add "Клавиши управления и интерфейс программы",readonly:yes,image:(add "icon-key.png"),iconplace:LEFT
	mt1 = add "Вы можете перемещаться между различными идеями с помощью
			<b>клавиш стрелок</b>. Для перемещения между различными фреймами
			используйте клавишу <b>Enter</b>. Фреймы отмечены треугольниками
			<span class='frame'>&#x25B3;</span> 
			и <span class='frame'>&#x25BD;</span>. Перейдите на следующий пункт
			с помощью клавиатуры или мыши и нажмите <b>Enter</b> для перехода
			внутрь страницы", plain:yes, readonly:yes
	
	mt1a = sample.hotkey()
	mt1a.plain = yes
	mt1a.list = UL


	tmr=sample.timer()
	tmr.plain = yes
	tmr.list = UL

	model.push mt0,mt00,mt01,mt01a,mt0a,mt1,mt1a,tmr

	prims = add "Примеры возможностей программы",
		readonly:yes
		nochildren:yes
		guide: add "Заходите в разделы с помощью клавиши Enter или нажав на треугольник 
			в названии раздела"
	model.push prims

	pri1 = add "Программа объединяет в себ возможности текстового редактора,
		редактора диаграмм, средства для презентации.", plain:yes

	prims.push pri1

	sample.text() 
	window.ttt.plain = yes
	window.ttt.list = UL
	prims.push window.ttt

	sample.mmap() # Подключаем методику "Mindmaps"
	window.mmap.plain = yes
	window.mmap.list = UL
	prims.push window.mmap

	prims.push mxx=sample.matrix() # Матрицы
	mxx.plain = yes
	mxx.list = UL

	# Стратегические карты
	prims.push ssmap=sample.maps()
	ssmap.plain = yes
	ssmap.list = UL

	prims.push sstr=sample.tree()
	sstr.plain = yes
	sstr.list = UL

	sample.checklist() 
	window.clist.plain = yes
	window.clist.list = UL
	prims.push window.clist

	strat = add "Стратегический анализ",
		readonly:yes
		nochildren:yes
		guide: add "Различные варианты стратегического анализа"
	model.push strat

	mt4 = add "Одно из предназначений программы - это помощь в проведении стратегического 
		анализа, например, программа поддерживает такие распространенные модели, как
		SWOT-анализ, анализ 5 сил Портера и другие модели. ", plain:yes

	strat.push mt4

	sample.swot() # Подключаем методику "Проект Я"
	window.swotmain.plain = yes
	window.swotmain.list = UL
	strat.push window.swotmain

	sample.fivewhys() # Подключаем методику "5 почему"
	window.fivewhys.plain = yes
	window.fivewhys.list = UL
	strat.push window.fivewhys

	sample.leadkpi() # Подключаем методику "5 почему"
	window.kpi.plain = yes
	window.kpi.list = UL
	strat.push window.kpi

	sample.glossary() # Подключаем методику "5 почему"
	window.glossary.plain = yes
	window.glossary.list = UL
	strat.push window.glossary

	strat.push (w = sample.pair()) # Методика попарного сравнения
	w.plain = yes
	w.list = UL


	bono = add "Поддержка процесса мышления", readonly:yes

	model.push bono

	mt5 = add "Программа поддерживает несколько методов поддержки процесса мышления,
		в частности, методы интеллектуальных карт и метод 6 шляп, разработанных
		де Боно. Также в этом разделе приведен способ генерации новых идей с помощью
		чтения цитат.", plain:yes

	bono.push mt5

	sample.sixhat() # Подключаем методику "6 шляп"
	window.sixh.plain = yes
	window.sixh.list = UL
	bono.push window.sixh

	sample.quotes() # Подключаем методику "5 почему"
	window.quotes.plain = yes
	window.quotes.list = UL
	bono.push window.quotes



	perso = add "Управление изменениями, личностный рост и психология"
	model.push perso

	pso1 = add "Программа позволяет легко реализовать различные формы и анкеты, 
		широко применяемые в психологии и различных методиках личностного
		роста", plain:yes
	perso.push pso1

	sample.projecti() # Подключаем методику "Проект Я"
	window.projecti.plain = yes
	window.projecti.list = UL
	perso.push window.projecti

	sample.maslow() # Подключаем методику "Проект Я"
	window.maslow.plain = yes
	window.maslow.list = UL
	perso.push window.maslow

	sample.anketa() # Подключаем методику "5 почему"
	window.ank.plain = yes
	window.ank.list = UL
	perso.push window.ank

	sample.forcefield() # Подключаем методику "5 почему"
	window.ffan.plain = yes
	window.ffan.list = UL
	perso.push window.ffan


	logic = add "Логический вывод и экспертные системы"
		readonly:yes
		nochildren:yes
	model.push logic

	logi1 = add "В этом разделе собраны примеры, когда система используется
			для вывода логических следствий", plain:yes 
	logic.push logi1
	###
	sample.prolog() # Подключаем методику "5 почему"
#	window.prol.plain = yes
#	window.prol.list = UL
#	logic.push window.prol

#	sample.lisp() # Подключаем методику "5 почему"
#	window.wlisp.plain = yes
#	window.wlisp.list = UL
#	logic.push window.wlisp
	###
	#
	# Прочие примеры
	#
	tobe = add "Прочие примеры"
		readonly:yes
		nochildren:yes
		guide: add "Прочие возможности программы" 
	model.push tobe

	tobe1 = add "В этом разделе собраны примеры реализации различных методологий", plain:yes 
	tobe.push tobe1

	sample.market() # Подключаем методику "5 почему"
	window.market.plain = yes
	window.market.list = UL
	tobe.push window.market

	tobe.push itr=sample.ishikawa()
	itr.plain = yes
	itr.list = UL

	tobe.push sstk=sample.sticker() 
	sstk.plain = yes
	sstk.list = UL

	tobe.push bb=sample.bcg() 
	bb.plain = yes
	bb.list = UL

	tobe.push gg1=sample.gantt() 
	gg1.plain = yes
	gg1.list = UL

	tobe.push bbo1=sample.blueocean() 
	bbo1.plain = yes
	bbo1.list = UL

	tobe.push cvv=sample.canvas() 
	cvv.plain = yes
	cvv.list = UL

	tobe.push cr=sample.circle() 
	cr.plain = yes
	cr.list = UL

	# Презентации и слайды
	tobe.push ssl=sample.slides()
	ssl.plain = yes
	ssl.list = UL
	mt01.run =-> 
		presentationToggle(on)
		false
	mt01.goto = ssl[0]

	tobe.push st=sample.start() 
	st.plain = yes
	st.list = UL


	#
	# Помощь: загрузка из файла
	#


	#
	# Финальные приготовления и запуск
	#

	sample.interface()
	###

#	wn = sample.nova() # Проверка новой процедуры draw()
#	wn = sample.forcefield() # Подключаем методику "Анализ силового поля"
#	wn = sample.swot()
	wn = sample.businessmodel()
#	wn = sample.text()

	setDefaults()

	wn.fhtml()
#	model.fhtml()
#	window.prol.fhtml()
#	window.cv1.fhtml()
#	library[4].fhtml()
#	st.fhtml()

#	window.ttt.fhtml()
#	hotkey.main.fhtml()
#	window.mmap.fhtml()
#	window.sixh.fhtml()
#	window.swotmain.fhtml()
#	mxx.fhtml()
#	presentationToggle(on)
#	ssl[0].fhtml()
# ssmap.fhtml()	
#	sstr.fhtml() # Разбираемся с деревьями
#	bb.fhtml()
#	sstk.fhtml()
#	gg1.fhtml()
#	bbo1.fhtml()
#	cvv.fhtml()
#	cr.fhtml()
#	itr.fhtml()