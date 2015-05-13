################################################
# MINDAY 0.010 Tokyo 
# sample-businessmodel.coffee
# Примеры по книге "Построение бизнес-моделей"
################################################



sample.businessmodel = ->
	newBusinessModel = (tttt) ->
		tttt.add "",list:OL
		wn = tttt.adr "Бизнес-модель",frame:yes,tooltip:"Укажите название бизнес-модели"
		tttt.adr "", tooltip:"Укажите описание варианта бизнес-модели", placeholder:"Описание"

		t = wn.add "Используйте различные стили для группирования идей или, если необходимо, добавьте свои стили:"
			nochildren:yes,readonly:yes,plain:yes,list:OL,childtootip:"Каким цветом выделить разные идеи на модели?"
		t.add "Инновации",kind:STICKER,scheme:BLUE,plain:yes
		t.adr "Операциии и инфраструктура",kind:STICKER,scheme:LIGHTBLUE,plain:yes
		t.adr "Отношения с клиентами",kind:STICKER,scheme:GREEN,plain:yes

		d = wn.add "Заполните бизнес-модель:",intype:TABLE,plain:yes,list:OL

		sss = (n) ->
			s = "background-image:url(../methods/businessmodel/"
			s += n
			s += ".png);background-position:center center;background-repeat:no-repeat;"
			s += "background-color:White"
			s

		d1 = d.add "Ключевые партнеры"
			colspan:2,rowspan:2,w:"20%",h:"300px",tblstyle:sss(1),childtooltip:"Кто является нашими ключевыми партнерами?
				<br>Кто наши основные поставщики?<br>Какие ключевые ресурсы мы получаем от партнеров?<br>
				Какой ключевой деятельностью занимаются наши партнеры?",insertkind:STICKER 

		d2 = d.adr "Ключевые виды деятельности"
			colspan:2,w:"20%",tblstyle:sss(2),h:"150px",childtooltip: "Каких видов деятельности требуют наши 
				ценностные предложения?<br>Наши каналы сбыта?<br>Наши взаимоотношения с клиентами?<br>
				Наши потоки поступления доходов?",insertkind:STICKER

		d3 = d.adr "Ключевые ресурсы"
			colspan:2,rowspan:2,w:"20%",h:"300px",tblstyle:sss(3),childtooltip:"Какие ключевые ресурсы нужны для наших ценностных
				предложений?<br>Наших каналов сбыта?<br>Взаимоотношений с клиентами?<br>Потоков доходов?",insertkind:STICKER

		d4 = d.adr "Ценностные предложения"
			colspan:2,w:"20%",h:"150px",tblstyle:sss(4),childtooltip:"Какие ценности мы предлагаем потребителю?<br>
				Какие проблемы помогаем решить нашим клиентам?<br>
				Какие потребности удовлетворяем?<br>
				Какой набор товаров и услуг мы можем предложить каждому потребительскому сегменту?",insertkind:STICKER
		
		d5 = d.adr "Взаимоотношения с клиентами"
			colspan:2,rowspan:2,w:"20%",h:"150px",tblstyle:sss(5),childtooltip:"Отношения какого типа ждет каждый
				потребительский сегмент?<br>Какие отношения установлены?<br>Каких расходов они требуют?<br>
				Как они интегрированы в общую схему бизнес-модели?",insertkind:STICKER

		d6 = d.add "Каналы сбыта"
			colspan:2,tblstyle:sss(6),h:"150px",childtooltip:"Какие каналы взаимодействия были бы желательны
				для наших потребительских сегментов?<br>Как мы взаимодействуем с ними сейчас?<br>
				Как связаны наши каналы между собой?<br>Какие из них наиболее эффективны?<br>
				Какие наиболее выгодны?",insertkind:STICKER

		d7 = d.adr "Потребительские сегменты"
			colspan:2,tblstyle:sss(7),h:"150px",childtooltip: "Для кого мы создаем ценностное предложение?<br>
				Какие клиенты для нас более важны?",insertkind:STICKER

		d8 = d.add "Структура издержек"
			colspan:5,tblstyle:sss(8),w:"50%",h:"150px",childtooltip:"Какие наиболее важные расходы предполагает наша бизнес-модель?
				<br>Какие из ключевых ресурсов наиболее дороги?<br>Какие ключевые виды деятельности
				требуют нашибольших затрат?",insertkind:STICKER

		d9 = d.adr "Потоки поступления доходов"
			colspan:5,tblstyle:sss(9),w:"50%",h:"150px",childtooltip:"За что клиенты действительно готовы платить?<br>
				За что они платят в настоящее время?<br>
				Каким образом они платят?<br>
				Как они предпочли бы платить?<br>
				Какую часто общей прибыли приносит каждый поток поступлений доходов?",insertkind:STICKER

		# Дополнительные страницы
		#######################
		# 1. Ключевые партнеры
		#######################
		dd1 = adf "Ключевые партнеры",goto:d1
		d1.goto = dd1
		#dd1.add kind:IMAGE,url:"../methods/businessmodel/1.png"

		dd11 = dd1.add "Распределите партнеров по основным типы партнерских отношений:"
			plain:yes,intype:TABLE,childtooltip: "Какие отношения связывают компанию с партнерами?",list:OL
		t = dd11.add "Стратегическое сотрудничество между неконкурирующими компаниями"
			childtooltip:"Какие неконкурирующие компаниии являются партнерами?",tblstyle:"background-color:White;",h:"200px"
		t = dd11.adr "Соконкуренция: стратегическое партнерство между конкурентами"
			childtooltip:"Какие конкурирующие компаниии являются партнерами?",tblstyle:"background-color:White;"
		t = dd11.adr "Совместные предприятия для запуска новых бизнес-проектов"
			childtooltip:"Какие совместные предприятия создаются для запуска новых проектов?",tblstyle:"background-color:White;"
		t = dd11.adr "Отношения производителя с поставщиками для гарантии получения качественных комплектующих"
			childtooltip:"Партнерство с какими предприятиями обеспечивает гарантию поставок качественных комплектующих?",tblstyle:"background-color:White;"

		dd12 = dd1.add "Опишите основные мотивы создания партнерских отношений:"
			intype:TABLE,tooltip:"Какие основные мотивы для создания партнерских отношений?",plain:yes,list:OL
		t = dd12.add "Оптимизация и экономия в сфере производства"
			tooltip: "Как можно снизить издержки путем привлечения партнеров?",childkind:STICKER,w:"33%",h:"200px",style:"background-colo",tblstyle:"background-color:White;"
		t = dd12.adr "Снижение риска и неопределенности"
			tooltip: "Как можно снизить риск и неопределенность путеи привлечения партнеров?",childkind:STICKER,w:"33%",tblstyle:"background-color:White;"
		t = dd12.adr "Поставки ресурсов и совместная деятельность"
			tooltip: "Выполнение каких функций можно передать партнерам?",childkind:STICKER,w:"34%",tblstyle:"background-color:White;"

		#######################
		# 2. Ключевые виды деятельности
		#######################

		dd2 = adf "Ключевые виды деятельности",goto:d2
		d2.goto = dd2

		dd21 = dd2.add "Опишите основные виды деятельности компании:"
			plain:yes,intype:TABLE,childtooltip: "Какими видами деятельности занимается компания?",list:OL
		t = dd21.add "Производство"
			childtooltip:"Что производит компания?",tblstyle:"background-color:White;",h:"200px"
		t = dd21.adr "Решение проблем"
			childtooltip:"Какие проблемы решает компания?",tblstyle:"background-color:White;"
		t = dd21.adr "Платформы/сети"
			childtooltip:"Какими платформами/сетями управляет компания?",tblstyle:"background-color:White;"

		#######################
		# 3. Ключевые ресурсы
		#######################

		dd3 = adf "Ключевые ресурсы",goto:d3
		d3.goto = dd3

		dd31 = dd3.add "Определите, какие наиболее важные активы используются для функционирования бизнес-модели:"
			plain:yes,intype:TABLE,childtooltip: "Какие виды ресурсов важны для компании?",list:OL
		t = dd31.add "Материальные ресурсы"
			childtooltip:"Какие материальные ресурсы важны для реализации бизнес-модели?",tblstyle:"background-color:White;",h:"200px",w:"25%"
		t = dd31.adr "Интеллектуальные ресурсы"
			childtooltip:"Какие интеллектуальные ресурсы используются в бизнес-модели?",tblstyle:"background-color:White;",h:"200px",w:"25%"
		t = dd31.adr "Персонал"
			childtooltip:"Какие категории персонала критически важны для компании?",tblstyle:"background-color:White;",h:"200px",w:"25%"
		t = dd31.adr "Финансы"
			childtooltip:"Какие финансовые ресурсы использует компания?",tblstyle:"background-color:White;",h:"200px",w:"25%"

		#######################
		# 4. Ценностные предложения
		#######################

		dd4 = adf "Ценностные предложения",goto:d4
		d4.goto = dd4

		dd4.add "Укажите основные сегменты, в которых работает компания:"
			list:OL,plain:yes

		t = dd4.add "Выберите наиболее подходящие ценности, которые мы предоставляем клиентам:"
			list:OL,plain:yes,intype:TABLE,childtooltip:"Какие ценности важны для клиентов?"

		tt1 = "Укажите потребительский сегмент"
		tt2 = "Укажите дополнительные ценности, предоставляемые клиенту"

		t.add "Вид ценности",th:yes
		t.adr "",th:yes,placeholder:"Сегмент",tooltip:tt1
		t.adr "",th:yes,placeholder:"Сегмент",tooltip:tt1
		t.adr "",th:yes,placeholder:"Сегмент",tooltip:tt1
		t.adr "",th:yes,placeholder:"Сегмент",tooltip:tt1

		t.add "Новизна"
		t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;

		t.add "Производительность"
		t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;

		t.add "Изготовление на заказ"
		t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;

		t.add "Поделиться своей работой"
		t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;

		t.add "Дизайн"
		t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;

		t.add "Бренд/статус"
		t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;

		t.add "Цена"
		t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;

		t.add "Уменьшение расходов"
		t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;

		t.add "Снижение рисков"
		t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;

		t.add "Доступность"
		t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;

		t.add "Удобство/применимость"
		t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;

		t.add "",placeholder:"Ценность",tooltip:tt2
		t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;

		t.add "",placeholder:"Ценность",tooltip:tt2
		t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;

		t.add "",placeholder:"Ценность",tooltip:tt2
		t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;t.adr kind:TICK;


		#######################
		# 5. Взаимоотношения с клиентами
		#######################
		dd5 = adf "Взаимоотношения с клиентами",goto:d5
		d5.goto = dd5

		t = dd5.add "Выберите наиболее подходящие стили взаимоотношений с клиентами:",list:OL,plain:yes
		t.add kind:TICK
		t.adr "Персональная поддержка"
		t.add kind:TICK
		t.adr "Особая персональная поддержка"
		t.add kind:TICK
		t.adr "Самообслуживание"
		t.add kind:TICK
		t.adr "Автоматизированное обслуживание"
		t.add kind:TICK
		t.adr "Сообщества"
		t.add kind:TICK
		t.adr "Совместное создание"

		t = dd5.add "Опишите основные виды отношений с клиентами для различных сегментов:",list:OL,plain:yes,intype:TABLE
		t.add "Клиенский сегмент",rowspan:2,th:yes
		t.adr "Мотив",colspan:3,th:yes
		t.adr "Виды отношений",rowspan:2,th:yes	
		t.add "Приобретение<br>клиентов",th:yes,plain:yes
		t.adr "Удержание<br>клиентов",th:yes,plain:yes
		t.adr "Увеличение<br>продаж",th:yes,plain:yes

		t.add "",placeholder:"Сегмент"
		t.adr kind:TICK
		t.adr kind:TICK
		t.adr kind:TICK
		t.adr "",placeholder:"Отношения"

		t.add "",placeholder:"Сегмент"
		t.adr kind:TICK
		t.adr kind:TICK
		t.adr kind:TICK
		t.adr "",placeholder:"Отношения"

		t.add "",placeholder:"Сегмент"
		t.adr kind:TICK
		t.adr kind:TICK
		t.adr kind:TICK
		t.adr "",placeholder:"Отношения"

		t.add "",placeholder:"Сегмент"
		t.adr kind:TICK
		t.adr kind:TICK
		t.adr kind:TICK
		t.adr "",placeholder:"Отношения"

		#######################
		# 6. Каналы сбыта
		#######################


		dd6 = adf "Каналы сбыта",goto:d6
		d6.goto = dd6

		t = dd6.add "Определить основные каналы сбыта и их роль в взаимодействии с клиентами:",list:OL,plain:yes,intype:TABLE

		t.add "Канал сбыта",th:yes,rowspan:2
		t.adr "Этапы",colspan:5,th:yes
		t.adr "Оценка<br>выгодности",rowspan:2,th:yes	
		t.add "Предоставление<br>информации",th:yes,plain:yes
		t.adr "Возможность<br>оценки",th:yes,plain:yes
		t.adr "Продажа",th:yes,plain:yes
		t.adr "Доставка",th:yes,plain:yes
		t.adr "Постпродажное<br>обслуживание",th:yes,plain:yes

		tt1 = "Как мы повышаем осведомленность потребителя о товарах и услугах нашей компании?"
		tt2 = "Как мы помогаем клиентам оценивать ценностные предложения нашей компании?"
		tt3 = "Каким образом мы предоставляем клиентам возможность приобретения определенных товаров и услуг?"
		tt4 = "Как мы доставляем клиентам наши ценностные предложения?"
		tt5 = "Как мы обеспечиваем клиентам постпродажное обслуживание?"
		tt6 = "Насколько выгодно нам работать с этим каналом?"

		t.add "Торговые агенты"
		t.adr "",tooltip:tt1
		t.adr "",tooltip:tt2
		t.adr "",tooltip:tt3
		t.adr "",tooltip:tt4
		t.adr "",tooltip:tt5
		t.adr "",tooltip:tt6

		t.add "Продажи через Интернет"
		t.adr "",tooltip:tt1
		t.adr "",tooltip:tt2
		t.adr "",tooltip:tt3
		t.adr "",tooltip:tt4
		t.adr "",tooltip:tt5
		t.adr "",tooltip:tt6

		t.add "Фирменные магазины"
		t.adr "",tooltip:tt1
		t.adr "",tooltip:tt2
		t.adr "",tooltip:tt3
		t.adr "",tooltip:tt4
		t.adr "",tooltip:tt5
		t.adr "",tooltip:tt6

		t.add "Партнерские магазины"
		t.adr "",tooltip:tt1
		t.adr "",tooltip:tt2
		t.adr "",tooltip:tt3
		t.adr "",tooltip:tt4
		t.adr "",tooltip:tt5
		t.adr "",tooltip:tt6

		t.add "Оптовики"
		t.adr "",tooltip:tt1
		t.adr "",tooltip:tt2
		t.adr "",tooltip:tt3
		t.adr "",tooltip:tt4
		t.adr "",tooltip:tt5
		t.adr "",tooltip:tt6


		#######################
		# 7. Потребительские сегменты
		#######################

		dd7 = adf "Потребительские сегменты",goto:d7
		d7.goto = dd7

		dd7.add "Выберите с помощью галочки (",plain:yes,list:OL
		dd7.adr kind:TICK,val:yes,plain:yes
		dd7.adr	") наиболее подходящую бизнес-модель:",plain:yes

		t = dd7.add "Определите, какие клиентские сегменты будет обслуживать бизнес-модель:"
			plain:yes,childtooltip:"Какие клиентские сегменты будет обслуживать бизнес-модель?",intype:TABLE,list:OL

		t.add "Выбор",th:yes
		t.adr "Виды бизнес-модели",th:yes
		t.adr "Потребительские сегменты",th:yes

		t.add kind:TICK
		t.adr "Массовый рынок"
		q = t.adr "Описание рынка",childtooltip:"Как можно описать рынок?"
		q.add "",placeholder:"Рынок - это..."

		t.add kind:TICK
		t.adr "Нишевой рынок"
		q = t.adr "Описание ниши",childtooltip:"Как можно потребительскую нишу?"
		q.add "",placeholder:"Ниша - это..."

		t.add kind:TICK
		t.adr "Дробное сегментирование"
		q = t.adr "Описание сгементов",childtooltip:"Как можно описать сегменты рынка?"
		q.add "",placeholder:"Сегмент 1"
		q.add "",placeholder:"Сегмент 2"
		q.add "",placeholder:"Сегмент 3"

		t.add kind:TICK
		t.adr "Многопрофильное предприятие"
		q = t.adr "Описание основных сегментов",childtooltip:"Как можно описать основные сегменты?"
		q.add "",placeholder:"Сегмент 1"
		q.add "",placeholder:"Сегмент 2"

		t.add kind:TICK
		t.adr "Многосторонние платформы<br>(или моногосторонние рынки)"
		q = t.adr "Описание основных сегментов",childtooltip:"Как можно описать основные сегменты?"
		q.add "",placeholder:"Сегмент 1"
		q.add "",placeholder:"Сегмент 2"

		t = dd7.add "Составьте карту эмпатии для каждого сегмента:"
			plain:yes,list:OL

		empatyMap = (t) ->
			tt = t.add "Сегмент",list:UL,frame:yes
			ttt = tt.add "Ответьте на вопросы карты эмпатии для клиентского сегмента?",list:OL,intype:TABLE,plain:yes

			q = ttt.add "Что она думает и чувствует?",colspan:2
			q.add "",list:UL,placeholder:"Что на самом деле важно?"
			q.add "",list:UL,placeholder:"Основные занятия"
			q.add "",list:UL,placeholder:"Проблемы и радости"
			ttt.add "Что она слышит?"
			ttt.adr "Что она видит?"
			ttt.add "Что она говорит и делает?",colspan:2
			ttt.add "Что ее тревожит?"
			ttt.adr "К чему она стремится?"

			tt

		empatyMap t
		empatyMap t
		empatyMap t
		empatyMap t

		#######################
		# 8. Структура издержек
		#######################

		dd8 = adf "Структура издержек",goto:d8
		d8.goto = dd8

		t = dd8.add "Опишите наиболее подходящую бизнес-модель в отношении издержек",plain:yes,list:OL,intype:TABLE

		t.add "Выбор",th:yes
		t.adr "Вид бизнес-модели",th:yes
		t.adr "Описание подхода",th:yes

		t.add kind:TICK
		t.adr "Ориентация на <br>оптимизацию издержек"
		tt = t.adr "Снижаемые издержки",childtooltip:"Какие издержки будут сокращаться?",childplaceholder:"Вид издержек"
		tt.add ""

		t.add kind:TICK
		t.adr "Ориентация на создание <br>дополнительной ценности"
		tt = t.adr "Создаваемые ценности",childtooltip:"Почему клиент будет готов платить дополнительные деньги за создаваемые ценности?",childplaceholder:"Вид ценностей"
		tt.add ""

		t = dd8.add "Определить возможности по сокращению следующих видов издержек:",plain:yes,list:OL,intype:TABLE

		t.add "Вид издержек",th:yes
		t.adr "Способы снижения",th:yes

		t.add "Постоянные затраты"
		t.adr "",placeholder:"Способы снижения постоянных затрат"

		t.add "Переменные затраты"
		t.adr "",placeholder:"Способы снижения переменных затрат"


		t = dd8.add "Рассмотрите способы снижения затрат:",plain:yes,list:OL,intype:TABLE

		t.add "Способ снижения затрат",th:yes
		t.adr "Применимость",th:yes
		t.adr "Варианты реализации",th:yes

		t.add "Экономия на масштабе"
		t.adr kind:TICK
		t.adr "",placeholder:"Способы снижения издержек"

		t.add "Эффекти диверсификации"
		t.adr kind:TICK
		t.adr "",placeholder:"Способы снижения издержек"


		#######################
		# 9. Потоки поступления доходов
		#######################


		dd9 = adf "Потоки поступления доходов",goto:d9
		d9.goto = dd9

		t = dd9.add "Опишите основные потоки получения доходов:",plain:yes,list:OL,intype:TABLE
		t.add "Вид дохода",th:yes
		t.adr "Описание",th:yes
		t.add "Продажа активов"
		t.adr "&nbsp;"
		t.add "Плата за использование"
		t.adr "&nbsp;"
		t.add "Оплата подписки"
		t.adr "&nbsp;"
		t.add "Аренда/рента/лизинг"
		t.adr "&nbsp;"
		t.add "Лицензии"
		t.adr "&nbsp;"
		t.add "Комиссии"
		t.adr "&nbsp;"
		t.add "Реклама"
		t.adr "&nbsp;"

		t = dd9.add "Опишите подход к ценообразованию:",plain:yes,list:OL,intype:TABLE
		t.add "Фиксированные цены",th:yes
		t.adr "Свободные цены",th:yes
		tt = t.add null
		tt.add kind:TICK
		tt.adr "Цена по прейскуранту"
		tt.add kind:TICK
		tt.adr "Зависимость от характеристик продукта"
		tt.add kind:TICK
		tt.adr "Зависимость от потребительского сегмента"
		tt.add kind:TICK
		tt.adr "Зависимость от величины закупки"
		tt=t.adr null
		tt.add kind:TICK
		tt.adr "Договор между партнерами (торги)"
		tt.add kind:TICK
		tt.adr "Управление доходами"
		tt.add kind:TICK
		tt.adr "Торговля в реальном времени"
		tt.add kind:TICK
		tt.adr "Аукцион"

		wn


	################################
	#
	# Анализ среды
	#
	################################
	environmentAnalysis  = (mm) ->
		mm0 = mm.add "Оцените влияние различных факторов на бизнес-модель:",intype:TABLE,plain:yes,list:OL
		mm1 = mm0.add "Отраслевые факторы",w:"150px",h:"150px",frame:yes,intype:TABLE
		mm2 = mm0.adr "Рыночные факторы",w:"150px",h:"150px",frame:yes,intype:TABLE
		mm3 = mm0.add "Ключевые тенденции",w:"150px",h:"150px",frame:yes,intype:TABLE
		mm4 = mm0.adr "Макроэкономические факторы",w:"150px",h:"150px",frame:yes,intype:TABLE

		mm1.add "Конкуренты (устойчивые компании)"
		mm1.add "Новички (нарушители спокойствия)"
		mm1.add "Заменители товары и услуги"
		mm1.add "Поставщики и другие участники цепочки создания стоимости"
		mm1.add "Заинтересованные стороны"

		mm2.add "Движущие силы рынка"
		t = mm2.adr null
		t.add "Какие движущие факторы определяют потребительскую картину рынка?",list:UL
		t.add "Какие перемены возможны в ближайшем будущем?",list:UL
		t.add "Куда движется рынок?",list:UL
		mm2.adr "",placeholder:"Ответы"
		mm2.add "Сегменты рынка"
		mm2.adr ""
		mm2.adr ""
		mm2.add "Потребности и спрос"
		mm2.adr ""
		mm2.adr ""
		mm2.add "Затраты на переключение"
		mm2.adr ""
		mm2.adr ""
		mm2.add "Привлечение прибыли"
		mm2.adr ""
		mm2.adr ""

		mm3.add "Технологические тенденции"
		mm3.add "Законодательные тенденции"
		mm3.add "Общественные и культурные тенденции"
		mm3.add "Социоэкономические тенденци"
		mm4.add "Условия мирового рынка"
		mm4.add "Фондовые рынки"
		mm4.add "Сырье и другие ресурсы"
		mm4.add "Экономическая инфраструктура"

	############################################
	#
	# SWOT-анализ
	#
	############################################

	swotAnalysis = (mm) ->
		sw = mm.add "Определите сильные и слабые стороны, возможности и угрозы для каждого из разделов
			бизнес-модели",plain:yes,list:OL,intype:TABLE

		sw1 = sw.add "Ключевые партнеры"
			colspan:2,rowspan:2,w:"20%",frame:yes

		sw10 = sw1.add "Выберите подходящие факторы, дополните другими факторами.",list:OL,intype:TABLE,plain:yes
		sw1s = sw10.add "Сильные стороны",childplaceholder:"Другие сильные стороны"
		sw1s.add "При возможности мы налаживаем отношения и работаем с партнерами",list:UL
		sw1s.add "У нас с партнерами прекрасные отношения",list:UL
		sw1s.add "",list:UL
		sw1w = sw10.adr "Слабые стороны",childplaceholder:"Другие слабые стороны"
		sw1w.add "Мы не можем наладить эффективные отношения с партнерами",list:UL
		sw1w.add "Рабочие отношения с партнерами часто приводят к конфликтам",list:UL
		sw1w.add "",list:UL
		sw1o = sw10.add "Возможности",childplaceholder:"Другие возможности"
		sw1o.add "Есть ли возможности для привлечения ресурсов со стороны?",list:UL
		sw1o.add "Помогает ли более тесная связь с партнерами лучше вести основную деятельность?",list:UL
		sw1o.add "Есть ли возможности для перекрестных продаж с партнерами?",list:UL
		sw1o.add "Могут ли партнерские каналы для налаживания связи с потребителями?",list:UL
		sw1o.add "Могут ли партнеры дополнить ценностное предложение?",list:UL
		sw1o.add "",list:UL
		sw1t = sw10.adr "Угрозы",childplaceholder:"Другие угрозы"
		sw1t.add "",list:UL

		sw2 = sw.adr "Ключевые виды деятельности"
			colspan:2,w:"20%",frame:yes
		sw20 = sw2.add "Выберите подходящие факторы и дополните по необходимости.",list:OL,intype:TABLE,plain:yes
		sw2s = sw20.add "Сильные стороны",childplaceholder:"Другие сильные стороны"
		sw2s.add "",list:UL
		sw2w = sw20.adr "Слабые стороны",childplaceholder:"Другие слабые стороны"
		sw2w.add "",list:UL
		sw2o = sw20.add "Возможности",childplaceholder:"Другие возможности"
		sw2o.add "",list:UL
		sw2t = sw20.adr "Угрозы",childplaceholder:"Другие угрозы"
		sw2t.add "",list:UL

		sw3 = sw.adr "Ключевые ресурсы"
			colspan:2,rowspan:2,w:"20%",frame:yes
		sw30 = sw3.add "Выберите подходящие факторы и дополните по необходимости.",list:OL,intype:TABLE,plain:yes
		sw3s = sw30.add "Сильные стороны",childplaceholder:"Другие сильные стороны"
		sw3s.add "",list:UL
		sw3w = sw30.adr "Слабые стороны",childplaceholder:"Другие слабые стороны"
		sw3w.add "",list:UL
		sw3o = sw30.add "Возможности",childplaceholder:"Другие возможности"
		sw3o.add "",list:UL
		sw3t = sw30.adr "Угрозы",childplaceholder:"Другие угрозы"
		sw3t.add "",list:UL

		sw4 = sw.adr "Ценностные предложения"
			colspan:2,w:"20%",frame:yes
		sw40 = sw4.add "Выберите подходящие факторы и дополните по необходимости.",list:OL,intype:TABLE,plain:yes
		sw4s = sw40.add "Сильные стороны",childplaceholder:"Другие сильные стороны"
		sw4s.add "",list:UL
		sw4w = sw40.adr "Слабые стороны",childplaceholder:"Другие слабые стороны"
		sw4w.add "",list:UL
		sw4o = sw40.add "Возможности",childplaceholder:"Другие возможности"
		sw4o.add "",list:UL
		sw4t = sw40.adr "Угрозы",childplaceholder:"Другие угрозы"
		sw4t.add "",list:UL

		sw5 = sw.adr "Взаимоотношения с клиентами"
			colspan:2,rowspan:2,w:"20%",frame:yes
		sw50 = sw5.add "Выберите подходящие факторы и дополните по необходимости.",list:OL,intype:TABLE,plain:yes
		sw5s = sw50.add "Сильные стороны",childplaceholder:"Другие сильные стороны"
		sw5s.add "",list:UL
		sw5w = sw50.adr "Слабые стороны",childplaceholder:"Другие слабые стороны"
		sw5w.add "",list:UL
		sw5o = sw50.add "Возможности",childplaceholder:"Другие возможности"
		sw5o.add "",list:UL
		sw5t = sw50.adr "Угрозы",childplaceholder:"Другие угрозы"
		sw5t.add "",list:UL

		sw6 = sw.add "Каналы сбыта"
			colspan:2,frame:yes
		sw60 = sw6.add "Выберите подходящие факторы и дополните по необходимости.",list:OL,intype:TABLE,plain:yes
		sw6s = sw60.add "Сильные стороны",childplaceholder:"Другие сильные стороны"
		sw6s.add "",list:UL
		sw6w = sw60.adr "Слабые стороны",childplaceholder:"Другие слабые стороны"
		sw6w.add "",list:UL
		sw6o = sw60.add "Возможности",childplaceholder:"Другие возможности"
		sw6o.add "",list:UL
		sw6t = sw60.adr "Угрозы",childplaceholder:"Другие угрозы"
		sw6t.add "",list:UL

		sw7 = sw.adr "Потребительские сегменты"
			colspan:2,frame:yes
		sw70 = sw7.add "Выберите подходящие факторы и дополните по необходимости.",list:OL,intype:TABLE,plain:yes
		sw7s = sw70.add "Сильные стороны",childplaceholder:"Другие сильные стороны"
		sw7s.add "",list:UL
		sw7w = sw70.adr "Слабые стороны",childplaceholder:"Другие слабые стороны"
		sw7w.add "",list:UL
		sw7o = sw70.add "Возможности",childplaceholder:"Другие возможности"
		sw7o.add "",list:UL
		sw7t = sw70.adr "Угрозы",childplaceholder:"Другие угрозы"
		sw7t.add "",list:UL

		sw8 = sw.add "Структура издержек"
			colspan:5,w:"50%",frame:yes
		sw80 = sw8.add "Выберите подходящие факторы и дополните по необходимости.",list:OL,intype:TABLE,plain:yes
		sw8s = sw80.add "Сильные стороны",childplaceholder:"Другие сильные стороны"
		sw8s.add "",list:UL
		sw8w = sw80.adr "Слабые стороны",childplaceholder:"Другие слабые стороны"
		sw8w.add "",list:UL
		sw8o = sw80.add "Возможности",childplaceholder:"Другие возможности"
		sw8o.add "",list:UL
		sw8t = sw80.adr "Угрозы",childplaceholder:"Другие угрозы"
		sw8t.add "",list:UL

		sw9 = sw.adr "Потоки поступления доходов"
			colspan:5,w:"50%",frame:yes
		sw90 = sw9.add "Выберите подходящие факторы и дополните по необходимости.",list:OL,intype:TABLE,plain:yes
		sw9s = sw90.add "Сильные стороны",childplaceholder:"Другие сильные стороны"
		sw9s.add "",list:UL
		sw9w = sw90.adr "Слабые стороны",childplaceholder:"Другие слабые стороны"
		sw9w.add "",list:UL
		sw9o = sw90.add "Возможности",childplaceholder:"Другие возможности"
		sw9o.add "",list:UL
		sw9t = sw90.adr "Угрозы",childplaceholder:"Другие угрозы"
		sw9t.add "",list:UL

	blueOceanAnalysis = (wn) ->

		t = wn.add "Развивайте бизнес-модель, обозначая новые возможности и удаляя лишние с помощью метода 'голубых океанов'",plain:yes,list:OL,intype:TABLE
		t.add "Исключить",th:yes
		t.adr "Увеличить",th:yes
		t.add "Какие факторы, долгое время составляющие предмет конкуренции в вашей отрасли вы могли бы исключить?",plain:yes
		t.adr "Какие факторы следует значительно увеличить по сравнению с существующими в отрасли стандартами?",plain:yes
		t.add "Сократить",th:yes
		t.adr "Создать",th:yes
		t.add "Какие факторы следует значительно сократить по сравнению с существующими в отрасли стандартами?",plain:yes
		t.adr "Какие факторы, из никогда не предлагавшихся ранее в отрасли стоит создать?",plain:yes

		sw = wn.add "Укажите факторы для каждого из разделов
			бизнес-модели",plain:yes,list:OL,intype:TABLE

		sw1 = sw.add "Ключевые партнеры"
			colspan:2,rowspan:2,w:"20%",childkind:STICKER

		sw2 = sw.adr "Ключевые виды деятельности"
			colspan:2,w:"20%",childkind:STICKER

		sw3 = sw.adr "Ключевые ресурсы"
			colspan:2,rowspan:2,w:"20%",childkind:STICKER

		sw4 = sw.adr "Ценностные предложения"
			colspan:2,w:"20%",childkind:STICKER

		sw5 = sw.adr "Взаимоотношения с клиентами"
			colspan:2,rowspan:2,w:"20%",childkind:STICKER

		sw6 = sw.add "Каналы сбыта"
			colspan:2,childkind:STICKER

		sw7 = sw.adr "Потребительские сегменты"
			colspan:2,childkind:STICKER

		sw8 = sw.add "Структура издержек"
			colspan:5,w:"50%",childkind:STICKER

		sw9 = sw.adr "Потоки поступления доходов"
			colspan:5,w:"50%",childkind:STICKER



	################################# 
	#
	# Верхнего уровня
	#
	#################################

	wn = adf "Бизнес-модель"

	wn.add "Разработано по книге Александра Остервальдера и Ива Пинье",plain:yes 
	wn.adr "\"Построение бизнес-моделей:Настольная книга стратега и новатора\".",plain:yes,url:"http://www.alpinabook.ru/catalogue/57308.html"

	t = wn.add "Введите название компании или проекта для бизнес-модели:"
		nochildren:yes,readonly:yes,plain:yes,list:OL
	t.add "",placeholder:"Название компании или проекта...",childtooltip:"Какое название у рассматриваемой компании или проекта?"

	t = wn.add "Создайте новый вариант бизнес-модели, нажав на клавишу ниже:",plain:yes,list:OL
	t.add "Создать новую бизнес-модель",plain:yes,forma:BUTTON,place:BAG,scheme:WHITE,run:->
		nbt = newBusinessModel(nt)
		nbt.fhtml(nbt)

	nt = wn.add "Заполните шаблон бизнес-модели компании. При необходимости, создайте несколько вариантов бизнес-модели:"
		nochildren:yes,readonly:yes,plain:yes,list:OL,intype:TABLE
	nt.add "#",th:yes
	nt.adr "Название варианта",th:yes
	nt.adr "Краткое описание варианта",th:yes

	t = wn.add "Проведите анализ среды бизнес-модели",plain:yes,list:OL
	asr = t.add "Анализ среды бизнес-модели",forma:BUTTON,place:BAG,scheme:WHITE,frame:yes,plain:yes
	environmentAnalysis asr

	t = wn.add "Проведите оценку сильных и слабых сторон бизнес-модели, рассмотрите возникающие
		возможности и угрозы при ее реализации:",plain:yes,list:OL
	swt = t.add "SWOT-анализ",forma:BUTTON,place:BAG,scheme:WHITE,frame:yes,plain:yes
	swotAnalysis(swt)

	t = wn.add "Разработайте новые возможности бизнес-модели с помощью метода 'голубых океанов'",plain:yes,list:OL
	boa = t.add "Анализ голубых океанов",forma:BUTTON,place:BAG,scheme:WHITE,frame:yes,plain:yes
	blueOceanAnalysis(boa)

	wn


#	library.push bcvv 
#	bcvv
