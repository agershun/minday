################################################
# MINDAY 0.008BI 
# sample-text.coffee
# Пример текста
################################################


sample.sticker = ->

	window.sticker = adf "Примеры использования стикеров",
		readonly: yes
		nochildren: yes
		guide: add "Оставляйте стикеры на память"
		description: add 'Система позволит "приклеивать" их к различным идеям'


	sti1 = add "Всегда хочется оставить заметки"
	sti2 = add "Оставить напоминание на будущее"
	sti3 = add "Потом будет возможность делать анализ со стикерами"

	window.sticker.push ss=add "В программе будет реализована функция работы со стикерами",canvas:CANVASJS
#	ss.sticker = add [sti1,sti2,sti3]


	ss.push cst=add "Цепочка создания стоимости"
	cst.push add "Закупки",forma:CARROW,panelplace:TBL,list:TD,tableclass:1
	cst.push add "Производство",forma:CARROW,panelplace:TBL,list:TD
	cst.push add "Продажи",forma:CARROW,panelplace:TBL,list:TD
	cst.push pur=add "Подумать",list:TD,newline:yes,forma:RECT,panelplace:TBL
	pur.push add "Быстро",list:UL
	pur.push add "Качество",list:UL
	pur.push add "Надежно",list:UL
	cst.push add "Произвести",list:TD,forma:RECT,panelplace:TBL
	cst.push add "Впарить",list:TD,forma:RECT,panelplace:TBL
#	console.log cst

	ss.push add "Иконка", forma:RRECT
	ss.push add "Иконка", image:(add "icon/tick.png"),forma:RECT,panelplace:TXT
	ss.push add "", image: (add "icon/cross.png"), imageplace:INSIDE,forma:OVAL
	ss.push add "Тест1",list:SPAN,panel:WHITE,panelplace:BAG
	ss.push add "Тест2",list:SPAN,forma:CIRCLE

	for i in [1..55]
		ss.push add "Тест-"+i,list:TH,forma:CARROW,newline:yes,panelplace:TBL
		for j in [1..5]
			ss.push add "Тест-"+i,list:TD,forma:CARROW,panelplace:TBL

	ss.push add "Тест2a",panel:WHITE,panelplace:BAG
	ss.push add "Тест2б",panel:WHITE,panelplace:TXT

	ss.push add "Тест31",list:TD,panel:WHITE,panelplace:BAG,tableclass:0,rowspan:2
	ss.push add "Тест32",list:TD,panel:WHITE,panelplace:TXT
	ss.push add "Тест33",list:TD,panel:WHITE,panelplace:TBL
	ss.push add "Тест4",list:TD,newline:yes
	ss.push add "Тест5",list:TD,forma:OVAL,panelplace:TBL
	ss.push add "Принятие<br>решений"
		align: CENTER
		image:  add "decision.jpg"
		imageplace: TOP		
		imagealign: CENTER
		list:TD		
		panel: WHITE
		panelplace: BAG

	ss.push add "lksaj ;kjas;fdkj;aslkjf ;aksjdf; aksjdf ;lkajsdf ;lkjas;fdlkj a;slkjfd ;jk
		lkj ;salkfja ;slkdjf ;alksjfd ;alksjfd ;alksjfd ;alksjfd ;laksjfd ;lajf;alksjfd ;lkajdsf
		as;lkfdj ;lkasjfd ;lakjdsf ;lakj fs
		askfj ;lkajsfd; kj ;askdjf
		askjfd ;lkajsdf;lkj ;lkasjdf ;lkjasdf
		a;ksjdf ;kajsdf;k jas;dkfj ;kl
		asd;fkj ;aksjdf ;lkj;lk jsad;lkfdja;lksjdf ;lkjafdskj as;dfkj ;askdjf;alkjdsf ;kajdsf ;kjafds
		a;lsdkjf ;lkajsdf; lkajs;lkfdj; laksjdf"
		plain:yes
		columns: 2



	window.sticker
