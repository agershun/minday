// Generated by CoffeeScript 1.3.3
var helpAbout, helpHelp, helpHotkey, helpKnowledgebase, helpMethod, helpPortal, setMenuHelp;

setMenuHelp = function() {
  $(".help_help").click(helpHelp);
  $(".help_hotkey").click(helpHotkey);
  $(".help_method").click(helpMethod);
  $(".help_knowledgebase").click(helpKnowledgebase);
  $(".help_portal").click(helpPortal);
  return $(".help_export").click(helpAbout);
};

helpHelp = function() {
  return alert("Справка");
};

helpHotkey = function() {
  return alert("Горячие клавиши");
};

helpKnowledgebase = function() {
  return alert("База знаний");
};

helpMethod = function() {
  return alert("Выбор методологии");
};

helpPortal = function() {
  return alert("Переход на портал minday.ru");
};

helpAbout = function() {
  return alert("Minday 0.010 Tokyo");
};
