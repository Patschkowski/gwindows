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
,( 1, 2),( 2, 20),( 9, 21),( 16, 19),( 28, 22),( 253, 24),( 254, 23),( 255, 18),(-1,-3000)
-- State  1
,(-1,-1)
-- State  2
,(-1,-2)
-- State  3
,( 2, 20),( 9, 21),( 16, 19),( 28, 22),( 253, 24),( 254, 23),( 255, 18),(-1,-3)
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
,( 30, 36),( 31,-351),( 41, 32),( 49, 29),( 50, 27),( 51, 28),( 52, 34),( 62, 35),(-1,-44)
-- State  18
,( 21, 38),( 22, 39),( 23, 40),( 24, 41),( 25, 42),(-1,-65)
-- State  19
,( 2, 44),( 253, 24),( 254, 23),(-1,-3000)
-- State  20
,( 26, 46),( 27, 47),(-1,-469)
-- State  21
,( 256, 48),( 257, 49),(-1,-3000)
-- State  22
,( 29, 50),(-1,-3000)
-- State  23
,(-1,-468)
-- State  24
,(-1,-470)
-- State  25
,( 0,-3001),(-1,-3000)
-- State  26
,(-1,-4)
-- State  27
,(-1,-400)
-- State  28
,(-1,-401)
-- State  29
,(-1,-402)
-- State  30
,( 10, 52),( 11, 53),(-1,-3000)
-- State  31
,( 31, 55),(-1,-3000)
-- State  32
,( 21, 38),( 22, 39),( 23, 40),( 24, 41),( 25, 42),(-1,-65)
-- State  33
,( 21, 38),( 22, 39),( 23, 40),( 24, 41),( 25, 42),(-1,-65)
-- State  34
,(-1,-405)
-- State  35
,( 21, 38),( 22, 39),( 23, 40),( 24, 41),( 25, 42),(-1,-65)
-- State  36
,( 21, 38),( 22, 39),( 23, 40),( 24, 41),( 25, 42),(-1,-65)
-- State  37
,( 21, 38),( 22, 39),( 23, 40),( 24, 41),( 25, 42),(-1,-65)
-- State  38
,(-1,-67)
-- State  39
,(-1,-68)
-- State  40
,(-1,-69)
-- State  41
,(-1,-70)
-- State  42
,(-1,-71)
-- State  43
,( 6, 63),( 14, 62),(-1,-3000)
-- State  44
,(-1,-469)
-- State  45
,( 4, 65),(-1,-3000)
-- State  46
,( 256, 66),(-1,-3000)
-- State  47
,( 21, 38),( 22, 39),( 23, 40),( 24, 41),( 25, 42),(-1,-65)
-- State  48
,(-1,-452)
-- State  49
,(-1,-453)
-- State  50
,( 21, 38),( 22, 39),( 23, 40),( 24, 41),( 25, 42),(-1,-65)
-- State  51
,(-1,-3000)
-- State  52
,(-1,-50)
-- State  53
,(-1,-51)
-- State  54
,(-1,-45)
-- State  55
,( 21, 38),( 22, 39),( 23, 40),( 24, 41),( 25, 42),(-1,-65)
-- State  56
,( 6, 63),( 14, 62),(-1,-3000)
-- State  57
,( 2, 44),( 253, 24),( 254, 23),( 256, 73),(-1,-3000)
-- State  58
,( 53, 78),( 54, 79),( 55, 80),( 56, 81),( 57, 82),( 58, 83),( 59, 84),(-1,-407)
-- State  59
,( 2, 44),( 253, 24),( 254, 23),(-1,-3000)
-- State  60
,( 256, 87),(-1,-3000)
-- State  61
,(-1,-66)
-- State  62
,(-1,-473)
-- State  63
,(-1,-474)
-- State  64
,( 2, 44),( 253, 24),( 254, 23),(-1,-440)
-- State  65
,( 2, 44),( 253, 24),( 254, 23),(-1,-3000)
-- State  66
,(-1,-445)
-- State  67
,( 6, 63),( 14, 62),(-1,-3000)
-- State  68
,( 6, 63),( 14, 62),(-1,-3000)
-- State  69
,( 21, 38),( 22, 39),( 23, 40),( 24, 41),( 25, 42),(-1,-65)
-- State  70
,(-1,-352)
-- State  71
,( 2, 44),( 253, 24),( 254, 23),( 256, 101),(-1,-382)
-- State  72
,(-1,-403)
-- State  73
,(-1,-404)
-- State  74
,(-1,-399)
-- State  75
,(-1,-408)
-- State  76
,( 53, 78),( 54, 79),( 55, 80),( 56, 81),( 57, 82),( 58, 83),( 59, 84),(-1,-409)
-- State  77
,(-1,-411)
-- State  78
,(-1,-412)
-- State  79
,(-1,-413)
-- State  80
,(-1,-414)
-- State  81
,(-1,-415)
-- State  82
,(-1,-416)
-- State  83
,(-1,-417)
-- State  84
,(-1,-418)
-- State  85
,( 6, 63),( 14, 62),( 60, 110),( 61, 109),(-1,-3000)
-- State  86
,( 4, 112),(-1,-3000)
-- State  87
,(-1,-467)
-- State  88
,(-1,-441)
-- State  89
,( 2, 44),( 253, 24),( 254, 23),(-1,-442)
-- State  90
,( 256, 114),(-1,-3000)
-- State  91
,( 7, 116),( 15, 115),(-1,-3000)
-- State  92
,(-1,-61)
-- State  93
,( 256, 120),(-1,-447)
-- State  94
,( 2, 44),( 253, 24),( 254, 23),( 256, 126),(-1,-455)
-- State  95
,( 2, 128),(-1,-3000)
-- State  96
,( 6, 63),( 14, 62),(-1,-3000)
-- State  97
,(-1,-383)
-- State  98
,( 2, 44),( 253, 24),( 254, 23),( 256, 101),(-1,-384)
-- State  99
,( 4, 132),(-1,-3000)
-- State  100
,(-1,-387)
-- State  101
,(-1,-388)
-- State  102
,( 7, 116),( 15, 115),(-1,-3000)
-- State  103
,(-1,-410)
-- State  104
,(-1,-419)
-- State  105
,(-1,-420)
-- State  106
,( 60, 110),( 61, 109),(-1,-3000)
-- State  107
,( 60, 110),( 61, 109),(-1,-422)
-- State  108
,(-1,-424)
-- State  109
,(-1,-425)
-- State  110
,( 256, 137),(-1,-3000)
-- State  111
,(-1,-406)
-- State  112
,( 2, 44),( 253, 24),( 254, 23),(-1,-3000)
-- State  113
,(-1,-443)
-- State  114
,(-1,-444)
-- State  115
,(-1,-475)
-- State  116
,(-1,-476)
-- State  117
,(-1,-439)
-- State  118
,(-1,-448)
-- State  119
,( 256, 120),(-1,-449)
-- State  120
,(-1,-451)
-- State  121
,( 7, 116),( 15, 115),(-1,-3000)
-- State  122
,(-1,-456)
-- State  123
,( 2, 44),( 253, 24),( 254, 23),( 256, 126),(-1,-457)
-- State  124
,( 4, 142),(-1,-3000)
-- State  125
,(-1,-460)
-- State  126
,(-1,-461)
-- State  127
,( 7, 116),( 15, 115),(-1,-3000)
-- State  128
,(-1,-347)
-- State  129
,(-1,-46)
-- State  130
,(-1,-353)
-- State  131
,(-1,-385)
-- State  132
,( 2, 44),( 253, 24),( 254, 23),(-1,-3000)
-- State  133
,(-1,-381)
-- State  134
,( 7, 116),( 15, 115),(-1,-3000)
-- State  135
,(-1,-423)
-- State  136
,( 2, 151),( 256, 150),(-1,-3000)
-- State  137
,( 6, 63),( 14, 62),(-1,-3000)
-- State  138
,( 6, 63),( 14, 62),(-1,-3000)
-- State  139
,(-1,-450)
-- State  140
,(-1,-446)
-- State  141
,(-1,-458)
-- State  142
,( 10, 155),(-1,-3000)
-- State  143
,(-1,-454)
-- State  144
,( 4, 156),(-1,-3000)
-- State  145
,( 13, 165),( 16, 19),( 17, 167),( 18, 168),( 19, 166),( 20, 170),( 31, 169),(-1,-52)
-- State  146
,( 32, 178),( 33, 177),(-1,-355)
-- State  147
,( 4, 180),(-1,-389)
-- State  148
,(-1,-421)
-- State  149
,( 4, 182),(-1,-428)
-- State  150
,(-1,-430)
-- State  151
,(-1,-431)
-- State  152
,(-1,-426)
-- State  153
,(-1,-427)
-- State  154
,( 34, 186),( 63, 185),(-1,-433)
-- State  155
,( 6, 63),( 14, 62),(-1,-3000)
-- State  156
,( 2, 189),(-1,-3000)
-- State  157
,( 13, 165),( 16, 19),( 17, 167),( 18, 168),( 19, 166),( 20, 170),( 31, 169),(-1,-52)
-- State  158
,(-1,-54)
-- State  159
,(-1,-55)
-- State  160
,(-1,-56)
-- State  161
,(-1,-57)
-- State  162
,(-1,-58)
-- State  163
,(-1,-59)
-- State  164
,(-1,-60)
-- State  165
,( 256, 191),(-1,-3000)
-- State  166
,( 2, 192),(-1,-3000)
-- State  167
,( 2, 208),( 8, 212),( 109, 211),( 110, 214),( 111, 213),( 112, 215),( 113, 216),( 114, 217),( 115, 209),( 116, 210),( 117, 218),( 118, 219),( 119, 220)
,( 120, 221),( 121, 222),( 122, 223),( 123, 224),( 124, 225),( 125, 226),( 126, 227),( 127, 194),( 128, 195),( 129, 196),( 130, 197),( 131, 199),( 132, 198)
,( 133, 200),( 134, 201),( 135, 202),( 136, 203),( 137, 204),( 138, 205),( 139, 206),(-1,-3000)
-- State  168
,( 2, 231),( 242, 232),( 243, 234),( 244, 235),( 245, 236),( 246, 237),( 247, 233),( 248, 238),( 249, 239),( 250, 240),( 251, 242),( 252, 241),(-1,-3000)
-- State  169
,( 2, 44),( 253, 24),( 254, 23),(-1,-3000)
-- State  170
,( 80, 247),( 81, 248),( 82, 249),( 83, 250),( 84, 251),( 85, 252),( 86, 253),( 87, 254),( 88, 255),( 89, 256),( 90, 257),( 91, 258),( 92, 259)
,( 93, 260),( 94, 261),( 95, 262),( 96, 263),( 97, 264),( 98, 265),( 99, 266),( 100, 267),( 101, 268),( 102, 269),( 103, 270),( 104, 271),( 105, 272)
,( 106, 273),( 107, 274),( 108, 275),( 256, 246),(-1,-3000)
-- State  171
,(-1,-47)
-- State  172
,(-1,-356)
-- State  173
,( 32, 178),( 33, 177),(-1,-357)
-- State  174
,(-1,-359)
-- State  175
,(-1,-360)
-- State  176
,(-1,-361)
-- State  177
,( 34, 280),( 256, 279),(-1,-3000)
-- State  178
,( 256, 281),(-1,-3000)
-- State  179
,( 7, 116),( 15, 115),(-1,-3000)
-- State  180
,( 12, 289),( 44, 284),( 45, 285),( 46, 286),( 47, 287),( 48, 288),(-1,-3000)
-- State  181
,(-1,-386)
-- State  182
,( 2, 151),( 256, 150),(-1,-3000)
-- State  183
,(-1,-434)
-- State  184
,( 34, 186),( 63, 185),(-1,-435)
-- State  185
,( 2, 44),( 253, 24),( 254, 23),(-1,-3000)
-- State  186
,(-1,-438)
-- State  187
,( 7, 116),( 15, 115),(-1,-3000)
-- State  188
,( 2, 44),( 253, 24),( 254, 23),(-1,-462)
-- State  189
,(-1,-348)
-- State  190
,(-1,-53)
-- State  191
,(-1,-93)
-- State  192
,( 4, 300),(-1,-3000)
-- State  193
,( 5, 301),(-1,-73)
-- State  194
,(-1,-75)
-- State  195
,(-1,-76)
-- State  196
,(-1,-77)
-- State  197
,(-1,-78)
-- State  198
,(-1,-79)
-- State  199
,(-1,-80)
-- State  200
,(-1,-81)
-- State  201
,(-1,-82)
-- State  202
,(-1,-83)
-- State  203
,(-1,-84)
-- State  204
,(-1,-85)
-- State  205
,(-1,-86)
-- State  206
,(-1,-87)
-- State  207
,(-1,-88)
-- State  208
,(-1,-89)
-- State  209
,(-1,-22)
-- State  210
,(-1,-23)
-- State  211
,(-1,-24)
-- State  212
,( 109, 302),( 111, 303),( 117, 304),( 118, 305),(-1,-3000)
-- State  213
,(-1,-26)
-- State  214
,(-1,-28)
-- State  215
,(-1,-29)
-- State  216
,(-1,-30)
-- State  217
,(-1,-31)
-- State  218
,(-1,-32)
-- State  219
,(-1,-34)
-- State  220
,(-1,-36)
-- State  221
,(-1,-37)
-- State  222
,(-1,-38)
-- State  223
,(-1,-39)
-- State  224
,(-1,-40)
-- State  225
,(-1,-41)
-- State  226
,(-1,-42)
-- State  227
,(-1,-43)
-- State  228
,(-1,-72)
-- State  229
,( 5, 306),(-1,-190)
-- State  230
,(-1,-192)
-- State  231
,(-1,-193)
-- State  232
,(-1,-194)
-- State  233
,(-1,-195)
-- State  234
,(-1,-196)
-- State  235
,(-1,-197)
-- State  236
,(-1,-198)
-- State  237
,(-1,-199)
-- State  238
,(-1,-200)
-- State  239
,(-1,-201)
-- State  240
,(-1,-202)
-- State  241
,(-1,-203)
-- State  242
,(-1,-204)
-- State  243
,(-1,-90)
-- State  244
,(-1,-91)
-- State  245
,(-1,-116)
-- State  246
,(-1,-117)
-- State  247
,(-1,-118)
-- State  248
,(-1,-119)
-- State  249
,(-1,-120)
-- State  250
,(-1,-121)
-- State  251
,(-1,-122)
-- State  252
,(-1,-123)
-- State  253
,(-1,-124)
-- State  254
,(-1,-125)
-- State  255
,(-1,-126)
-- State  256
,(-1,-127)
-- State  257
,(-1,-128)
-- State  258
,(-1,-129)
-- State  259
,(-1,-130)
-- State  260
,(-1,-131)
-- State  261
,(-1,-132)
-- State  262
,(-1,-133)
-- State  263
,(-1,-134)
-- State  264
,(-1,-135)
-- State  265
,(-1,-136)
-- State  266
,(-1,-137)
-- State  267
,(-1,-138)
-- State  268
,(-1,-139)
-- State  269
,(-1,-140)
-- State  270
,(-1,-141)
-- State  271
,(-1,-142)
-- State  272
,(-1,-143)
-- State  273
,(-1,-144)
-- State  274
,(-1,-145)
-- State  275
,(-1,-146)
-- State  276
,(-1,-92)
-- State  277
,( 6, 63),( 14, 62),(-1,-3000)
-- State  278
,(-1,-358)
-- State  279
,(-1,-365)
-- State  280
,(-1,-380)
-- State  281
,(-1,-362)
-- State  282
,(-1,-354)
-- State  283
,( 4, 310),(-1,-391)
-- State  284
,(-1,-393)
-- State  285
,(-1,-394)
-- State  286
,(-1,-395)
-- State  287
,(-1,-396)
-- State  288
,(-1,-397)
-- State  289
,(-1,-398)
-- State  290
,(-1,-390)
-- State  291
,(-1,-429)
-- State  292
,(-1,-436)
-- State  293
,(-1,-437)
-- State  294
,(-1,-432)
-- State  295
,(-1,-463)
-- State  296
,( 2, 44),( 253, 24),( 254, 23),(-1,-464)
-- State  297
,( 4, 312),(-1,-3000)
-- State  298
,( 7, 116),( 15, 115),(-1,-3000)
-- State  299
,( 4, 314),(-1,-3000)
-- State  300
,( 256, 315),(-1,-3000)
-- State  301
,( 2, 208),( 8, 212),( 109, 211),( 110, 214),( 111, 213),( 112, 215),( 113, 216),( 114, 217),( 115, 209),( 116, 210),( 117, 218),( 118, 219),( 119, 220)
,( 120, 221),( 121, 222),( 122, 223),( 123, 224),( 124, 225),( 125, 226),( 126, 227),( 127, 194),( 128, 195),( 129, 196),( 130, 197),( 131, 199),( 132, 198)
,( 133, 200),( 134, 201),( 135, 202),( 136, 203),( 137, 204),( 138, 205),( 139, 206),(-1,-3000)
-- State  302
,(-1,-25)
-- State  303
,(-1,-27)
-- State  304
,(-1,-33)
-- State  305
,(-1,-35)
-- State  306
,( 2, 231),( 242, 232),( 243, 234),( 244, 235),( 245, 236),( 246, 237),( 247, 233),( 248, 238),( 249, 239),( 250, 240),( 251, 242),( 252, 241),(-1,-3000)
-- State  307
,(-1,-48)
-- State  308
,( 4, 319),(-1,-3000)
-- State  309
,( 4, 320),( 35, 323),( 36, 324),( 37, 325),( 38, 326),( 39, 327),( 40, 328),(-1,-368)
-- State  310
,( 12, 289),( 44, 284),( 45, 285),( 46, 286),( 47, 287),( 48, 288),(-1,-3000)
-- State  311
,(-1,-465)
-- State  312
,( 2, 331),(-1,-3000)
-- State  313
,(-1,-459)
-- State  314
,( 2, 332),(-1,-3000)
-- State  315
,( 4, 333),(-1,-63)
-- State  316
,(-1,-74)
-- State  317
,(-1,-191)
-- State  318
,( 12,-95),( 49,-95),( 64,-95),( 65,-95),( 66,-95),( 67,-95),( 68,-95),( 69,-95),( 70,-95),( 71,-95),( 72,-95),( 73,-95),( 74,-95)
,( 75,-95),( 76,-95),( 77,-95),( 78,-95),( 79,-95),(-1,-94)
-- State  319
,( 2, 44),( 253, 24),( 254, 23),(-1,-3000)
-- State  320
,( 35, 323),( 36, 324),( 37, 325),( 38, 326),( 39, 327),( 40, 328),(-1,-3000)
-- State  321
,(-1,-370)
-- State  322
,( 4, 339),( 35, 323),( 36, 324),( 37, 325),( 38, 326),( 39, 327),( 40, 328),(-1,-371)
-- State  323
,(-1,-374)
-- State  324
,(-1,-375)
-- State  325
,(-1,-376)
-- State  326
,(-1,-377)
-- State  327
,(-1,-378)
-- State  328
,(-1,-379)
-- State  329
,(-1,-363)
-- State  330
,(-1,-392)
-- State  331
,(-1,-466)
-- State  332
,(-1,-349)
-- State  333
,( 2, 343),(-1,-3000)
-- State  334
,(-1,-62)
-- State  335
,( 12, 355),( 49, 365),( 64, 356),( 65, 366),( 66, 367),( 67, 368),( 68, 358),( 69, 359),( 70, 360),( 71, 373),( 72, 374),( 73, 375),( 74, 376)
,( 75, 369),( 76, 370),( 77, 371),( 78, 372),( 79, 364),(-1,-3000)
-- State  336
,( 7, 116),( 15, 115),(-1,-3000)
-- State  337
,(-1,-366)
-- State  338
,(-1,-369)
-- State  339
,( 35, 323),( 36, 324),( 37, 325),( 38, 326),( 39, 327),( 40, 328),(-1,-3000)
-- State  340
,(-1,-373)
-- State  341
,( 6, 63),( 14, 62),(-1,-3000)
-- State  342
,( 4, 382),(-1,-3000)
-- State  343
,( 4, 383),(-1,-3000)
-- State  344
,(-1,-97)
-- State  345
,(-1,-98)
-- State  346
,(-1,-99)
-- State  347
,(-1,-100)
-- State  348
,(-1,-101)
-- State  349
,(-1,-102)
-- State  350
,(-1,-103)
-- State  351
,(-1,-104)
-- State  352
,(-1,-105)
-- State  353
,(-1,-106)
-- State  354
,(-1,-107)
-- State  355
,(-1,-108)
-- State  356
,( 256, 385),(-1,-222)
-- State  357
,( 256, 387),(-1,-3000)
-- State  358
,(-1,-248)
-- State  359
,( 256, 387),(-1,-3000)
-- State  360
,( 256, 391),(-1,-273)
-- State  361
,( 256, 387),(-1,-3000)
-- State  362
,( 256, 387),(-1,-3000)
-- State  363
,( 256, 387),(-1,-3000)
-- State  364
,( 2, 44),( 253, 24),( 254, 23),(-1,-3000)
-- State  365
,( 2, 44),( 253, 24),( 254, 23),( 256, 399),(-1,-3000)
-- State  366
,(-1,-245)
-- State  367
,(-1,-246)
-- State  368
,(-1,-247)
-- State  369
,(-1,-294)
-- State  370
,(-1,-295)
-- State  371
,(-1,-296)
-- State  372
,(-1,-297)
-- State  373
,(-1,-326)
-- State  374
,(-1,-327)
-- State  375
,(-1,-329)
-- State  376
,(-1,-330)
-- State  377
,( 12,-95),( 49,-95),( 64,-95),( 65,-95),( 66,-95),( 67,-95),( 68,-95),( 69,-95),( 70,-95),( 71,-95),( 72,-95),( 73,-95),( 74,-95)
,( 75,-95),( 76,-95),( 77,-95),( 78,-95),( 79,-95),(-1,-94)
-- State  378
,(-1,-49)
-- State  379
,( 4, 320),( 35, 323),( 36, 324),( 37, 325),( 38, 326),( 39, 327),( 40, 328),(-1,-368)
-- State  380
,(-1,-372)
-- State  381
,( 32, 178),( 33, 177),(-1,-355)
-- State  382
,( 2, 404),(-1,-3000)
-- State  383
,( 2, 405),(-1,-3000)
-- State  384
,( 2, 407),( 253, 24),( 254, 23),( 256, 406),(-1,-3000)
-- State  385
,( 4, 410),(-1,-3000)
-- State  386
,( 2, 44),( 253, 24),( 254, 23),(-1,-3000)
-- State  387
,(-1,-345)
-- State  388
,( 4, 413),(-1,-224)
-- State  389
,( 2, 44),( 253, 24),( 254, 23),(-1,-3000)
-- State  390
,( 4, 416),(-1,-265)
-- State  391
,( 4, 418),(-1,-3000)
-- State  392
,( 2, 44),( 253, 24),( 254, 23),(-1,-3000)
-- State  393
,( 4, 420),(-1,-298)
-- State  394
,( 4, 420),(-1,-298)
-- State  395
,( 4, 420),(-1,-298)
-- State  396
,(-1,-343)
-- State  397
,( 4, 425),(-1,-332)
-- State  398
,(-1,-341)
-- State  399
,(-1,-342)
-- State  400
,(-1,-339)
-- State  401
,(-1,-96)
-- State  402
,(-1,-367)
-- State  403
,( 7, 116),( 15, 115),(-1,-3000)
-- State  404
,(-1,-350)
-- State  405
,( 4, 429),(-1,-3000)
-- State  406
,(-1,-113)
-- State  407
,(-1,-114)
-- State  408
,(-1,-115)
-- State  409
,(-1,-109)
-- State  410
,(-1,-223)
-- State  411
,( 4, 413),(-1,-224)
-- State  412
,( 4, 432),(-1,-3000)
-- State  413
,( 2, 437),( 8, 212),( 109, 211),( 110, 214),( 111, 213),( 112, 215),( 113, 216),( 114, 217),( 115, 209),( 116, 210),( 117, 218),( 118, 219),( 119, 220)
,( 120, 221),( 121, 222),( 122, 223),( 123, 224),( 124, 225),( 125, 226),( 126, 227),( 140, 450),( 141, 451),( 142, 452),( 143, 453),( 144, 454),( 145, 455)
,( 146, 457),( 147, 458),( 148, 465),( 149, 461),( 150, 462),( 151, 464),( 152, 456),( 153, 463),( 154, 459),( 155, 460),( 156, 438),( 157, 439),( 158, 440)
,( 159, 441),( 160, 442),( 161, 443),( 162, 446),( 163, 447),( 164, 448),( 165, 444),( 166, 445),( 167, 449),(-1,-3000)
-- State  414
,( 4, 467),(-1,-188)
-- State  415
,( 4, 469),(-1,-250)
-- State  416
,( 2, 472),( 8, 212),( 109, 211),( 110, 214),( 111, 213),( 112, 215),( 113, 216),( 114, 217),( 115, 209),( 116, 210),( 117, 218),( 118, 219),( 119, 220)
,( 120, 221),( 121, 222),( 122, 223),( 123, 224),( 124, 225),( 125, 226),( 126, 227),( 168, 475),( 169, 476),( 170, 477),( 171, 479),( 172, 480),( 173, 481)
,( 174, 483),( 175, 487),( 176, 485),( 177, 486),( 178, 484),( 179, 488),( 180, 490),( 181, 482),( 182, 489),( 183, 492),( 184, 491),( 185, 493),( 186, 478)
,( 187, 494),(-1,-3000)
-- State  417
,( 4, 467),(-1,-188)
-- State  418
,(-1,-274)
-- State  419
,( 4, 497),(-1,-275)
-- State  420
,( 2, 502),( 8, 212),( 109, 211),( 110, 214),( 111, 213),( 112, 215),( 113, 216),( 114, 217),( 115, 209),( 116, 210),( 117, 218),( 118, 219),( 119, 220)
,( 120, 221),( 121, 222),( 122, 223),( 123, 224),( 124, 225),( 125, 226),( 126, 227),( 168, 475),( 169, 476),( 170, 477),( 171, 479),( 172, 480),( 173, 481)
,( 174, 483),( 175, 487),( 176, 485),( 177, 486),( 178, 484),( 179, 488),( 180, 490),( 181, 482),( 182, 489),( 183, 492),( 184, 491),( 185, 493),( 186, 478)
,( 187, 494),(-1,-3000)
-- State  421
,(-1,-293)
-- State  422
,(-1,-325)
-- State  423
,(-1,-328)
-- State  424
,( 4, 504),(-1,-3000)
-- State  425
,( 2, 508),( 8, 212),( 109, 211),( 110, 214),( 111, 213),( 112, 215),( 113, 216),( 114, 217),( 115, 209),( 116, 210),( 117, 218),( 118, 219),( 119, 220)
,( 120, 221),( 121, 222),( 122, 223),( 123, 224),( 124, 225),( 125, 226),( 126, 227),( 208, 506),(-1,-3000)
-- State  426
,(-1,-331)
-- State  427
,( 4, 510),(-1,-3000)
-- State  428
,(-1,-364)
-- State  429
,( 2, 511),(-1,-3000)
-- State  430
,( 4, 512),(-1,-3000)
-- State  431
,( 4, 467),(-1,-188)
-- State  432
,( 2, 44),( 253, 24),( 254, 23),(-1,-3000)
-- State  433
,( 5, 515),(-1,-226)
-- State  434
,(-1,-228)
-- State  435
,(-1,-229)
-- State  436
,(-1,-230)
-- State  437
,(-1,-231)
-- State  438
,(-1,-232)
-- State  439
,(-1,-233)
-- State  440
,(-1,-234)
-- State  441
,(-1,-235)
-- State  442
,(-1,-236)
-- State  443
,(-1,-237)
-- State  444
,(-1,-238)
-- State  445
,(-1,-239)
-- State  446
,(-1,-240)
-- State  447
,(-1,-241)
-- State  448
,(-1,-242)
-- State  449
,(-1,-243)
-- State  450
,(-1,-205)
-- State  451
,(-1,-206)
-- State  452
,(-1,-207)
-- State  453
,(-1,-208)
-- State  454
,(-1,-209)
-- State  455
,(-1,-210)
-- State  456
,(-1,-211)
-- State  457
,(-1,-212)
-- State  458
,(-1,-213)
-- State  459
,(-1,-214)
-- State  460
,(-1,-215)
-- State  461
,(-1,-216)
-- State  462
,(-1,-217)
-- State  463
,(-1,-218)
-- State  464
,(-1,-219)
-- State  465
,(-1,-220)
-- State  466
,(-1,-225)
-- State  467
,( 2, 231),( 242, 232),( 243, 234),( 244, 235),( 245, 236),( 246, 237),( 247, 233),( 248, 238),( 249, 239),( 250, 240),( 251, 242),( 252, 241),(-1,-3000)
-- State  468
,(-1,-244)
-- State  469
,( 2, 527),( 8, 212),( 109, 211),( 110, 214),( 111, 213),( 112, 215),( 113, 216),( 114, 217),( 115, 209),( 116, 210),( 117, 218),( 118, 219),( 119, 220)
,( 120, 221),( 121, 222),( 122, 223),( 123, 224),( 124, 225),( 125, 226),( 126, 227),( 188, 518),( 189, 519),( 190, 520),( 191, 521),( 192, 522),( 193, 523)
,( 194, 524),( 195, 525),(-1,-3000)
-- State  470
,( 4, 467),(-1,-188)
-- State  471
,( 5, 530),(-1,-267)
-- State  472
,(-1,-269)
-- State  473
,(-1,-270)
-- State  474
,(-1,-271)
-- State  475
,(-1,-305)
-- State  476
,(-1,-306)
-- State  477
,(-1,-307)
-- State  478
,(-1,-308)
-- State  479
,(-1,-309)
-- State  480
,(-1,-310)
-- State  481
,(-1,-311)
-- State  482
,(-1,-312)
-- State  483
,(-1,-313)
-- State  484
,(-1,-314)
-- State  485
,(-1,-315)
-- State  486
,(-1,-316)
-- State  487
,(-1,-317)
-- State  488
,(-1,-318)
-- State  489
,(-1,-319)
-- State  490
,(-1,-320)
-- State  491
,(-1,-321)
-- State  492
,(-1,-322)
-- State  493
,(-1,-323)
-- State  494
,(-1,-324)
-- State  495
,(-1,-266)
-- State  496
,(-1,-264)
-- State  497
,( 2, 545),( 8, 538),( 109, 211),( 110, 214),( 111, 213),( 112, 215),( 113, 216),( 114, 217),( 115, 209),( 116, 210),( 117, 218),( 118, 219),( 119, 220)
,( 120, 221),( 121, 222),( 122, 223),( 123, 224),( 124, 225),( 125, 226),( 126, 227),( 196, 532),( 197, 533),( 198, 534),( 199, 535),( 200, 536),( 201, 537)
,( 202, 539),( 203, 540),( 204, 541),( 205, 542),( 206, 543),(-1,-3000)
-- State  498
,( 4, 467),(-1,-188)
-- State  499
,( 5, 548),(-1,-300)
-- State  500
,(-1,-302)
-- State  501
,(-1,-303)
-- State  502
,(-1,-304)
-- State  503
,(-1,-299)
-- State  504
,( 2, 128),(-1,-3000)
-- State  505
,( 5, 550),(-1,-334)
-- State  506
,(-1,-336)
-- State  507
,(-1,-337)
-- State  508
,(-1,-338)
-- State  509
,(-1,-333)
-- State  510
,( 2, 44),( 253, 24),( 254, 23),(-1,-3000)
-- State  511
,(-1,-64)
-- State  512
,( 2, 44),( 253, 24),( 254, 23),(-1,-3000)
-- State  513
,(-1,-221)
-- State  514
,(-1,-346)
-- State  515
,( 2, 437),( 8, 212),( 109, 211),( 110, 214),( 111, 213),( 112, 215),( 113, 216),( 114, 217),( 115, 209),( 116, 210),( 117, 218),( 118, 219),( 119, 220)
,( 120, 221),( 121, 222),( 122, 223),( 123, 224),( 124, 225),( 125, 226),( 126, 227),( 140, 450),( 141, 451),( 142, 452),( 143, 453),( 144, 454),( 145, 455)
,( 146, 457),( 147, 458),( 148, 465),( 149, 461),( 150, 462),( 151, 464),( 152, 456),( 153, 463),( 154, 459),( 155, 460),( 156, 438),( 157, 439),( 158, 440)
,( 159, 441),( 160, 442),( 161, 443),( 162, 446),( 163, 447),( 164, 448),( 165, 444),( 166, 445),( 167, 449),(-1,-3000)
-- State  516
,(-1,-189)
-- State  517
,( 5, 554),(-1,-252)
-- State  518
,(-1,-254)
-- State  519
,(-1,-255)
-- State  520
,(-1,-256)
-- State  521
,(-1,-257)
-- State  522
,(-1,-258)
-- State  523
,(-1,-259)
-- State  524
,(-1,-260)
-- State  525
,(-1,-261)
-- State  526
,(-1,-262)
-- State  527
,(-1,-263)
-- State  528
,(-1,-251)
-- State  529
,(-1,-249)
-- State  530
,( 2, 472),( 8, 212),( 109, 211),( 110, 214),( 111, 213),( 112, 215),( 113, 216),( 114, 217),( 115, 209),( 116, 210),( 117, 218),( 118, 219),( 119, 220)
,( 120, 221),( 121, 222),( 122, 223),( 123, 224),( 124, 225),( 125, 226),( 126, 227),( 168, 475),( 169, 476),( 170, 477),( 171, 479),( 172, 480),( 173, 481)
,( 174, 483),( 175, 487),( 176, 485),( 177, 486),( 178, 484),( 179, 488),( 180, 490),( 181, 482),( 182, 489),( 183, 492),( 184, 491),( 185, 493),( 186, 478)
,( 187, 494),(-1,-3000)
-- State  531
,( 5, 556),(-1,-277)
-- State  532
,(-1,-279)
-- State  533
,(-1,-280)
-- State  534
,(-1,-281)
-- State  535
,(-1,-282)
-- State  536
,(-1,-283)
-- State  537
,(-1,-284)
-- State  538
,( 109, 302),( 111, 303),( 117, 304),( 118, 305),( 201, 557),(-1,-3000)
-- State  539
,(-1,-286)
-- State  540
,(-1,-287)
-- State  541
,(-1,-288)
-- State  542
,(-1,-289)
-- State  543
,(-1,-290)
-- State  544
,(-1,-291)
-- State  545
,(-1,-292)
-- State  546
,(-1,-276)
-- State  547
,(-1,-272)
-- State  548
,( 2, 502),( 8, 212),( 109, 211),( 110, 214),( 111, 213),( 112, 215),( 113, 216),( 114, 217),( 115, 209),( 116, 210),( 117, 218),( 118, 219),( 119, 220)
,( 120, 221),( 121, 222),( 122, 223),( 123, 224),( 124, 225),( 125, 226),( 126, 227),( 168, 475),( 169, 476),( 170, 477),( 171, 479),( 172, 480),( 173, 481)
,( 174, 483),( 175, 487),( 176, 485),( 177, 486),( 178, 484),( 179, 488),( 180, 490),( 181, 482),( 182, 489),( 183, 492),( 184, 491),( 185, 493),( 186, 478)
,( 187, 494),(-1,-3000)
-- State  549
,(-1,-344)
-- State  550
,( 2, 508),( 8, 212),( 109, 211),( 110, 214),( 111, 213),( 112, 215),( 113, 216),( 114, 217),( 115, 209),( 116, 210),( 117, 218),( 118, 219),( 119, 220)
,( 120, 221),( 121, 222),( 122, 223),( 123, 224),( 124, 225),( 125, 226),( 126, 227),( 208, 506),(-1,-3000)
-- State  551
,( 4, 413),(-1,-224)
-- State  552
,(-1,-110)
-- State  553
,(-1,-227)
-- State  554
,( 2, 527),( 8, 212),( 109, 211),( 110, 214),( 111, 213),( 112, 215),( 113, 216),( 114, 217),( 115, 209),( 116, 210),( 117, 218),( 118, 219),( 119, 220)
,( 120, 221),( 121, 222),( 122, 223),( 123, 224),( 124, 225),( 125, 226),( 126, 227),( 188, 518),( 189, 519),( 190, 520),( 191, 521),( 192, 522),( 193, 523)
,( 194, 524),( 195, 525),(-1,-3000)
-- State  555
,(-1,-268)
-- State  556
,( 2, 545),( 8, 538),( 109, 211),( 110, 214),( 111, 213),( 112, 215),( 113, 216),( 114, 217),( 115, 209),( 116, 210),( 117, 218),( 118, 219),( 119, 220)
,( 120, 221),( 121, 222),( 122, 223),( 123, 224),( 124, 225),( 125, 226),( 126, 227),( 196, 532),( 197, 533),( 198, 534),( 199, 535),( 200, 536),( 201, 537)
,( 202, 539),( 203, 540),( 204, 541),( 205, 542),( 206, 543),(-1,-3000)
-- State  557
,(-1,-285)
-- State  558
,(-1,-301)
-- State  559
,(-1,-335)
-- State  560
,(-1,-340)
-- State  561
,( 4, 564),(-1,-3000)
-- State  562
,(-1,-253)
-- State  563
,(-1,-278)
-- State  564
,( 80, 247),( 81, 248),( 82, 249),( 83, 250),( 84, 251),( 85, 252),( 86, 253),( 87, 254),( 88, 255),( 89, 256),( 90, 257),( 91, 258),( 92, 259)
,( 93, 260),( 94, 261),( 95, 262),( 96, 263),( 97, 264),( 98, 265),( 99, 266),( 100, 267),( 101, 268),( 102, 269),( 103, 270),( 104, 271),( 105, 272)
,( 106, 273),( 107, 274),( 108, 275),( 256, 246),(-1,-3000)
-- State  565
,(-1,-111)
-- State  566
,( 4, 567),(-1,-3000)
-- State  567
,( 2, 607),( 8, 212),( 109, 211),( 110, 214),( 111, 213),( 112, 215),( 113, 216),( 114, 217),( 115, 209),( 116, 210),( 117, 218),( 118, 219),( 119, 220)
,( 120, 221),( 121, 222),( 122, 223),( 123, 224),( 124, 225),( 125, 226),( 126, 227),( 140, 450),( 141, 451),( 142, 452),( 143, 453),( 144, 454),( 145, 455)
,( 146, 457),( 147, 458),( 148, 465),( 149, 461),( 150, 462),( 151, 464),( 152, 456),( 153, 463),( 154, 459),( 155, 460),( 156, 438),( 157, 439),( 158, 440)
,( 159, 441),( 160, 442),( 161, 443),( 162, 446),( 163, 447),( 164, 448),( 165, 444),( 166, 445),( 167, 449),( 168, 475),( 169, 476),( 170, 477),( 171, 479)
,( 172, 480),( 173, 481),( 174, 483),( 175, 487),( 176, 485),( 177, 486),( 178, 484),( 179, 488),( 180, 490),( 181, 482),( 182, 489),( 183, 492),( 184, 491)
,( 185, 493),( 186, 478),( 187, 494),( 207, 573),( 209, 577),( 210, 578),( 211, 574),( 212, 575),( 213, 576),( 214, 579),( 215, 580),( 216, 581),( 217, 582)
,( 218, 583),( 219, 584),( 220, 585),( 221, 586),( 222, 587),( 223, 588),( 224, 589),( 225, 590),( 226, 591),( 227, 592),( 228, 593),( 229, 594),( 230, 595)
,( 231, 596),( 232, 597),( 233, 598),( 234, 599),( 235, 600),( 236, 601),( 237, 602),( 238, 603),( 239, 604),( 240, 605),( 241, 606),(-1,-3000)
-- State  568
,( 5, 609),(-1,-147)
-- State  569
,(-1,-149)
-- State  570
,(-1,-150)
-- State  571
,(-1,-151)
-- State  572
,(-1,-152)
-- State  573
,(-1,-153)
-- State  574
,(-1,-154)
-- State  575
,(-1,-155)
-- State  576
,(-1,-156)
-- State  577
,(-1,-157)
-- State  578
,(-1,-158)
-- State  579
,(-1,-159)
-- State  580
,(-1,-160)
-- State  581
,(-1,-161)
-- State  582
,(-1,-162)
-- State  583
,(-1,-163)
-- State  584
,(-1,-164)
-- State  585
,(-1,-165)
-- State  586
,(-1,-166)
-- State  587
,(-1,-167)
-- State  588
,(-1,-168)
-- State  589
,(-1,-169)
-- State  590
,(-1,-170)
-- State  591
,(-1,-171)
-- State  592
,(-1,-172)
-- State  593
,(-1,-173)
-- State  594
,(-1,-174)
-- State  595
,(-1,-175)
-- State  596
,(-1,-176)
-- State  597
,(-1,-177)
-- State  598
,(-1,-178)
-- State  599
,(-1,-179)
-- State  600
,(-1,-180)
-- State  601
,(-1,-181)
-- State  602
,(-1,-182)
-- State  603
,(-1,-183)
-- State  604
,(-1,-184)
-- State  605
,(-1,-185)
-- State  606
,(-1,-186)
-- State  607
,(-1,-187)
-- State  608
,( 4, 610),(-1,-3000)
-- State  609
,( 2, 607),( 8, 212),( 109, 211),( 110, 214),( 111, 213),( 112, 215),( 113, 216),( 114, 217),( 115, 209),( 116, 210),( 117, 218),( 118, 219),( 119, 220)
,( 120, 221),( 121, 222),( 122, 223),( 123, 224),( 124, 225),( 125, 226),( 126, 227),( 140, 450),( 141, 451),( 142, 452),( 143, 453),( 144, 454),( 145, 455)
,( 146, 457),( 147, 458),( 148, 465),( 149, 461),( 150, 462),( 151, 464),( 152, 456),( 153, 463),( 154, 459),( 155, 460),( 156, 438),( 157, 439),( 158, 440)
,( 159, 441),( 160, 442),( 161, 443),( 162, 446),( 163, 447),( 164, 448),( 165, 444),( 166, 445),( 167, 449),( 168, 475),( 169, 476),( 170, 477),( 171, 479)
,( 172, 480),( 173, 481),( 174, 483),( 175, 487),( 176, 485),( 177, 486),( 178, 484),( 179, 488),( 180, 490),( 181, 482),( 182, 489),( 183, 492),( 184, 491)
,( 185, 493),( 186, 478),( 187, 494),( 207, 573),( 209, 577),( 210, 578),( 211, 574),( 212, 575),( 213, 576),( 214, 579),( 215, 580),( 216, 581),( 217, 582)
,( 218, 583),( 219, 584),( 220, 585),( 221, 586),( 222, 587),( 223, 588),( 224, 589),( 225, 590),( 226, 591),( 227, 592),( 228, 593),( 229, 594),( 230, 595)
,( 231, 596),( 232, 597),( 233, 598),( 234, 599),( 235, 600),( 236, 601),( 237, 602),( 238, 603),( 239, 604),( 240, 605),( 241, 606),(-1,-3000)
-- State  610
,( 2, 128),(-1,-3000)
-- State  611
,(-1,-148)
-- State  612
,( 4, 467),(-1,-188)
-- State  613
,(-1,-112)
);
--  The offset vector
SHIFT_REDUCE_OFFSET : array (0.. 613) of Integer :=
( 0,
 9, 10, 11, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
 32, 41, 47, 51, 54, 57, 59, 60, 61, 63, 64, 65, 66, 67, 70, 72,
 78, 84, 85, 91, 97, 103, 104, 105, 106, 107, 108, 111, 112, 114, 116, 122,
 123, 124, 130, 131, 132, 133, 134, 140, 143, 148, 156, 160, 162, 163, 164, 165,
 169, 173, 174, 177, 180, 186, 187, 192, 193, 194, 195, 196, 204, 205, 206, 207,
 208, 209, 210, 211, 212, 217, 219, 220, 221, 225, 227, 230, 231, 233, 238, 240,
 243, 244, 249, 251, 252, 253, 256, 257, 258, 259, 262, 265, 266, 267, 269, 270,
 274, 275, 276, 277, 278, 279, 280, 282, 283, 286, 287, 292, 294, 295, 296, 299,
 300, 301, 302, 303, 307, 308, 311, 312, 315, 318, 321, 322, 323, 324, 326, 327,
 329, 337, 340, 342, 343, 345, 346, 347, 348, 349, 352, 355, 357, 365, 366, 367,
 368, 369, 370, 371, 372, 374, 376, 410, 423, 427, 458, 459, 460, 463, 464, 465,
 466, 469, 471, 474, 481, 482, 485, 486, 489, 493, 494, 497, 501, 502, 503, 504,
 506, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522,
 523, 524, 525, 526, 531, 532, 533, 534, 535, 536, 537, 538, 539, 540, 541, 542,
 543, 544, 545, 546, 547, 549, 550, 551, 552, 553, 554, 555, 556, 557, 558, 559,
 560, 561, 562, 563, 564, 565, 566, 567, 568, 569, 570, 571, 572, 573, 574, 575,
 576, 577, 578, 579, 580, 581, 582, 583, 584, 585, 586, 587, 588, 589, 590, 591,
 592, 593, 594, 595, 596, 599, 600, 601, 602, 603, 604, 606, 607, 608, 609, 610,
 611, 612, 613, 614, 615, 616, 617, 618, 622, 624, 627, 629, 631, 665, 666, 667,
 668, 669, 682, 683, 685, 693, 700, 701, 703, 704, 706, 708, 709, 710, 729, 733,
 740, 741, 749, 750, 751, 752, 753, 754, 755, 756, 757, 758, 759, 761, 762, 781,
 784, 785, 786, 793, 794, 797, 799, 801, 802, 803, 804, 805, 806, 807, 808, 809,
 810, 811, 812, 813, 815, 817, 818, 820, 822, 824, 826, 828, 832, 837, 838, 839,
 840, 841, 842, 843, 844, 845, 846, 847, 848, 867, 868, 876, 877, 880, 882, 884,
 889, 891, 895, 896, 898, 902, 904, 906, 910, 912, 914, 916, 917, 919, 920, 921,
 922, 923, 924, 927, 928, 930, 931, 932, 933, 934, 935, 937, 939, 988, 990, 992,
 1033, 1035, 1036, 1038, 1079, 1080, 1081, 1082, 1084, 1106, 1107, 1109, 1110, 1112, 1114, 1116,
 1120, 1122, 1123, 1124, 1125, 1126, 1127, 1128, 1129, 1130, 1131, 1132, 1133, 1134, 1135, 1136,
 1137, 1138, 1139, 1140, 1141, 1142, 1143, 1144, 1145, 1146, 1147, 1148, 1149, 1150, 1151, 1152,
 1153, 1154, 1155, 1168, 1169, 1198, 1200, 1202, 1203, 1204, 1205, 1206, 1207, 1208, 1209, 1210,
 1211, 1212, 1213, 1214, 1215, 1216, 1217, 1218, 1219, 1220, 1221, 1222, 1223, 1224, 1225, 1226,
 1227, 1259, 1261, 1263, 1264, 1265, 1266, 1267, 1269, 1271, 1272, 1273, 1274, 1275, 1279, 1280,
 1284, 1285, 1286, 1335, 1336, 1338, 1339, 1340, 1341, 1342, 1343, 1344, 1345, 1346, 1347, 1348,
 1349, 1350, 1391, 1393, 1394, 1395, 1396, 1397, 1398, 1399, 1405, 1406, 1407, 1408, 1409, 1410,
 1411, 1412, 1413, 1414, 1455, 1456, 1478, 1480, 1481, 1482, 1511, 1512, 1544, 1545, 1546, 1547,
 1548, 1550, 1551, 1552, 1583, 1584, 1586, 1689, 1691, 1692, 1693, 1694, 1695, 1696, 1697, 1698,
 1699, 1700, 1701, 1702, 1703, 1704, 1705, 1706, 1707, 1708, 1709, 1710, 1711, 1712, 1713, 1714,
 1715, 1716, 1717, 1718, 1719, 1720, 1721, 1722, 1723, 1724, 1725, 1726, 1727, 1728, 1729, 1730,
 1732, 1835, 1837, 1838, 1840);
end Rc_Shift_Reduce;
