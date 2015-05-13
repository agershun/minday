// Generated by CoffeeScript 1.3.3

keyp[GANTT] = {};

keyp[GANTTSTAGE] = {};

keyp[GANTTRESULT] = {};

keyp[GANTTPHASE] = {};

Idea.prototype.kindGantt = function() {
  var i, ia, _i, _j, _len, _len1, _ref, _ref1;
  this.kind = GANTT;
  _ref = this.data;
  for (i = _i = 0, _len = _ref.length; _i < _len; i = ++_i) {
    ia = _ref[i];
    ia.kind = GANTTSTAGE;
    ia.pa = this;
    ia.ix = i;
    if (ia.result != null) {
      ia.result.kind = GANTTRESULT;
      ia.result.pa = ia;
      ia.result.ix = "result";
    }
  }
  if (this.phase != null) {
    this.phase.kind = GANTTPHASES;
    this.phase.pa = this;
    this.phase.ix = 'phase';
    _ref1 = this.phase.data;
    for (i = _j = 0, _len1 = _ref1.length; _j < _len1; i = ++_j) {
      ia = _ref1[i];
      ia.kind = GANTTPHASE;
      ia.pa = this.phase;
      ia.ix = i;
    }
  }
  return this;
};

draw[GANTT] = function(level) {
  var ia, p, s, _i, _j, _k, _len, _len1, _ref, _ref1, _ref2, _ref3;
  s = this.startIdeaTxt(level);
  if ((level === 0) || (level > 0 && !(this.frame != null))) {
    s += "<table id='bag" + this.id + "'>";
    s += "<tbody><thead><th></th>";
    for (p = _i = _ref = this.start, _ref1 = this.finish; _ref <= _ref1 ? _i <= _ref1 : _i >= _ref1; p = _ref <= _ref1 ? ++_i : --_i) {
      s += "<th width='" + (100 / (this.finish - this.start + 2)) + "%'>" + p + "</th>";
    }
    if (this.phase != null) {
      s += "<tr><th></th>";
      _ref2 = this.phase.data;
      for (_j = 0, _len = _ref2.length; _j < _len; _j++) {
        ia = _ref2[_j];
        s += "<th id='tbl" + ia.id + "' colspan=" + (ia.finish - ia.start + 1) + ">" + ia.draw(level + 1) + "</th>";
      }
    }
    s += "</thead>";
    if (this.length > 0) {
      _ref3 = this.data;
      for (_k = 0, _len1 = _ref3.length; _k < _len1; _k++) {
        ia = _ref3[_k];
        s += "<tr><th id='tbl" + ia.id + "'>" + ia.draw(level + 1) + "</th>";
        if (ia.start > this.start) {
          s += "<td colspan=" + (ia.start - this.start) + ">";
        }
        s += "<td ";
        if (ia.result != null) {
          s += "id='tbl" + ia.result.id + "' ";
        }
        s += " colspan=" + (ia.finish - ia.start + 1) + ">";
        if (ia.result != null) {
          s += ia.result.draw(level + 1);
        }
        if (ia.finish < this.finish) {
          s += "<td colspan=" + (this.finish - ia.finish) + ">";
        }
      }
    }
    s += "</tbody></table>";
  }
  return s += this.endIdeaTxt(level);
};

keyp[GANTT][KEY_DOWN] = function() {
  if (this[0] != null) {
    return this[0].select();
  }
  return this;
};

keyp[GANTTSTAGE][KEY_RIGHT] = function() {
  if (this.result != null) {
    return this.result.select();
  } else if (this.pa[this.ix + 1] != null) {
    return this.pa[this.ix + 1].select();
  }
  return this.pa.downnext();
};

keyp[GANTTSTAGE][KEY_UP] = function() {
  if (this.pa[this.ix - 1] != null) {
    return this.pa[this.ix - 1].select();
  }
  return this.pa;
};

keyp[GANTTSTAGE][KEY_DOWN] = function() {
  if (this.pa[this.ix + 1] != null) {
    return this.pa[this.ix + 1].select();
  }
  return this.pa.downnext();
};

keyp[GANTTSTAGE][KEY_LEFT] = function() {
  var _ref;
  if (((_ref = this.pa[this.ix - 1]) != null ? _ref.result : void 0) != null) {
    return this.pa[this.ix - 1].result.select();
  } else if (this.pa[this.ix - 1] != null) {
    return this.pa[this.ix - 1].select();
  }
  return this.pa;
};

keyp[GANTTRESULT][KEY_RIGHT] = function() {
  if (this.pa.pa[this.pa.ix + 1] != null) {
    return this.pa.pa[this.pa.ix + 1].select();
  }
  return this.pa.downnext();
};

keyp[GANTTRESULT][KEY_LEFT] = function() {
  return this.pa.select();
};

keyp[GANTTRESULT][KEY_DOWN] = function() {
  var _ref;
  if (((_ref = this.pa.pa[this.pa.ix + 1]) != null ? _ref.result : void 0) != null) {
    return this.pa.pa[this.pa.ix + 1].result.select();
  } else if (this.pa.pa[this.pa.ix + 1] != null) {
    return this.pa.pa[this.pa.ix + 1].select();
  }
  return this.pa.downnext();
};

keyp[GANTTRESULT][KEY_UP] = function() {
  var _ref, _ref1;
  if (((_ref = this.pa.pa[this.pa.ix - 1]) != null ? _ref.result : void 0) != null) {
    return this.pa.pa[this.pa.ix - 1].result.select();
  } else if (this.pa.pa[this.pa.ix - 1] != null) {
    return this.pa.pa[this.pa.ix - 1].select();
  } else if (((_ref1 = this.pa.pa.phase) != null ? _ref1[0] : void 0) != null) {
    return this.pa.pa.phase[0].select();
  }
  return this.pa.pa;
};

keyp[GANTTPHASE][KEY_LEFT] = function() {
  if (this.pa[this.ix - 1] != null) {
    return this.pa[this.ix - 1].select();
  }
  return this.pa.pa.select();
};

keyp[GANTTPHASE][KEY_RIGHT] = function() {
  if (this.pa[this.ix + 1] != null) {
    return this.pa[this.ix + 1].select();
  } else if (this.pa.pa[0] != null) {
    return this.pa.pa[0].select();
  }
  return this.pa.pa.downnext();
};

keyp[GANTTPHASE][KEY_UP] = function() {
  return this.pa.pa.select();
};

keyp[GANTTPHASE][KEY_DOWN] = function() {
  var _ref;
  if (((_ref = this.pa.pa[0]) != null ? _ref.result : void 0) != null) {
    return this.pa.pa[0].result.select();
  } else if (this.pa.pa[0] != null) {
    return this.pa.pa[0].select();
  }
  return this.pa.pa.downnext();
};

childkind[GANTT] = function() {
  return GANTTSTAGE;
};

childkind[GANTTSTAGE] = function() {
  return IDEA;
};