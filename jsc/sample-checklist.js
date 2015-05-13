// Generated by CoffeeScript 1.3.3

sample.checklist = function() {
  var q;
  window.clist = adf("Чеклист - список дел", {
    description: add("Список дел"),
    guide: add("Отметьте выполненные дела с помощью клавиши Enter. Кстати, можно добавить			свои комментарии под делами или отредактировать их названия")
  });
  window.clist.push(q = add("Программа позволяет создавать списки для выполнения дел (чек-лист)", {
    plain: true
  }));
  window.clist.push(q = add("Клавиши управления"));
  window.clist.push(q = add("Изменять состояние можно с помощью клавиши <b>Enter</b>", {
    plain: true,
    list: UL
  }));
  window.clist.push(q = add("Поставить формат галочки до идеи можно клавишами <b>Alt-C</b>", {
    plain: true,
    list: UL
  }));
  window.clist.push(q = add("Поставить формат галочки после идеи можно клавишами <b>Alt-Y</b>", {
    plain: true,
    list: UL
  }));
  window.clist.push(q = add("Пример:Как вскипятить чайник?"));
  q.push(add("Взять чайник.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Подойти к крану.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Открыть кран.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Наливать в чайник воду небольшими дозами, проверяя, не произошла ли ошибка переполнения. Если произошла, отлить воду.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Проверить совместимость чайника с нагревающим устройством.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Поставить чайник на электрическую подставку.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Выругаться, потому что нету диска с драйвером, и чайник не работает.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Найти кнопку включения.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Нажать кнопку.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Опять выругаться, потому что чайник не работает.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Найти вилку.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Проверить совместимость вилки с розеткой.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Выругаться уже матом, потому что порт для подключения нестандартный.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Подумать, какой стороной вставить вилку.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Выругаться.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Вставить вилку как попало.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Чудо устройство заработало.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Выругаться, потому что программа кипячения жутко тормозит.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Перекур.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Чайник выключился. Проверить, есть ли чай. Если истина, то искать совместимую кружку, если ложь – аварийное завершение.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Достать кружку.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Бросить пакетик.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Наливать воду в кружку.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Выругаться, потому что произошла ошибка переполнения, слить воду.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Вытереть стол.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Достать пакетик из раковины, выругаться.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Повторить операции 22-23, предусмотреть ошибку переполнения, в противном случае бесконечный цикл 22-27, или пока вода не остынет, тогда начинать сначала.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Выругаться, потому что плохо заваривается.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Добавить еще пакетик.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Попробовать чай, выругаться, потому что нет сахара.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Достать сахарницу из системного блока – остальное пространство занято, больше ставить некуда.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Насыпать сахара.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Выругаться, потому что канал подачи сахара слишком узкий.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Опять выругаться, потому что чай слишком сладкий.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Открыть visual c++.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Выругаться матом на microsoft.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Поставить чай на стол, в системный блок нельзя – там сахарница.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Написать программу.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Перекурить, вспомнив, что есть чай.", {
    format: CHECKBOX,
    plain: true
  }));
  q.push(add("Пить холодный чай.", {
    format: CHECKBOX,
    plain: true
  }));
  library.push(window.clist);
  return window.clist;
};
