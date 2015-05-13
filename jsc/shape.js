// Generated by CoffeeScript 1.3.3
var margins, paddings, shapes;

shapes = [];

margins = {};

paddings = {};

Idea.prototype.margin = function() {
  if ((this.forma != null) && (margins[this.forma] != null)) {
    return margins[this.forma].call(this);
  } else {
    if (this.place == null) {
      return "5px";
    } else if (this.place === TBL) {
      return "0px";
    } else if (this.place === BAG) {
      return "5px";
    } else if (this.place === TXT) {
      return "10px";
    } else {
      return "5px";
    }
  }
};

Idea.prototype.padding = function() {
  if ((this.forma != null) && (paddings[this.forma] != null)) {
    return paddings[this.forma].call(this);
  } else {
    return "10px";
  }
};

shapes.push(BUTTON);

ssshape[BUTTON] = function(x, y, w, h) {};

shapes.push(PANEL);

ssshape[PANEL] = function(x, y, w, h) {};

shapes.push(CSSOVAL);

ssshape[CSSOVAL] = function(x, y, w, h) {};

Idea.prototype.strokefill = function(x, y, w, h) {
  var ctx, gc, sch;
  ctx = v[this.id].ctx;
  sch = v[this.id].scheme != null ? schemes[v[this.id].scheme] : schemes[WHITE];
  gc = ctx.createLinearGradient(0, y - h / 2, 0, y + h / 2);
  gc.addColorStop(0, sch[1]);
  gc.addColorStop(1, sch[2]);
  ctx.fillStyle = gc;
  ctx.strokeStyle = sch[2];
  ctx.lineWidth = 1;
  ctx.fill();
  return ctx.stroke();
};

shapes.push(RRECT);

ssshape[RRECT] = function(x, y, w, h) {
  var ctx, rad;
  rad = 10;
  ctx = v[this.id].ctx;
  ctx.beginPath();
  ctx.moveTo(x - w / 2 + rad, y - h / 2);
  ctx.lineTo(x + w / 2 - rad, y - h / 2);
  ctx.arcTo(x + w / 2, y - h / 2, x + w / 2, y - h / 2 + rad, rad);
  ctx.lineTo(x + w / 2, y + h / 2 - rad);
  ctx.arcTo(x + w / 2, y + h / 2, x + w / 2 - rad, y + h / 2, rad);
  ctx.lineTo(x - w / 2 + rad, y + h / 2);
  ctx.arcTo(x - w / 2, y + h / 2, x - w / 2, y + h / 2 - rad, rad);
  ctx.lineTo(x - w / 2, y - h / 2 + rad);
  ctx.arcTo(x - w / 2, y - h / 2, x - w / 2 + rad, y - h / 2, rad);
  ctx.closePath();
  return this.strokefill(x, y, w, h);
};

shapes.push(RECT);

ssshape[RECT] = function(x, y, w, h) {
  var ctx;
  ctx = v[this.id].ctx;
  ctx.beginPath();
  ctx.moveTo(x - w / 2, y - h / 2);
  ctx.lineTo(x + w / 2, y - h / 2);
  ctx.lineTo(x + w / 2, y + h / 2);
  ctx.lineTo(x - w / 2, y + h / 2);
  ctx.closePath();
  return this.strokefill(x, y, w, h);
};

shapes.push(OVAL);

ssshape[OVAL] = function(x, y, w, h) {
  var ctx, cx, cy, kappa, xb, xe, yb, ye;
  kappa = 0.5522848;
  cx = w / 2 * kappa;
  cy = h / 2 * kappa;
  xb = x - w / 2;
  yb = y - h / 2;
  xe = x + w / 2;
  ye = y + h / 2;
  ctx = v[this.id].ctx;
  ctx.beginPath();
  ctx.moveTo(xb, y);
  ctx.bezierCurveTo(xb, y - cy, x - cx, yb, x, yb);
  ctx.bezierCurveTo(x + cx, yb, xe, y - cy, xe, y);
  ctx.bezierCurveTo(xe, y + cy, x + cx, ye, x, ye);
  ctx.bezierCurveTo(x - cx, ye, xb, y + cy, xb, y);
  ctx.closePath();
  return this.strokefill(x, y, w, h);
};

shapes.push(CIRCLE);

ssshape[CIRCLE] = function(x, y, w, h) {
  var ctx, r;
  r = Math.min(w, h) / 2;
  ctx = v[this.id].ctx;
  ctx.beginPath();
  ctx.arc(x, y, r, 0, 2 * Math.PI);
  ctx.closePath();
  return this.strokefill(x, y, w, h);
};

shapes.push(AARROW);

ssshape[AARROW] = function(x, y, w, h) {
  var ctx, rad;
  rad = 5;
  ctx = v[this.id].ctx;
  ctx.beginPath();
  ctx.moveTo(x - w / 2, y - h / 2);
  ctx.lineTo(x + w / 2 - rad, y - h / 2);
  ctx.lineTo(x + w / 2 + rad, y);
  ctx.lineTo(x + w / 2 - rad, y + h / 2);
  ctx.lineTo(x - w / 2, y + h / 2);
  ctx.closePath();
  return this.strokefill(x, y, w, h);
};

shapes.push(BARROW);

ssshape[BARROW] = function(x, y, w, h) {
  var ctx, rad;
  rad = 5;
  ctx = v[this.id].ctx;
  ctx.beginPath();
  ctx.moveTo(x - w / 2 - rad, y - h / 2);
  ctx.lineTo(x + w / 2 - rad, y - h / 2);
  ctx.lineTo(x + w / 2 + rad, y);
  ctx.lineTo(x + w / 2 - rad, y + h / 2);
  ctx.lineTo(x - w / 2 - rad, y + h / 2);
  ctx.lineTo(x - w / 2 + rad, y);
  ctx.closePath();
  return this.strokefill(x, y, w, h);
};

shapes.push(CARROW);

margins[CARROW] = function() {
  return (this.ix === 0 ? margins[AARROW].call(this) : margins[BARROW].call(this));
};

paddings[CARROW] = function() {
  return (this.ix === 0 ? paddings[AARROW].call(this) : paddings[BARROW].call(this));
};

ssshape[CARROW] = function(x, y, w, h) {
  if (this.ix === 0) {
    return ssshape[AARROW].call(this, x, y, w, h);
  } else {
    return ssshape[BARROW].call(this, x, y, w, h);
  }
};
