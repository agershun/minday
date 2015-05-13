##########################
# Minday 0.009 Lykia
# timer.coffee
# Кнопка для таймера
###########################

timer = {}
$$tick = null
$$bell = null

setTimer = ->
	timer.state = off
	$("#timer").click clickTimer
	$$tick = document.getElementById("tick-audio")
	$$bell = document.getElementById("bell-audio")

changeTime =->
	$("#time").html ("&nbsp;"+Math.floor(timer.seconds/60)+":"+("0"+timer.seconds%60).substr(-2))
	timer.seconds -= 1
	# Если времы прошло, то...
	if timer.seconds <= 0
		clearInterval(timer.interval)
		timer.state = off
		alert "Время закончилось!"
		$("#time").html "Таймер"
		$$bell.load()
		$$bell.play()
	# Издавать звуки	
	if (timer.seconds % 60) is 0 or (timer.seconds < 10) or ((timer.seconds < 60) and ((timer.seconds % 10) is 0))
#		$$tick.currentTime = 0
		$$tick.load()
		$$tick.play()


clickTimer =->
	if timer.state is off
		timer.minutes = prompt "На сколько минут поставить таймер","15"
		timer.seconds = timer.minutes*60
		timer.interval = setInterval changeTime,1000
		timer.state = on
	else
		clearInterval(timer.interval)
		timer.state = off
		$("#time").html "Таймер"
