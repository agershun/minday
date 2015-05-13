################################################
# MINDAY 0.010 Tokyo 
# tabs.coffee
# Процедуры обработки табов
################################################

tbs = []

Idea::kindTabs = ->
	@kind = TABS
	for ia,i in @[0]
		ia.kind = TAB
		ia.pa = @
		ia.sd = 0
		ia.ix = i
	if not @activetab? and @[0]?[0]? then @activetab = 0

draw[TABS] = (level) ->
	unless @ativetab? then @activetab = 0
	tbs.push @ # Сохраняем для дальнейшего вызова jQuery
	s = @startIdeaTxt(level,DRAWHEADER)
	if (level is 0) or (level > 0 and not @frame?)
		if @[0]?
			s += "<div>"
			for ia,i in @[0]
				s += "<span id='tbs"+ia.id+"' class='tbs "
				if @activetab is i
					s += "active-tbs" 
				else
					s += "inactive-tbs" 					
				s += "'><span id='txt"+ia.id+"' class='idea-txt"+(level+1)+"'>"+ia.txt+"</span></span>"
			s+= "</div>"
			s+= "<div>"
			for ia,i in @[0]
				s += "<div id='tab"+ia.id+"' class='"
				if @activetab is i
					s += "active-tab" 
				else
					s += "inactive-tab" 
				s +="'>"
				s += ia.draw(level,DRAWCHILDREN)
				s += "</div>"
			s+= "</div>"
	s += @endIdeaTxt(level)
	s

###
#draw[TAB] = (level) ->
#	s = "<div id='tab"+@id+"' class='"
#	if @pa.activetab is @
#		s += " active-tab" 
#	else
#		s += " inactive-tab" 
#	s += " "+@class.txt if @class?
#	s += "' "
#	s += " style='"+@style.txt+"'" if @style?
#	s +=">"

	# Стикеры
	if @sticker? and @sticker.length > 0
		for sti in @sticker.data
			s += "<div id='sti"+sti.id+"' class='idea-sti'>"
			s += sti.txt
			s += "</div>"

	if @motivator? and @length is 0
		s += "<div class='idea-bag"+(level+1)+"'>"
		s += "<div id='mot"+@id+"' class='idea-mot"+(level+1)+"'>"
		s += @motivator.txt #TODO - подумать о мотиваторе, как об HTML с типом MOTIVATOR
		s += "</div>"
		s += "</div>"		

	if @example? and @example.length > 0 and @length is 0
		for ex in @example
			s += "<div class='idea-bag"+(level+1)+"'>"
			s += "<div id='mot"+@id+"' class='idea-exa"+(level+1)+"'>"
			s += ex.txt 
			s += "</div>"
			s += "</div>"		

	# Картинка
	if @image? and @image.length > 0
		s += "<table><tbody><tr><td>"
		for img in @image.data
			s += "<img src='methods/"+img.txt+"' align='right' class='image'/>"
		s += "<td>"



	if (level is 0) or (level > 0 and not @frame?)
		for ia in @data
			s += ia.draw(level+1)

	if @image?
		s+="</tbody></table>"

	s += "</div>"
	s

#
# НАВИГАТОР Табов
#
navi[TAB] = (eo) ->
	if $txt.attr("contentEditable") is "true" then return navi[IDEA](eo)
	switch eo.which
		when 40 # Down
			if (sidea is fidea) or (not sidea.frame)
				if sidea[0]	then sidea[0].select()
			else
				if sidea.length is 0
					if sidea.pa[sidea.ix+1]? then sidea.pa[sidea.ix+1].select()
					else 
						sia = sidea 
						while sia isnt fidea and not (sia.pa[sia.ix+1]?)
							sia = sia.pa
						if sia isnt fidea then sia.pa[sia.ix+1].select()

		when 38 # Up
			sidea.pa.select()

		when 37 # Left
			if sidea.pa[sidea.ix-1]? then sidea.pa[sidea.ix-1].select()
			else sidea.pa.select()

		when 39 # Right
			if sidea.pa[sidea.ix+1]? then sidea.pa[sidea.ix+1].select()
			else 
				sia = sidea 
				while sia isnt fidea and not (sia.pa[sia.ix+1]?)
					sia = sia.pa
				if sia isnt fidea then sia.pa[sia.ix+1].select()
		else navi[IDEA](eo)

# Уровень всех табов
navi[TABS] = (eo) ->
	if $txt.attr("contentEditable") is "true" then return navi[IDEA](eo)
	switch eo.which
		when 40, 39 # Down, Right
			if sidea[0]? then sidea[0].select()
			else
				sia = sidea 
				while sia isnt fidea and not (sia.pa[sia.ix+1]?)
					sia = sia.pa
				if sia isnt fidea then sia.pa[sia.ix+1].select()
		when 38, 37 # Up, Left
			sidea.pa.select()
		else navi[IDEA](eo)

