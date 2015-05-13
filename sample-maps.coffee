################################################
# MINDAY 0.009Tu 
# sample-map.coffee
# Пример работы со стратегическими картами
################################################

sample.maps = ->
	maps = adf "Примеры стратегических карт"
	maps.push add "Программа может использоваться для быстрого рисования стратегических
		карт и других несложных диаграмм",plain:yes

	maps.push mapa=add "Стратегическая карта",kind:MAP
	mapa.push fin=add "Финансы",kind:HLANE
	mapa.push cli=add "Клиенты",kind:HLANE
	mapa.push pro=add "Процессы",kind:HLANE
	mapa.push lea=add "Обучение и рост",kind:HLANE

	fin.push glane1=add "",kind:HLANE
	glane1.push gf1=add "Ф1. Увеличить<br/>прибыль",kind:NODE
	fin.push glane2=add "",kind:HLANE
	glane2.push gf2=add "Ф2. Повысить<br/>доходы",kind:NODE
	glane2.push gf3=add "Ф3. Сократить<br/>расходы",kind:NODE

	gf2.axon = adr [gf1]
	gf3.axon = adr [gf1]

	cli.push ggc1=add "Частные клиенты",kind:GROUP
	ggc1.push gc1=add "К1. Я активно<br/>использую сервис",kind:NODE
	gc1.axon = adr [gf2]
	ggc1.push gc2=add "К2. Мне предлагают<br/>приемлемые условия",kind:NODE
	gc2.axon = adr [gf2]

	cli.push ggc1=add "Дистрибьюторы",kind:NODE
	ggc1.axon = adr [gf3]
	ggc1.push gc3=add "К3. Я могу<br/>заработать",kind:NODE
	ggc1.push gc4=add "К4. Мне предлагают<br/>новые знания",kind:NODE


	pro.push gp1=add "П1. Повысить скорость<br/>обслуживания",kind:NODE
	pro.push gp2=add "П2. Снизить брак<br/>производства",kind:NODE
	gp1.axon = adr [gc2,gc3]
	gp2.axon = adr [gc4]

	lea.push gl1=add "О1. Создать систему<br/>подготовки персонала",kind:NODE
	gl1.axon = adr [gp1,gp2]

	library.push maps
	maps
