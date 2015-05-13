################################################
# MINDAY 0.009 Ly
# gantt.coffee
# Процедуры для работы с диаграммой Гантта
################################################

keyp[GANTT] = {}
keyp[GANTTSTAGE] = {}
keyp[GANTTRESULT] = {}
keyp[GANTTPHASE] = {}

Idea::kindGantt = ->
	@kind = GANTT
	for ia,i in @data
		ia.kind = GANTTSTAGE
		ia.pa = @
		ia.ix = i
		if ia.result?
			ia.result.kind = GANTTRESULT
			ia.result.pa = ia
			ia.result.ix = "result"
	if @phase?
		@phase.kind = GANTTPHASES
		@phase.pa = @
		@phase.ix = 'phase'
		for ia,i in @phase.data
			ia.kind = GANTTPHASE
			ia.pa = @phase
			ia.ix = i

	@

draw[GANTT] = (level) ->
	s = @startIdeaTxt(level)
	if (level is 0) or (level > 0 and not @frame?)
		s += "<table id='bag"+@id+"'>"
		s += "<tbody><thead><th></th>"
		for p in [@start..@finish]
			s+="<th width='"+(100/(@finish-@start+2))+"%'>"+p+"</th>"
		if @phase?
			s += "<tr><th></th>"
			for ia in @phase.data
				s += "<th id='tbl"+ia.id+"' colspan="+(ia.finish-ia.start+1)+">"+ia.draw(level+1)+"</th>"
		s += "</thead>"
		if @length > 0
			for ia in @data
				s+= "<tr><th id='tbl"+ia.id+"'>"+ia.draw(level+1)+"</th>"
				if ia.start > @start
					s+= "<td colspan="+(ia.start-@start)+">"
				s += "<td "
				s += "id='tbl"+ia.result.id+"' " if ia.result?
				s += " colspan="+(ia.finish-ia.start+1)+">"
				s += ia.result.draw(level+1) if ia.result?
				if ia.finish < @finish
					s+= "<td colspan="+(@finish-ia.finish)+">"
		s += "</tbody></table>"

	s += @endIdeaTxt(level)

keyp[GANTT][KEY_DOWN] =->
	if @[0]? then return @[0].select()
	@

# Клавиши для GANTTSTAGE

keyp[GANTTSTAGE][KEY_RIGHT] =->
	if @result? then return @result.select()
	else if @pa[@ix+1]? then return @pa[@ix+1].select()
	@pa.downnext()

keyp[GANTTSTAGE][KEY_UP] =->
	if @pa[@ix-1]? then return @pa[@ix-1].select()
	@pa

keyp[GANTTSTAGE][KEY_DOWN] =->
	if @pa[@ix+1]? then return @pa[@ix+1].select()
	@pa.downnext()

keyp[GANTTSTAGE][KEY_LEFT] =->
	if @pa[@ix-1]?.result? then return @pa[@ix-1].result.select()
	else if @pa[@ix-1]? then return @pa[@ix-1].select()
	@pa


# Клавиши для GANTTRESULT

keyp[GANTTRESULT][KEY_RIGHT] =->
	if @pa.pa[@pa.ix+1]? then return @pa.pa[@pa.ix+1].select()
	@pa.downnext()

keyp[GANTTRESULT][KEY_LEFT] =-> @pa.select()

keyp[GANTTRESULT][KEY_DOWN] =-> 
	if @pa.pa[@pa.ix+1]?.result? then return @pa.pa[@pa.ix+1].result.select()
	else if @pa.pa[@pa.ix+1]? then return @pa.pa[@pa.ix+1].select()
	@pa.downnext()

keyp[GANTTRESULT][KEY_UP] =-> 
	if @pa.pa[@pa.ix-1]?.result? then return @pa.pa[@pa.ix-1].result.select()
	else if @pa.pa[@pa.ix-1]? then return @pa.pa[@pa.ix-1].select()
	else if @pa.pa.phase?[0]? then return @pa.pa.phase[0].select()
	@pa.pa

# Клавиши для GANTTPHASE
keyp[GANTTPHASE][KEY_LEFT] =-> 
	if @pa[@ix-1]? then return @pa[@ix-1].select()
	@pa.pa.select()

keyp[GANTTPHASE][KEY_RIGHT] =-> 
	if @pa[@ix+1]? then return @pa[@ix+1].select()
	else if @pa.pa[0]? then return @pa.pa[0].select()
	@pa.pa.downnext()

keyp[GANTTPHASE][KEY_UP] =-> @pa.pa.select()

keyp[GANTTPHASE][KEY_DOWN] =-> 
	if @pa.pa[0]?.result? then return @pa.pa[0].result.select()
	else if @pa.pa[0]? then return @pa.pa[0].select()
	@pa.pa.downnext()


childkind[GANTT] =-> GANTTSTAGE
childkind[GANTTSTAGE] =-> IDEA
