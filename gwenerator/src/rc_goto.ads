package Rc_Goto is

    type Small_Integer is range -32_000 .. 32_000;

    type Goto_Entry is record
        Nonterm  : Small_Integer;
        Newstate : Small_Integer;
    end record;

  --pragma suppress(index_check);

    subtype Row is Integer range -1 .. Integer'Last;

    type Goto_Parse_Table is array (Row range <>) of Goto_Entry;

    Goto_Matrix : constant Goto_Parse_Table :=
       ((-1,-1)  -- Dummy Entry.
-- State  0
,(-22,18),(-18,17),(-17,16),(-16,15),(-15,14),(-14,13),(-13,12),(-12,11),(-11,10),(-10,9),(-9,8)
,(-8,7),(-7,6),(-6,5),(-5,4),(-4,3),(-3,1),(-2,26)
-- State  3
,(-22,18),(-18,17),(-17,16),(-16,15),(-15,14),(-14,13),(-13,12),(-12,11),(-11,10),(-10,9),(-9,8)
,(-8,7),(-7,6),(-6,5),(-5,4),(-4,3),(-3,27)
-- State  18
,(-135,37),(-112,35),(-23,34)
-- State  19
,(-44,42),(-26,50)
-- State  20
,(-22,52)
-- State  34
,(-24,61)
-- State  36
,(-44,42),(-26,63)
-- State  37
,(-44,42),(-26,64)
-- State  38
,(-137,65)
-- State  39
,(-44,42),(-26,66)
-- State  40
,(-44,42),(-26,67)
-- State  41
,(-31,70)
-- State  42
,(-44,42),(-26,71)
-- State  50
,(-31,72)
-- State  54
,(-44,42),(-26,75)
-- State  57
,(-44,42),(-26,76)
-- State  61
,(-25,77)
-- State  62
,(-44,42),(-26,78)
-- State  63
,(-31,79)
-- State  64
,(-136,82),(-22,80)
-- State  65
,(-142,85),(-141,84),(-140,83),(-138,93)
-- State  66
,(-22,94)
-- State  70
,(-167,96),(-166,99),(-22,97)
-- State  72
,(-155,101),(-154,100),(-153,103),(-22,102)
-- State  73
,(-22,104)
-- State  75
,(-31,105)
-- State  76
,(-31,106)
-- State  77
,(-44,42),(-26,107)
-- State  78
,(-113,108)
-- State  79
,(-131,111),(-130,110),(-129,109),(-128,114),(-22,112)
-- State  84
,(-142,85),(-141,84),(-140,115)
-- State  93
,(-146,120),(-145,119),(-144,117),(-143,116),(-139,123),(-31,118)
-- State  96
,(-167,96),(-166,125),(-22,97)
-- State  99
,(-34,129)
-- State  101
,(-155,101),(-154,130),(-22,102)
-- State  103
,(-34,132)
-- State  105
,(-158,134),(-157,133),(-156,136)
-- State  106
,(-162,139),(-161,138),(-160,137),(-159,142),(-22,140)
-- State  107
,(-27,144)
-- State  108
,(-31,145)
-- State  110
,(-131,111),(-130,110),(-129,146),(-22,112)
-- State  114
,(-34,148)
-- State  118
,(-146,120),(-145,119),(-144,149)
-- State  119
,(-146,120),(-145,119),(-144,150)
-- State  121
,(-147,151)
-- State  124
,(-22,153)
-- State  126
,(-167,96),(-166,154),(-22,97)
-- State  134
,(-158,134),(-157,155)
-- State  136
,(-34,156)
-- State  138
,(-162,139),(-161,138),(-160,157),(-22,140)
-- State  142
,(-34,159)
-- State  143
,(-109,160)
-- State  144
,(-28,161)
-- State  145
,(-114,162)
-- State  147
,(-22,163)
-- State  149
,(-34,164)
-- State  151
,(-149,165),(-148,168)
-- State  152
,(-143,169),(-31,118)
-- State  153
,(-31,170)
-- State  161
,(-41,180),(-40,179),(-39,178),(-38,177),(-37,175),(-36,174),(-35,173),(-29,187),(-12,176)
-- State  162
,(-120,192),(-119,191),(-118,190),(-117,189),(-116,188),(-115,195)
-- State  163
,(-132,197)
-- State  170
,(-152,200),(-151,199),(-150,203)
-- State  171
,(-31,204)
-- State  173
,(-41,180),(-40,179),(-39,178),(-38,177),(-37,175),(-36,174),(-35,173),(-29,206),(-12,176)
-- State  182
,(-42,208)
-- State  183
,(-46,209),(-45,247),(-21,224)
-- State  184
,(-76,249),(-75,248),(-47,267)
-- State  185
,(-22,268)
-- State  186
,(-69,269),(-48,301)
-- State  187
,(-30,302)
-- State  189
,(-120,192),(-119,191),(-118,190),(-117,189),(-116,303)
-- State  195
,(-34,307)
-- State  196
,(-134,308),(-133,315)
-- State  198
,(-149,165),(-148,316)
-- State  200
,(-152,200),(-151,317)
-- State  201
,(-22,318)
-- State  203
,(-34,319)
-- State  204
,(-165,321),(-164,320),(-163,323),(-22,322)
-- State  205
,(-110,324)
-- State  302
,(-31,332)
-- State  304
,(-124,333)
-- State  306
,(-121,334)
-- State  321
,(-165,321),(-164,336),(-22,322)
-- State  323
,(-34,338)
-- State  326
,(-46,209),(-45,341),(-21,224)
-- State  331
,(-76,249),(-75,248),(-47,342)
-- State  332
,(-32,343)
-- State  334
,(-127,347),(-126,346),(-122,354)
-- State  335
,(-134,308),(-133,355)
-- State  343
,(-49,359),(-33,360)
-- State  344
,(-22,361)
-- State  345
,(-127,347),(-126,362)
-- State  347
,(-127,347),(-126,364)
-- State  354
,(-123,365)
-- State  357
,(-111,366)
-- State  358
,(-43,368)
-- State  359
,(-99,388),(-98,387),(-96,386),(-83,382),(-61,379),(-60,378),(-59,377),(-58,376),(-57,375),(-56,374),(-55,373)
,(-54,372),(-53,371),(-52,370),(-51,369),(-50,402)
-- State  360
,(-34,403)
-- State  361
,(-125,404)
-- State  363
,(-127,347),(-126,405)
-- State  365
,(-31,406)
-- State  380
,(-62,409)
-- State  381
,(-77,410)
-- State  382
,(-84,412)
-- State  383
,(-85,413)
-- State  384
,(-84,414)
-- State  385
,(-92,416)
-- State  386
,(-84,417)
-- State  387
,(-84,418)
-- State  388
,(-84,419)
-- State  389
,(-79,421),(-22,420)
-- State  390
,(-105,424),(-22,422)
-- State  402
,(-49,359),(-33,425)
-- State  404
,(-127,347),(-126,346),(-122,426)
-- State  406
,(-120,192),(-119,191),(-118,190),(-117,189),(-116,188),(-115,427)
-- State  409
,(-63,432),(-22,431)
-- State  410
,(-78,434)
-- State  411
,(-108,435)
-- State  412
,(-80,437)
-- State  413
,(-79,438),(-22,420)
-- State  414
,(-89,440)
-- State  416
,(-79,442),(-22,420)
-- State  417
,(-97,444)
-- State  418
,(-97,445)
-- State  419
,(-97,446)
-- State  420
,(-107,447)
-- State  421
,(-102,449)
-- State  424
,(-106,450)
-- State  427
,(-34,451)
-- State  432
,(-64,453)
-- State  434
,(-79,455),(-22,420)
-- State  436
,(-82,457),(-81,496),(-72,458),(-71,459),(-21,460)
-- State  438
,(-86,498)
-- State  439
,(-91,499),(-90,531),(-73,502),(-21,501)
-- State  442
,(-93,533)
-- State  443
,(-101,534),(-100,538),(-73,535),(-21,536)
-- State  448
,(-104,540),(-103,544),(-21,542)
-- State  455
,(-80,548)
-- State  456
,(-79,549),(-22,420)
-- State  496
,(-68,552)
-- State  497
,(-88,553),(-87,567),(-74,554),(-21,555)
-- State  531
,(-68,569)
-- State  532
,(-95,570),(-94,586),(-21,584)
-- State  538
,(-68,588)
-- State  539
,(-27,589)
-- State  544
,(-68,591)
-- State  545
,(-79,592),(-22,420)
-- State  547
,(-22,594)
-- State  550
,(-82,457),(-81,595),(-72,458),(-71,459),(-21,460)
-- State  551
,(-76,249),(-75,248),(-47,596)
-- State  567
,(-68,598)
-- State  568
,(-91,499),(-90,599),(-73,502),(-21,501)
-- State  586
,(-68,602)
-- State  587
,(-101,534),(-100,603),(-73,535),(-21,536)
-- State  590
,(-104,540),(-103,604),(-21,542)
-- State  592
,(-80,605)
-- State  594
,(-65,606)
-- State  597
,(-88,553),(-87,608),(-74,554),(-21,555)
-- State  600
,(-95,570),(-94,609),(-21,584)
-- State  610
,(-69,269),(-48,612)
-- State  612
,(-66,613)
-- State  614
,(-74,620),(-73,619),(-72,618),(-71,617),(-70,615),(-67,675),(-21,616)
-- State  676
,(-74,620),(-73,619),(-72,618),(-71,617),(-70,615),(-67,678),(-21,616)
-- State  677
,(-27,679)
-- State  679
,(-68,680)
);
--  The offset vector
GOTO_OFFSET : array (0.. 680) of Integer :=
(0,
18,18,18,35,35,35,35,35,35,35,35,35,35,35,35,35,35,
35,38,40,41,41,41,41,41,41,41,41,41,41,41,41,41,41,
42,42,44,46,47,49,51,52,54,54,54,54,54,54,54,54,55,
55,55,55,57,57,57,59,59,59,59,60,62,63,65,69,70,70,
70,70,73,73,77,78,78,79,80,82,83,88,88,88,88,88,91,
91,91,91,91,91,91,91,91,97,97,97,100,100,100,101,101,104,
104,105,105,108,113,114,115,115,119,119,119,119,120,120,120,120,123,
126,126,127,127,127,128,128,131,131,131,131,131,131,131,131,133,133,
134,134,138,138,138,138,139,140,141,142,142,143,143,144,144,146,148,
149,149,149,149,149,149,149,149,158,164,165,165,165,165,165,165,165,
168,169,169,178,178,178,178,178,178,178,178,178,179,182,185,186,188,
189,189,194,194,194,194,194,194,195,197,197,199,199,201,202,202,203,
207,208,208,208,208,208,208,208,208,208,208,208,208,208,208,208,208,
208,208,208,208,208,208,208,208,208,208,208,208,208,208,208,208,208,
208,208,208,208,208,208,208,208,208,208,208,208,208,208,208,208,208,
208,208,208,208,208,208,208,208,208,208,208,208,208,208,208,208,208,
208,208,208,208,208,208,208,208,208,208,208,208,208,208,208,208,208,
208,208,208,208,208,208,208,208,208,208,208,208,208,209,209,210,210,
211,211,211,211,211,211,211,211,211,211,211,211,211,211,211,214,214,
215,215,215,218,218,218,218,218,221,222,222,225,227,227,227,227,227,
227,227,227,229,230,232,232,234,234,234,234,234,234,234,235,235,235,
236,237,253,254,255,255,257,257,258,258,258,258,258,258,258,258,258,
258,258,258,258,258,258,259,260,261,262,263,264,265,266,267,269,271,
271,271,271,271,271,271,271,271,271,271,271,273,273,276,276,282,282,
282,284,285,286,287,289,290,290,292,293,294,295,296,297,297,297,298,
298,298,299,299,299,299,299,300,300,302,302,307,307,308,312,312,312,
313,317,317,317,317,317,320,320,320,320,320,320,320,321,323,323,323,
323,323,323,323,323,323,323,323,323,323,323,323,323,323,323,323,323,
323,323,323,323,323,323,323,323,323,323,323,323,323,323,323,323,323,
323,323,323,324,328,328,328,328,328,328,328,328,328,328,328,328,328,
328,328,328,328,328,328,328,328,328,328,328,328,328,328,328,328,328,
328,328,328,328,329,332,332,332,332,332,332,333,334,334,334,334,334,
335,337,337,338,338,338,343,346,346,346,346,346,346,346,346,346,346,
346,346,346,346,346,346,347,351,351,351,351,351,351,351,351,351,351,
351,351,351,351,351,351,351,351,352,356,356,356,359,359,360,360,361,
361,361,365,365,365,368,368,368,368,368,368,368,368,368,368,370,370,
371,371,378,378,378,378,378,378,378,378,378,378,378,378,378,378,378,
378,378,378,378,378,378,378,378,378,378,378,378,378,378,378,378,378,
378,378,378,378,378,378,378,378,378,378,378,378,378,378,378,378,378,
378,378,378,378,378,378,378,378,378,378,378,378,378,385,386,386, 387);

subtype Rule        is Natural;
subtype Nonterminal is Integer;

   Rule_Length : array (Rule range  0 ..  537) of Natural := (2,
1,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,2,1,3,1,1,1,2,1,2,1,1,1,1,1,2,1,2,1,
1,1,1,1,1,1,1,1,1,0,0,0,0,0,13,1,1,0,2,1,1,1,1,1,1,1,4,0,6,0,6,0,2,1,1,1,1,
1,1,1,2,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,0,0,3,1,1,1,1,1,1,1,1,
1,1,1,0,0,0,0,15,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
1,1,1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,2,4,1,3,1,1,1,
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,
5,0,2,0,3,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,1,1,0,4,0,3,1,3,1,1,1,
1,1,1,1,1,1,1,1,1,1,3,0,3,1,3,1,1,1,4,0,2,0,3,1,3,1,1,1,1,1,1,2,1,1,1,1,1,
1,1,1,3,1,1,1,1,3,1,1,3,1,1,0,3,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
1,1,1,1,1,1,1,1,1,1,1,1,3,0,3,1,3,1,1,1,0,6,1,1,0,4,0,4,0,0,0,10,0,0,0,9,0,
1,1,2,1,1,1,0,0,8,0,0,7,0,2,1,1,3,2,1,1,1,1,1,1,2,6,0,1,1,2,4,1,1,0,2,1,3,
1,1,1,1,1,1,4,1,1,1,1,1,1,1,1,0,5,0,1,1,2,1,1,1,1,1,1,1,1,1,1,3,1,2,1,0,3,
3,1,3,1,1,9,0,1,1,2,2,1,5,0,1,1,2,2,3,6,0,1,1,2,1,2,2,6,0,1,1,2,6,1,1,0,1,
1,2,3,4,5,1,2,3,1,1,1,1,1,1,1,1,1,1,1);
   Get_LHS_Rule: array (Rule range  0 ..  537) of Nonterminal := (-1,
-2,-2,-3,-3,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,
-4,-4,-4,-4,-19,-19,-20,-20,-21,-21,-21,-21,-21,-21,
-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,
-21,-21,-21,-21,-23,-25,-28,-30,-32,-5,-24,-24,-29,-29,
-35,-35,-35,-35,-35,-35,-35,-12,-42,-37,-43,-43,-26,-26,
-44,-44,-44,-44,-44,-44,-44,-38,-45,-45,-46,-46,-46,-46,
-46,-46,-46,-46,-46,-46,-46,-46,-46,-46,-46,-46,-39,-40,
-41,-36,-33,-49,-33,-50,-50,-50,-50,-50,-50,-50,-50,-50,
-50,-50,-62,-64,-65,-66,-51,-63,-63,-48,-48,-69,-69,-69,
-69,-69,-69,-69,-69,-69,-69,-69,-69,-69,-69,-69,-69,-69,
-69,-69,-69,-69,-69,-69,-69,-69,-69,-69,-69,-69,-69,-67,
-67,-70,-70,-70,-70,-70,-70,-70,-70,-70,-70,-70,-70,-70,
-70,-70,-70,-70,-70,-70,-70,-70,-70,-70,-70,-70,-70,-70,
-70,-70,-70,-70,-70,-70,-70,-70,-70,-70,-70,-70,-70,-70,
-70,-70,-70,-70,-70,-70,-70,-70,-70,-70,-70,-70,-70,-70,
-70,-70,-70,-70,-68,-68,-68,-47,-47,-75,-75,-76,-76,-76,
-76,-76,-76,-76,-76,-76,-76,-76,-76,-76,-76,-76,-76,-71,
-71,-71,-71,-71,-71,-71,-71,-71,-71,-71,-71,-71,-71,-71,
-71,-71,-71,-71,-71,-71,-77,-52,-78,-78,-80,-80,-81,-81,
-82,-82,-82,-82,-72,-72,-72,-72,-72,-72,-72,-72,-72,-72,
-72,-72,-72,-53,-83,-83,-83,-85,-54,-86,-86,-87,-87,-88,
-88,-88,-74,-74,-74,-74,-74,-74,-74,-74,-74,-74,-55,-89,
-89,-90,-90,-91,-91,-91,-56,-92,-92,-93,-93,-94,-94,-95,
-95,-95,-95,-95,-95,-95,-95,-95,-95,-95,-95,-95,-95,-95,
-57,-96,-96,-96,-96,-58,-98,-98,-59,-99,-99,-97,-97,-100,
-100,-101,-101,-101,-73,-73,-73,-73,-73,-73,-73,-73,-73,-73,
-73,-73,-73,-73,-73,-73,-73,-73,-73,-73,-73,-73,-73,-73,
-73,-73,-73,-73,-60,-102,-102,-103,-103,-104,-104,-104,-106,-61,
-105,-105,-107,-79,-108,-84,-109,-110,-111,-27,-112,-113,-114,-6,
-115,-115,-116,-116,-117,-117,-117,-121,-123,-120,-124,-125,-118,-122,
-122,-122,-126,-126,-126,-127,-127,-127,-127,-127,-127,-119,-7,-128,
-128,-129,-129,-130,-131,-131,-132,-132,-133,-133,-134,-134,-134,-134,
-134,-134,-8,-135,-135,-135,-135,-135,-135,-136,-136,-137,-9,-138,
-138,-140,-140,-141,-142,-142,-142,-142,-142,-142,-142,-139,-139,-143,
-144,-144,-145,-147,-145,-146,-148,-148,-149,-149,-11,-150,-150,-151,
-151,-152,-152,-10,-153,-153,-154,-154,-155,-13,-14,-156,-156,-157,
-157,-158,-15,-15,-16,-159,-159,-160,-160,-161,-162,-162,-163,-163,
-164,-164,-165,-17,-18,-166,-166,-166,-167,-167,-22,-22,-22,-168,
-168,-31,-31,-34,-34);
end Rc_Goto;
