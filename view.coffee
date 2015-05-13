################################################
# MINDAY 0.009Tu
# view.coffee
# Меню Вид
################################################

# Устанавливаем ссылки на меню
setMenuView = ->
	$(".view_fullscreen").click viewFullScreen
	$(".view_description").click viewDescription
	$(".view_guide").click viewGuide
	$(".view_todo").click viewTodo
	$(".view_comment").click viewComment
	$(".view_sticker").click viewSticker
	$(".view_ballon").click viewBallon
	$(".view_timer").click viewTimer

# Устанавливаем
showFullScreen =->
	$('#navbar').hide()
	$('#toolbar').hide()
	$('body').css("padding-top","0px")
#	$('#desk').css("width","100%")
#	$('#sidebar').hide()
	
# Переключаем
viewFullScreen = ->
	$('#navbar').toggle()
	if $('#navbar').css("display") is "none"
		$('body').css("padding-top","0px")
		$('#toolbar').hide()
#		$('#desk').css("width","100%")
#		$('#sidebar').hide()
	else
		$('body').css("padding-top","40px")
		$('#toolbar').show()
#		$('#desk').css("width","80%")
#		$('#sidebar').show()
	redraw()


viewDescription = ->	alert "Эта функция будет реализована в следующих версиях программы"
viewGuide = ->	alert "Эта функция будет реализована в следующих версиях программы"
viewTodo = ->	alert "Эта функция будет реализована в следующих версиях программы"
viewComment = ->	alert "Эта функция будет реализована в следующих версиях программы"
viewSticker = ->	alert "Эта функция будет реализована в следующих версиях программы"
viewBallon = ->	alert "Эта функция будет реализована в следующих версиях программы"

viewTimer =->	
	$('#timer').toggle()
	if $('#timer').css("display") is "none"
		$('#icon-timer').hide()
	else
		$('#icon-timer').show()

