################################################
# MINDAY 0.009Tu
# help.coffee
# Меню Помощь
################################################

# Устанавливаем ссылки на меню
setMenuHelp = ->
	$(".help_help").click helpHelp
	$(".help_hotkey").click helpHotkey
	$(".help_method").click helpMethod
	$(".help_knowledgebase").click helpKnowledgebase
	$(".help_portal").click helpPortal
	$(".help_export").click helpAbout

helpHelp = ->
	alert "Справка"

helpHotkey = ->
	alert "Горячие клавиши"

helpKnowledgebase = ->
	alert "База знаний"

helpMethod = ->
	alert "Выбор методологии"


helpPortal = ->
	alert "Переход на портал minday.ru"

helpAbout = ->
	alert "Minday 0.010 Tokyo"

