################################################
# MINDAY 0.008BI 
# sample-timer.coffee
# Таймер
################################################


sample.timer = ->

	tmr = adf "Работа с таймером"

	tmr.push add "Для проведения мозгового штурма может быть полезным ограничить время 
		работы над проблемой. Для этого в программу встроен таймер.", plain:yes
	tmr.push add "Для включения и выключения таймера, нажмите кнопку в правом
		верхнем углу. По окончанию времени, таймер подаст сигнал и высветит 
		предупреждения.",plain:yes

	library.push tmr
	tmr