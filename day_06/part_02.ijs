load 'viewmat'

lines =. >@:cutopen@:(1!:1)
input =. lines < '/Users/pcorey/advent_of_code_2018/day_06/input'

d =. [: +/ |@-

rot =. [: |. |:

wh =. 1 + >./ - <./

coords =. 3 : 0
  'w h' =. (1 + >./ - <./) y
  (<./y) +"1  (i. h) ,"0~ ((h,w) $ i. w)
)

distances =. 4 : 0
  +/ ((>x) d"1~ ])"1 y
)

grid =. 3 : 0
  (<y) distances"1 coords y
)

numbers =. ". input
viewmat 10000 > grid numbers
