################################################
# MINDAY 0.008BI 
# piechart.coffee
# Процедуры для рисования диаграммы с долями
################################################

svg[PIECHART] = ->
	ppr[@id] = Raphael "pap"+@id,500,320
	pp = $('#pap'+@id).position() # Берем координаты всей пирамиды
	$('#bag'+@id).height($('#txt'+@id).outerHeight(true)+$('#pap'+@id).outerHeight(true))

	pie1 = []
	pie2 = []
	if @source?
		for re,ri in @source.data
			pie1[ri] = re[0].txt
			pie2[ri] = Number(re[1].txt)

#	pie = ppr[@id].piechart(320, 240, 100, [55, 20, 13, 32, 5, 1, 2, 10], { legend: ["%%.%% - Enterprise Users", "IE Users"], legendpos: "west", href: ["http://raphaeljs.com", "http://g.raphaeljs.com"]})
		g[@id] = ppr[@id].piechart(300, 170, 130, pie2, { legend: pie1, legendpos: "west", href: ["http://minday.ru", "http://minday.ru"]})

#	for ia,i in @data
#		svgp[ia.id] = ppr[@id].path ia.shape(1.4*400,400)

#		svgp[ia.id].attr
#			"stroke":"#888"
#			"stroke-opacity": 0.5
#			"stroke-width":1
#			"fill":"90-#FF9-#FFE"
#			"fill-opacity": 1
#
#		$("#bag"+ia.id).offset({top:pp.top+(i+1+0.25)*400/(@length+1), left:pp.left})


draw[PIECHART] = (level) ->
	s = @htmlIdeaTxt(level)
	if (level is 0) or (level > 0 and not @frame?)
		svga.push @ # Сохраняем текущий элемент для прорисовки
		s += "<div id='pap"+@id+"'></div>"
	s += "</div>"	
	s

###
html[LAYER] = (level) ->
	svga.push @
	s = ""
	s += "<div id='bag"+@id+"' class='pyramid idea-bag"+level+"'>"
	s += "<div id='txt"+@id+"' class='idea-txt"+level+"'>"
	s += @txt if @txt?
	s += "</div>"	

	# Стикеры
	if @sticker? and @sticker.length > 0
		for sti in @sticker.data
			s += "<div id='sti"+sti.id+"' class='idea-sti'>"
			s += sti.txt
			s += "</div>"

	if (level is 0) or (level > 0 and not @frame?)
		for ia in @data
			s += ia.html(level+1)
	s += "</div>"
	s
###
#
# НАВИГАТОР Пирамиды
#
navi[PIECHART] = (eo) ->
	if $txt.attr("contentEditable") is "true" then return navi[IDEA](eo)
	switch eo.which
		when 40 # Down
			if (sidea is fidea)
				if sidea[0]? then sidea[0].select()
			else
				if (not sidea.frame) and sidea[0]? then sidea[0].select()
				else
					sia = sidea 
					while sia isnt fidea and not (sia.pa[sia.ix+1]?)
						sia = sia.pa
					if sia isnt fidea then sia.pa[sia.ix+1].select()
		else navi[IDEA](eo)

###
# Уровень пирамиды
navi[LAYER] = (eo) ->
	if $txt.attr("contentEditable") is "true" then return navi[IDEA](eo)
	switch eo.which
		when 40 # Down
			if sidea.pa[sidea.ix+1]? then sidea.pa[sidea.ix+1].select()
		when 38 # Up
			if sidea.pa[sidea.ix-1]? then sidea.pa[sidea.ix-1].select()
			else sidea.pa.select()
		else navi[IDEA](eo)
###
