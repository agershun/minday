// Generated by CoffeeScript 1.3.3

sample.swot = function() {
  var O, O1, S, S1, T, T1, W, W1, bt, ns, obl, obl1, st, sw, swot, swot1, swot2, wswot;
  wswot = adf("SWOT-анализ", {
    kind: TABS
  });
  swot = wswot.add("Инструкции");
  swot.add({
    kind: LIST
  });
  obl = swot.adr("Укажите область для проведения анализа:");
  obl.add("", {
    tooltip: "Например, компания, новый проект и т.п.",
    placeholder: "Компания, проект..."
  });
  swot.add({
    kind: LIST
  });
  sw = swot.adr("Рассмотрите факторы, влияющие на рассматриваемую область:", {
    intype: TABLE
  });
  sw.add("Факторы", {
    th: true
  });
  sw.adr("Положительные", {
    th: true
  });
  sw.adr("Отрицательные", {
    th: true
  });
  sw.add("Внутренние", {
    th: true
  });
  S = sw.adr("Положительные стороны", {
    childplaceholder: "Мы лучшие в...",
    childtooltip: "Примеры сильных сторон: знание марки, большие продажи, наличие			собственного производства"
  });
  S.add("");
  W = sw.adr("Отрицательные стороны", {
    childplaceholder: "У нас есть проблемы в...",
    childtooltip: "Примеры слабых сторон"
  });
  W.add("");
  sw.add("Внешние", {
    th: true
  });
  O = sw.adr("Возможности", {
    childplaceholder: "Рынок предоставляет возможности...",
    childtooltip: "Примеры возможностей..."
  });
  O.add("");
  T = sw.adr("Угрозы", {
    childplaceholder: "Рынок предоставляет возможности...",
    childtooltip: "Примеры угроз..."
  });
  T.add("");
  swot.add({
    kind: LIST
  });
  bt = swot.adr("Нажмите, чтобы продолжить", {
    forma: BUTTON,
    scheme: WHITE,
    place: BAG,
    run: function() {
      var i, j, len, _i, _j, _k, _l, _m, _n, _ref, _ref1, _ref2, _ref3, _ref4, _ref5, _ref6;
      ns.length = 0;
      ns.add("Сопоставление", {
        th: true
      });
      if (S.length > 0) {
        for (i = _i = 0, _ref = S.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
          ns.adr(S[i][0].txt, {
            th: true
          });
        }
      }
      if (W.length > 0) {
        for (i = _j = 0, _ref1 = W.length - 1; 0 <= _ref1 ? _j <= _ref1 : _j >= _ref1; i = 0 <= _ref1 ? ++_j : --_j) {
          ns.adr(W[i][0].txt, {
            th: true
          });
        }
      }
      len = S.length + W.length;
      if (O.length > 0) {
        for (j = _k = 0, _ref2 = O.length - 1; 0 <= _ref2 ? _k <= _ref2 : _k >= _ref2; j = 0 <= _ref2 ? ++_k : --_k) {
          ns.add(O[j][0].txt, {
            th: true
          });
          for (i = _l = 0, _ref3 = len - 1; 0 <= _ref3 ? _l <= _ref3 : _l >= _ref3; i = 0 <= _ref3 ? ++_l : --_l) {
            ns.adr("");
          }
        }
      }
      if (T.length > 0) {
        for (j = _m = 0, _ref4 = T.length - 1; 0 <= _ref4 ? _m <= _ref4 : _m >= _ref4; j = 0 <= _ref4 ? ++_m : --_m) {
          ns.add(O[j][0].txt, {
            th: true
          });
          for (i = _n = 0, _ref5 = len - 1; 0 <= _ref5 ? _n <= _ref5 : _n >= _ref5; i = 0 <= _ref5 ? ++_n : --_n) {
            ns.adr("");
          }
        }
      }
      if (((_ref6 = ns[1]) != null ? _ref6[1] : void 0) != null) {
        return redraw(ns[1][1]);
      } else {
        return redraw();
      }
    }
  });
  swot.add({
    kind: LIST
  });
  ns = swot.adr("Заполните таблицу", {
    intype: TABLE
  });
  swot1 = wswot.adr("Пример");
  obl1 = swot1.add("Область анализа:");
  obl1.add("Компания");
  swot2 = swot1.add(null, {
    intype: TABLE,
    tableclass: 0
  });
  S1 = swot2.add("Положительные стороны");
  S1.add("Все хорошо");
  W1 = swot2.adr("Отрицательные стороны");
  W1.add("Все плохо");
  O1 = swot2.add("Возможности");
  O1.add("Все возможно");
  T1 = swot2.adr("Угрозы");
  st = swot1.add("Поиск фокусных направлений", {
    intype: TABLE
  });
  st.add("", {
    th: true
  });
  st.adr("Все хорошо", {
    th: true
  });
  st.add("Все возможно", {
    th: true
  });
  st.adr("Усе Ок");
  return wswot;
  /*
  
  	return swot
  
  
  	S = add "Сильные стороны",
  		readonly:yes
  		childmotivator: add "Мы лучше в..."
  		guide: add "Введите сильные стороны"
  		description: add "Примеры сильных сторон: знание марки, большие продажи, наличие
  			собственного производства"
  		example: [(add "Лучшие продукты"),(add "Сильный бренд")]
  	S.push add ""
  	W = add "Слабые стороны", 
  		readonly:yes
  		childmotivator: add "Мы хуже в..."
  		guide: add "Введите слабые стороны"
  		description: add "Примеры слабых сторон: отсутствие производства, слабая мотивация персонала"
  		example: [(add "Слабая мотивация"), (add "Нехватка финансов")]
  	W.push add ""
  	O = add "Возможности",
  		readonly:yes
  		childmotivator: add "Наши возможности..."
  		guide: add "Введите возмжности"
  		description: add "Примеры возможностей: демографический рост"
  		example: [add "Демографический рост", add "Снижение залогов"]
  	O.push add ""
  	T = add "Угрозы", 
  		readonly:yes
  		childmotivator: add "Нам угрожает..."
  		guide: add "Введите угрозы"
  		description: add "Примеры угроз: вступление России в ВТО, приход иностранных поставщиков"
  		example: [(add "Вступление в ВТО"), (add "Активность конкурентов")]
  	T.push add ""
  
  	intf = add [S,W]
  	extf = add [O,T]
  	INT = add "Внутренние",
  		readonly: yes
  		nochildren: yes
  		description: add "Факторы, связанные с компанией, подразделением"
  	EXT = add "Внешние",
  		readonly: yes
  		nochildren: yes
  		description: add "Факторы, связанные с рынком, государством, обществом"
  	srow = add [INT,EXT]
  	POS = add "Положительные",
  		readonly: yes
  		nochildren: yes
  		description: add "Факторы, улучшающие положение компании"
  	NEG = add "Отрицательные",
  		readonly: yes
  		nochildren: yes	
  		description: add "Факторы, ухудшающие положение компании"
  	scol = add [POS,NEG]
  	scor = add "Факторы",
  		readonly: yes
  		nochildren: yes
  	swot = add "Таблица для анализа", [intf,extf],
  		row: srow
  		column: scol
  		corner: scor
  		readonly: yes
  		nochildren: yes
  		guide: add "Введите поочереди сильный и слабые стороны, возможности и угрозы компании"
  	swot.kindMatrix()
  
  	qswot = add "Область анализа",
  		guide: add "Укажите область, для которой будет проводится SWOT-анализ"
  		description: add "SWOT-анализ успешно применяется для компании, департамента, 
  			новых и старых продуктов, групп и других областей бизнеса"
  		childmotivator: add "Компания, подразделение, новый продукт..."
  		readonly: yes
  
  	qswot.push add ""
  		noenter:yes
  
  	swotstep1 = add "Шаг 1: Определить факторы"
  	swotstep2 = add "Шаг 2: Сопоставить факторы"
  
  	window.swotmain = adf "SWOT-анализ",
  		readonly: yes
  		nochildren: yes
  		description: add "SWOT-анализ — метод стратегического планирования, 
  			используемый для оценки факторов и явлений, влияющих на проект или
  			предприятие. Все факторы делятся на четыре категории: 
  			strengths (сильные стороны), weaknesses (слабые стороны), 
  			opportunities (возможности) и threats (угрозы). 
  			Метод включает определение цели проекта и выявление внутренних и 
  			внешних факторов, способствующих её достижению или осложняющих его."
  		guide: add "Определить область анализа и соответствующие факторы"
  		next: swotstep2
  
  	window.swotmain.push qswot, swot
  
  	window.swotsopost = adf "SWOT-анализ: сопоставление факторов", 
  		guide: add "Рассмотрите попарно внутренние и внешние факторы, найдите возможности
  			для роста компании. Если таблица - пуста, проделайте первый шаг SWOT-анализа"
  		description: add "Один из методов проведения SWOT-анализа предусматривает
  		сопоставление внутренних и внешних факторов для поиска новых мероприятий. "
  		readonly: yes
  		nochildren: yes
  		next: swotstep1
  
  	swotstep1.goto = window.swotmain
  	swotstep2.goto = window.swotsopost
  	swotstep2.run = () ->
  		IN = add ""
  		if S.length > 0
  			for i in [0..S.length-1]
  				IN.push add S[i].txt
  		if W.length > 0
  			for i in [0..W.length-1]
  				IN.push add W[i].txt
  		EX = add ""
  		if O.length > 0
  			for i in [0..O.length-1]
  				EX.push add O[i].txt
  		if T.length > 0
  			for i in [0..T.length-1]
  				EX.push add T[i].txt
  
  		if IN.length > 0 and EX.length > 0
  			for i in [0..IN.length-1]
  				ro = add ""
  				for j in [0..EX.length-1]
  					ro.push add ""
  				swotsopost.push ro
  			swotsopost.row = IN
  			swotsopost.column = EX
  			swotsopost.kindMatrix()
  		else
  			swotsopost.lenght = 0
  
  	window.swotmain.push window.swotsopost
  
  	library.push window.swotmain
  	window.swotmain
  */

};
