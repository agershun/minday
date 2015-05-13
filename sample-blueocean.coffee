################################################
# MINDAY 0.009 Lykia 
# sample-blueocean.coffee
# Пример применения голубых океанов
################################################

sample.blueocean = ->

	bbo = adf "Голубые океаны"
	bbo.push bo=add "Алкогольные напитки"
	
	alcohol = add "Крепость", [(add "Слабый"),(add "Средний"),(add "Крепкий")]
	price = add "Цена", [(add "Низкая"),(add "Средняя"),(add "Высокая")]
	age = add "Возраст", [(add "Молодежь"),(add "Средний"),(add "Преклонный")]
	sex = add "Пол", [(add "Мужчины"),(add "Юнисекс"),(add "Женщины")]
	noble = add "Благородство", [(add "Низкий"),(add "Средний"),(add "Благородный")]

	bo.char = add [alcohol,price,age,sex,noble]

	pivo = add "Пиво"
	pivo[alcohol.id]=0
	pivo[price.id]=0
	pivo[age.id]=0
	pivo[sex.id]=0
	pivo[noble.id]=1

	vino = add "Вино" 
	vino[alcohol.id]=1
	vino[price.id]=2
	vino[age.id]=1
	vino[sex.id]=1
	vino[noble.id]=1

	vodka = add "Водка"
	vodka[alcohol.id]=2
	vodka[price.id]=1
	vodka[age.id]=1
	vodka[sex.id]=0
	vodka[noble.id]=0

	liquor = add "Ликер"
	liquor[alcohol.id]=1
	liquor[price.id]=2
	liquor[age.id]=1
	liquor[sex.id]=2
	liquor[noble.id]=1

	bo.push pivo,vino,vodka,liquor
	bo.kindBlueOcean()

	library.push bbo
	bbo

