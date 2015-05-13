################################################
# MINDAY 0.008BI 
# sample-pair.coffee
# Метод попарного сравнения. 
# На основе рассылки mindtools.com
################################################

pair = {}

sample.pair = ->

	pair.main = adf "Метод попарного сравнения"
		description: add "Paired Comparison Analysis is useful for 
			weighing up the relative importance of different options. It's particularly 
			helpful where priorities aren't clear, where the options are completely different, 
			where evaluation criteria are subjective, or where they're competing in importance.
			The tool provides a framework for comparing each option against all others, and 
			helps to show the difference in importance between factors."

	pair.m10 = add "Когда вы выбираете из нескольких вариантов, как определить 
		какой предпочесть?", plain:yes
	pair.m20 = add "Это особенно сложная задачаа, если варианты очень отличаются
		друг от друга, если критерии выбора субъективны или у вас нет объективной
		информации для принятия решения", plain:yes
	pair.m30 = add "Метод попарного сравнения помогает выработать относительную
		важность различных вариантов. Классический пример такого выбора: 
		\"Сравнение яблок с апельсинами\""
		plain:yes
	pair.m40 = add "О методе"
	pair.m41 = add "Метод попарного сравнения помогает выработать важность вариантов
		относительно друг друга.", plain:yes
	pair.m42 = add "This makes it easy to choose the most important problem to solve, 
		or to pick the solution that will be most effective. It also helps you set priorities 
		where there are conflicting demands on your resources.", plain:yes
	pair.m43 = add "The tool is particularly useful when you don't have objective data to 
		use to make your decision. It's also an ideal tool to use to compare different, 
		subjective options, for example, where you need to decide the relative importance 
		of qualifications, skills, experience and teamworking ability when hiring people 
		for a new role. ", plain:yes
	pair.m44 = add "Decisions like these are often much harder to make than, for example,
	 comparing three similar IT systems, where Grid Analysis or some form of financial 
	 analysis can help you decide.", plain:yes

	pair.main.push pair.m10, pair.m20, pair.m30, pair.m40
	pair.m40.push pair.m41,pair.m42,pair.m43,pair.m44

	pair.m50 = add "Как использовать метод?"
	pair.variants = add "Выпишите все варианты, среди которых вы будете делать выбор",
		list: OL
		motivator: add "Мне нужно сравнить следующие варианты..."
		example: add [
			add "Заграничный девелоперский проект"
			add "Местный образовательный проект"
			add "Завещание университету"
			add "Помощь жертвам катастрофы"
		]
	pair.main.push pair.m50
	pair.m50.push pair.variants

	pair.m56 = add "Нажмите кнопку, чтобы перенести варианты в матрицу ниже", list:OL
	pair.m56a = add "<b>Note:</b><br/>On the table, the cells where you will compare an option with 
		itself are blocked out. The cells on the table where you would be duplicating 
		a comparison are also blocked out. This ensures that you make each comparison
		only once."
		plain:yes
		class: add "note"
	pair.m56b = add "Сформировать матрицу"
		kind:BUTTON
		run: ->
			R = add ""
			C = add ""
			for i in [0..pair.variants.length-1]
				R.push add i+":"+pair.variants[i].txt
				C.push add i+":"+pair.variants[i].txt
			pair.matrix = add ""
				row: R
				column: C
			for i in [0..pair.variants.length-1]
				RC1 = add ""
				for i in [0..pair.variants.length-1]
					RC1.push add ""
				pair.matrix.push RC1
			pair.matrix.kindMatrix()

			pair.m56.pop()
			pair.m56.push pair.matrix

	pair.m56.push pair.m56a, pair.m56b
	pair.m50.push pair.m56

	pair.m57 = add "В каждой клеточке таблицы определите, какой из вариантов 
		важнее. Сделайте выбор из двух вариантов.", list:OL
	pair.m50.push pair.m57

	pair.m58 = add "Write down the letter of the most important option in the cell. 
		Then, score the difference in importance between the options, running from zero 
		(no difference/same importance) to, say, three (major difference/one much more 
		important than the other.) Запишите букву варианта в клеточке", list:OL
	pair.m50.push pair.m58

	pair.m59 = add "Finally, consolidate the results by adding up the values for each of the 
		options. You may want to convert these values into a percentage of the
		total score.", list:OL
	pair.m50.push pair.m59

	pair.m60 = add "Скорректируйте результаты в соответствии со здравым смыслом.", list:OL
	pair.m50.push pair.m60

	pair.main
