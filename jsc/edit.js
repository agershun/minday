// Generated by CoffeeScript 1.3.3
var editCopy, editCut, editDelete, editDuplicate, editFind, editForma, editKind, editKindReverse, editPaste, editPlace, editRedo, editScheme, editSelectAll, editText, editUndo, setMenuEdit;

setMenuEdit = function() {
  $(".edit_undo").click(editUndo);
  $(".edit_redo").click(editRedo);
  $(".edit_cut").click(editCut);
  $(".edit_copy").click(editCopy);
  $(".edit_paste").click(editPaste);
  $(".edit_duplicate").click(editDuplicate);
  $(".edit_delete").click(editDelete);
  $(".edit_select_all").click(editSelectAll);
  $(".edit_text").click(editText);
  $(".edit_forma").click(editForma);
  $(".edit_scheme").click(editScheme);
  $(".edit_place").click(editPlace);
  $(".edit_kind").click(editKind);
  return $(".edit_find").click(editFind);
};

editUndo = function() {
  return alert("Эта функция программы будет реализована в следующих версиях");
};

editRedo = function() {
  return alert("Эта функция программы будет реализована в следующих версиях");
};

editCut = function() {
  return sidea.cutIdea();
};

editCopy = function() {
  return sidea.copyIdea();
};

editPaste = function() {
  return sidea.pa.pasteIdea(sidea, sidea.ix, sidea.ix, true);
};

editDuplicate = function() {
  return sidea.duplicateIdea();
};

editDelete = function() {
  return sidea.del();
};

editSelectAll = function() {
  return alert("Эта функция программы будет реализована в следующих версиях");
};

editText = function() {
  return startEdit(false);
};

editForma = function() {
  var fi;
  if (sidea.forma != null) {
    fi = shapes.indexOf(sidea.forma);
    if (fi < -1) {
      fi = 0;
    }
  } else {
    fi = 0;
  }
  sidea.forma = shapes[(fi + 1) % shapes.length];
  return redraw();
};

editScheme = function() {
  var fi, shh;
  shh = [WHITE, BLUE, LIGHTBLUE, GREEN, YELLOW, RED, BLACK];
  if (sidea.scheme != null) {
    fi = shh.indexOf(sidea.scheme);
    if (fi < -1) {
      fi = 0;
    }
  } else {
    fi = 0;
  }
  sidea.scheme = shh[(fi + 1) % shh.length];
  return redraw();
};

editPlace = function() {
  if (sidea.place != null) {
    if (sidea.place === TXT) {
      sidea.place = BAG;
    } else if (sidea.place === BAG) {
      sidea.place = TBL;
    } else if (sidea.place === TBL) {
      sidea.place = TXT;
    } else {
      delete sidea.place;
    }
  } else {
    sidea.place = TXT;
  }
  return redraw();
};

editKind = function() {
  var ki;
  ki = kkind.indexOf(sidea.kind);
  if (ki < 0) {
    ki = 0;
  } else {
    ki = (ki + 1) % kkind.length;
  }
  sidea.kind = kkind[ki];
  redraw();
  return $('#bag' + sidea.id).qtip({
    content: kkindname[ki],
    show: {
      event: false,
      ready: true
    }
  });
};

editKindReverse = function() {
  var ki;
  ki = kkind.indexOf(sidea.kind);
  if (ki <= 0) {
    ki = kkind.length - 1;
  } else {
    ki = (ki - 1) % kkind.length;
  }
  sidea.kind = kkind[ki];
  redraw();
  return $('#bag' + sidea.id).qtip({
    content: kkindname[ki],
    show: {
      event: false,
      ready: true,
      solo: true
    }
  });
};

editFind = function() {
  return $('#input_search').focus();
};