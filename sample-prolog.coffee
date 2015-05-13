################################################
# MINDAY 0.008BI 
# sample-checklist.coffee
# Пример текста
################################################


sample.prolog = ->

	#
	# Пролог
	#
	window.prol = adf "Логические выводы и описание знаний",
		description: add "В этом разделе будут показан пример использования программы
			совместно с системами логического вывода, такими как язык Пролог,
			а также примеры использования языков Лисп, OWL, RDF и других языков
			описания знаний. Эта часть программы уже реализована, но не интегрирована в систему."

	syn = add "сын"
	fam1 = addfact "Андрей Михайлович"
	fam1[syn.id] = add [(add "Иван"), (add "Александр"), (add "Валентин")]
	fam2 = addfact "Михаил Андреевич"
	fam2[syn.id] = [fam1, (add "Сережа")]
	fam3 = addfact "Андрей Александрович"
	fam3[syn.id] = [fam2, (add "Александр Андреевич")]
	fam4 = addfact "Александр Львович"
	fam4[syn.id] = [fam3]
	fam5 = addfact "Лев Яковлевич"
	fam5[syn.id] = [fam4,(add "Борис Львович")]

	facts = add "Факты"
	facts.push fam1,fam2,fam3,fam4,fam5

	ru1 = addrule "брат(А,Б) :- папа(В,А),папа(В,Б),ne(А,Б)."	
	ru2 = addrule "дедушка(А,Б) :- папа(А,В),папа(В,Б)."		
	ru3 = addrule "внук(А,Б) :- дедушка(Б,А)."		
	ru4 = addrule "прадедушка(А,Б) :- дедушка(В,Б),папа(А,В)."		
	ru5 = addrule "правнук(А,Б) :- прадедушка(Б,А)."
	ru6 = addrule "папа(А,Б) :- сын(Б,А)."
#	ru6 = addrule "папа(А,Б) :- #"+(-syn.id)+"(Б,А)."
#	ru7 = addrule "prob([X|Xs],Cond,P) :- !,prob(X,Cond,Px),prob(Xs,[X|Cond],PRest),P is Px * PRest."


	ruls = add "Правила (на языке Пролог)"
	ruls.push ru1,ru2,ru3,ru4,ru5,ru6,ru7

	factsProlog()
	query = "папа('Валентин',Папа)"
	# query = "брат('Валя',Брат)"
	# query = "дедушка('Михаил Андреевич',Внук)"
	answer=runProlog(query)

#	console.log rules
#	console.log answer

	request = add "Запрос"
	request.push add query

	tans = add "Ответ"

	for answ in answer
		tia = add null
		for ans in answ
			ref0 = find(ans[0])
			unless ref0? then ref0 = add ans[0]
			ref1 = find(ans[1])
			unless ref1? then ref1 = add ans[1]
			tia[ref0.id] = add [ref1]
		tans.push tia

	window.prol.push facts, ruls, request, tans

	