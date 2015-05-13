// Generated by CoffeeScript 1.3.3

draw[MAINMENU] = function(level) {
  var s;
  return s = "";
};

draw[MENU] = function(level) {
  var ia, s, _i, _len, _ref;
  s = "";
  s += "<a class='dropdown-toggle' data-toggle='dropdown' href='#'>";
  if (this.txt != null) {
    s += this.txt;
  }
  s += "<b class='caret'></b>";
  s += "</a>";
  if (this.length > 0) {
    s += "<ul class='dropdown-menu'>";
    _ref = this.data;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      ia = _ref[_i];
      if ((ia.txt != null) || ia.txt === "") {
        s += "<li><a  id='mnu" + ia.id + "' class='menu-item'>" + ia.txt + "</a></li>";
      } else {
        s += "<li class='divider'></li>";
      }
    }
    s += "</ul>";
  }
  return s;
};