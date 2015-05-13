#####################################################
# MINDAY 0.010 Tokyo
# keys.coffee
# Работа с клавишами
#####################################################

keye = {} # Массив с процедурами обработки клавиатуры во время режима редактирования
keye[DEFAULT] = {}
keyp = {} # Массив с процедурами обработки клавиатуры вне режима редактирования
keyp[DEFAULT] = {}

SHIFT = 1000
CTRL = 10000
ALT = 100000

KEY_BACKSPACE = 8
KEY_TAB = 9
KEY_ENTER = 13
KEY_ESC = 27
KEY_SPACE = 32
KEY_PGUP = 33
KEY_PGDN = 34
KEY_END = 35
KEY_HOME = 36
KEY_LEFT = 37
KEY_UP = 38
KEY_RIGHT = 39
KEY_DOWN = 40
KEY_INSERT = 45
KEY_DELETE = 46

KEY_0 = 48
KEY_1 = 49
KEY_2 = 50
KEY_3 = 51
KEY_4 = 52
KEY_5 = 53
KEY_6 = 54
KEY_7 = 55
KEY_8 = 56
KEY_9 = 57


KEY_A = 65
KEY_B = 66
KEY_C = 67
KEY_D = 68
KEY_E = 69
KEY_F = 70
KEY_G = 71
KEY_H = 72
KEY_I = 73
KEY_J = 74
KEY_K = 75
KEY_L = 76
KEY_M = 77
KEY_N = 78
KEY_O = 79
KEY_P = 80
KEY_Q = 81
KEY_R = 82
KEY_S = 83
KEY_T = 84
KEY_U = 85
KEY_V = 86
KEY_W = 87
KEY_X = 88
KEY_Y = 89
KEY_Z = 90

KEY_F1 = 112
KEY_F2 = 113
KEY_F3 = 114
KEY_F4 = 115
KEY_F5 = 116
KEY_F6 = 117
KEY_F7 = 118
KEY_F8 = 119
KEY_F9 = 120
KEY_F10 = 121
KEY_F11 = 122
KEY_F12 = 123