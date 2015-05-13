// Generated by CoffeeScript 1.3.3
var $bag, $tab, $tbl, $tbs, $txt, acss, canvastype, clas, ctx, cvv, cvva, draw, dropIdea, drtxt, fidea, ggg, ideatxt, lastBackground, lastFidea, notxt, paint, pppaint, shape, sidea, ssidea, ssshape, svg, tbx, v;

sidea = null;

fidea = null;

ssidea = [];

$txt = null;

$bag = null;

$tbl = null;

$tab = null;

$tbs = null;

cvva = [];

ggg = {};

v = {};

ctx = {};

cvv = {};

notxt = {};

acss = [];

shape = {};

svg = {};

paint = {};

draw = {};

ssshape = {};

pppaint = {};

canvastype = {};

lastFidea = null;

lastBackground = 0;

tbx = {};

clas = {};

drtxt = {};

Idea.prototype.ssshape = function(x, y, w, h) {
  if (this.kind != null) {
    return ssshape[this.kind].call(this, x, y, w, h);
  } else {
    return ssshape[DEFAULT].call(this, x, y, w, h);
  }
};

ssshape[DEFAULT] = function(x, y, w, h) {
  if (this.forma != null) {
    if (ssshape[this.forma] != null) {
      return ssshape[this.forma].call(this, x, y, w, h);
    } else {
      return ssshape[RRECT].call(this, x, y, w, h);
    }
  }
  return null;
};

Idea.prototype.draw = function(level, drawshow) {
  if (level == null) {
    level = 0;
  }
  if (draw[this.kind] != null) {
    return draw[this.kind].call(this, level, drawshow);
  } else {
    return draw[DEFAULT].call(this, level, drawshow);
  }
};

Idea.prototype.pppaint = function(level, ctx) {
  if (level == null) {
    level = 0;
  }
  if (pppaint[this.kind] != null) {
    return pppaint[this.kind].call(this, level, ctx);
  } else {
    return pppaint[DEFAULT].call(this, level, ctx);
  }
};

Idea.prototype.canvastype = function() {
  if (canvastype[this.kind] != null) {
    return canvastype[this.kind].call(this);
  } else {
    return canvastype[DEFAULT].call(this);
  }
};

canvastype[DEFAULT] = function() {
  return false;
};

Idea.prototype.drawIdea = function(level) {
  if (level == null) {
    level = 0;
  }
  return draw[DEFAULT].call(this, level);
};

Idea.prototype.cvv = function(level) {
  if (level == null) {
    level = 0;
  }
  if (cvv[this.kind] != null) {
    return cvv[this.kind].call(this, level);
  } else {
    return cvv[DEFAULT].call(this, level);
  }
};

Idea.prototype.drtxt = function(level) {
  if (level == null) {
    level = 0;
  }
  if (drtxt[this.kind] != null) {
    return drtxt[this.kind].call(this, level);
  } else {
    return drtxt[DEFAULT].call(this, level);
  }
};

cvv[DEFAULT] = function(level) {
  var $cvv, $map, $pap;
  $pap = $("#pap" + this.id);
  $cvv = $("#cvv" + this.id);
  $map = $("#map" + this.id);
  if ((this.canvas != null) && this.canvas === CANVASJS) {
    $pap.width($map.width());
    $pap.height($map.height());
    $cvv.attr("width", $map.width());
    $cvv.attr("height", $map.height());
    ctx[this.id] = $cvv[0].getContext("2d");
    return this.pppaint(level, ctx[this.id]);
  }
};

pppaint[DEFAULT] = function(level, ctx) {
  var $tag, aa, ia, _i, _len, _ref, _results;
  if (this.forma != null) {
    v[this.id] = {};
    v[this.id].ctx = ctx;
    v[this.id].scheme = this.scheme != null ? this.scheme : WHITE;
    if ((this.place != null) && this.place === TBL) {
      $tag = $("#tbl" + this.id);
      v[this.id].ww = $tag.outerWidth(true);
      v[this.id].hh = $tag.outerHeight(true);
      v[this.id].w = $tag.outerWidth(false);
      v[this.id].h = $tag.outerHeight(false);
      v[this.id].x = $tag.position().left + v[this.id].ww / 2;
      v[this.id].y = $tag.position().top + v[this.id].hh / 2;
      this.ssshape(v[this.id].x, v[this.id].y, v[this.id].w, v[this.id].h);
    } else if ((this.place != null) && this.place === TXT) {
      $tag = $("#txt" + this.id);
      v[this.id].ww = $tag.outerWidth(true);
      v[this.id].hh = $tag.outerHeight(true);
      v[this.id].w = $tag.outerWidth(false) + 10;
      v[this.id].h = $tag.outerHeight(false) + 10;
      v[this.id].x = $tag.position().left + v[this.id].ww / 2;
      v[this.id].y = $tag.position().top + v[this.id].hh / 2;
      this.ssshape(v[this.id].x, v[this.id].y, v[this.id].w, v[this.id].h);
    } else {
      $tag = $("#bag" + this.id);
      v[this.id].ww = $tag.outerWidth(true);
      v[this.id].hh = $tag.outerHeight(true);
      v[this.id].w = $tag.outerWidth(false);
      v[this.id].h = $tag.outerHeight(false);
      v[this.id].x = $tag.position().left + v[this.id].ww / 2;
      v[this.id].y = $tag.position().top + v[this.id].hh / 2;
      this.ssshape(v[this.id].x, v[this.id].y, v[this.id].w, v[this.id].h);
    }
  }
  if (this.notFrame(level)) {
    _ref = this.data;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      aa = _ref[_i];
      _results.push((function() {
        var _j, _len1, _results1;
        _results1 = [];
        for (_j = 0, _len1 = aa.length; _j < _len1; _j++) {
          ia = aa[_j];
          _results1.push(ia.pppaint(level + 1, ctx));
        }
        return _results1;
      })());
    }
    return _results;
  }
};

Idea.prototype.createTableau = function() {
  var cs, i, ia, ii, j, jj, jjj, rs, t, _i, _j, _k, _l, _ref, _ref1, _ref2, _ref3;
  t = [];
  for (i = _i = 0, _ref = this.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
    if (t[i] == null) {
      t[i] = [];
    }
    jj = 0;
    for (j = _j = 0, _ref1 = this[i].length - 1; 0 <= _ref1 ? _j <= _ref1 : _j >= _ref1; j = 0 <= _ref1 ? ++_j : --_j) {
      ia = this[i][j];
      while (t[i][jj] != null) {
        jj++;
      }
      cs = this[i][j].colspan != null ? this[i][j].colspan : 1;
      rs = this[i][j].rowspan != null ? this[i][j].rowspan : 1;
      ia.ii = i;
      ia.jj = jj;
      for (ii = _k = i, _ref2 = i + rs - 1; i <= _ref2 ? _k <= _ref2 : _k >= _ref2; ii = i <= _ref2 ? ++_k : --_k) {
        if (t[ii] == null) {
          t[ii] = [];
        }
        for (jjj = _l = jj, _ref3 = jj + cs - 1; jj <= _ref3 ? _l <= _ref3 : _l >= _ref3; jjj = jj <= _ref3 ? ++_l : --_l) {
          t[ii][jjj] = ia.id;
        }
      }
    }
  }
  return tbx[this.id] = t;
};

Idea.prototype.tbxDown = function() {
  var i, t;
  t = tbx[this.pa.id];
  i = this.ii;
  while (i < t.length && t[i][this.jj] === this.id) {
    i++;
  }
  if (i < t.length) {
    return idea[-t[i][this.jj]];
  } else {
    return this.pa.downnext();
  }
};

Idea.prototype.tbxUp = function() {
  var i, t;
  t = tbx[this.pa.id];
  i = this.ii;
  while (i >= 0 && t[i][this.jj] === this.id) {
    i--;
  }
  if (i >= 0) {
    return idea[-t[i][this.jj]];
  } else {
    return this.pa;
  }
};

Idea.prototype.tbxLeft = function() {
  var j, rs, t;
  t = tbx[this.pa.id];
  j = this.jj;
  while (j >= 0 && t[this.ii][j] === this.id) {
    j--;
  }
  if (j >= 0) {
    return idea[-t[this.ii][j]];
  } else {
    rs = this.rowspan ? this.rowspan : 1;
    if (this.ii - rs >= 0) {
      return idea[-t[this.ii - rs][t[this.ii - rs].length - 1]];
    } else {
      return this.pa;
    }
  }
};

Idea.prototype.tbxRight = function() {
  var j, rs, t;
  t = tbx[this.pa.id];
  j = this.jj;
  while (j < t[this.ii].length && t[this.ii][j] === this.id) {
    j++;
  }
  if (j < t[this.ii].length) {
    return idea[-t[this.ii][j]];
  } else {
    rs = this.rowspan ? this.rowspan : 1;
    if (this.ii + rs < t.length) {
      return idea[-t[this.ii + rs][0]];
    } else {
      return this.pa.rightnext();
    }
  }
};

Idea.prototype.notFrame = function(level) {
  return (level === 0) || (level > 0 && !(this.frame != null));
};

Idea.prototype.notHeader = function(level) {
  return level !== 0;
};

Idea.prototype.htmlIdeaTxt = function(level) {
  return this.startIdeaTxt(level);
};

Idea.prototype.simpleIdeaTxt = function(level, drawshow) {
  return this.startIdeaTxt(level, drawshow) + this.endIdeaTxt(level, drawshow);
};

ideatxt = function(s) {
  if (typeof s === "string") {
    return s;
  } else if (isIdea(s)) {
    return s.txt;
  } else {
    return console.error("ideatxt(s): Тип s - не строка и не идея");
  }
};

drtxt[DEFAULT] = function(level) {
  var s;
  s = "";
  if ((this.txt != null) && this.txt !== "") {
    if (this === fidea) {
      s = this.txt.replace(/(<([^>]+)>)/ig, "");
    } else {
      s += this.txt;
    }
  } else if (this.placeholder != null) {
    s += "<div id='mot" + this.id + "' class='idea-mot" + level + "'>";
    s += ideatxt(this.placeholder);
    s += "</div>";
  } else if ((this.pa != null) && (this.pa.childplaceholder != null)) {
    s += "<div id='mot" + this.id + "' class='idea-mot" + level + "'>";
    s += ideatxt(this.pa.childplaceholder);
    s += "</div>";
  }
  return s;
};

Idea.prototype.startIdeaTxt = function(level, drawshow) {
  var s, _ref, _ref1, _ref2;
  s = "";
  /* 
  	# TODO: Перенести все align в нормальный текст
  	unless @ is fidea and @list?
  
  		if (@list is INLINE) and @notHeader(level)
  				s += "<div class='idea-inline'"  
  				s += ">"
  
  		if (@list is SPAN) or (@list is STICKER) 
  			prevexist = @pa?[@ix-1]?.list?
  			if (not prevexist) or (prevexist and @pa[@ix-1].list isnt SPAN and @pa[@ix-1].list isnt STICKER)
  				s += "<div style='display:inline-block;' "  
  				s += ">"
  
  		else if @list is TD or @list is TH
  			prevexist = @pa?[@ix-1]?.list?
  			if (not prevexist) or (prevexist and (@pa[@ix-1].list isnt TD) and (@pa[@ix-1].list isnt TH))
  				@createTableau()
  				s += "<table style='display:inline-block;' class='"
  				if @tableclass?
  					s += tblClass[@tableclass]
  				else 
  					s += tblClass[0]
  				s += "'"  
  				s += "><tbody>"
  			if @newline then s+="<tr>"
  			s += "<td " if @list is TD
  			s += "<th " if @list is TH
  #			s += " class='"+panelClass[@panel]+"' " if @panel? and @place? and @place is TBL
  			s += " rowspan="+@rowspan if @rowspan?
  			s += " colspan="+@colspan if @colspan?
  			if @valign?
  				s += " style='vertical-align:"
  				switch (@valign)
  					when TOP then s+="top"
  					when MIDDLE then s+="middle"
  					when BOTTOM then s+="bottom"
  				s += "'"
  			if @align?
  				s += " style='text-align:"
  				switch (@align)
  					when LEFT then s+="left"
  					when CENTER then s+="center"
  					when RIGHT then s+="right"
  					when JUSTIFY then s+="justify"
  				s += "' "
  			if @place? and @place is TBL and @ isnt fidea
  				if @forma? and (@forma is BUTTON or @forma is PANEL)
  					s += " class='"
  					s += " button" if @forma is BUTTON
  					s += " panel" if @forma is PANEL
  					s += " scheme-"+schemes[@scheme][0] if @scheme?
  					s += "' "
  			s += " id='tbl"+@id+"'>"
  */

  if ((this.list === OL) || (this.list === UL) && (this !== fidea)) {
    if (this.list === OL) {
      if ((((_ref = this.pa) != null ? (_ref1 = _ref[this.sd - 1]) != null ? (_ref2 = _ref1[this.ix]) != null ? _ref2.list : void 0 : void 0 : void 0) != null) && (this.pa[this.sd - 1][this.ix].list === OL) && (this.pa[this.sd - 1][this.ix].start != null)) {
        this.start = this.pa[this.sd - 1][this.ix].start + 1;
      } else {
        this.start = 1;
      }
      s += "<ol id='olt" + this.id + "' start='" + this.start + "' class='idea-ol";
    } else if (this.list === UL) {
      s += "<ul id='ult" + this.id + "' class='idea-ul ";
    }
    if (this.plain != null) {
      s += " idea-oul-plain";
    } else if (this.level != null) {
      s += " idea-oul" + this.level;
    } else {
      s += " idea-oul" + level;
    }
    s += "'><li id='lit" + this.id + "'><div style='display:block'>";
  }
  s += "<div";
  if (this.level != null) {
    s += " id='bag" + this.id + "' class='idea-bag" + this.level;
  } else {
    s += " id='bag" + this.id + "' class='idea-bag" + level;
  }
  if (!((this.nodrop != null) || ((this.pa != null) && (this.pa.childnodrop != null)))) {
    s += " drop";
  }
  if (!((this.nodrag != null) || ((this.pa != null) && (this.pa.childnodrag != null)))) {
    s += " drag";
  }
  if (this.kind === LAYER) {
    s += " pyramid";
  }
  if (this.kind === BUTTON) {
    s += " btn";
  }
  if ((((this.place != null) && this.place === BAG) || (!(this.place != null))) && this !== fidea) {
    if ((this.forma != null) && (this.forma === BUTTON || this.forma === PANEL || this.forma === CSSOVAL || this.forma === CSSRECT || this.forma === CSSRRECT)) {
      if (this.forma === BUTTON) {
        s += " button";
      }
      if (this.forma === PANEL) {
        s += " panel";
      }
      if (this.forma === CSSOVAL) {
        s += " cssoval";
      }
      if (this.forma === CSSRECT) {
        s += " cssrect";
      }
      if (this.forma === CSSRRECT) {
        s += " cssrrect";
      }
      if (this.scheme != null) {
        s += " scheme-" + schemes[this.scheme][0];
      }
    }
  }
  if (this.kind === SLIDE && this === fidea) {
    s += " slide";
  }
  if ((this.border != null) && this !== fidea) {
    s += " bordered";
  }
  if (clas[this.kind] != null) {
    s += " " + clas[this.kind] + "-bag";
  }
  if (this.kind === MINDLEAF) {
    s += " mindbag";
  }
  if (this["class"] != null) {
    s += " " + this["class"].txt;
  }
  s += "' ";
  if (this.bagstyle != null) {
    s += " style='" + this.bagstyle + "'";
  }
  if (this.columns != null) {
    s += " style='-webkit-columns:" + this.columns + ";' ";
  }
  if (this.childrenalign != null) {
    s += " style='text-align:";
    switch (this.childrenalign) {
      case LEFT:
        s += "left";
        break;
      case CENTER:
        s += "center";
        break;
      case RIGHT:
        s += "right";
        break;
      case JUSTIFY:
        s += "justify";
    }
    s += "'";
  }
  if ((this.forma != null) && (this.place != null) && this.place === BAG && this !== fidea) {
    s += " style='padding:" + this.padding() + "; margin:" + this.margin() + ";' ";
  }
  s += ">";
  if ((drawshow != null) && ((drawshow === DRAWALL) || (drawshow === DRAWHEADER))) {
    if ((this.plain != null) && (this !== fidea)) {
      s += "<div  id='lvl" + this.id + "' class='idea-plain";
    } else if (this.level != null) {
      s += "<div  id='lvl" + this.id + "' class='idea-txt" + this.level;
    } else {
      s += "<div  id='lvl" + this.id + "' class='idea-txt" + level;
    }
    if (!(this.txt != null) && !notxt[this.kind]) {
      s += " display-none";
    }
    s += "' ";
    if (this.align != null) {
      s += " style='text-align:";
      switch (this.align) {
        case LEFT:
          s += "left";
          break;
        case CENTER:
          s += "center";
          break;
        case RIGHT:
          s += "right";
          break;
        case JUSTIFY:
          s += "justify";
      }
      s += "'";
    }
    s += ">";
    if (this.linethrough != null) {
      s += "<span style='text-decoration:line-through;'>";
    }
    if (this.bold != null) {
      s += "<b>";
    }
    if (this.italic != null) {
      s += "<i>";
    }
    if (this.underline != null) {
      s += "<u>";
    }
    s += "<span id='txt" + this.id + "'";
    if (this.frame && this === fidea && (this.id === 0 || this.id === -1) && !this.goto) {
      s += " class='frame-head'";
    }
    if (this.frame && this === fidea && !(this.id === 0 || this.id === -1) && !this.goto) {
      s += " class='frame-up'";
    }
    if (this.frame && this !== fidea && !this.goto) {
      s += " class='frame-down'";
    }
    if (this.run != null) {
      s += " class='frame-run'";
    }
    if (this.goto != null) {
      s += " class='frame-goto'";
    }
    if (this.url != null) {
      s += " class='frame-url'";
    }
    if ((this.frame != null) || (this.goto != null) || (this.url != null)) {
      s += " class='frame-txt'";
    }
    if (clas[this.kind] != null) {
      s += " class='" + clas[this.kind] + "-txt'";
    }
    if ((this.panel != null) && (this.place != null) && this.place === TXT) {
      s += " class='" + panelClass[this.panel] + "'";
    }
    s += " style='";
    if (this.w != null) {
      s += "width:" + this.w + "px;";
    }
    if (this.h != null) {
      s += "height:" + this.h + "px;";
    }
    s += "'";
    if ((this.place != null) && this.place === TXT && this !== fidea) {
      if ((this.forma != null) && (this.forma === BUTTON || this.forma === PANEL || this.forma === CSSOVAL || this.forma === CSSRECT || this.forma === CSSRRECT)) {
        s += " class='";
        if (this.forma === BUTTON) {
          s += " button";
        }
        if (this.forma === PANEL) {
          s += " panel";
        }
        if (this.forma === CSSOVAL) {
          s += " cssoval";
        }
        if (this.forma === CSSRECT) {
          s += " cssrect";
        }
        if (this.forma === CSSRRECT) {
          s += " cssrrect";
        }
        if (this.scheme != null) {
          s += " scheme-" + schemes[this.scheme][0];
        }
        s += "' ";
      }
    }
    s += ">";
    s += this.drtxt(level);
    s += "</span>";
    if (this.underline != null) {
      s += "</u>";
    }
    if (this.italic != null) {
      s += "</i>";
    }
    if (this.bold != null) {
      s += "</b>";
    }
    if (this.linethrough != null) {
      s += "</span>";
    }
    s += "</div>";
  }
  if (this.notFrame(level)) {
    if (((this.canvas != null) && this.canvas === CANVASJS) || (this.canvastype() === PASSIVE)) {
      cvva.push(this);
      s += "<div id='par" + this.id + "' style='position:relative'>";
      s += "<div id='pap" + this.id + "'  style='position:absolute;top:0px;left:0px'>";
      s += "<canvas id='cvv" + this.id + "'>";
      s += "</canvas>";
      s += "</div>";
      s += "<div id='map" + this.id + "'  class='mapbag' style='position:absolute;top:0px;left:0px'>";
    } else if (this.canvastype() === ACTIVE) {
      cvva.push(this);
      s += "<div id='pap" + this.id + "' class='ppr' style='position:relative'>";
      s += "<canvas id='cvv" + this.id + "'>";
      s += "</canvas>";
      acss.push("");
    }
  }
  return s;
};

draw[DEFAULT] = function(level, drawshow) {
  var i, ia, j, s, _i, _j, _k, _l, _ref, _ref1, _ref2, _ref3;
  if (drawshow == null) {
    drawshow = DRAWALL;
  }
  s = this.startIdeaTxt(level, drawshow);
  if ((drawshow === DRAWALL || drawshow === DRAWCHILDREN) && this.notFrame(level) && (this.length != null) && this.length > 0) {
    if ((this.intype != null) && (this.intype === TABLE || this.intype === TABLEAU)) {
      this.createTableau();
      s += "<table class='";
      if (this.tableclass != null) {
        s += tblClass[this.tableclass];
      } else {
        s += tblClass[0];
      }
      s += "'><tbody>";
      for (i = _i = 0, _ref = this.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        s += "<tr>";
        for (j = _j = 0, _ref1 = this[i].length - 1; 0 <= _ref1 ? _j <= _ref1 : _j >= _ref1; j = 0 <= _ref1 ? ++_j : --_j) {
          ia = this[i][j];
          if (ia == null) {
            console.error("not defined ", i, j);
          }
          s += ia.th != null ? "<th" : "<td";
          s += " id='tbl" + ia.id + "'";
          if (ia.rowspan != null) {
            s += " rowspan=" + ia.rowspan;
          }
          if (ia.colspan != null) {
            s += " colspan=" + ia.colspan;
          }
          if (ia.w != null) {
            s += " width=" + ia.w;
          }
          if (ia.h != null) {
            s += " height=" + ia.h;
          }
          if (ia.tblstyle != null) {
            s += " style='" + ia.tblstyle + "'";
          }
          if (((ia.place != null) && ia.place === TBL) && this !== fidea) {
            s += " style='";
            if ((ia.forma != null) && (ia.forma === BUTTON || ia.forma === PANEL || ia.forma === CSSOVAL || ia.forma === CSSRECT || ia.forma === CSSRRECT)) {
              if (ia.forma === BUTTON) {
                s += " button";
              }
              if (ia.forma === PANEL) {
                s += " panel";
              }
              if (ia.forma === CSSOVAL) {
                s += " cssoval";
              }
              if (ia.forma === CSSRECT) {
                s += " cssrect";
              }
              if (ia.forma === CSSRRECT) {
                s += " cssrrect";
              }
              if (ia.scheme != null) {
                s += " scheme-" + schemes[ia.scheme][0];
              }
            }
            s += "' ";
          }
          s += ">";
          if (this.txt === null) {
            s += ia.draw(level);
          } else {
            s += ia.draw(level + 1);
          }
        }
      }
      s += "</table>";
    } else {
      for (i = _k = 0, _ref2 = this.length - 1; 0 <= _ref2 ? _k <= _ref2 : _k >= _ref2; i = 0 <= _ref2 ? ++_k : --_k) {
        if (this[i].length > 0) {
          if (this[i].length > 1) {
            s += "<div id='cha" + this.id + "' style='display:block;'>";
          }
          for (j = _l = 0, _ref3 = this[i].length - 1; 0 <= _ref3 ? _l <= _ref3 : _l >= _ref3; j = 0 <= _ref3 ? ++_l : --_l) {
            ia = this[i][j];
            if (this.intype === LIST || (!(this.intype != null))) {
              if (this[i].length === 1) {
                s += "<div id='chb" + ia.id + "'>";
              }
              s += "<div id='chc" + ia.id + "' style='display:inline-block;vertical-align:top'>";
            } else {
              if (this[i].length === 1) {
                s += "<div id='chb" + ia.id + "' style='display:inline;'>";
              }
              s += "<div id='chc" + ia.id + "' style='display:inline;'>";
            }
            if (this.txt == null) {
              s += ia.draw(level, drawshow);
            } else {
              s += ia.draw(level + 1, drawshow);
            }
            s += "</div>";
            if (j !== this[i].length - 1) {
              s += "&nbsp;";
            }
            if (this[i].length === 1) {
              s += "</div>";
            }
          }
          if (this[i].length > 1) {
            s += "</div>";
          }
        }
      }
    }
  }
  s += this.endIdeaTxt(level);
  return s;
};

Idea.prototype.endIdeaTxt = function(level) {
  var ass, ia, s, _i, _len, _ref;
  s = "";
  if (this.notHeader(level) && (this[OUTSIDE] != null) && this[OUTSIDE].length > 0) {
    _ref = this[OUTSIDE];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      ia = _ref[_i];
      ass = ia.draw(level + 1);
      acss[acss.length - 1] += ass;
    }
  }
  if (this.notFrame(level)) {
    if ((this.canvas != null) || (this.canvastype() === PASSIVE)) {
      s += "</div>";
      s += "</div>";
    } else if (this.canvastype() === ACTIVE) {
      s += acss.pop();
      s += "</div>";
    }
  }
  s += "</div>";
  if (this.list === OL && this !== fidea) {
    s += "</div></li></ol>";
  }
  if (this.list === UL && this !== fidea) {
    s += "</div></li></ul>";
  }
  return s;
};

Idea.prototype.drawGraphics = function() {
  var i, _i, _ref, _results;
  if (cvva.length > 0) {
    _results = [];
    for (i = _i = _ref = cvva.length - 1; _i >= 0; i = _i += -1) {
      _results.push(cvva[i].cvv());
    }
    return _results;
  }
};

Idea.prototype.fhtml = function(sia) {
  var drs, f, hhh, s, shiftKey, t1, t2, tb, _i, _len;
  if (sia == null) {
    sia = this;
  }
  t1 = new Date().getTime();
  $('.dropdown.open .dropdown-toggle').dropdown('toggle');
  ggg = {};
  v = {};
  ctx = {};
  cvva = [];
  fidea = this;
  drs = this.draw();
  $desk.html(drs);
  shiftKey = false;
  sia.select();
  if (fidea.next != null) {
    s = "<button id='next-step' class='step btn btn-primary'>";
    s += fidea.next.txt;
    s += "</button>";
  } else {
    s = "";
  }
  $step.html(s);
  if (fidea.next != null) {
    $('#next-step').click(function(eo) {
      if (fidea.next.run != null) {
        fidea.next.run();
      }
      if (fidea.next.goto != null) {
        return fidea.next.goto.fhtml();
      }
    });
  }
  if (fidea.menu != null) {
    $menu.html(fidea.menu.draw());
  } else {
    $menu.html(defaultMenu.draw());
  }
  $('.dropdown-toggle').dropdown();
  $('a.menu-item').click(function(eo) {
    var midea;
    midea = idea[-Number(eo.srcElement.id.substr(3))];
    if (eo.srcElement.id.substr(0, 3) === "mnu") {
      if (midea.run != null) {
        midea.run();
      }
      if (midea.goto != null) {
        return midea.goto.fhtml();
      }
    }
  });
  if (tbs.length > 0) {
    for (_i = 0, _len = tbs.length; _i < _len; _i++) {
      tb = tbs[_i];
      $('#tbs' + tb.id + ' a:first').tab('show');
    }
  }
  if (this.kind === SLIDE && statePresentation) {
    showFullScreen();
    f = function(s) {
      return s.substr(0, s.length - 2);
    };
    hhh = window.innerHeight;
    hhh -= f($("#bag" + fidea.id).css("margin-bottom"));
    hhh -= f($("#bag" + fidea.id).css("margin-top"));
    hhh -= f($("#bag" + fidea.id).css("border-top-width"));
    hhh -= f($("#bag" + fidea.id).css("border-bottom-width"));
    hhh -= 40;
    $("#bag" + fidea.id).height(hhh);
  }
  if (fidea.background != null) {
    if (fidea.background !== lastBackground || fidea !== lastFidea) {
      $("body").css("background", bkgStyle[fidea.background]);
      lastBackground = fidea.background;
    }
  } else {
    $("body").css("background", bkgStyle[0]);
    lastBackground = 0;
  }
  lastFidea = fidea;
  this.drawGraphics();
  t2 = new Date().getTime();
  return this;
};

Idea.prototype.unselect = function() {
  return $("#txt" + this.id).removeClass("selected-txt");
};

Idea.prototype.select = function() {
  var found, si, sia, ta, tpp, _i, _j, _k, _l, _len, _len1, _len2, _len3, _ref, _ref1;
  if (typeof this === "undefined" || this === null) {
    return;
  }
  if (sidea != null) {
    finishEdit();
    $txt.removeClass("active-txt");
    $bag.removeClass("active-bag");
    $tbl.removeClass("active-tbl");
  }
  if ((this.pa != null) && this.pa.kind === TABS) {
    this.pa.activetab = this.ix;
    _ref = this.pa[0];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      ta = _ref[_i];
      $("#tab" + ta.id).addClass("inactive-tab");
      $("#tab" + ta.id).removeClass("active-tab");
      $("#tbs" + ta.id).removeClass("active-tbs");
    }
    $("#tbs" + this.id).addClass("active-tbs");
    $("#tab" + this.id).addClass("active-tab");
    $("#tab" + this.id).removeClass("inactive-tab");
  }
  if (!window.shiftKey) {
    for (_j = 0, _len1 = ssidea.length; _j < _len1; _j++) {
      sia = ssidea[_j];
      sia.unselect();
    }
    ssidea = [];
  } else {
    found = -1;
    if (ssidea.length > 0) {
      for (si = _k = 0, _len2 = ssidea.length; _k < _len2; si = ++_k) {
        sia = ssidea[si];
        if (sidea === sia) {
          found = si;
        }
      }
    }
    if (found !== -1) {
      $txt.addClass("selected-txt");
    }
  }
  saveHistory();
  sidea = this;
  found = -1;
  if (ssidea.length > 0) {
    for (si = _l = 0, _len3 = ssidea.length; _l < _len3; si = ++_l) {
      sia = ssidea[si];
      if (sidea === sia) {
        found = si;
      }
    }
  }
  if (found === -1) {
    ssidea.push(sidea);
  } else {
    ssidea[found].unselect();
    ssidea.splice(found, 1);
  }
  $txt = $("#txt" + sidea.id);
  $bag = $("#bag" + sidea.id);
  $tbl = $("#tbl" + sidea.id);
  if ((sidea.motivator != null) || (((_ref1 = sidea.pa) != null ? _ref1.childmotivator : void 0) != null) && sidea.txt.length === 0) {
    $txt.addClass("active-txt-mot");
    $txt.addClass("active-txt-exa");
  } else {
    $txt.addClass("active-txt");
  }
  $bag.addClass("active-bag");
  $tbl.addClass("active-tbl");
  if (($bag != null) && ($bag.offset() != null)) {
    tpp = $bag.offset().top;
    if (tpp - $("body").scrollTop() < 100 || tpp - $("body").scrollTop() > (window.innerHeight - 100)) {
      $('body').scrollTop(tpp - window.innerHeight / 2);
    }
  }
  cometFocusPublish();
  if (v[this.id] && (v[this.id].prj != null)) {
    v[this.id].prj.view.draw();
  }
  this.showTooltip();
  $(".drag").draggable({
    distance: 25
  });
  $(".drop").droppable({
    accept: ".drag",
    hoverClass: "idea-hover",
    greedy: true,
    drop: dropIdea,
    tolerance: "pointer"
  });
  return this;
};

dropIdea = function(eo, ui) {
  var ia1, ia2, id1, id2, ix1, ix2, pa1, pa2, sd1, sd2;
  id1 = Number(ui.draggable[0].id.substr(3));
  ia1 = idea[-id1];
  pa1 = ia1.pa;
  sd1 = ia1.sd;
  ix1 = ia1.ix;
  id2 = Number(this.id.substr(3));
  ia2 = idea[-id2];
  pa2 = ia2.pa;
  sd2 = ia2.sd;
  ix2 = ia2.ix;
  pa1[sd1].splice(ix1, 1);
  if (sd1 === OUTSIDE && (((ia2[OUTSIDE] != null) && ia2[OUTSIDE].length > 0) || (sd2 === OUTSIDE))) {
    ia2.ado(ia1);
  } else {
    ia2.add(ia1);
  }
  pa1.normalizeIdea();
  pa2.normalizeIdea();
  return redraw(ia2);
};

Idea.prototype.upperFrame = function() {
  var sia;
  if (this.pa == null) {
    return this;
  }
  sia = this.pa;
  while ((sia.pa != null) && (!(sia.frame != null))) {
    sia = sia.pa;
  }
  return sia;
};

Idea.prototype.showTooltip = function() {
  var $tooltip, s;
  s = "";
  if ((this.tooltip != null) || (this.childtooltip != null) || ((this.pa != null) && (this.pa.childtooltip != null))) {
    if (this.tooltip != null) {
      s = ideatxt(this.tooltip);
    } else if ((this.pa != null) && (this.pa.childtooltip != null)) {
      s = ideatxt(this.pa.childtooltip);
    } else if (this.childtooltip != null) {
      s = ideatxt(this.childtooltip);
    }
  }
  $tooltip = this.txt != null ? $('#txt' + sidea.id) : $('#bag' + sidea.id);
  return $tooltip.qtip({
    content: s,
    show: {
      events: false,
      ready: true,
      solo: true
    }
  });
};
