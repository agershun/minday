################################################
# MINDAY 0.010 Tokyo 
# sample-nova.coffee
# Пример текста
################################################


sample.nova = ->
	wn = adf "Возможности программы",kind:TABS,activetab:0
	t1=wn.add "Первый"
	t2=wn.adr "Второй"

	t1.add "Привет, первый!"
	t2.add "Привет, второй!"


	###
	r = wn.add intype:LINE
	r.add kind:ICON,val:0
	r.adr "Основной вопрос: Как проще добавлять идеи типа TICK и ICON в текст?"
	r.adr kind:TICK,val:yes
	wn.add "Следующая идея"
	wn.adr "Следующая идея"
	wn.add kind:IMAGE,url:"strategy-big.jpg",w:226,h:150



	tr = wn.add "Организационная структура",kind:TREE
	tr0 = tr.add OUTSIDE,"Генеральный директор",kind:NODE
	tr0.add "Иванов А.А."
	
	tr1=tr0.add OUTSIDE,"Финансовый директор",kind:NODE
	tr1.add "Петров Д.Б."

	tr2=tr0.add OUTSIDE,"Коммерческий директор",kind:NODE
	tr2.add "Сидоров Е.Ж."
	tr2.add kind:IMAGE,url:"strategy-big.jpg",w:226,h:150

	
	mm = wn.add "Интеллектуальная<br>карта",kind:MINDMAP
	mms = mm.add OUTSIDE,"Идея",kind:MINDLEAF
	mms.add "Интересная<br>идея?"
	mm1=mms.add OUTSIDE,"Раз",kind:MINDLEAF
	mm1.add "Раз-раз-раз"
	mms.add OUTSIDE,"Два",kind:MINDLEAF
	mms.add OUTSIDE,"Три",kind:MINDLEAF
#	mm4 = mms.add OUTSIDE,"Четыре",kind:MINDLEAF
#	mm4.add OUTSIDE,"Кто",kind:MINDLEAF
#	mm41 = mm4.add "Просто текст",intype:TABLE
#	mm42 = mm41.add "Просто текст"
#	mm41.adr "Просто текст"
#	mm41.add "Просто текст"
#	mm41.adr "Просто текст"
#	mq = mm42.add "Интеллектуальная карта", kind:MINDMAP
#	mq0=mq.add OUTSIDE, "раз",kind:MINDLEAF
#	mq0.add OUTSIDE,"Огого",kind:MINDLEAF
#	mq0.add OUTSIDE,"Огого",kind:MINDLEAF
#	mqq0=mq0.add "Еще одна подкарта",kind:MINDMAP
#	mqqq0 = mqq0.add OUTSIDE,"Вот",kind:MINDLEAF
#	mqqq0.add OUTSIDE,"Ку",kind:MINDLEAF
#	mqqq0.add OUTSIDE,"Ку",kind:MINDLEAF
#	mqqq0.add OUTSIDE,"Ку",kind:MINDLEAF
#	mqqq0.add OUTSIDE,"Ку",kind:MINDLEAF
#	mqqq0.add OUTSIDE,"Ку",kind:MINDLEAF
	###
	###
	e = r.add "Это еще"
	e.add AFTER,"Раз"
	e.add AFTER,"Два"
	e.add AFTER,"Три"
	e.add BEFORE,"Раз"
	e.add BEFORE,"Два"
	e.add BEFORE,"Три"
	q = wn.add "Это пример галочки"
	q.add kind:TICK
	q.add 0,kind:TICK,val:yes
	q.add 0,kind:TICK,val:no
	q.add 1,kind:TICK,val:yes
	q.add 1,"Это просто стикер",kind:STICKER,plain:yes
	q.add 1,"А это - <br> не просто стикер",kind:STICKER
	q.add 2,kind:TICK,val:no

	w = wn.add "Описание"
	w.add "Эта страница на примере ценностного предложения демонстрирует отдельные
	 возможности программы Minday. Вы можете перейти с помощью клавиш курсора к шаблону
	 ценностного предложения и заполнить недостающие элементы.",plain:yes

	a = wn.add "Ценностное предложение",border:true,intype:LIST
	a.add "",placeholder:"Название продукта/проекта",tooltip:"Введите название проекта"
	a.adr "&nbsp;- это&nbsp;"
	a.adr "",placeholder:"категория продукта",tooltip:"Например, напиток или услуга"
	a.adr "&nbsp;для&nbsp;"
	a.adr "",placeholder:"целевой аудитории"
	a.adr ", который&nbsp;"
	a.adr "",placeholder:" решает основную задачу"
	a.adr "&nbsp;посредством&nbsp;"
	a.adr "",placeholder:"уникальности"

	b = wn.add "Пример предложения"
	b.add "Гугл - это <b>поисковая система</b> для <b>пользователей интернета</b>, которая
  	<b>позволяет людям быстро находить необходимую информацию</b>, применяя <b>лучшие алгоритмы
  	для получения быстрого и точного результата поиска</b>"

	c = wn.add null,intype:TABLE,tableclass:0
	c.add "Продукт",th:yes
	c.adr "Категория",th:true
	c.adr "Аудитория",th:true
	c.adr "Задача",th:true
	c.adr "Уникальность",th:true
	c.add "Minday"
	c.adr "программа"
	c.adr "аналитики"
	c.adr "структуризации идей"
	c.adr "широкого спектра встроенных методик"
	c.add "МАГ КОНСАЛТИНГ"
	c.adr "консалтинговая компания"
	c.adr "руководство компаний"
	c.adr "повышение эффективности управления"
	c.adr "технологии сбалансированного управления"


	d = wn.add "Бизнес-модель",intype:TABLE
	d.add "Ключевые партнеры",colspan:2,rowspan:2
	d.adr "Ключевые виды деятельности",colspan:2
	d.adr "Ключевые ресурсы",colspan:2,rowspan:2
	d.adr "Ценностные предложения",colspan:2
	d.adr "Взаимоотношения с клиентами",colspan:2,rowspan:2
	d.add "Каналы сбыта",colspan:2
	d.adr "Потребительские сегменты",colspan:2
	d.add "Структура издержек",colspan:5
	d.adr "Потоки поступления доходов",colspan:5
	###

	wn