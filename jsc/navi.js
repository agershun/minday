// Generated by CoffeeScript 1.3.3
var finishEdit, navi, prevKey, redraw, redrawEvent, startEdit, stateEdit;

window.shiftKey = false;

prevKey = KEY_SPACE;

navi = {};

redrawEvent = function(eo) {
  return fidea.fhtml(sidea);
};

redraw = function(sia) {
  if (arguments.length === 0) {
    sia = sidea;
  }
  if (sia != null) {
    return fidea.fhtml(sia);
  }
};

$(window).keyup(function(eo) {
  var ia, pos, s, ss, _i, _len, _ref, _ref1;
  prevKey = eo.which;
  if (((KEY_0 <= (_ref = eo.which) && _ref <= KEY_Z) || (185 < (_ref1 = eo.which) && _ref1 < 223) || eo.which === KEY_BACKSPACE || eo.which === KEY_SPACE || eo.which === KEY_DELETE) && (!eo.altKey) && (!eo.ctrlKey)) {
    if (searchStatus === true) {
      ss = $('#input_search').val();
      s = '';
      for (_i = 0, _len = idea.length; _i < _len; _i++) {
        ia = idea[_i];
        if (ia.txt != null) {
          pos = ia.txt.search(ss);
          if (pos > -1) {
            s += "<p><a href='#' id='a" + ia.id + "' class='aidea'>";
            s += ia.txt.substr(0, pos) + "<b>" + ia.txt.substr(pos, ss.length) + "</b>" + ia.txt.substr(pos + ss.length);
            s += " (" + ia.upperFrame().txt + ")" + "</p>";
          }
        }
      }
      $("#dialog_open").html(s);
      return $('.aidea').click(function(eo) {
        var sia;
        sia = idea[-eo.srcElement.id.substr(1)];
        return sia.upperFrame().fhtml(sia);
      });
    }
  }
});

$(window).keydown(function(eo) {
  var ret;
  if ((typeof sidea !== "undefined" && sidea !== null) && (navi[sidea.kind] != null)) {
    ret = navi[sidea.kind](eo);
  } else if ((sidea.sd != null) && (navi[sidea.sd] != null)) {
    ret = navi[sidea.sd](eo);
  } else {
    ret = navi[IDEA](eo);
  }
  return ret;
});

stateEdit = function() {
  return $txt.attr("contentEditable") === "true";
};

navi[IDEA] = function(eo) {
  var kcode, _ref, _ref1, _ref2, _ref3, _ref4, _ref5;
  if (searchStatus === true) {
    return true;
  }
  window.shiftKey = eo.shiftKey;
  kcode = eo.which;
  if (eo.shiftKey) {
    kcode += SHIFT;
  }
  if (eo.ctrlKey) {
    kcode += CTRL;
  }
  if (eo.altKey) {
    kcode += ALT;
  }
  if (stateEdit()) {
    if (((_ref = keye[sidea.kind]) != null ? _ref[kcode] : void 0) != null) {
      keye[sidea.kind][kcode].call(sidea);
      eo.preventDefault();
      return false;
    } else if (((_ref1 = keye[DEFAULT]) != null ? _ref1[kcode] : void 0) != null) {
      keye[DEFAULT][kcode].call(sidea);
      eo.preventDefault();
      return false;
    }
  } else {
    if (((_ref2 = keyp[sidea.kind]) != null ? _ref2[kcode] : void 0) != null) {
      finishEdit();
      keyp[sidea.kind][kcode].call(sidea);
      eo.preventDefault();
      return false;
    } else if (keyp[DEFAULT][kcode] != null) {
      finishEdit();
      keyp[DEFAULT][kcode].call(sidea);
      eo.preventDefault();
      return false;
    }
  }
  if (((KEY_0 <= (_ref3 = eo.which) && _ref3 <= KEY_Z) || (185 < (_ref4 = eo.which) && _ref4 < 223)) && (!eo.altKey) && (!eo.ctrlKey)) {
    if ($txt.attr("contentEditable") !== "true") {
      if (!(sidea.readonly != null) && !(((_ref5 = sidea.pa) != null ? _ref5.childreadonly : void 0) != null)) {
        return startEdit(true);
      }
    }
  }
};

startEdit = function(selectText) {
  var range, sel;
  if (selectText == null) {
    selectText = false;
  }
  if (sidea.txt === "" || sidea.txt === null) {
    $txt.html("&nbsp;");
  } else {
    $txt.html(sidea.txt);
  }
  $("#lvl" + sidea.id).removeClass("display-none");
  $txt.addClass("edit-txt");
  $txt.attr("contentEditable", "true");
  $txt.focus();
  if (selectText) {
    if (window.getSelection && document.createRange) {
      range = document.createRange();
      range.selectNodeContents($txt[0]);
      sel = window.getSelection();
      sel.removeAllRanges();
      return sel.addRange(range);
    } else if (document.body.createTextRange) {
      range = document.body.createTextRange();
      range.moveToElementText($txt[0]);
      return range.select();
    }
  }
};

finishEdit = function() {
  var aa, s, _i, _len, _ref, _ref1, _results;
  if ($txt.attr("contentEditable") === "true") {
    $txt.attr("contentEditable", "false");
    $txt.blur();
    $txt.removeClass("edit-txt");
    if ($txt.html === "&nbsp;") {
      if (sidea.txt === null) {
        sidea.txt = null;
      } else if (sidea.txt === "") {
        sidea.txt = "";
      } else {
        sidea.txt = "";
      }
    } else {
      sidea.txt = $txt.html();
    }
    s = "";
    if (sidea.txt !== null) {
      s += sidea.txt;
    }
    if (sidea.txt === "") {
      s += "&nbsp;";
    }
    $txt.html(s);
    if (!(sidea.txt != null) && (notxt[this.kind] != null)) {
      $("#lvl" + sidea.id).addClass("display-none");
    }
    if (sidea.run != null) {
      sidea.run();
    }
    if (((_ref = sidea.pa) != null ? _ref.runchild : void 0) != null) {
      sidea.pa.runchild();
    }
    if (sidea.goto != null) {
      sidea.goto.upperFrame.fhtml(sidea.goto);
    }
    if (sidea.refresh != null) {
      fidea.fhtml(sidea);
    }
    _ref1 = this.cvva;
    _results = [];
    for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
      aa = _ref1[_i];
      _results.push(aa.cvv());
    }
    return _results;
  }
};