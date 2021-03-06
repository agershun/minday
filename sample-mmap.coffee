################################################
# MINDAY 0.008BI 
# mmap.coffee
# Описание методики интеллектуальных карт
################################################

sample.mmap = ->
	#
	# MINDMAP
	#
	window.mmap = adf "Интеллектуальные карты (mind maps)"

	window.mmap.push add "В этом примере будет показан пример реализации интеллектуальных
		карт (mind maps), разработанных де Боно.",plain:yes

	mmaap = add "Пример интеллектуальной карты (mind map)"
	mmain = add "Стратегический<br/>анализ"
	mm0 = add "Основные положения"
	mm0.push add "Миссия"
	mm0.push add "Видение",forma:RECT,scheme:GREEN
	mm0.push add "Ценности",forma:OVAL,scheme:BLUE
	mm1 = add "Внутренний<br/>анализ"
	mm1.push add "Цепочка создания стоимости"
	mm1.push add "Стержневые компетенции"
	mm2 = add "Внешний<br/>анализ",forma:AARROW,scheme:RED
	mm2.push add "SWOT-анализ"
	mm2.push add "PEST-анализ"
	mm2.push add "Анализ<br/>рынка"
	mm2.push add "Анализ<br/>5 сил Портера"
	mm3 = add "Целеполагание"
	mm3.push add "Стратегические цели"
	mm3.push add "KPI"
	mmain.push mm0,mm1,mm2,mm3
	mmaap.push mmain
	mmaap.kindMindmap()

	window.mmap.push mmaap

	window.mmap.push mmk=add "Клавиши управления при работе с интеллектуальными картами"
	mmk.push add "Вставить карту можно с помощью клавиш <b>Ctrl-Alt-I</b>",plain:yes
	mmk.push add "Во время работы с интеллектуальной картой можно использовать
		практически все те же клавиши, что и при работе с простыми идеями, например: ",plain:yes
	mmk.push add "Вставка дочерней идеи - <b>Ins</b>",plain:yes,list:UL
	mmk.push add "Вставка следующей идеи - <b>Enter</b>",plain:yes,list:UL

	window.mmap.push mmq=add "Несколько интеллектуальных карт"
	mmq.push add "Да, в Minday можно одновремменно на одной странице работать с несколькими
		интеллектуальными картами!",plain:yes

	mmq.push mmqq0=add "Пример карты"
	mmqq0.push mmqq=add "Стороны света"
	mmqq.push add "Север"
	mmqq.push add "Юг"
	mmqq.push add "Запад"
	mmqq.push add "Восток"
	mmqq0.kindMindmap()	

	library.push window.mmap
	window.mmap