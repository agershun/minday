################################################
# MINDAY 0.010 Tokyo 
# sample-canvas.coffee
# Примеры для холста
################################################

#TODO: Сделать осмысленный пример

sample.canvas = ->
	cvv = adf "Примеры холстов"
	cvv.push add "Холст - это такое состояние идеи, которое позволяет
		совмещать на одном экране текст и графику. Вы можете любую
		идею оформить с помощью соответствующей фигуры.",plain:yes
	cvv.push cv=add "Графическое изображение процесса",canvas:CANVASJS
	cv.push z=add "Закругленный прямоугольник",forma:RRECT,place:BAG,scheme:WHITE,list:TD
	cv.push add "Овал",forma:OVAL,place:BAG,scheme:BLUE,list:TD
	cv.push add "Круг",forma:CIRCLE,place:BAG,scheme:LIGHTBLUE,list:TD
	cv.push add "Прямоугольник",forma:RECT,place:BAG,scheme:GREEN,list:TD
	cv.push add "Стрелка в начале",forma:AARROW,place:BAG,scheme:YELLOW,list:TD
	cv.push add "Стрелка",forma:BARROW,place:BAG,scheme:RED,list:TD
	cv.push add "Закругленный прямоугольник",forma:RRECT,place:TBL,scheme:WHITE,list:TD,newline:yes
	cv.push add "Овал",forma:OVAL,place:TBL,scheme:BLUE,list:TD
	cv.push add "Прямоугольник",forma:RECT,place:TBL,scheme:GREEN,list:TD
	cv.push add ""
	cv.push add "Определение<br>потребности<br>клиента",forma:AARROW,place:TBL,scheme:GREEN,list:TD,newline:yes,plain:yes,tableclass:1
	cv.push add "Разработка<br>продукта",forma:BARROW,place:TBL,scheme:YELLOW,list:TD,plain:yes
	cv.push add "Производство<br>продукта",forma:BARROW,place:TBL,scheme:YELLOW,list:TD,plain:yes
	cv.push add "Передача<br>клиенту",forma:BARROW,place:TBL,scheme:YELLOW,list:TD,plain:yes
	cv.push add "Удовлетворение<br>потребности<br>клиента",forma:BARROW,place:TBL,scheme:GREEN,list:TD,plain:yes
	cv.push add ""
	cv.push add "Круг",forma:CIRCLE,place:TBL,scheme:LIGHTBLUE,list:TD,newline:yes
	cv.push add "Закругленный прямоугольник",forma:RRECT,place:TXT,scheme:WHITE,list:TD,newline:yes
	cv.push add "Овал",forma:OVAL,place:TXT,scheme:BLUE,list:TD
	cv.push add "Круг",forma:CIRCLE,place:TXT,scheme:LIGHTBLUE,list:TD,axon:(adr [z])
	cv.push add "Прямоугольник",forma:RECT,place:TXT,scheme:GREEN,list:TD
	cv.push add "Стрелка в начале",forma:AARROW,place:TXT,scheme:YELLOW,list:TD
	cv.push add "Стрелка",forma:BARROW,place:TXT,scheme:RED,list:TD
	library.push cvv 
	window.cv1 = cvv
	cvv
