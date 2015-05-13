// Generated by CoffeeScript 1.3.3

sample["interface"] = function() {
  var im, m1, m10, m2, m20, m30, m40, m50, n10, n20, n30, n40, n50, n60, n70, n80;
  if (models["help-interface"] == null) {
    updateModel();
    createNewModel("help-interface");
    return serverLoad("help-interface");
  } else {
    createNewModel("help-interface");
    selectModel("help-interface");
    im = adf("Интерфейс программы");
    im.push(m1 = add("Области экрана", {
      list: OL
    }));
    im.push(m2 = add("Меню", {
      list: OL
    }));
    m1.push(m10 = add("Меню"));
    m1.push(m20 = add("Поиск"));
    m1.push(m30 = add("Таймер"));
    m1.push(m40 = add("Рабочее поле"));
    m1.push(m50 = add("Боковая панель"));
    m2.push(n10 = add("Файл"));
    m2.push(n20 = add("Сервер"));
    m2.push(n30 = add("Правка"));
    m2.push(n40 = add("Формат"));
    m2.push(n50 = add("Вставка"));
    m2.push(n60 = add("Вид"));
    m2.push(n70 = add("Меню"));
    m2.push(n80 = add("Справка"));
    updateCurrentModel(im, im, false);
    return selectModel();
  }
};
