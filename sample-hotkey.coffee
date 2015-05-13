################################################
# MINDAY 0.008BI 
# sample-hotkey.coffee
# Метод попарного сравнения. 
# На основе рассылки mindtools.com
################################################

hotkey = {}

hotkey.init = ->
	hotkey.main = adf "Клавиши управления программой"

	m1 = add "Курсор", list:OL
	m2 = add "Редактирование", list:OL
	m20 = add "Форматирование", list:OL
	m3 = add "Вставка", list:OL
	m4 = add "Удаление", list:OL
	m5 = add "Фреймы", list:OL
	m6 = add "Форматирование", list:OL
	m7 = add "Перемещение", list:OL
	m8 = add "Правка", list:OL
	m9 = add "Списки", list:OL
	mA = add "Поиск", list:OL
	mB = add "Экранный режим", list:OL


	hotkey.main.push m1,m2,m20,m3,m4,m5,m6,m7,m8,m9,mA

	m10 = add "Перемещение между идеями производится с помощью <b>клавиш со стрелками</b>."
		plain:yes
	m11 = add "Можно перемещаться на следующую идею также с помощью клавиши <b>Enter</b>.
		Если идея - последняя в списке, то программа добавит новую идею в конце списка
		и переместится на эту новую идею"
		plain:yes
	m12 = add "Чтобы переместиться на предыдущую идею используйте клавиши <b>Alt-Backspace</b>."
		plain:yes

	m1.push m10,m11,m12

	m2.push add "Для редактирования идей используйте
			клавишу <b>F2</b>", plain:yes, readonly:yes
	m2.push add "<i>Попробуйте отредактируйте эту идею. Для завершения, нажмите <b>F2</b> 
		или <b>Enter</b></i>", plain:yes
	m2.push add "Обратите внимание, что редактировать можно не все
			идеи, а только те, для которых это разрешено. Например, попробуйте отредактировать
			эту идею"
			plain:yes
			readonly:yes
			style: add "color:Gray"
	m2.push add "Если идея запрещена для редактирования, но все-таки это очень нужно сделать,
		то можно снять или установить флаг запрета на редактирование с помощью клавиш <b>Alt-R</b>"
		plain:yes

	m20.push add "Во время редактирования идеи можно установить формат отдельных 
		фрагментов текста с помощью соответствующих клавиш",plain:yes
	m20.push add "<b>Жирный шрифт</b> - клавиши <b>Ctrl-B</b>",plain:yes,list:UL
	m20.push add "<i>Наклонный шрифт</i> - клавиши <b>Ctrl-I</b>",plain:yes,list:UL
	m20.push add "<u>Подчеркнутый шрифт</u> - клавиши <b>Ctrl-U</b>",plain:yes,list:UL
	m20.push add "<span style='text-decoration:line-through;'>Зачеркнутый текст</span> - клавиши <b>Ctrl-U</b>",plain:yes,list:UL
	m20.push add "Текст в рамочке - клавиши <b>Ctrl-Alt-O</b>",plain:yes,list:UL,border:yes
	m20.push add "Новая строка (без создания новой идеи) - клавиши <b>Shift-Enter</b>",plain:yes,list:UL

	m30 = add "Для вставки идеи после текущей используйте клавиши <b>Ctrl-Enter</b>",
		plain:yes
	m31 = add "Для вставки идеи перед текущей используйте клавиши <b>Ctrl-Shift-Enter</b>",
		plain:yes
	m32 = add "Для вставки дочерней идеи используйте клавишу <b>Ins</b>"
		plain:yes
	m3.push m30,m31,m32

	m40 = add "Удаление идей производится клавишей <b>Del</b>."		
		plain:yes
	m4.push m40


	m50 = add "Для того, чтобы перейти вглубь фрема используте клавишу <b>Enter</b>",plain:yes
	m51 = add "Для того, чтобы перенести идею и ее дочерние идеи в отдельный фрейм,
		используйте клавиши <b>Alt-Enter</b>",plain:yes
	m52 = add "Для того, чтобы поднять подидеи из фрейма на уровень выше также используйте
		клавиши <b>Alt-Enter</b>",plain:yes
	m5.push m50,m51,m52

	m60 = add "Для переключение представления идеи в виде заголовка 
		и простого текста нажмите <b>Alt-P</b>."		
		plain:yes
	m61 = add "Для переключение представления идеи в формате  
		ненумерованного списка нажмите <b>Alt-U</b>."		
		plain:yes
	m62 = add "Для переключение представления идеи в формате 
		нумерованного списка <b>Alt-O</b>."		
		plain:yes
	m63 = add "Для переключение представления идеи виде чекбокса <b>Alt-C</b>."		
		plain:yes
	m64 = add "Для переключение представления идеи в формате 
		\"да-нет\" <b>Alt-Y</b>."		
		plain:yes
	m65 = add "Для переключение представления идеи в формате числа с процентами
		<b>Alt-E</b>."		
		plain:yes

	m6.push m60,m61,m62,m63,m64,m65

	m70 = add "Для перемещения идей вверх или вниз можно использовать клавиши
		<b>Alt-стрелка вверх</b> и <b>Alt-стрелка вниз</b>."		
		plain:yes
	m7.push m70

	m8.push add "Для того, чтобы вырезать идею используйте клавиши <b>Ctrl-X</b>",plain:yes
	m8.push add "Для того, чтобы скопировать идею используйте клавиши <b>Ctrl-C</b>",plain:yes
	m8.push add "Для того, чтобы вставить идею используйте клавиши <b>Ctrl-V</b>",plain:yes
	m8.push add "Для того, чтобы продублировать идею используйте клавиши <b>Ctrl-2</b>",plain:yes

	m9.push add "Программа позволяет работать со списками следующих видов",plain:yes
	m9.push m9ul=add "Ненумерованный список - клавиши <b>Alt-U</b>",plain:yes
	m9ul.push add "Красный",plain:yes,list:UL
	m9ul.push add "Желтый",plain:yes,list:UL
	m9ul.push add "Зеленый",plain:yes,list:UL

	m9.push m9ol=add "Нумерованный список - клавиши <b>Alt-O</b>",plain:yes
	m9ol.push add "Один",plain:yes,list:OL
	m9ol.push add "Два",plain:yes,list:OL
	m9ol.push add "Три",plain:yes,list:OL

	m9.push m9span=add "Горизонтальное перечисление идей - клавиши <b>Ctrl-1</b>",plain:yes
	m9span.push add "Veni",plain:yes,list:SPAN
	m9span.push add "Vidi",plain:yes,list:SPAN
	m9span.push add "Vici",plain:yes,list:SPAN

	mA.push add "Для того, чтобы найти нужную идею можно воспользоваться клавишами
		<b>Ctrl-F</b>",plain:yes

	mB.push add "Для перехода в полноэкранный режим воспользуйтесь клавишами <b>Ctrl-F11</b>",plain:yes
	mB.push add "Вместе со стандартными для браузера клавишей <b>F11</b> вы сможете
		работать на полном экране",plain:yes



sample.hotkey = ->
	hotkey.init()
	library.push hotkey.main
	hotkey.main
