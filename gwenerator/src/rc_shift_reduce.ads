package Rc_Shift_Reduce is

    type Small_Integer is range -32_000 .. 32_000;

    type Shift_Reduce_Entry is record
        T   : Small_Integer;
        Act : Small_Integer;
    end record;
    pragma Pack(Shift_Reduce_Entry);

    subtype Row is Integer range -1 .. Integer'Last;

  --pragma suppress(index_check);

    type Shift_Reduce_Array is array (Row  range <>) of Shift_Reduce_Entry;

    Shift_Reduce_Matrix : constant Shift_Reduce_Array :=
        ( (-1,-1) -- Dummy Entry

-- State  0
,( 1, 2),( 2, 21),( 9, 22),( 16, 20),( 30, 23),( 298, 25),( 300, 24),( 301, 19),(-1,-3000)
-- State  1
,(-1,-1)
-- State  2
,(-1,-2)
-- State  3
,( 2, 21),( 9, 22),( 16, 20),( 30, 23),( 298, 25),( 300, 24),( 301, 19),(-1,-3)
-- State  4
,(-1,-5)
-- State  5
,(-1,-6)
-- State  6
,(-1,-7)
-- State  7
,(-1,-8)
-- State  8
,(-1,-9)
-- State  9
,(-1,-10)
-- State  10
,(-1,-11)
-- State  11
,(-1,-12)
-- State  12
,(-1,-13)
-- State  13
,(-1,-14)
-- State  14
,(-1,-15)
-- State  15
,(-1,-16)
-- State  16
,(-1,-17)
-- State  17
,(-1,-18)
-- State  18
,( 32, 40),( 33, 41),( 34,-396),( 44, 36),( 52, 31),( 53, 28),( 54, 29),( 55, 30),( 56, 32),( 57, 33),( 58, 38),( 68, 39),(-1,-47)
-- State  19
,( 21, 43),( 22, 44),( 23, 45),( 24, 46),( 25, 47),( 26, 48),( 27, 49),(-1,-69)
-- State  20
,( 2, 51),( 298, 25),( 300, 24),(-1,-3000)
-- State  21
,( 28, 53),( 29, 54),(-1,-523)
-- State  22
,( 302, 55),( 303, 56),(-1,-3000)
-- State  23
,( 31, 57),(-1,-3000)
-- State  24
,(-1,-522)
-- State  25
,(-1,-524)
-- State  26
,( 0,-3001),(-1,-3000)
-- State  27
,(-1,-4)
-- State  28
,(-1,-445)
-- State  29
,(-1,-446)
-- State  30
,(-1,-447)
-- State  31
,(-1,-448)
-- State  32
,(-1,-449)
-- State  33
,(-1,-450)
-- State  34
,( 10, 59),( 11, 60),(-1,-3000)
-- State  35
,( 34, 62),(-1,-3000)
-- State  36
,( 21, 43),( 22, 44),( 23, 45),( 24, 46),( 25, 47),( 26, 48),( 27, 49),(-1,-69)
-- State  37
,( 21, 43),( 22, 44),( 23, 45),( 24, 46),( 25, 47),( 26, 48),( 27, 49),(-1,-69)
-- State  38
,(-1,-453)
-- State  39
,( 21, 43),( 22, 44),( 23, 45),( 24, 46),( 25, 47),( 26, 48),( 27, 49),(-1,-69)
-- State  40
,( 21, 43),( 22, 44),( 23, 45),( 24, 46),( 25, 47),( 26, 48),( 27, 49),(-1,-69)
-- State  41
,( 6, 69),( 14, 68),(-1,-3000)
-- State  42
,( 21, 43),( 22, 44),( 23, 45),( 24, 46),( 25, 47),( 26, 48),( 27, 49),(-1,-69)
-- State  43
,(-1,-71)
-- State  44
,(-1,-72)
-- State  45
,(-1,-73)
-- State  46
,(-1,-74)
-- State  47
,(-1,-75)
-- State  48
,(-1,-76)
-- State  49
,(-1,-77)
-- State  50
,( 6, 69),( 14, 68),(-1,-3000)
-- State  51
,(-1,-523)
-- State  52
,( 4, 73),(-1,-3000)
-- State  53
,( 302, 74),(-1,-3000)
-- State  54
,( 21, 43),( 22, 44),( 23, 45),( 24, 46),( 25, 47),( 26, 48),( 27, 49),(-1,-69)
-- State  55
,(-1,-500)
-- State  56
,(-1,-501)
-- State  57
,( 21, 43),( 22, 44),( 23, 45),( 24, 46),( 25, 47),( 26, 48),( 27, 49),(-1,-69)
-- State  58
,(-1,-3000)
-- State  59
,(-1,-53)
-- State  60
,(-1,-54)
-- State  61
,(-1,-48)
-- State  62
,( 21, 43),( 22, 44),( 23, 45),( 24, 46),( 25, 47),( 26, 48),( 27, 49),(-1,-69)
-- State  63
,( 6, 69),( 14, 68),(-1,-3000)
-- State  64
,( 2, 51),( 298, 25),( 300, 24),( 302, 81),(-1,-3000)
-- State  65
,( 59, 86),( 60, 87),( 61, 88),( 62, 89),( 63, 90),( 64, 91),( 65, 92),(-1,-455)
-- State  66
,( 2, 51),( 298, 25),( 300, 24),(-1,-3000)
-- State  67
,( 302, 95),(-1,-3000)
-- State  68
,(-1,-527)
-- State  69
,(-1,-528)
-- State  70
,( 2, 51),( 298, 25),( 300, 24),( 302, 98),(-1,-3000)
-- State  71
,(-1,-70)
-- State  72
,( 2, 51),( 298, 25),( 300, 24),(-1,-488)
-- State  73
,( 2, 51),( 298, 25),( 300, 24),(-1,-3000)
-- State  74
,(-1,-493)
-- State  75
,( 6, 69),( 14, 68),(-1,-3000)
-- State  76
,( 6, 69),( 14, 68),(-1,-3000)
-- State  77
,( 21, 43),( 22, 44),( 23, 45),( 24, 46),( 25, 47),( 26, 48),( 27, 49),(-1,-69)
-- State  78
,(-1,-397)
-- State  79
,( 2, 51),( 298, 25),( 300, 24),( 302, 113),(-1,-427)
-- State  80
,(-1,-451)
-- State  81
,(-1,-452)
-- State  82
,(-1,-444)
-- State  83
,(-1,-456)
-- State  84
,( 59, 86),( 60, 87),( 61, 88),( 62, 89),( 63, 90),( 64, 91),( 65, 92),(-1,-457)
-- State  85
,(-1,-459)
-- State  86
,(-1,-460)
-- State  87
,(-1,-461)
-- State  88
,(-1,-462)
-- State  89
,(-1,-463)
-- State  90
,(-1,-464)
-- State  91
,(-1,-465)
-- State  92
,(-1,-466)
-- State  93
,( 6, 69),( 14, 68),( 66, 122),( 67, 121),(-1,-3000)
-- State  94
,( 4, 124),(-1,-3000)
-- State  95
,(-1,-515)
-- State  96
,( 2, 51),( 4, 126),( 298, 25),( 300, 24),( 302, 98),(-1,-517)
-- State  97
,(-1,-520)
-- State  98
,(-1,-521)
-- State  99
,( 7, 128),( 15, 127),(-1,-3000)
-- State  100
,(-1,-489)
-- State  101
,( 2, 51),( 298, 25),( 300, 24),(-1,-490)
-- State  102
,( 302, 131),(-1,-3000)
-- State  103
,( 7, 128),( 15, 127),(-1,-3000)
-- State  104
,(-1,-64)
-- State  105
,( 302, 135),(-1,-495)
-- State  106
,( 2, 51),( 298, 25),( 300, 24),( 302, 141),(-1,-503)
-- State  107
,( 2, 143),(-1,-3000)
-- State  108
,( 6, 69),( 14, 68),(-1,-3000)
-- State  109
,(-1,-428)
-- State  110
,( 2, 51),( 298, 25),( 300, 24),( 302, 113),(-1,-429)
-- State  111
,( 4, 147),(-1,-3000)
-- State  112
,(-1,-432)
-- State  113
,(-1,-433)
-- State  114
,( 7, 128),( 15, 127),(-1,-3000)
-- State  115
,(-1,-458)
-- State  116
,(-1,-467)
-- State  117
,(-1,-468)
-- State  118
,( 66, 122),( 67, 121),(-1,-3000)
-- State  119
,( 66, 122),( 67, 121),(-1,-470)
-- State  120
,(-1,-472)
-- State  121
,(-1,-473)
-- State  122
,( 302, 152),(-1,-3000)
-- State  123
,(-1,-454)
-- State  124
,( 2, 51),( 298, 25),( 300, 24),(-1,-3000)
-- State  125
,(-1,-518)
-- State  126
,( 2, 51),( 298, 25),( 300, 24),( 302, 98),(-1,-3000)
-- State  127
,(-1,-529)
-- State  128
,(-1,-530)
-- State  129
,(-1,-516)
-- State  130
,(-1,-491)
-- State  131
,(-1,-492)
-- State  132
,(-1,-487)
-- State  133
,(-1,-496)
-- State  134
,( 302, 135),(-1,-497)
-- State  135
,(-1,-499)
-- State  136
,( 7, 128),( 15, 127),(-1,-3000)
-- State  137
,(-1,-504)
-- State  138
,( 2, 51),( 298, 25),( 300, 24),( 302, 141),(-1,-505)
-- State  139
,( 4, 158),(-1,-3000)
-- State  140
,(-1,-508)
-- State  141
,(-1,-509)
-- State  142
,( 7, 128),( 15, 127),(-1,-3000)
-- State  143
,(-1,-392)
-- State  144
,(-1,-49)
-- State  145
,(-1,-398)
-- State  146
,(-1,-430)
-- State  147
,( 2, 51),( 298, 25),( 300, 24),(-1,-3000)
-- State  148
,(-1,-426)
-- State  149
,( 7, 128),( 15, 127),(-1,-3000)
-- State  150
,(-1,-471)
-- State  151
,( 2, 167),( 302, 166),(-1,-3000)
-- State  152
,( 6, 69),( 14, 68),(-1,-3000)
-- State  153
,( 6, 69),( 14, 68),(-1,-3000)
-- State  154
,(-1,-519)
-- State  155
,(-1,-498)
-- State  156
,(-1,-494)
-- State  157
,(-1,-506)
-- State  158
,( 10, 171),(-1,-3000)
-- State  159
,(-1,-502)
-- State  160
,( 4, 172),(-1,-3000)
-- State  161
,( 13, 181),( 16, 20),( 17, 183),( 18, 184),( 19, 182),( 20, 186),( 34, 185),(-1,-55)
-- State  162
,( 35, 194),( 36, 193),(-1,-400)
-- State  163
,( 4, 196),(-1,-434)
-- State  164
,(-1,-469)
-- State  165
,( 4, 198),(-1,-476)
-- State  166
,(-1,-478)
-- State  167
,(-1,-479)
-- State  168
,(-1,-474)
-- State  169
,(-1,-475)
-- State  170
,( 37, 202),( 69, 201),(-1,-481)
-- State  171
,( 6, 69),( 14, 68),(-1,-3000)
-- State  172
,( 2, 205),(-1,-3000)
-- State  173
,( 13, 181),( 16, 20),( 17, 183),( 18, 184),( 19, 182),( 20, 186),( 34, 185),(-1,-55)
-- State  174
,(-1,-57)
-- State  175
,(-1,-58)
-- State  176
,(-1,-59)
-- State  177
,(-1,-60)
-- State  178
,(-1,-61)
-- State  179
,(-1,-62)
-- State  180
,(-1,-63)
-- State  181
,( 302, 207),(-1,-3000)
-- State  182
,(-1,-65)
-- State  183
,( 2, 225),( 8, 229),( 116, 228),( 117, 231),( 118, 230),( 119, 232),( 120, 233),( 121, 234),( 122, 226),( 123, 227),( 124, 235),( 125, 236),( 126, 237)
,( 127, 238),( 128, 239),( 129, 240),( 130, 241),( 131, 242),( 132, 243),( 133, 244),( 134, 245),( 135, 246),( 136, 210),( 137, 211),( 138, 212),( 139, 213)
,( 140, 215),( 141, 214),( 142, 216),( 143, 217),( 144, 218),( 145, 219),( 146, 220),( 147, 221),( 148, 222),( 149, 223),(-1,-3000)
-- State  184
,( 2, 250),( 283, 251),( 284, 252),( 285, 255),( 286, 256),( 287, 257),( 288, 254),( 289, 258),( 290, 259),( 291, 261),( 292, 263),( 293, 262),( 294, 264)
,( 295, 253),( 296, 260),( 297, 265),(-1,-3000)
-- State  185
,( 2, 51),( 298, 25),( 300, 24),(-1,-3000)
-- State  186
,( 86, 270),( 87, 271),( 88, 272),( 89, 273),( 90, 274),( 91, 275),( 92, 276),( 93, 277),( 94, 278),( 95, 279),( 96, 280),( 97, 281),( 98, 282)
,( 99, 283),( 100, 284),( 101, 285),( 102, 286),( 103, 287),( 104, 288),( 105, 289),( 106, 290),( 107, 291),( 108, 292),( 109, 293),( 110, 294),( 111, 295)
,( 112, 296),( 113, 297),( 114, 298),( 115, 299),( 302, 269),(-1,-3000)
-- State  187
,(-1,-50)
-- State  188
,(-1,-401)
-- State  189
,( 35, 194),( 36, 193),(-1,-402)
-- State  190
,(-1,-404)
-- State  191
,(-1,-405)
-- State  192
,(-1,-406)
-- State  193
,( 37, 304),( 302, 303),(-1,-3000)
-- State  194
,( 302, 305),(-1,-3000)
-- State  195
,( 7, 128),( 15, 127),(-1,-3000)
-- State  196
,( 12, 313),( 47, 308),( 48, 309),( 49, 310),( 50, 311),( 51, 312),(-1,-3000)
-- State  197
,(-1,-431)
-- State  198
,( 2, 167),( 302, 166),(-1,-3000)
-- State  199
,(-1,-482)
-- State  200
,( 37, 202),( 69, 201),(-1,-483)
-- State  201
,( 2, 51),( 298, 25),( 300, 24),(-1,-3000)
-- State  202
,(-1,-486)
-- State  203
,( 7, 128),( 15, 127),(-1,-3000)
-- State  204
,( 2, 51),( 298, 25),( 300, 24),(-1,-510)
-- State  205
,(-1,-393)
-- State  206
,(-1,-56)
-- State  207
,(-1,-100)
-- State  208
,( 2, 324),(-1,-3000)
-- State  209
,( 5, 325),(-1,-79)
-- State  210
,(-1,-81)
-- State  211
,(-1,-82)
-- State  212
,(-1,-83)
-- State  213
,(-1,-84)
-- State  214
,(-1,-85)
-- State  215
,(-1,-86)
-- State  216
,(-1,-87)
-- State  217
,(-1,-88)
-- State  218
,(-1,-89)
-- State  219
,(-1,-90)
-- State  220
,(-1,-91)
-- State  221
,(-1,-92)
-- State  222
,(-1,-93)
-- State  223
,(-1,-94)
-- State  224
,(-1,-95)
-- State  225
,(-1,-96)
-- State  226
,(-1,-23)
-- State  227
,(-1,-24)
-- State  228
,(-1,-25)
-- State  229
,( 116, 326),( 118, 327),( 124, 328),( 125, 329),(-1,-3000)
-- State  230
,(-1,-27)
-- State  231
,(-1,-29)
-- State  232
,(-1,-30)
-- State  233
,(-1,-31)
-- State  234
,(-1,-32)
-- State  235
,(-1,-33)
-- State  236
,(-1,-35)
-- State  237
,(-1,-37)
-- State  238
,(-1,-38)
-- State  239
,(-1,-39)
-- State  240
,(-1,-40)
-- State  241
,(-1,-41)
-- State  242
,(-1,-42)
-- State  243
,(-1,-43)
-- State  244
,(-1,-44)
-- State  245
,(-1,-45)
-- State  246
,(-1,-46)
-- State  247
,(-1,-78)
-- State  248
,( 5, 330),(-1,-218)
-- State  249
,(-1,-220)
-- State  250
,(-1,-221)
-- State  251
,(-1,-222)
-- State  252
,(-1,-223)
-- State  253
,(-1,-224)
-- State  254
,(-1,-225)
-- State  255
,(-1,-226)
-- State  256
,(-1,-227)
-- State  257
,(-1,-228)
-- State  258
,(-1,-229)
-- State  259
,(-1,-230)
-- State  260
,(-1,-231)
-- State  261
,(-1,-232)
-- State  262
,(-1,-233)
-- State  263
,(-1,-234)
-- State  264
,(-1,-235)
-- State  265
,(-1,-236)
-- State  266
,(-1,-97)
-- State  267
,(-1,-98)
-- State  268
,(-1,-122)
-- State  269
,(-1,-123)
-- State  270
,(-1,-124)
-- State  271
,(-1,-125)
-- State  272
,(-1,-126)
-- State  273
,(-1,-127)
-- State  274
,(-1,-128)
-- State  275
,(-1,-129)
-- State  276
,(-1,-130)
-- State  277
,(-1,-131)
-- State  278
,(-1,-132)
-- State  279
,(-1,-133)
-- State  280
,(-1,-134)
-- State  281
,(-1,-135)
-- State  282
,(-1,-136)
-- State  283
,(-1,-137)
-- State  284
,(-1,-138)
-- State  285
,(-1,-139)
-- State  286
,(-1,-140)
-- State  287
,(-1,-141)
-- State  288
,(-1,-142)
-- State  289
,(-1,-143)
-- State  290
,(-1,-144)
-- State  291
,(-1,-145)
-- State  292
,(-1,-146)
-- State  293
,(-1,-147)
-- State  294
,(-1,-148)
-- State  295
,(-1,-149)
-- State  296
,(-1,-150)
-- State  297
,(-1,-151)
-- State  298
,(-1,-152)
-- State  299
,(-1,-153)
-- State  300
,(-1,-99)
-- State  301
,( 6, 69),( 14, 68),(-1,-3000)
-- State  302
,(-1,-403)
-- State  303
,(-1,-410)
-- State  304
,(-1,-425)
-- State  305
,(-1,-407)
-- State  306
,(-1,-399)
-- State  307
,( 4, 334),(-1,-436)
-- State  308
,(-1,-438)
-- State  309
,(-1,-439)
-- State  310
,(-1,-440)
-- State  311
,(-1,-441)
-- State  312
,(-1,-442)
-- State  313
,(-1,-443)
-- State  314
,(-1,-435)
-- State  315
,(-1,-477)
-- State  316
,(-1,-484)
-- State  317
,(-1,-485)
-- State  318
,(-1,-480)
-- State  319
,(-1,-511)
-- State  320
,( 2, 51),( 298, 25),( 300, 24),(-1,-512)
-- State  321
,( 4, 336),(-1,-3000)
-- State  322
,( 7, 128),( 15, 127),(-1,-3000)
-- State  323
,( 4, 338),(-1,-3000)
-- State  324
,( 4, 339),(-1,-3000)
-- State  325
,( 2, 225),( 8, 229),( 116, 228),( 117, 231),( 118, 230),( 119, 232),( 120, 233),( 121, 234),( 122, 226),( 123, 227),( 124, 235),( 125, 236),( 126, 237)
,( 127, 238),( 128, 239),( 129, 240),( 130, 241),( 131, 242),( 132, 243),( 133, 244),( 134, 245),( 135, 246),( 136, 210),( 137, 211),( 138, 212),( 139, 213)
,( 140, 215),( 141, 214),( 142, 216),( 143, 217),( 144, 218),( 145, 219),( 146, 220),( 147, 221),( 148, 222),( 149, 223),(-1,-3000)
-- State  326
,(-1,-26)
-- State  327
,(-1,-28)
-- State  328
,(-1,-34)
-- State  329
,(-1,-36)
-- State  330
,( 2, 250),( 283, 251),( 284, 252),( 285, 255),( 286, 256),( 287, 257),( 288, 254),( 289, 258),( 290, 259),( 291, 261),( 292, 263),( 293, 262),( 294, 264)
,( 295, 253),( 296, 260),( 297, 265),(-1,-3000)
-- State  331
,(-1,-51)
-- State  332
,( 4, 343),(-1,-3000)
-- State  333
,( 4, 344),( 38, 347),( 39, 348),( 40, 349),( 41, 350),( 42, 351),( 43, 352),(-1,-413)
-- State  334
,( 12, 313),( 47, 308),( 48, 309),( 49, 310),( 50, 311),( 51, 312),(-1,-3000)
-- State  335
,(-1,-513)
-- State  336
,( 2, 355),(-1,-3000)
-- State  337
,(-1,-507)
-- State  338
,( 2, 356),(-1,-3000)
-- State  339
,( 302, 357),(-1,-3000)
-- State  340
,(-1,-80)
-- State  341
,(-1,-219)
-- State  342
,( 12,-102),( 52,-102),( 70,-102),( 71,-102),( 72,-102),( 73,-102),( 74,-102),( 75,-102),( 76,-102),( 77,-102),( 78,-102),( 79,-102),( 80,-102)
,( 81,-102),( 82,-102),( 83,-102),( 84,-102),( 85,-102),(-1,-101)
-- State  343
,( 2, 51),( 298, 25),( 300, 24),(-1,-3000)
-- State  344
,( 38, 347),( 39, 348),( 40, 349),( 41, 350),( 42, 351),( 43, 352),(-1,-3000)
-- State  345
,(-1,-415)
-- State  346
,( 4, 362),( 38, 347),( 39, 348),( 40, 349),( 41, 350),( 42, 351),( 43, 352),(-1,-416)
-- State  347
,(-1,-419)
-- State  348
,(-1,-420)
-- State  349
,(-1,-421)
-- State  350
,(-1,-422)
-- State  351
,(-1,-423)
-- State  352
,(-1,-424)
-- State  353
,(-1,-408)
-- State  354
,(-1,-437)
-- State  355
,(-1,-514)
-- State  356
,(-1,-394)
-- State  357
,( 4, 366),(-1,-67)
-- State  358
,( 12, 379),( 52, 389),( 70, 380),( 71, 390),( 72, 391),( 73, 392),( 74, 382),( 75, 383),( 76, 384),( 77, 397),( 78, 398),( 79, 399),( 80, 400)
,( 81, 393),( 82, 394),( 83, 395),( 84, 396),( 85, 388),(-1,-3000)
-- State  359
,( 7, 128),( 15, 127),(-1,-3000)
-- State  360
,(-1,-411)
-- State  361
,(-1,-414)
-- State  362
,( 38, 347),( 39, 348),( 40, 349),( 41, 350),( 42, 351),( 43, 352),(-1,-3000)
-- State  363
,(-1,-418)
-- State  364
,( 6, 69),( 14, 68),(-1,-3000)
-- State  365
,( 4, 406),(-1,-3000)
-- State  366
,( 2, 407),(-1,-3000)
-- State  367
,(-1,-66)
-- State  368
,(-1,-104)
-- State  369
,(-1,-105)
-- State  370
,(-1,-106)
-- State  371
,(-1,-107)
-- State  372
,(-1,-108)
-- State  373
,(-1,-109)
-- State  374
,(-1,-110)
-- State  375
,(-1,-111)
-- State  376
,(-1,-112)
-- State  377
,(-1,-113)
-- State  378
,(-1,-114)
-- State  379
,(-1,-115)
-- State  380
,( 302, 409),(-1,-258)
-- State  381
,( 302, 411),(-1,-3000)
-- State  382
,(-1,-285)
-- State  383
,( 302, 411),(-1,-3000)
-- State  384
,( 302, 415),(-1,-313)
-- State  385
,( 302, 411),(-1,-3000)
-- State  386
,( 302, 411),(-1,-3000)
-- State  387
,( 302, 411),(-1,-3000)
-- State  388
,( 2, 51),( 298, 25),( 300, 24),(-1,-3000)
-- State  389
,( 2, 51),( 298, 25),( 300, 24),( 302, 423),(-1,-3000)
-- State  390
,(-1,-282)
-- State  391
,(-1,-283)
-- State  392
,(-1,-284)
-- State  393
,(-1,-335)
-- State  394
,(-1,-336)
-- State  395
,(-1,-337)
-- State  396
,(-1,-338)
-- State  397
,(-1,-340)
-- State  398
,(-1,-341)
-- State  399
,(-1,-343)
-- State  400
,(-1,-344)
-- State  401
,( 12,-102),( 52,-102),( 70,-102),( 71,-102),( 72,-102),( 73,-102),( 74,-102),( 75,-102),( 76,-102),( 77,-102),( 78,-102),( 79,-102),( 80,-102)
,( 81,-102),( 82,-102),( 83,-102),( 84,-102),( 85,-102),(-1,-101)
-- State  402
,(-1,-52)
-- State  403
,( 4, 344),( 38, 347),( 39, 348),( 40, 349),( 41, 350),( 42, 351),( 43, 352),(-1,-413)
-- State  404
,(-1,-417)
-- State  405
,( 35, 194),( 36, 193),(-1,-400)
-- State  406
,( 2, 428),(-1,-3000)
-- State  407
,( 4, 429),(-1,-3000)
-- State  408
,( 2, 51),( 298, 25),( 300, 24),( 302, 430),(-1,-3000)
-- State  409
,( 4, 433),(-1,-3000)
-- State  410
,( 2, 51),( 298, 25),( 300, 24),(-1,-3000)
-- State  411
,(-1,-390)
-- State  412
,( 4, 436),(-1,-260)
-- State  413
,( 2, 51),( 298, 25),( 300, 24),(-1,-3000)
-- State  414
,( 4, 439),(-1,-305)
-- State  415
,( 4, 441),(-1,-3000)
-- State  416
,( 2, 51),( 298, 25),( 300, 24),(-1,-3000)
-- State  417
,( 4, 443),(-1,-345)
-- State  418
,( 4, 443),(-1,-345)
-- State  419
,( 4, 443),(-1,-345)
-- State  420
,(-1,-388)
-- State  421
,( 4, 448),(-1,-377)
-- State  422
,(-1,-386)
-- State  423
,(-1,-387)
-- State  424
,(-1,-384)
-- State  425
,(-1,-103)
-- State  426
,(-1,-412)
-- State  427
,( 7, 128),( 15, 127),(-1,-3000)
-- State  428
,(-1,-395)
-- State  429
,( 2, 452),(-1,-3000)
-- State  430
,(-1,-120)
-- State  431
,(-1,-121)
-- State  432
,(-1,-116)
-- State  433
,(-1,-259)
-- State  434
,( 4, 436),(-1,-260)
-- State  435
,( 4, 455),(-1,-3000)
-- State  436
,( 2, 460),( 8, 229),( 116, 228),( 117, 231),( 118, 230),( 119, 232),( 120, 233),( 121, 234),( 122, 226),( 123, 227),( 124, 235),( 125, 236),( 126, 237)
,( 127, 238),( 128, 239),( 129, 240),( 130, 241),( 131, 242),( 132, 243),( 133, 244),( 134, 245),( 135, 246),( 150, 474),( 151, 475),( 152, 476),( 153, 477)
,( 154, 478),( 155, 479),( 156, 481),( 157, 482),( 158, 489),( 159, 485),( 160, 486),( 161, 488),( 162, 480),( 163, 487),( 164, 483),( 165, 484),( 166, 490)
,( 167, 491),( 168, 492),( 169, 493),( 170, 461),( 171, 462),( 172, 463),( 173, 464),( 174, 465),( 175, 466),( 176, 469),( 177, 470),( 178, 471),( 179, 467)
,( 180, 468),( 181, 472),( 182, 473),(-1,-3000)
-- State  437
,(-1,-281)
-- State  438
,( 4, 495),(-1,-287)
-- State  439
,( 2, 498),( 8, 229),( 116, 228),( 117, 231),( 118, 230),( 119, 232),( 120, 233),( 121, 234),( 122, 226),( 123, 227),( 124, 235),( 125, 236),( 126, 237)
,( 127, 238),( 128, 239),( 129, 240),( 130, 241),( 131, 242),( 132, 243),( 133, 244),( 134, 245),( 135, 246),( 183, 501),( 184, 502),( 185, 504),( 186, 506)
,( 187, 507),( 188, 508),( 189, 510),( 190, 513),( 191, 517),( 192, 515),( 193, 516),( 194, 514),( 195, 518),( 196, 520),( 197, 512),( 198, 519),( 199, 522)
,( 200, 521),( 201, 503),( 202, 505),( 203, 523),( 204, 524),( 205, 509),( 206, 511),(-1,-3000)
-- State  440
,(-1,-304)
-- State  441
,(-1,-314)
-- State  442
,( 4, 526),(-1,-315)
-- State  443
,( 2, 531),( 8, 229),( 116, 228),( 117, 231),( 118, 230),( 119, 232),( 120, 233),( 121, 234),( 122, 226),( 123, 227),( 124, 235),( 125, 236),( 126, 237)
,( 127, 238),( 128, 239),( 129, 240),( 130, 241),( 131, 242),( 132, 243),( 133, 244),( 134, 245),( 135, 246),( 183, 501),( 184, 502),( 185, 504),( 186, 506)
,( 187, 507),( 188, 508),( 189, 510),( 190, 513),( 191, 517),( 192, 515),( 193, 516),( 194, 514),( 195, 518),( 196, 520),( 197, 512),( 198, 519),( 199, 522)
,( 200, 521),( 201, 503),( 202, 505),( 203, 523),( 204, 524),( 205, 509),( 206, 511),(-1,-3000)
-- State  444
,(-1,-334)
-- State  445
,(-1,-339)
-- State  446
,(-1,-342)
-- State  447
,( 4, 533),(-1,-3000)
-- State  448
,( 2, 537),( 8, 229),( 116, 228),( 117, 231),( 118, 230),( 119, 232),( 120, 233),( 121, 234),( 122, 226),( 123, 227),( 124, 235),( 125, 236),( 126, 237)
,( 127, 238),( 128, 239),( 129, 240),( 130, 241),( 131, 242),( 132, 243),( 133, 244),( 134, 245),( 135, 246),( 231, 535),(-1,-3000)
-- State  449
,(-1,-376)
-- State  450
,( 4, 539),(-1,-3000)
-- State  451
,(-1,-409)
-- State  452
,( 4, 540),(-1,-3000)
-- State  453
,( 4, 541),(-1,-3000)
-- State  454
,(-1,-257)
-- State  455
,( 2, 51),( 298, 25),( 300, 24),(-1,-3000)
-- State  456
,( 5, 543),(-1,-262)
-- State  457
,(-1,-264)
-- State  458
,(-1,-265)
-- State  459
,(-1,-266)
-- State  460
,(-1,-267)
-- State  461
,(-1,-268)
-- State  462
,(-1,-269)
-- State  463
,(-1,-270)
-- State  464
,(-1,-271)
-- State  465
,(-1,-272)
-- State  466
,(-1,-273)
-- State  467
,(-1,-274)
-- State  468
,(-1,-275)
-- State  469
,(-1,-276)
-- State  470
,(-1,-277)
-- State  471
,(-1,-278)
-- State  472
,(-1,-279)
-- State  473
,(-1,-280)
-- State  474
,(-1,-237)
-- State  475
,(-1,-238)
-- State  476
,(-1,-239)
-- State  477
,(-1,-240)
-- State  478
,(-1,-241)
-- State  479
,(-1,-242)
-- State  480
,(-1,-243)
-- State  481
,(-1,-244)
-- State  482
,(-1,-245)
-- State  483
,(-1,-246)
-- State  484
,(-1,-247)
-- State  485
,(-1,-248)
-- State  486
,(-1,-249)
-- State  487
,(-1,-250)
-- State  488
,(-1,-251)
-- State  489
,(-1,-252)
-- State  490
,(-1,-253)
-- State  491
,(-1,-254)
-- State  492
,(-1,-255)
-- State  493
,(-1,-256)
-- State  494
,( 4, 544),(-1,-215)
-- State  495
,( 2, 549),( 8, 229),( 116, 228),( 117, 231),( 118, 230),( 119, 232),( 120, 233),( 121, 234),( 122, 226),( 123, 227),( 124, 235),( 125, 236),( 126, 237)
,( 127, 238),( 128, 239),( 129, 240),( 130, 241),( 131, 242),( 132, 243),( 133, 244),( 134, 245),( 135, 246),( 207, 550),( 208, 551),( 209, 552),( 210, 553)
,( 211, 554),( 212, 556),( 213, 557),( 214, 558),( 215, 555),( 216, 559),(-1,-3000)
-- State  496
,(-1,-286)
-- State  497
,( 5, 561),(-1,-307)
-- State  498
,(-1,-309)
-- State  499
,(-1,-310)
-- State  500
,(-1,-311)
-- State  501
,(-1,-352)
-- State  502
,(-1,-353)
-- State  503
,(-1,-354)
-- State  504
,(-1,-355)
-- State  505
,(-1,-356)
-- State  506
,(-1,-357)
-- State  507
,(-1,-358)
-- State  508
,(-1,-359)
-- State  509
,(-1,-360)
-- State  510
,(-1,-361)
-- State  511
,(-1,-362)
-- State  512
,(-1,-363)
-- State  513
,(-1,-364)
-- State  514
,(-1,-365)
-- State  515
,(-1,-366)
-- State  516
,(-1,-367)
-- State  517
,(-1,-368)
-- State  518
,(-1,-369)
-- State  519
,(-1,-370)
-- State  520
,(-1,-371)
-- State  521
,(-1,-372)
-- State  522
,(-1,-373)
-- State  523
,(-1,-374)
-- State  524
,(-1,-375)
-- State  525
,( 4, 544),(-1,-215)
-- State  526
,( 2, 578),( 8, 570),( 116, 228),( 117, 231),( 118, 230),( 119, 232),( 120, 233),( 121, 234),( 122, 226),( 123, 227),( 124, 235),( 125, 236),( 126, 237)
,( 127, 238),( 128, 239),( 129, 240),( 130, 241),( 131, 242),( 132, 243),( 133, 244),( 134, 245),( 135, 246),( 217, 564),( 218, 565),( 219, 566),( 220, 567)
,( 221, 568),( 222, 569),( 223, 571),( 224, 572),( 225, 573),( 226, 574),( 227, 575),( 228, 576),(-1,-3000)
-- State  527
,(-1,-312)
-- State  528
,( 5, 580),(-1,-347)
-- State  529
,(-1,-349)
-- State  530
,(-1,-350)
-- State  531
,(-1,-351)
-- State  532
,( 4, 544),(-1,-215)
-- State  533
,( 2, 143),(-1,-3000)
-- State  534
,( 5, 583),(-1,-379)
-- State  535
,(-1,-381)
-- State  536
,(-1,-382)
-- State  537
,(-1,-383)
-- State  538
,(-1,-378)
-- State  539
,( 2, 51),( 298, 25),( 300, 24),(-1,-3000)
-- State  540
,( 2, 585),(-1,-3000)
-- State  541
,( 2, 51),( 298, 25),( 300, 24),(-1,-3000)
-- State  542
,(-1,-391)
-- State  543
,( 2, 460),( 8, 229),( 116, 228),( 117, 231),( 118, 230),( 119, 232),( 120, 233),( 121, 234),( 122, 226),( 123, 227),( 124, 235),( 125, 236),( 126, 237)
,( 127, 238),( 128, 239),( 129, 240),( 130, 241),( 131, 242),( 132, 243),( 133, 244),( 134, 245),( 135, 246),( 150, 474),( 151, 475),( 152, 476),( 153, 477)
,( 154, 478),( 155, 479),( 156, 481),( 157, 482),( 158, 489),( 159, 485),( 160, 486),( 161, 488),( 162, 480),( 163, 487),( 164, 483),( 165, 484),( 166, 490)
,( 167, 491),( 168, 492),( 169, 493),( 170, 461),( 171, 462),( 172, 463),( 173, 464),( 174, 465),( 175, 466),( 176, 469),( 177, 470),( 178, 471),( 179, 467)
,( 180, 468),( 181, 472),( 182, 473),(-1,-3000)
-- State  544
,( 2, 250),( 283, 251),( 284, 252),( 285, 255),( 286, 256),( 287, 257),( 288, 254),( 289, 258),( 290, 259),( 291, 261),( 292, 263),( 293, 262),( 294, 264)
,( 295, 253),( 296, 260),( 297, 265),(-1,-3000)
-- State  545
,(-1,-261)
-- State  546
,( 5, 589),(-1,-289)
-- State  547
,(-1,-291)
-- State  548
,(-1,-292)
-- State  549
,(-1,-293)
-- State  550
,(-1,-294)
-- State  551
,(-1,-295)
-- State  552
,(-1,-296)
-- State  553
,(-1,-297)
-- State  554
,(-1,-298)
-- State  555
,(-1,-299)
-- State  556
,(-1,-300)
-- State  557
,(-1,-301)
-- State  558
,(-1,-302)
-- State  559
,(-1,-303)
-- State  560
,( 4, 544),(-1,-215)
-- State  561
,( 2, 498),( 8, 229),( 116, 228),( 117, 231),( 118, 230),( 119, 232),( 120, 233),( 121, 234),( 122, 226),( 123, 227),( 124, 235),( 125, 236),( 126, 237)
,( 127, 238),( 128, 239),( 129, 240),( 130, 241),( 131, 242),( 132, 243),( 133, 244),( 134, 245),( 135, 246),( 183, 501),( 184, 502),( 185, 504),( 186, 506)
,( 187, 507),( 188, 508),( 189, 510),( 190, 513),( 191, 517),( 192, 515),( 193, 516),( 194, 514),( 195, 518),( 196, 520),( 197, 512),( 198, 519),( 199, 522)
,( 200, 521),( 201, 503),( 202, 505),( 203, 523),( 204, 524),( 205, 509),( 206, 511),(-1,-3000)
-- State  562
,(-1,-306)
-- State  563
,( 5, 592),(-1,-317)
-- State  564
,(-1,-319)
-- State  565
,(-1,-320)
-- State  566
,(-1,-321)
-- State  567
,(-1,-322)
-- State  568
,(-1,-323)
-- State  569
,(-1,-324)
-- State  570
,( 116, 326),( 118, 327),( 124, 328),( 125, 329),( 222, 593),(-1,-3000)
-- State  571
,(-1,-326)
-- State  572
,(-1,-327)
-- State  573
,(-1,-328)
-- State  574
,(-1,-329)
-- State  575
,(-1,-330)
-- State  576
,(-1,-331)
-- State  577
,(-1,-332)
-- State  578
,(-1,-333)
-- State  579
,( 4, 544),(-1,-215)
-- State  580
,( 2, 531),( 8, 229),( 116, 228),( 117, 231),( 118, 230),( 119, 232),( 120, 233),( 121, 234),( 122, 226),( 123, 227),( 124, 235),( 125, 236),( 126, 237)
,( 127, 238),( 128, 239),( 129, 240),( 130, 241),( 131, 242),( 132, 243),( 133, 244),( 134, 245),( 135, 246),( 183, 501),( 184, 502),( 185, 504),( 186, 506)
,( 187, 507),( 188, 508),( 189, 510),( 190, 513),( 191, 517),( 192, 515),( 193, 516),( 194, 514),( 195, 518),( 196, 520),( 197, 512),( 198, 519),( 199, 522)
,( 200, 521),( 201, 503),( 202, 505),( 203, 523),( 204, 524),( 205, 509),( 206, 511),(-1,-3000)
-- State  581
,(-1,-346)
-- State  582
,(-1,-389)
-- State  583
,( 2, 537),( 8, 229),( 116, 228),( 117, 231),( 118, 230),( 119, 232),( 120, 233),( 121, 234),( 122, 226),( 123, 227),( 124, 235),( 125, 236),( 126, 237)
,( 127, 238),( 128, 239),( 129, 240),( 130, 241),( 131, 242),( 132, 243),( 133, 244),( 134, 245),( 135, 246),( 231, 535),(-1,-3000)
-- State  584
,( 4, 436),(-1,-260)
-- State  585
,(-1,-68)
-- State  586
,(-1,-117)
-- State  587
,(-1,-263)
-- State  588
,( 4, 599),(-1,-216)
-- State  589
,( 2, 549),( 8, 229),( 116, 228),( 117, 231),( 118, 230),( 119, 232),( 120, 233),( 121, 234),( 122, 226),( 123, 227),( 124, 235),( 125, 236),( 126, 237)
,( 127, 238),( 128, 239),( 129, 240),( 130, 241),( 131, 242),( 132, 243),( 133, 244),( 134, 245),( 135, 246),( 207, 550),( 208, 551),( 209, 552),( 210, 553)
,( 211, 554),( 212, 556),( 213, 557),( 214, 558),( 215, 555),( 216, 559),(-1,-3000)
-- State  590
,(-1,-288)
-- State  591
,(-1,-308)
-- State  592
,( 2, 578),( 8, 570),( 116, 228),( 117, 231),( 118, 230),( 119, 232),( 120, 233),( 121, 234),( 122, 226),( 123, 227),( 124, 235),( 125, 236),( 126, 237)
,( 127, 238),( 128, 239),( 129, 240),( 130, 241),( 131, 242),( 132, 243),( 133, 244),( 134, 245),( 135, 246),( 217, 564),( 218, 565),( 219, 566),( 220, 567)
,( 221, 568),( 222, 569),( 223, 571),( 224, 572),( 225, 573),( 226, 574),( 227, 575),( 228, 576),(-1,-3000)
-- State  593
,(-1,-325)
-- State  594
,(-1,-316)
-- State  595
,(-1,-348)
-- State  596
,(-1,-380)
-- State  597
,(-1,-385)
-- State  598
,( 4, 602),(-1,-3000)
-- State  599
,( 299, 603),(-1,-3000)
-- State  600
,(-1,-290)
-- State  601
,(-1,-318)
-- State  602
,( 86, 270),( 87, 271),( 88, 272),( 89, 273),( 90, 274),( 91, 275),( 92, 276),( 93, 277),( 94, 278),( 95, 279),( 96, 280),( 97, 281),( 98, 282)
,( 99, 283),( 100, 284),( 101, 285),( 102, 286),( 103, 287),( 104, 288),( 105, 289),( 106, 290),( 107, 291),( 108, 292),( 109, 293),( 110, 294),( 111, 295)
,( 112, 296),( 113, 297),( 114, 298),( 115, 299),( 302, 269),(-1,-3000)
-- State  603
,(-1,-217)
-- State  604
,(-1,-118)
-- State  605
,( 4, 606),(-1,-3000)
-- State  606
,( 2, 666),( 8, 229),( 116, 228),( 117, 231),( 118, 230),( 119, 232),( 120, 233),( 121, 234),( 122, 226),( 123, 227),( 124, 235),( 125, 236),( 126, 237)
,( 127, 238),( 128, 239),( 129, 240),( 130, 241),( 131, 242),( 132, 243),( 133, 244),( 134, 245),( 135, 246),( 150, 474),( 151, 475),( 152, 476),( 153, 477)
,( 154, 478),( 155, 479),( 156, 481),( 157, 482),( 158, 489),( 159, 485),( 160, 486),( 161, 488),( 162, 480),( 163, 487),( 164, 483),( 165, 484),( 166, 490)
,( 167, 491),( 168, 492),( 169, 493),( 170, 461),( 171, 462),( 172, 463),( 173, 464),( 174, 465),( 175, 466),( 176, 469),( 177, 470),( 178, 471),( 179, 467)
,( 180, 468),( 181, 472),( 182, 473),( 183, 501),( 184, 502),( 185, 504),( 186, 506),( 187, 507),( 188, 508),( 189, 510),( 190, 513),( 191, 517),( 192, 515)
,( 193, 516),( 194, 514),( 195, 518),( 196, 520),( 197, 512),( 198, 519),( 199, 522),( 200, 521),( 201, 503),( 202, 505),( 203, 523),( 204, 524),( 205, 509)
,( 206, 511),( 207, 550),( 208, 551),( 209, 552),( 210, 553),( 211, 554),( 212, 556),( 213, 557),( 214, 558),( 215, 555),( 216, 559),( 229, 613),( 230, 614)
,( 232, 618),( 233, 619),( 234, 615),( 235, 616),( 236, 617),( 237, 620),( 238, 621),( 239, 622),( 240, 623),( 241, 624),( 242, 625),( 243, 626),( 244, 627)
,( 245, 628),( 246, 629),( 247, 630),( 248, 632),( 249, 633),( 250, 635),( 251, 636),( 252, 637),( 253, 638),( 254, 639),( 255, 640),( 256, 641),( 257, 634)
,( 258, 643),( 259, 631),( 260, 642),( 261, 644),( 262, 645),( 263, 646),( 264, 647),( 265, 648),( 266, 649),( 267, 650),( 268, 651),( 269, 652),( 270, 653)
,( 271, 654),( 272, 655),( 273, 656),( 274, 658),( 275, 657),( 276, 659),( 277, 660),( 278, 661),( 279, 662),( 280, 663),( 281, 664),( 282, 665),(-1,-3000)
-- State  607
,( 5, 668),(-1,-154)
-- State  608
,(-1,-156)
-- State  609
,(-1,-157)
-- State  610
,(-1,-158)
-- State  611
,(-1,-159)
-- State  612
,(-1,-160)
-- State  613
,(-1,-161)
-- State  614
,(-1,-162)
-- State  615
,(-1,-163)
-- State  616
,(-1,-164)
-- State  617
,(-1,-165)
-- State  618
,(-1,-166)
-- State  619
,(-1,-167)
-- State  620
,(-1,-168)
-- State  621
,(-1,-169)
-- State  622
,(-1,-170)
-- State  623
,(-1,-171)
-- State  624
,(-1,-172)
-- State  625
,(-1,-173)
-- State  626
,(-1,-174)
-- State  627
,(-1,-175)
-- State  628
,(-1,-176)
-- State  629
,(-1,-177)
-- State  630
,(-1,-178)
-- State  631
,(-1,-179)
-- State  632
,(-1,-180)
-- State  633
,(-1,-181)
-- State  634
,(-1,-182)
-- State  635
,(-1,-183)
-- State  636
,(-1,-184)
-- State  637
,(-1,-185)
-- State  638
,(-1,-186)
-- State  639
,(-1,-187)
-- State  640
,(-1,-188)
-- State  641
,(-1,-189)
-- State  642
,(-1,-190)
-- State  643
,(-1,-191)
-- State  644
,(-1,-192)
-- State  645
,(-1,-193)
-- State  646
,(-1,-194)
-- State  647
,(-1,-195)
-- State  648
,(-1,-196)
-- State  649
,(-1,-197)
-- State  650
,(-1,-198)
-- State  651
,(-1,-199)
-- State  652
,(-1,-200)
-- State  653
,(-1,-201)
-- State  654
,(-1,-202)
-- State  655
,(-1,-203)
-- State  656
,(-1,-204)
-- State  657
,(-1,-205)
-- State  658
,(-1,-206)
-- State  659
,(-1,-207)
-- State  660
,(-1,-208)
-- State  661
,(-1,-209)
-- State  662
,(-1,-210)
-- State  663
,(-1,-211)
-- State  664
,(-1,-212)
-- State  665
,(-1,-213)
-- State  666
,(-1,-214)
-- State  667
,( 4, 669),(-1,-3000)
-- State  668
,( 2, 666),( 8, 229),( 116, 228),( 117, 231),( 118, 230),( 119, 232),( 120, 233),( 121, 234),( 122, 226),( 123, 227),( 124, 235),( 125, 236),( 126, 237)
,( 127, 238),( 128, 239),( 129, 240),( 130, 241),( 131, 242),( 132, 243),( 133, 244),( 134, 245),( 135, 246),( 150, 474),( 151, 475),( 152, 476),( 153, 477)
,( 154, 478),( 155, 479),( 156, 481),( 157, 482),( 158, 489),( 159, 485),( 160, 486),( 161, 488),( 162, 480),( 163, 487),( 164, 483),( 165, 484),( 166, 490)
,( 167, 491),( 168, 492),( 169, 493),( 170, 461),( 171, 462),( 172, 463),( 173, 464),( 174, 465),( 175, 466),( 176, 469),( 177, 470),( 178, 471),( 179, 467)
,( 180, 468),( 181, 472),( 182, 473),( 183, 501),( 184, 502),( 185, 504),( 186, 506),( 187, 507),( 188, 508),( 189, 510),( 190, 513),( 191, 517),( 192, 515)
,( 193, 516),( 194, 514),( 195, 518),( 196, 520),( 197, 512),( 198, 519),( 199, 522),( 200, 521),( 201, 503),( 202, 505),( 203, 523),( 204, 524),( 205, 509)
,( 206, 511),( 207, 550),( 208, 551),( 209, 552),( 210, 553),( 211, 554),( 212, 556),( 213, 557),( 214, 558),( 215, 555),( 216, 559),( 229, 613),( 230, 614)
,( 232, 618),( 233, 619),( 234, 615),( 235, 616),( 236, 617),( 237, 620),( 238, 621),( 239, 622),( 240, 623),( 241, 624),( 242, 625),( 243, 626),( 244, 627)
,( 245, 628),( 246, 629),( 247, 630),( 248, 632),( 249, 633),( 250, 635),( 251, 636),( 252, 637),( 253, 638),( 254, 639),( 255, 640),( 256, 641),( 257, 634)
,( 258, 643),( 259, 631),( 260, 642),( 261, 644),( 262, 645),( 263, 646),( 264, 647),( 265, 648),( 266, 649),( 267, 650),( 268, 651),( 269, 652),( 270, 653)
,( 271, 654),( 272, 655),( 273, 656),( 274, 658),( 275, 657),( 276, 659),( 277, 660),( 278, 661),( 279, 662),( 280, 663),( 281, 664),( 282, 665),(-1,-3000)
-- State  669
,( 2, 143),(-1,-3000)
-- State  670
,(-1,-155)
-- State  671
,( 4, 544),(-1,-215)
-- State  672
,(-1,-119)
);
--  The offset vector
SHIFT_REDUCE_OFFSET : array (0.. 672) of Integer :=
( 0,
 9, 10, 11, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
 32, 33, 46, 54, 58, 61, 64, 66, 67, 68, 70, 71, 72, 73, 74, 75,
 76, 77, 80, 82, 90, 98, 99, 107, 115, 118, 126, 127, 128, 129, 130, 131,
 132, 133, 136, 137, 139, 141, 149, 150, 151, 159, 160, 161, 162, 163, 171, 174,
 179, 187, 191, 193, 194, 195, 200, 201, 205, 209, 210, 213, 216, 224, 225, 230,
 231, 232, 233, 234, 242, 243, 244, 245, 246, 247, 248, 249, 250, 255, 257, 258,
 264, 265, 266, 269, 270, 274, 276, 279, 280, 282, 287, 289, 292, 293, 298, 300,
 301, 302, 305, 306, 307, 308, 311, 314, 315, 316, 318, 319, 323, 324, 329, 330,
 331, 332, 333, 334, 335, 336, 338, 339, 342, 343, 348, 350, 351, 352, 355, 356,
 357, 358, 359, 363, 364, 367, 368, 371, 374, 377, 378, 379, 380, 381, 383, 384,
 386, 394, 397, 399, 400, 402, 403, 404, 405, 406, 409, 412, 414, 422, 423, 424,
 425, 426, 427, 428, 429, 431, 432, 469, 486, 490, 522, 523, 524, 527, 528, 529,
 530, 533, 535, 538, 545, 546, 549, 550, 553, 557, 558, 561, 565, 566, 567, 568,
 570, 572, 573, 574, 575, 576, 577, 578, 579, 580, 581, 582, 583, 584, 585, 586,
 587, 588, 589, 590, 591, 596, 597, 598, 599, 600, 601, 602, 603, 604, 605, 606,
 607, 608, 609, 610, 611, 612, 613, 614, 616, 617, 618, 619, 620, 621, 622, 623,
 624, 625, 626, 627, 628, 629, 630, 631, 632, 633, 634, 635, 636, 637, 638, 639,
 640, 641, 642, 643, 644, 645, 646, 647, 648, 649, 650, 651, 652, 653, 654, 655,
 656, 657, 658, 659, 660, 661, 662, 663, 664, 665, 666, 667, 668, 671, 672, 673,
 674, 675, 676, 678, 679, 680, 681, 682, 683, 684, 685, 686, 687, 688, 689, 690,
 694, 696, 699, 701, 703, 740, 741, 742, 743, 744, 761, 762, 764, 772, 779, 780,
 782, 783, 785, 787, 788, 789, 808, 812, 819, 820, 828, 829, 830, 831, 832, 833,
 834, 835, 836, 837, 838, 840, 859, 862, 863, 864, 871, 872, 875, 877, 879, 880,
 881, 882, 883, 884, 885, 886, 887, 888, 889, 890, 891, 892, 894, 896, 897, 899,
 901, 903, 905, 907, 911, 916, 917, 918, 919, 920, 921, 922, 923, 924, 925, 926,
 927, 946, 947, 955, 956, 959, 961, 963, 968, 970, 974, 975, 977, 981, 983, 985,
 989, 991, 993, 995, 996, 998, 999, 1000, 1001, 1002, 1003, 1006, 1007, 1009, 1010, 1011,
 1012, 1013, 1015, 1017, 1073, 1074, 1076, 1123, 1124, 1125, 1127, 1174, 1175, 1176, 1177, 1179,
 1203, 1204, 1206, 1207, 1209, 1211, 1212, 1216, 1218, 1219, 1220, 1221, 1222, 1223, 1224, 1225,
 1226, 1227, 1228, 1229, 1230, 1231, 1232, 1233, 1234, 1235, 1236, 1237, 1238, 1239, 1240, 1241,
 1242, 1243, 1244, 1245, 1246, 1247, 1248, 1249, 1250, 1251, 1252, 1253, 1254, 1255, 1257, 1290,
 1291, 1293, 1294, 1295, 1296, 1297, 1298, 1299, 1300, 1301, 1302, 1303, 1304, 1305, 1306, 1307,
 1308, 1309, 1310, 1311, 1312, 1313, 1314, 1315, 1316, 1317, 1318, 1319, 1320, 1322, 1357, 1358,
 1360, 1361, 1362, 1363, 1365, 1367, 1369, 1370, 1371, 1372, 1373, 1377, 1379, 1383, 1384, 1440,
 1457, 1458, 1460, 1461, 1462, 1463, 1464, 1465, 1466, 1467, 1468, 1469, 1470, 1471, 1472, 1473,
 1475, 1522, 1523, 1525, 1526, 1527, 1528, 1529, 1530, 1531, 1537, 1538, 1539, 1540, 1541, 1542,
 1543, 1544, 1545, 1547, 1594, 1595, 1596, 1620, 1622, 1623, 1624, 1625, 1627, 1660, 1661, 1662,
 1697, 1698, 1699, 1700, 1701, 1702, 1704, 1706, 1707, 1708, 1740, 1741, 1742, 1744, 1887, 1889,
 1890, 1891, 1892, 1893, 1894, 1895, 1896, 1897, 1898, 1899, 1900, 1901, 1902, 1903, 1904, 1905,
 1906, 1907, 1908, 1909, 1910, 1911, 1912, 1913, 1914, 1915, 1916, 1917, 1918, 1919, 1920, 1921,
 1922, 1923, 1924, 1925, 1926, 1927, 1928, 1929, 1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937,
 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1950, 2093, 2095, 2096, 2098);
end Rc_Shift_Reduce;
