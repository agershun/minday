// Generated by CoffeeScript 1.3.3

Idea.prototype.kindTable = function() {
  var ca, i, j, ra, _i, _j, _len, _len1, _ref, _ref1, _results;
  this.kind = TABLE;
  if (this.field != null) {
    this.field.kind = FIELDS;
    this.field.pa = this;
    this.field.ix = 'field';
    _ref = this.field;
    for (i = _i = 0, _len = _ref.length; _i < _len; i = ++_i) {
      ca = _ref[i];
      ca.kind = FIELD;
      ca.pa = this.field;
      ca.ix = i;
    }
  }
  _ref1 = this.data;
  _results = [];
  for (i = _j = 0, _len1 = _ref1.length; _j < _len1; i = ++_j) {
    ra = _ref1[i];
    ra.kind = RECORD;
    ra.pa = this;
    ra.ix = i;
    _results.push((function() {
      var _k, _len2, _results1;
      _results1 = [];
      for (j = _k = 0, _len2 = ra.length; _k < _len2; j = ++_k) {
        ca = ra[j];
        ca.kind = VALUE;
        ca.pa = ra;
        _results1.push(ca.ix = j);
      }
      return _results1;
    })());
  }
  return _results;
};

navi[TABLE] = function(eo) {
  var sia, _ref;
  if ($txt.attr("contentEditable") === "true") {
    return navi[IDEA](eo);
  }
  switch (eo.which) {
    case 40:
    case 39:
      if ((sidea === fidea) || (!sidea.frame)) {
        if (((_ref = sidea[0]) != null ? _ref[0] : void 0) != null) {
          return sidea[0][0].select();
        }
      } else {
        sia = sidea;
        while (sia !== fidea && !(sia.pa[sia.ix + 1] != null)) {
          sia = sia.pa;
        }
        if (sia !== fidea) {
          return sia.pa[sia.ix + 1].select();
        }
      }
      break;
    default:
      return navi[IDEA](eo);
  }
};

navi[FIELD] = function(eo) {
  if ($txt.attr("contentEditable") === "true") {
    return navi[IDEA](eo);
  }
  switch (eo.which) {
    case 40:
      if (((!sidea.frame) || (sidea === fidea)) && (sidea[0] != null)) {
        return sidea[0].select();
      } else if (sidea.pa.pa[0][sidea.ix] != null) {
        return sidea.pa.pa[0][sidea.ix].select();
      }
      break;
    case 38:
      return sidea.pa.pa.select();
    case 37:
      if (sidea.pa[sidea.ix - 1] != null) {
        return sidea.pa[sidea.ix - 1].select();
      } else {
        return sidea.pa.pa.select();
      }
      break;
    case 39:
      if (sidea.pa[sidea.ix + 1] != null) {
        return sidea.pa[sidea.ix + 1].select();
      }
      break;
    default:
      return navi[IDEA](eo);
  }
};

navi[VALUE] = function(eo) {
  var _ref, _ref1, _ref2;
  if ($txt.attr("contentEditable") === "true") {
    return navi[IDEA](eo);
  }
  switch (eo.which) {
    case 40:
      if (((!sidea.frame) || (sidea === fidea)) && (sidea[0] != null)) {
        return sidea[0].select();
      } else if (((_ref = sidea.pa.pa[sidea.pa.ix + 1]) != null ? _ref[sidea.ix] : void 0) != null) {
        return sidea.pa.pa[sidea.pa.ix + 1][sidea.ix].select();
      } else if (sidea.pa.pa.pa[sidea.pa.pa.ix + 1] != null) {
        return sidea.pa.pa.pa[sidea.pa.pa.ix + 1].select();
      }
      break;
    case 38:
      if (((_ref1 = sidea.pa.pa[sidea.pa.ix - 1]) != null ? _ref1[sidea.ix] : void 0) != null) {
        return sidea.pa.pa[sidea.pa.ix - 1][sidea.ix].select();
      } else if (((_ref2 = sidea.pa.pa.field) != null ? _ref2[sidea.ix] : void 0) != null) {
        return sidea.pa.pa.field[sidea.ix].select();
      } else {
        return sidea.pa.pa.select();
      }
      break;
    case 37:
      if (sidea.pa.pa[sidea.pa.ix][sidea.ix - 1] != null) {
        return sidea.pa.pa[sidea.pa.ix][sidea.ix - 1].select();
      } else {
        return sidea.pa.pa.select();
      }
      break;
    case 39:
      if (sidea.pa.pa[sidea.pa.ix][sidea.ix + 1] != null) {
        return sidea.pa.pa[sidea.pa.ix][sidea.ix + 1].select();
      }
      break;
    default:
      return navi[IDEA](eo);
  }
};

draw[TABLE] = function(level) {
  var ca, ci, ra, ri, s, _i, _j, _k, _len, _len1, _len2, _ref, _ref1, _ref2, _ref3;
  s = this.htmlIdeaTxt(level);
  if ((level === 0) || (level > 0 && !(this.frame != null))) {
    s += "<table id='bag" + this.id + "'>";
    if (this.field != null) {
      s += "<thead>";
      _ref = this.field;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        ca = _ref[_i];
        s += "<th id='tbl" + ca.id + "'>";
        s += ca.draw(level + 1);
        s += "</th>";
      }
      s += "</thead>";
    }
    _ref1 = this.data;
    for (ri = _j = 0, _len1 = _ref1.length; _j < _len1; ri = ++_j) {
      ra = _ref1[ri];
      s += "<tr>";
      for (ci = _k = 0, _len2 = ra.length; _k < _len2; ci = ++_k) {
        ca = ra[ci];
        s += "<td id='tbl" + ca.id + "' ";
        if (((_ref2 = this.field) != null ? (_ref3 = _ref2[ci]) != null ? _ref3.keyfield : void 0 : void 0) != null) {
          s += "class='keyfield'";
        }
        s += ">";
        s += ca.draw(level + 1);
        s += "</td>";
      }
      s += "</tr>";
    }
    s += "</table>";
  }
  s += "</div>";
  return s;
};