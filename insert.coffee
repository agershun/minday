################################################
# MINDAY 0.010 Tokyo
# insert.coffee
# Работа с меню Вставка
################################################

# Устанавливаем ссылки на меню
setMenuInsert = ->
	$(".insert_childidea").click insertChildIdea
	$(".insert_altchildidea").click insertAltChildIdea
	$(".insert_upidea").click insertUpIdea
	$(".insert_downidea").click insertDownIdea
	$(".insert_leftidea").click insertLeftIdea
	$(".insert_rightidea").click insertRightIdea
	$(".insert_beforeidea").click insertBeforeIdea
	$(".insert_afteridea").click insertAfterIdea
	$(".insert_downrow").click insertDownRow


	$(".insert_mindmap").click insertMindmap
	$(".insert_pyramid").click insertPyramid
	$(".insert_matrix").click insertMatrix
	$(".insert_tabs").click insertTabs
	$(".insert_tree").click insertTree
	$(".insert_gantt").click insertGantt
	$(".insert_table").click insertTable
	$(".insert_piechart").click insertPiechart
	$(".insert_todo").click insertTodo
	$(".insert_comment").click insertComment
	$(".insert_sticker").click insertSticker
	$(".insert_description").click insertDescription
	$(".insert_guide").click insertGuide
	$(".insert_ballon").click insertBallon
	$(".insert_tick").click insertTick
	$(".insert_icon").click insertIcon
	$(".insert_tag").click insertTag

# Меню по умолчанию
insertChildIdea = ->
	finishEdit()
	ck = null
	ck = childkind[sidea.kind]() if childkind[sidea.kind]? and childkind[sidea.kind]()?
	ck = sidea.insertkind if sidea.insertkind?
	unless sidea.nochildren?
		if ck?
			if childsd[sidea.kind]? and childsd[sidea.kind]() is OUTSIDE
				ia = sidea.ado "&nbsp;",kind:ck
			else 	
				ia = sidea.add "&nbsp;",kind:ck
			fidea.fhtml(ia)

insertAltChildIdea = ->
	finishEdit()
	unless sidea.nochildren?
		unless childkind[sidea.kind]() is null 
			if childsd[sidea.kind]? and childsd[sidea.kind]() is OUTSIDE
				ia = sidea.add "&nbsp;"
			else 	
				ia = sidea.add OUTSIDE,"&nbsp;",kind:childkind[sidea.kind]()
			fidea.fhtml(ia)

insertUpIdea = ->
	finishEdit()
	unless sidea.pa.nochildren? and sidea.sd >= 0
		ia = add "&nbsp;",kind:sidea.kind #TODO: Переделать в @childkind()
		iaa = [ia]
		sidea.pa.splice(sidea.sd,0,iaa)
		sidea.pa.normalizeIdea()
		fidea.fhtml(ia)

insertDownIdea = ->
	finishEdit()
	unless sidea.pa.nochildren?
		if sidea.sd >= 0
			ia = add "&nbsp;",kind:sidea.kind #TODO: Переделать в @childkind()
			iaa = [ia]
			sidea.pa.splice(sidea.sd+1,0,iaa)
			sidea.pa.normalizeIdea()
			fidea.fhtml(ia)
			# TODO Разобраться с таблицами
			return ia
		else 
			return insertChildIdea()
	ia

insertUpRow = ->
	finishEdit()
	unless sidea.pa.nochildren? and sidea.sd >= 0
		iaa = []
		for a,j in sidea.pa[sidea.sd]
			ia = add "&nbsp;",kind:a.kind #TODO: Переделать в @childkind()
			iaa.push ia
		sidea.pa.splice(sidea.sd,0,iaa)
		sidea.pa.normalizeIdea()
		fidea.fhtml(iaa[0])

insertDownRow = ->
	finishEdit()
	unless sidea.pa.nochildren? and sidea.sd >= 0
		iaa = []
		for a,j in sidea.pa[sidea.sd]
			ia = add "&nbsp;",kind:a.kind #TODO: Переделать в @childkind()
			iaa.push ia
		sidea.pa.splice(sidea.sd+1,0,iaa)
		sidea.pa.normalizeIdea()
		fidea.fhtml(iaa[sidea.ix])
		# TODO Разобраться с таблицами
		return iaa[sidea.ix]
	sidea

insertLeftIdea = ->
	finishEdit()
	unless sidea.pa.nochildren?
		ia = add "&nbsp;",kind:sidea.kind #TODO: Переделать в @childkind()
		ia.sd = sidea.sd
		sidea.pa[sidea.sd].splice(sidea.ix,0,ia)
		sidea.pa.normalizeIdea()
		fidea.fhtml(ia)
		# TODO Разобраться с таблицами

insertRightIdea = ->
	finishEdit()
	unless sidea.pa.nochildren?
		ia = add "&nbsp;",kind:sidea.kind #TODO: Переделать в @childkind()
		ia.sd = sidea.sd
		sidea.pa[sidea.sd].splice(sidea.ix+1,0,ia)
		sidea.pa.normalizeIdea()
		fidea.fhtml(ia)
		# TODO Разобраться с таблицами

insertBeforeIdea = ->
	finishEdit()
	unless sidea.nochildren?
		ia1 = sidea.add "&nbsp;"
		ia2 = sidea.adr sidea.txt
		sidea.txt = null
		fidea.fhtml(ia1)


insertAfterIdea = ->
	finishEdit()
	unless sidea.nochildren?
		ia1 = sidea.add sidea.txt
		ia2 = sidea.adr "&nbsp;"
		sidea.txt = null
		fidea.fhtml(ia2)


insertMindmap = ->
	finishEdit()
	mm = sidea.add null,kind:MINDMAP
	mm.add OUTSIDE,"&nbsp;",kind:MINDLEAF
	fidea.fhtml(mm)

insertTree = ->
	finishEdit()
	tr = sidea.add null,kind:TREE
	tr0 = tr.add OUTSIDE,"&nbsp;",kind:NODE
	tr0.add OUTSIDE,"&nbsp;",kind:NODE
	tr0.add OUTSIDE,"&nbsp;",kind:NODE
	fidea.fhtml(tr)


insertMatrix = ->
	finishEdit()
	sidea.intype = TABLE
	mm = sidea.add "1"
	sidea.adr "2"
	sidea.add "3"
	sidea.adr "4"
	fidea.fhtml(mm)

insertTabs = ->
	finishEdit()
	mm = sidea.addIdea(sidea,0,0,false)
	mm.txt = "Закладки"
	mm.push add "Закладка 1",[(add "Идея 1.1"),(add "Идея 1.2")]
	mm.push add "Закладка 2",[(add "Идея 2.1"),(add "Идея 2.2")]
	mm.kindTabs()
	sidea.upperFrame().fhtml(sidea)


insertGantt = ->
	finishEdit()
	g = sidea.addIdea(sidea,0,0,false)
	g.txt = "План проекта"
	g.start = 1
	g.finish = 12
	g.phase = (gp=add "")
	gp.push add "Фаза 1",start:1,finish:5
	gp.push add "Фаза 2",start:6,finish:12
	g.push add "Этап 1",start:1,finish:6
	g.push add "Этап 2",start:6,finish:12
	g.kindGantt()
	g.upperFrame().fhtml(g)

insertPyramid = ->
	finishEdit()
	mm = sidea.addIdea(sidea,0,0,false)
	mm.txt = "Матрица"
	mm.kindPyramid()
	mm.upperFrame().fhtml(mm[0])

#
# Пока не реализовано
#
insertTable = ->
	finishEdit()
	mm = sidea.addIdea(sidea,0,0,false)
	mm.kindTable()
	mm.upperFrame().fhtml(mm[0][0])

insertPiechart = ->
	finishEdit()
	mm = sidea.addIdea(sidea,0,0,false)
	mm.kind = PIECHART
	mm.upperFrame().fhtml(mm[0][0])


insertTodo = ->
	alert "Эта функция программы будет реализована в следующих версиях"

insertComment = ->
	alert "Эта функция программы будет реализована в следующих версиях"

insertSticker = ->
	alert "Эта функция программы будет реализована в следующих версиях"

insertDescription = ->
	alert "Эта функция программы будет реализована в следующих версиях"

insertGuide = ->
	alert "Эта функция программы будет реализована в следующих версиях"

insertBallon = ->
	alert "Эта функция программы будет реализована в следующих версиях"

insertTick = ->
	finishEdit()
	ia = sidea.add kind:TICK
	fidea.fhtml(ia)

insertIcon = ->
	finishEdit()
	ia = sidea.add kind:ICON
	fidea.fhtml(ia)

insertTag = ->
	finishEdit()
	ia = sidea.add " ",kind:TAG
	fidea.fhtml(ia)



# TODO: Вынести в отдельный файл 
closeDropdownMenu =->
	$('.dropdown.open .dropdown-toggle').dropdown('toggle');


