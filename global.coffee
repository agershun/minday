################################################
# MINDAY 0.008BI 
# global.coffee
# Оснонвые константы
################################################

# Глобальные переменные

method = {}
sample = {}

# Массив для хранения графических элементов
SCRH = 400 # Не нужно?
SCRW = 900
DW = 20 # Для mindmap и tree?
DH = 20


# Типы идей

DEFAULT = -100
IDEA = -200
LINK = -210

# Пирамида
PYRAMID = -300
LAYER = -310

# Матрица в общем виде
MATRIX = -400
CORNER = -410
ROWS = -420
ROW = -430
COLUMNS = -440
COLUMN = -450
CELL = -460
ROWCELL = -470

# Меню
MAINMENU = -500
MENU = -510
MENUITEM = -520

# Стикеры и другие вспомогательные элементы
STICKER = -600
TODO = -610
DESCRIPTION = -620
GUIDE = -630
EXAMPLE = -640
COMMENT = -650

# Таблицы
TABLE = -700
FIELDS = -710
FIELD = -720 # Есть параметр index - показывающий, это это ключевое поле
RECORD = -730
VALUE = -740

# Табло
TABLEAU = -750
LINE = -760

# Блоки
BLOCKS = -800
BLOCK = -810

# Диаграммы
PIECHART = -900

# Интеллектуальные карты
MINDMAP = -1000
MINDLEAF = -1010
MINDLEFT = -1020
MINDRIGHT = -1030
MINDCENTER = -1040

# Деревья
TREE = -1100
KNOT = -1110
TREELEFT = -1120
TREERIGHT = -1130
TREEUP = -1140
TREEDOWN = -1150
TREEROOT = -1160

# Текст
DOC = -1200
TEXT = -1210

# Тексты
PA = -1300
UL = -1310
OL = -1320
SPAN = -1330
TD = -1340
TH = -1350
INLINE = -1360
LIST = -1370
# STICKER = -1360 - пока берется старый стикер, но будет только новый
OLIST = -1380
ULIST = -1390


# Формат
PERCENT = -1400
NUMBER = -1410
CHECKBOX = -1420
YESNO = -1430

# Табуляция
TABS = -1500
TAB = -1510

# Пролог
FACT = -1600
RULE = -1610

# Элементы управления (как и @forma)
BUTTON = -1700
PANEL = -1710

# Презентация и слайды
PRESENTATION = -1800
SLIDE = -1810

# Стратегические карты
MAP = -1900
NODE = -1910
EDGE = -1920
HLANE = -1930
VLANE = -1940
COURT = -1950
GROUP = -1960
MAPTABLE = -1970

# Ишикава
ISHIKAWA = -2000
BONE = -2010

# Матрица БКГ
BCG = -2100
BCGCORNER = -2110 # Наверное не нужен
BCGCOLUMNS = -2120
BCGCOLUMN = -2130
BCGROWS = -2140
BCGROW = -2150
BCGROWCELL = -2150
BCGCELL = -2160
BCGENTITY = -2170 # Собственно сами кружочки с позицией и радиусом

# Диаграмма Гантта
GANTT = -2200
GANTTPERIOD = -2210
GANTTSTAGE = -2220
GANTTPHASES = -2230
GANTTPHASE = -2240
GANTTRESULTS = -2250
GANTTRESULT = -2260

# Голубые океаны
BLUEOCEAN = -2300
OCEAN = -2310
CHARS = -2320
CHAR = -2330

# Фигуры
RRECT = -2400
RECT = -2410
OVAL = -2420
CIRCLE = -2422
AARROW = -2430
BARROW = -2432
CARROW = -2434

# Канва
ACTIVE = -2500
PASSIVE = -2510
NATIVE = -2520

# Выравнивание, а также размещение картинок, маркеров и т.п. @side ()
LEFT = -2600
CENTER = -2610
RIGHT = -2620
JUSTIFY = -2630
TOP = -2640
MIDDLE = -2650
BOTTOM = -2660
INSIDE = -2670 # Тэг по умолчанию
OUTSIDE = -2675 # Тэг для графических элементов снаружи
BEFORE = -2680
AFTER = -2690

# Пирог
PIE = -2700
PIEPART = -2710

# Цвета @scheme
WHITE = -2800
BLUE = -2810
LIGHTBLUE = -2820
GREEN = -2830
YELLOW = -2840
RED = -2850
BLACK = -2860

# Место применения класса панели
TBL = -2900
BAG = -2910
TXT = -2920 # По умолчанию

# Библиотеки графики
RAPHAELJS = -3000 # TODO Убрать
PAPERJS = -3010 # TODO Убрать
CANVASJS = -3020

# Новые типы данных
TICK = -3100 # Галочка
TAG = -3110 # Тэг
ICON = -3120 # Тэг
IMAGE = -3130
GEM = -3140

# Параметры drawshow

DRAWALL = -3200
DRAWHEADER = -3210
DRAWCHILDREN = -3220

# CSS-эдементы
CSSRECT = -3310
CSSRRECT = -3320
CSSOVAL = -3330

# Ромашка
DAISY = -3400
PETAL = -3410


# Цвета и заливки

# Фоны
bkgStyle = []
bkgStyle.push "#FFD url('/img/grid-18px-masked.png') repeat-x"
bkgStyle.push "#FFF url('/img/back-sky.jpg') no-repeat"

# Стили таблиц
tblClass = []
tblClass.push "normaltable"
tblClass.push "guidetable"

#TODO: Удалить
btnClass = {}
btnClass[WHITE] = 'panel-white'
btnClass[BLUE] = 'panel-blue'
btnClass[LIGHTBLUE] = 'btn btn-info'
btnClass[GREEN] = 'btn btn-success'
btnClass[YELLOW] = 'btn btn-warning'
btnClass[RED] = 'btn btn-darger'
btnClass[BLACK] = 'btn btn-inverse'

#TODO: Удалить
panelClass = {}
panelClass[WHITE] = 'panel-white'
panelClass[BLUE] = 'panel-black'

# Цветовые схемы
schemes = {} 
schemes[WHITE] = ["white","#ffffff","#e6e6e6","#bfbfbf","Black","Yellow"]
schemes[BLUE] = ["blue","#0088cc","#0055cc","#003580","White","Magenta"]
schemes[LIGHTBLUE] = ["lightblue","#5bc0de","#2f96b4","#1f6377","White","Cyan"]
schemes[GREEN] = ["green","#62c462","#51a351","#387038","White","#c0ffc0"]
schemes[YELLOW] = ["yellow","#fbb450","#f89406","#ad6704","White","#c0ffff"]
schemes[RED] = ["red","#ee5f5b","#bd362f","#802420","White","#c0c0c0"]
schemes[BLACK] = ["black","#555555","#222222","#000000","White","#ffffff"]

# Типы идей
kkind = [IDEA,ULIST,OLIST,TICK,GEM,ICON,TAG,IMAGE,STICKER,MINDMAP,TREE]
kkindname = ["Идея","Ненумерованный список","Нумерованный список","Галочка","Камешек","Иконка","Тэг","Картинка","Стикер","Интеллектуальная<br>карта","Дерево"]

