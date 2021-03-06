#####################################################
# MINDAY 0.008BI 
# sample-slidea.coffee
# Примеры презентация и слайдов 
# Используется для презентации возможностей программы
#####################################################


sample.slides = ->

	pres = adf "Minday - презентация программы",
		kind:PRESENTATION
		guide: add "Для просмотра презентации нажмите клавишу <b>F5</b>"
		description: add "Пример \"быстрой\" презентации, выполнненной в программе Minday"
		state:PRESENTATION

	pres.push s10=adf "Minday - первые шаги",
		kind:SLIDE
		list:OL
		guide: add "Для перехода на следующий слайд нажмите <b>пробел</b>."
		description: add "Это пример презентации"
	s10.push add "Здравствуйте!"
	s10.push  add "Это - презентационный ролик, демонстрирующий возможности программы Minday. 
		В нем отражены назначение программ и показаны ее основные возможности, а также
		способы управления программой", plain:yes
	s10.push  s11=add "Клавиши управления презентацией"
	s11.push add "Для перемещения между слайдами используйте клавиши (они такие
		же, как и в Microsoft PowerPoint):",plain:yes
	s11.push add "Следущий слайд: <b>пробел, стрелка вправо (\u2192), стрелка вниз (\u2193), PgDn</b>",plain:yes,list:UL
	s11.push add "Предыдущий слайд: <b>Alt-Backspace (\u232B), стрелка влево (\u2190), стрелка вверх (\u2191), PgUp</b>",plain:yes,list:UL
	s11.push add "Начало презентации: <b>Home</b>",plain:yes,list:UL
	s11.push add "Конец презентации: <b>End</b>",plain:yes,list:UL
	s11.push add "Белый цвет экрана: <b>W</b>",plain:yes,list:UL
	s11.push add "Черный экрана: <b>B</b>",plain:yes,list:UL
	s11.push add "Начать презентацию с начала: <b>Alt-F5</b>",plain:yes,list:UL
	s11.push add "Начать презентацию с текущего слайда: <b>Shift-F5</b>",plain:yes,list:UL
	s11.push add "Завершить показ презентации: <b>Esc</b>",plain:yes,list:UL
	s11.push add "Перейти/выйти из режима редактирования презентации: <b>Ctrl-Alt-R</b>",plain:yes,list:UL

	pres.push s20=adf "Что такое Minday?", kind:SLIDE,list:OL
	s20.push  add "Minday - это программа, предназначенная для:",plain:yes 
	s20.push  add "Проведения мозговых штурмов",plain:yes,list:UL
	s20.push  add "Написания быстрых заметок и записи идей",plain:yes,list:UL
	s20.push  add "Записи и структуризации идей и другие неструктурированных знаний",plain:yes,list:UL
	s20.push  add "Использования различных методологий анализа (например, SWOT-анализ)",plain:yes,list:UL
	s20.push  add "Подобора похожих решений бизнес-задач",plain:yes,list:UL
	s20.push  add "Разработки сложных документов, например, предложение или стратегию",plain:yes,list:UL
	s20.push  add "Разработки планов и презентаций для проведения обучения",plain:yes,list:UL
	s20.push  add "Организации обмена и сохранения знаний в компании",plain:yes,list:UL

	pres.push s30=adf "Факты", kind:SLIDE,list:OL
	s30.push  add "В среднем разработка стратегии развития требует применения около 10 
		различных моделей анализа: SWOT-анализ, PEST-анализ и т.п.",plain:yes,list:UL
	s30.push  add "Разработанная стратегия для крупной компании включает более 
		100 диаграмм стандартных моделей",plain:yes,list:UL
	s30.push  add "Средняя дипломная работа студента MBA включает минимум 5 моделей",plain:yes,list:UL
	s30.push  add "Большинство современных управленческих технологий, применяемых во всех 
		компаниях, предусматривают совместную работу и проведение \"мозговых штурмов\"",plain:yes,list:UL

	pres.push s40=adf "Аудитория", kind:SLIDE,list:OL
	s40.push s41=add "Это задачи, которые <br>выполняют ежедневно по всему<br> миру тысячи людей",plain:yes,list:SPAN
	s41.push add "Консультанты",plain:yes,list:UL
	s41.push add "Аналитики",plain:yes,list:UL
	s41.push add "Разработчики",plain:yes,list:UL
	s41.push add "Преподаватели",plain:yes,list:UL
	s41.push add "Студенты вузов<br>и бизнес-школ",plain:yes,list:UL
	s41.push add "Руководители<br>и предприниматели",plain:yes,list:UL

	s40.push s42=add "Обычно это люди:",plain:yes,list:SPAN
	s42.push s43=add "Пользователи"
	s43.push add "умные и умеющие думать",plain:yes,list:UL
	s43.push add "креативные и создающие знания",plain:yes,list:UL
	s43.push add "с высшим образованием, умеющие использовать методологии",plain:yes,list:UL
	s43.push add "активные, готовые создавать и делиться знаниями",plain:yes,list:UL
	s42.kindMindmap()

	pres.push s50=adf "Проблемы существующих инструментов", kind:SLIDE,list:OL
	s50col = add [(add "Программа"),(add "Сложности использования")]
	s50.push s51=add "",column:s50col
	s51.push add [(add "Книги"),(add "линейны, нет шаблонов, не всегда под рукой")]
	s51.push add [(add "Консалтинг, коучинг"),(add "дорого, требует человека")]
	s51.push add [(add "Википедия, электронные библиотеки и словари "),(add "неинтерактивны, нет возможности работать со своими данными")]
	s51.push add [(add "Brainstorming"),(add "мало моделей")]
	s51.push add [(add "Cooperation"),(add "мало методологий, нет примеров")]
	s51.push add [(add "Word, Excel, PowerPoint, Visio, Mindmaps"),(add " много свободы, нет специализированных библиотек, плохие wizards, неудобная структуризация")]
	s51.push add [(add "ARIS, Mega и т.п."),(add "дорогие, закрытые пакеты")]
	s51.kindMatrix()

	pres.push s60=adf "Предлагаемое решение", kind:SLIDE,list:OL
	s60.push s61=add "Программа для:",plain:yes,list:UL
	s61.push add "индивидуальной и совместной работы",plain:yes,list:UL
	s61.push add "свободной и ведомой методологиями работы",plain:yes,list:UL
	s61.push add "записи и структурирования данных и идей",plain:yes,list:UL
	s60.push add "Портал: библиотека моделей, методологий, примеров",plain:yes,list:UL
	s60.push add "Площадка для обмена моделями, разработанными пользователей",plain:yes,list:UL
	s60.push add "Удобный инструмент",plain:yes,list:UL
	s60.push add "Стандарт по созданию и обмену моделей,  методологий в интернете",plain:yes,list:UL

	pres.push s70=adf "Отличительные характеристики программы", kind:SLIDE,list:OL
	s70.push add "Простой и быстрый интерфейс",list:UL
	s70.push add "Минимум нажатий клавиш и движений мышью",list:UL
	s70.push add "Неограниченная свобода мышления и помощь в структуризации",list:UL
	s70.push add "Красивые автоформатированные диаграммы",list:UL
	s70.push add "Быстрый подбор нужных моделей и методологий",list:UL
	s70.push add "Ненавязчивые и полезные инструкции",list:UL
	s70.push add "Одновременная работа нескольких пользователей с одним документом",list:UL
	s70.push add "Экспорт в популярные форматы данных (Word, PowerPoint)",list:UL

	pres.push s80=adf "Типы данных", kind:SLIDE,list:OL
	s80.push s81=add "Дотупные форматы"
	s81.push add "Идеи",list:UL
	s81.push add "Матрицы",list:UL
	s81.push add "Интеллектуальные карты",list:UL
	s81.push add "Пирамиды",list:UL
	s81.push add "Сегменты",list:UL
	s81.push add "Стратегические карты",list:UL
	s81.push add "Диаграмма Гантта",list:UL

	pres.push s90=adf "Ок, что дальше?", kind:SLIDE,list:OL
	s90.push add "Далее вы можете ознакомиться с основными возможностями программы
		и попробовать ее в действии. Для этого нажмите клавиши <b>Ctrl-Home</b> и вернитесь 
		к началу модели."

	pres
