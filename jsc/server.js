// Generated by CoffeeScript 1.3.3
﻿;

var channel, channelArrive, clickServerOpenFile, clickServerSubscribe, cometAllChannel, cometClient, cometDirtyChannel, cometFocusArrive, cometFocusChannel, cometFocusPublish, cometStart, cometStatus, cursor, filename, serverChangeUser, serverLoad, serverLoadFileSuccess, serverOpen, serverOpenFileSuccess, serverOpenSuccess, serverRefresh, serverSave, serverSaveAs, serverSaveSuccess, serverShare, serverShareDirSuccess, serverShareSuccess, serverSubscribe, serverUnsubscribe, setFocus, setMenuServer, shareStatus, username;

username = "";

filename = "minday.mdy";

cometStatus = false;

setMenuServer = function() {
  $(".server_changeuser").click(serverChangeUser);
  $(".server_open").click(serverOpen);
  $(".server_refresh").click(serverRefresh);
  $(".server_save").click(serverSave);
  $(".server_saveas").click(serverSaveAs);
  $(".server_share").click(serverShare);
  $(".server_subscribe").click(serverSubscribe);
  return $(".server_unsubscribe").click(serverUnsubscribe);
};

cometStart = function() {
  username = $.cookie('username');
  return $('#username').html(username);
};

serverChangeUser = function() {
  username = prompt("Введите имя пользователя", username);
  $.cookie('username', username);
  return $('#username').html(username);
};

serverOpen = function() {
  return $.get('dir', serverOpenSuccess, 'json');
};

serverOpenSuccess = function(data) {
  var fi, s, _i, _len;
  s = "<p><b>Открыть файл</b></p>";
  s += "<p>Выберите файл на сервере для работы:</p>";
  for (_i = 0, _len = data.length; _i < _len; _i++) {
    fi = data[_i];
    s += "<div>";
    s += "<a id='" + fi + "' class='open_file' href='#'>";
    s += fi;
    s += "</a>";
    s += "</div>";
  }
  $("#dialog_open").html(s);
  return $(".open_file").click(clickServerOpenFile);
};

clickServerOpenFile = function(eo) {
  $("#dialog_open").html("");
  filename = eo.srcElement.id;
  return serverRefresh();
};

serverRefresh = function() {
  return $.get("open=" + filename, serverOpenFileSuccess, "json");
};

serverOpenFileSuccess = function(data) {
  var b, io, _i, _len, _ref;
  deleteIdea();
  b = data;
  initIdea(b.length);
  _ref = b.idea;
  for (_i = 0, _len = _ref.length; _i < _len; _i++) {
    io = _ref[_i];
    cloneIdea(io);
  }
  idea[-b.sideaid].upperFrame().fhtml();
  return alert("Загружен файл с сервера");
};

serverLoad = function(fname) {
  return $.get("open=" + fname, serverLoadFileSuccess, "json");
};

serverLoadFileSuccess = function(data) {
  var b, io, _i, _len, _ref;
  b = data;
  updateModel();
  selectModel(b.filename);
  deleteIdea();
  initIdea(b.length);
  _ref = b.idea;
  for (_i = 0, _len = _ref.length; _i < _len; _i++) {
    io = _ref[_i];
    cloneIdea(io);
  }
  updateModel(b.filename);
  return selectModel();
};

serverSaveAs = function() {
  filename = prompt("Введите имя файла для сохранения", "minday.mdy");
  return serverSave();
};

serverSave = function() {
  var data;
  data = JSON.stringify({
    filename: filename,
    length: idea.length,
    idea: idea,
    sideaid: sidea.id
  });
  return $.post("save=" + filename, data, serverSaveSuccess, "json");
};

serverSaveSuccess = function() {
  return alert("Файл передан");
};

channel = "";

cometClient = null;

cometAllChannel = null;

cometDirtyChannel = null;

cometFocusChannel = null;

cometStatus = false;

shareStatus = false;

serverShare = function() {
  var data;
  if (cometStatus === false) {
    cometClient = new Faye.Client('http://localhost:8000/faye');
    data = JSON.stringify({
      filename: filename,
      username: username
    });
    return $.post("share", data, serverShareSuccess, 'json');
  }
};

serverShareSuccess = function() {
  var shareChannelName;
  shareStatus = true;
  shareChannelName = filename + "-" + username;
  return alert("Файл " + filename + " доступен другим пользователям на канале " + filename + "-" + username);
};

serverSubscribe = function() {
  return $.get('sharedir', serverShareDirSuccess, 'json');
};

serverShareDirSuccess = function(data) {
  var fi, s, _i, _len;
  s = "<p><b>Поключиться к редактированию</b></p>";
  s += "<p>Выберите файл на сервере для работы:</p>";
  for (_i = 0, _len = data.length; _i < _len; _i++) {
    fi = data[_i];
    s += "<div>";
    s += "<a id='" + fi.filename + "-" + fi.username + "' class='open_file' href='#'>";
    s += fi.filename + "-" + fi.username;
    s += "</a>";
    s += "</div>";
  }
  $("#dialog_open").html(s);
  return $(".open_file").click(clickServerSubscribe);
};

clickServerSubscribe = function(eo) {
  var channelName;
  $("#dialog_open").html("");
  channelName = eo.srcElement.id;
  if (cometStatus === false) {
    cometClient = new Faye.Client('http://localhost:8000/faye');
  }
  channel = cometClient.subscribe(channelName, channelArrive);
  return serverRefresh();
};

channelArrive = function(data) {
  return alert("changes come");
};

serverUnsubscribe = function() {
  channel.cancel();
  return cometStatus = false;
};

cursor = {};

cometFocusArrive = function(data) {
  var b, _ref;
  b = JSON.parse(data);
  if (b.username !== username) {
    if (((_ref = cursor[b.username]) != null ? _ref.sideaid : void 0) != null) {
      cursor[b.username].oldid = cursor[b.username].sideaid;
    } else {
      cursor[b.username] = {};
    }
    cursor[b.user].sideaid = b.sideaid;
    return setFocus(cursor[b.username]);
  }
};

setFocus = function(f) {
  if ((f != null ? f.oldid : void 0) != null) {
    $("#txt" + f.oldid).removeClass('cursor');
  }
  if ((f != null ? f.sideaid : void 0) != null) {
    return $("#txt" + f.sideaid).addClass('cursor');
  }
};

cometFocusPublish = function() {
  var data;
  if (cometStatus === true) {
    data = JSON.stringify({
      username: username,
      sideaid: sidea.id
    });
    return cometClient.publish(cometFocusChannel, data);
  }
};

/*
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
*/

