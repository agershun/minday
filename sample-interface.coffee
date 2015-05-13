################################################
# MINDAY 0.008BI 
# sample-interface.coffee
# Метод попарного сравнения. 
# На основе рассылки mindtools.com
################################################

sample.interface = ->

	unless models["help-interface"]?
		updateModel()
		createNewModel("help-interface")
#		selectModel("help-interface")
		serverLoad("help-interface")
#		updateModel("help-interface")
#		selectModel()
	else
		createNewModel("help-interface")
		selectModel("help-interface")

		im = adf "Интерфейс программы"

		im.push m1=add "Области экрана", list:OL
		im.push m2=add "Меню", list:OL

		m1.push m10=add "Меню"
		m1.push m20=add "Поиск"
		m1.push m30=add "Таймер"
		m1.push m40=add "Рабочее поле"
		m1.push m50=add "Боковая панель"

		m2.push n10=add "Файл"
		m2.push n20=add "Сервер"
		m2.push n30=add "Правка"
		m2.push n40=add "Формат"
		m2.push n50=add "Вставка"
		m2.push n60=add "Вид"
		m2.push n70=add "Меню"
		m2.push n80=add "Справка"

		updateCurrentModel(im,im,false)

		selectModel()

