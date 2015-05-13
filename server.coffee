##################################
# Minday 0.009 Lykia
# server.coffee
# Реализация кооперативной работы
#################################

username = ""
filename = "minday.mdy"
cometStatus = off

# Устанавливаем меню
setMenuServer =->
	$(".server_changeuser").click serverChangeUser
	$(".server_open").click serverOpen
	$(".server_refresh").click serverRefresh
	$(".server_save").click serverSave
	$(".server_saveas").click serverSaveAs
	$(".server_share").click serverShare
	$(".server_subscribe").click serverSubscribe
	$(".server_unsubscribe").click serverUnsubscribe
#	$("#server_getall").click getAll
#	$("#server_postall").click postAll
#	$("#server_checkdirty").click checkDirty
#	$("#server_getdirty").click getDirty
#	$("#server_postdirty").click postDirty
#	$("#server_cometpublish").click cometAllPublish

cometStart =->
	# Заодно проставим имя пользователя
	username = $.cookie('username')	
	$('#username').html username


# Установление пользователя
serverChangeUser = ->
	username = prompt "Введите имя пользователя",username
	$.cookie 'username',username
	$('#username').html username

#############################
# Открытие файла из сервера
#############################
serverOpen = ->
	$.get('dir',serverOpenSuccess,'json')

serverOpenSuccess = (data) ->
	s = "<p><b>Открыть файл</b></p>"
	s += "<p>Выберите файл на сервере для работы:</p>"
	for fi in data
		s+="<div>"
		s+="<a id='"+fi+"' class='open_file' href='#'>"
		s+=fi
		s+="</a>"
		s+="</div>"

	$("#dialog_open").html s
	$(".open_file").click clickServerOpenFile

clickServerOpenFile = (eo) ->
	$("#dialog_open").html ""
	filename = eo.srcElement.id
	serverRefresh()

serverRefresh = () ->
	$.get("open="+filename,serverOpenFileSuccess,"json")

serverOpenFileSuccess = (data) ->
	deleteIdea()
	b = data # JSON.parse data
	initIdea(b.length)
	for io in b.idea
		cloneIdea(io)
	idea[-b.sideaid].upperFrame().fhtml()
	alert "Загружен файл с сервера"

#############################
# Тихая загрузка файла
#############################

serverLoad = (fname) ->
	$.get("open="+fname,serverLoadFileSuccess,"json")

serverLoadFileSuccess = (data) ->
	b = data # JSON.parse data
	updateModel()
	selectModel(b.filename)
	deleteIdea()
	initIdea(b.length)
	for io in b.idea
		cloneIdea(io)
	updateModel(b.filename)
	selectModel()
#	idea[-b.sideaid].upperFrame().fhtml()
#	alert "Загружен файл с сервера"




#############################
# Сохранение файла на сервер
#############################
serverSaveAs = ->
	filename = prompt "Введите имя файла для сохранения", "minday.mdy"
	serverSave()

serverSave = ->
	data = JSON.stringify
		filename: filename
		length:idea.length
		idea:idea
		sideaid:sidea.id
	$.post("save="+filename,data,serverSaveSuccess,"json")

serverSaveSuccess = ->
	alert "Файл передан"


#############################
# Открыть файл для редактирования другими пользователями
#############################

channel = ""
cometClient = null
cometAllChannel = null
cometDirtyChannel = null
cometFocusChannel = null
cometStatus = off
shareStatus = off

serverShare =->
	if cometStatus is off
		cometClient = new Faye.Client('http://localhost:8000/faye')		
		data = JSON.stringify
			filename: filename
			username: username
		$.post("share",data,serverShareSuccess,'json')

serverShareSuccess =->
	shareStatus = on
	shareChannelName = filename+"-"+username
	alert "Файл "+filename+" доступен другим пользователям на канале "+filename+"-"+username

serverSubscribe = ->
	$.get('sharedir',serverShareDirSuccess,'json')

serverShareDirSuccess = (data) ->
	s = "<p><b>Поключиться к редактированию</b></p>"
	s += "<p>Выберите файл на сервере для работы:</p>"
	for fi in data
		s+="<div>"
		s+="<a id='"+fi.filename+"-"+fi.username+"' class='open_file' href='#'>"
		s+=fi.filename+"-"+fi.username
		s+="</a>"
		s+="</div>"

	$("#dialog_open").html s
	$(".open_file").click clickServerSubscribe

clickServerSubscribe = (eo) ->
	$("#dialog_open").html ""
	channelName = eo.srcElement.id
	if cometStatus is off
		cometClient = new Faye.Client('http://localhost:8000/faye')
	channel = cometClient.subscribe channelName,channelArrive
	serverRefresh()

channelArrive = (data) ->
	alert "changes come"

serverUnsubscribe = ->
	channel.cancel()
	cometStatus = off

#	channel = filename
#	comerStatus = on
#	cometClient = new Faye.Client('http://localhost:8000/faye')
#	cometAllChannel = cometClient.subscribe "/all",cometAllArrive
#	cometFocusChannel = cometClient.subscribe "/focus/"+channel,cometFocusArrive
#	cometDirtyChannel = cometClient.subscribe "/dirty/"+channel,cometDirtyArrive


#############################
# Канал фокуса
#############################

cursor = {}

cometFocusArrive = (data) ->
	b = JSON.parse data
	if b.username isnt username
		if cursor[b.username]?.sideaid?
			cursor[b.username].oldid = cursor[b.username].sideaid
		else
			cursor[b.username] = {}
		cursor[b.user].sideaid = b.sideaid  # Сохраняем текущую позицию фокуса
		setFocus cursor[b.username] 

setFocus = (f) ->
	if f?.oldid? 
		$("#txt"+f.oldid).removeClass 'cursor'
	if f?.sideaid?
		$("#txt"+f.sideaid).addClass 'cursor'

cometFocusPublish = ->
	if cometStatus is on
		data = JSON.stringify
			username:username
			sideaid:sidea.id
		cometClient.publish cometFocusChannel,data



###
# Процедуры для работы с Faye
comet = {}

allChannel = "/all" # Полное обновление
dirtyChannel = "/dirty" # Частичное обновление
focusChannel = "/focus" # Передача курсора
lockChannel = "/lock" # Канал блокировки
problemChannel = "/problem" # Канал для проблем и оповещений
chatChannel = "/chat" # Канал для чата


cometClient = null # Сам клиент

cometStart =->
	username = $.cookie('username')	
	$('#username').html username
	return # Пока ничего не делаем
	cometClient = new Faye.Client('http://localhost:8000/faye');
	cometClient.subscribe allChannel,cometAllArrive
	cometClient.subscribe dirtyChannel,cometDirtyArrive
	cometClient.subscribe focusChannel,cometFocusArrive
	cometStatus = on

cometFinish =->
	cometClient = new Faye.Client('http://localhost:8000/faye');
	cometClient.subscribe allChannel,cometAllArrive
	cometClient.subscribe dirtyChannel,cometDirtyArrive
	cometClient.subscribe focusChannel,cometFocusArrive
	cometStatus = off

cometFocusArrive = (data) ->
	b = JSON.parse data
	if cursor[b.username]?.sideaid?
		cursor[b.username].oldid = cursor[b.username].sideaid
	else
		cursor[b.username] = {}
	cursor[b.user].sideaid = b.sideaid  # Сохраняем текущую позицию фокуса
	setFocus cursor[b.username] 

setFocus = (f) ->
	if f?.oldid? 
		$("#txt"+f.oldid).removeClass 'cursor'
	if f?.sideaid?
		$("#txt"+f.sideaid).addClass 'cursor'

cometFocusPublish = ->
	if cometStatus is on
		data = JSON.stringify
			username:username
			sideaid:sidea.id
		cometClient.publish focusChannel,data

cometAllArrive = (data) ->
	deleteIdea()
	b = JSON.parse data
	initIdea(b.length)
	for io in b.idea
		cloneIdea(io)
	idea[-b.fideaid].fhtml(idea[-b.sideaid])

cometAllPublish = ->
	data = JSON.stringify
		length:idea.length
		idea:idea
		sideaid:sidea.id
		fideaid:fidea.id
	cometClient.publish dirtyChannel,data

cometDirtyArrive = (data) ->
#	deleteIdea()
	b = JSON.parse data
#	initIdea(b.length)
	for io in b.idea
		cloneIdea(io)
#	idea[-b.fideaid].fhtml(idea[-b.sideaid])

# Публиковать грязные данные
cometDirtyPublish = ->
	data = JSON.stringify
		length:idea.length
		idea:idea
		sideaid:sidea.id
		fideaid:fidea.id
	cometClient.publish dirtyChannel,data


#
# Константы
#
dirty = []


# Передача всей модели на сервер
successPostAll = ->
	alert "Файл передан"

postAll = ->
	data = JSON.stringify
		length:idea.length
		idea:idea
		sideaid:sidea.id
	$.post("all",data,successPostAll,"json")

# Получение всей модели с сервера
successGetAll = (data) ->
	deleteIdea()
	console.log data
	b = data # JSON.parse data
	initIdea(b.length)
	for io in b.idea
		cloneIdea(io)
	idea[b.sideaid].upperFrame().fhtml()
	alert "Файл загружен"

getAll = ->
	$.get("all",successGetAll,"json")


# Передать часть грязных данных
successPostDirty = ->
	alert "Файл передан"

checkDirty = ->
	alert dirty


postDirty = ->
	data = JSON.stringify
		dirty:dirty
	$.post("dirty",data,successPostAll,"json")

# Получение грязных данных с сервера
successGetDirty = (data) ->
	deleteIdea()
	console.log data
	b = data # JSON.parse data
	initIdea(b.length)
	for io in b.idea
		cloneIdea(io)
	idea[b.sideaid].upperFrame().fhtml()
	alert "Файл загружен"

getDirty = ->
	$.get("",successGetAll,"json")




my.user = "dpetrov@gmail.com"
alien.lock = {}
my.lock = {}
dirty = []
lastsync = null
lasttouch = null

Idea::touch = ->
	if dirty.indexOf(@id) is -1
		dirty.push @id
	@dirtytime = now

Idea::lock = ->
	lck=alien.lock.indexOf(fidea.id)
	if lck > -1
		return
	else
		locky.push
	yes

