################################################
# MINDAY 0.009Tu 
# sample-matrix.coffee
# Пример работы с матрицами
################################################


sample.matrix = ->

	window.mx = adf "Работа с матрицами"
	mx.push add "Программа позволяет работать в различными матрицами. Например, 
		ниже приведен пример матрицы.",plain:yes
	mx.push m=add "Магический квадрат"
	m.push add [(add "2"),(add "7"),(add "6")]
	m.push add [(add "9"),(add "5"),(add "1")]
	m.push add [(add "4"),(add "3"),(add "8")]
	m.kindMatrix()

	mx.push mx0=add "Клавиши для работы с матрицами",plain:yes
	mx0.push add "Вставить матрицу можно с помощью клавиш <b>Ctrl-Alt-M</b>",plain:yes,list:UL
	mx0.push add "Вставить новую колонку после текущей можно с помощью клавиши <b>Tab</b>",plain:yes,list:UL
	mx0.push add "Вставить новую колонку до текущей можно с помощью клавиш <b>Shift-Tab</b>",plain:yes,list:UL
	mx0.push add "Вставить новый ряд после текущего можно с помощью клавиш <b>Ctrl-Enter</b>",plain:yes,list:UL
	mx0.push add "Вставить новый ряд до текущего можно с помощью клавиш <b>Shift-Ctrl-Enter</b>",plain:yes,list:UL
	mx0.push add "Очистить ячейку можно с помощью клавиши <b>Del</b>",plain:yes,list:UL
	mx0.push add "Удалить колонку можно с помощью клавиш <b>Alt-Del</b>",plain:yes,list:UL
	mx0.push add "Удалить ряд можно с помощью клавиш <b>Ctrl-Del</b>",plain:yes,list:UL
	mx0.push add "Добавить заголовки к колонкам можно с помощью клавиш <b>Ctrl-Alt-H</b>",plain:yes,list:UL
	mx0.push add "Добавить заголовки к рядам можно с помощью клавиш <b>Ctrl-Alt-Q</b>",plain:yes,list:UL
	mx0.push add "Менять ряды местами можно с помощью клавиш <b>Alt-стрелки вверх-вниз</b>",plain:yes,list:UL
	mx0.push add "Менять колонки местами можно с помощью клавиш <b>Alt-стрелки вправо-влево</b>",plain:yes,list:UL

	mx.push add "Матрицы могут иметь колонки и/или ряды, а внутри ячеек матрицы
	 могут быть другие матрицы и другие элементы, например, интеллектуальные карты:", plain:yes

	mf = add [(add "Положительный<br>мотиватор"),(add "Отрицательный<br>мотиватор")]
	mi = add [(add "Добавление<br>мотиватора"),(add "Удаление<br>мотиватора")]
	mx.push mfi=add "Влияние мотиваторов на поведение",row:mi,column:mf
	mfi.push add [(add "Стимуляция"),(add "Отказ")]
	mfi.push add [(q3=add "Отказ"),(q4=add "Стимуляция")]
	mfi.kindMatrix()

	q3.push q3m=add "Пример матрицы"
	q3m.push add [(add "2"),(add "7"),(add "6")]
	q3m.push add [(add "9"),(add "5"),(add "1")]
	q3m.push add [(add "4"),(add "3"),(add "8")]
	q3m.kindMatrix()

	q4.push q4ii=add "Стороны света"
	q4ii.push (add "Север"),(add "Восток"),(qy=add "Юг"),(add "Запад")
	qy.push (add "Китай"),(add "Япония")
	q4.kindMindmap()

	library.push window.mx
	window.mx

