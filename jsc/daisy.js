// Generated by CoffeeScript 1.3.3

canvastype[DAISY] = function() {
  return ACTIVE;
};

childkind[DAISY] = function() {
  return PETAL;
};

childsd[DAISY] = function() {
  return OUTSIDE;
};

childkind[PETAL] = function() {
  return PETAL;
};

childsd[PETAL] = function() {
  return OUTSIDE;
};

keyp[DAISY] = {};

keyp[PETAL] = {};

clas[DAISY] = "daisy";

clas[PETAL] = "petal";

Idea.prototype.kindDaisy = function() {
  return this.kind = DAISY;
};

Idea.prototype.kindPetal = function() {
  return this.kind = PETAL;
};

ssshape[PETAL] = function(x, y, w, h) {
  var frm;
  frm = this.forma != null ? this.forma : RRECT;
  return ssshape[frm].call(this, x, y, w, h);
};

ssshape[DAISY] = ssshape[PETAL];

cvv[DAISY] = function(level) {
  var $cvv, ctx, mms;
  mms = this[OUTSIDE][0];
  mms.treesethw(0);
  mms.treesetxy();
  $cvv = $("#cvv" + this.id);
  $cvv.attr("width", v[mms.id].ww);
  $cvv.attr("height", v[mms.id].hh);
  ctx = $cvv[0].getContext("2d");
  return mms.treedraw(ctx);
};

Idea.prototype.treesethw = function(lvl) {
  var ia, _i, _len, _ref;
  v[this.id] = {};
  v[this.id].lvl = lvl;
  v[this.id].w = $("#bag" + this.id).outerWidth(true);
  v[this.id].h = $("#bag" + this.id).outerHeight(true);
  v[this.id].hh = v[this.id].h;
  v[this.id].ww = -DW;
  if (!(this.frame != null) && (this[OUTSIDE] != null)) {
    _ref = this[OUTSIDE];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      ia = _ref[_i];
      if (ia.kind === PETAL) {
        ia.treesethw(lvl + 1);
        v[this.id].hh = Math.max(v[this.id].hh, v[this.id].h + DH + v[ia.id].hh);
        v[this.id].ww += v[ia.id].ww + DW;
      }
    }
  }
  return v[this.id].ww = Math.max(v[this.id].w, v[this.id].ww);
};

Idea.prototype.treesetxy = function() {
  var ia, xx, _i, _len, _ref;
  if (v[this.id].lvl === 0) {
    v[this.id].x = v[this.id].ww / 2 + 3 / 2 * DW;
    v[this.id].y = v[this.id].h / 2 + DH;
  }
  xx = v[this.id].x - v[this.id].ww / 2;
  if (!(this.frame != null) && (this[OUTSIDE] != null)) {
    _ref = this[OUTSIDE];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      ia = _ref[_i];
      if (ia.kind === PETAL) {
        v[ia.id].x = xx + v[ia.id].ww / 2;
        v[ia.id].y = v[this.id].y + v[this.id].h / 2 + v[ia.id].h / 2 + DH;
        xx += v[ia.id].ww + DW;
        ia.treesetxy();
      }
    }
  }
  if (v[this.id].lvl === 0) {
    v[this.id].ww += 3 * DW;
    return v[this.id].hh += 2 * DH;
  }
};

Idea.prototype.treedraw = function(ctx) {
  var ia, _i, _len, _ref, _results;
  v[this.id].ctx = ctx;
  this.ssshape(v[this.id].x, v[this.id].y, v[this.id].w, v[this.id].h);
  $("#bag" + this.id).css("position", "absolute");
  $("#bag" + this.id).css("top", v[this.id].y - v[this.id].h / 2);
  $("#bag" + this.id).css("left", v[this.id].x - v[this.id].w / 2);
  if (this.pa.kind === PETAL) {
    ctx.beginPath();
    ctx.moveTo(v[this.id].x, v[this.id].y - v[this.id].h / 2);
    ctx.lineTo(v[this.id].x, (v[this.id].y - v[this.id].h / 2 + v[this.pa.id].y + v[this.pa.id].h / 2) / 2);
    ctx.lineTo(v[this.pa.id].x, (v[this.id].y - v[this.id].h / 2 + v[this.pa.id].y + v[this.pa.id].h / 2) / 2);
    ctx.lineTo(v[this.pa.id].x, v[this.pa.id].y + v[this.pa.id].h / 2);
    ctx.strokeStyle = "red";
    ctx.lineWidth = 1;
    ctx.stroke();
  }
  if (!(this.frame != null) && (this[OUTSIDE] != null)) {
    _ref = this[OUTSIDE];
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      ia = _ref[_i];
      switch (ia.kind) {
        case PETAL:
          _results.push(ia.treedraw(ctx));
          break;
        default:
          _results.push(void 0);
      }
    }
    return _results;
  }
};

keyp[DAISY][KEY_DOWN] = function() {
  var _ref;
  if (((_ref = this[OUTSIDE]) != null ? _ref[0] : void 0) != null) {
    return this[OUTSIDE][0].select();
  }
};

downnext[PETAL] = function() {
  var _ref;
  if (this === fidea) {
    return null;
  }
  if (this.pa != null) {
    if (((_ref = this[OUTSIDE]) != null ? _ref[0] : void 0) != null) {
      return this[OUTSIDE][0];
    } else {
      return this.pa.downnext();
    }
  }
  return this;
};

keyp[PETAL][KEY_DOWN] = function() {
  var ria, sia, _ref, _ref1;
  if (((_ref = this[0]) != null ? _ref[0] : void 0) != null) {
    return this[0][0].select();
  } else if (((_ref1 = this[OUTSIDE]) != null ? _ref1[0] : void 0) != null) {
    return this[OUTSIDE][0].select();
  } else {
    sia = this.pa;
    while (sia.kind === PETAL) {
      sia = sia.pa;
    }
    ria = sia.downnext();
    if (ria === null) {
      return this.select();
    } else {
      return ria.select();
    }
  }
};

keyp[PETAL][KEY_RIGHT] = function() {
  if (this.pa[OUTSIDE][this.ix + 1] != null) {
    this.pa[OUTSIDE][this.ix + 1].select();
  }
  return this;
};

keyp[PETAL][KEY_LEFT] = function() {
  if (this.pa[OUTSIDE][this.ix - 1] != null) {
    this.pa[OUTSIDE][this.ix - 1].select();
  }
  return this;
};

keyp[PETAL][KEY_UP] = function() {
  return this.pa.select();
};

/*

keyp[PETAL][KEY_DOWN] =->
	if @length > 0 then return @[0].select()
	else
		sia = @pa
		while sia.kind is PETAL
			sia = sia.pa
		ria = sia.downnext()
		if ria is null then return @select()
		else return ria.select()

keyp[PETAL][KEY_ENTER] =->
	if v[@id]? and v[@id].lvl is 0
		@addIdea(@,0,0,true)
	else 
		keyp[DEFAULT][KEY_ENTER].call(@)

# TODO Переписать

keyp[PETAL][KEY_LEFT] =->
	if @pa[@ix-1]? then return @pa[@ix-1].select()
	else if @pa.pa[@pa.ix-1]?[@pa.pa.length-1]? then return @pa.pa[@pa.ix-1][@pa.pa.length-1].select()
	else if @pa.pa[@pa.ix-1]? then return @pa.pa[@pa.ix-1].select()
	@

keyp[PETAL][KEY_RIGHT] =->
	if @pa[@ix+1]? then @pa[@ix+1].select()
	else if @pa.pa[@pa.ix+1]?[0]? then return @pa.pa[@pa.ix+1][0].select()
	else if @pa.pa[@pa.ix+1]? then return @pa.pa[@pa.ix+1].select()
	@

keyp[PETAL][KEY_UP] =->
	if @pa? then @pa.select()
*/

