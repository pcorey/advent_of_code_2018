load 'viewmat'

lines =. >@:cutopen@:(1!:1)
input =. lines < '/Users/pcorey/advent_of_code_2018/day_06/input'

d =. [: +/ |@-
NB.     2 2 d 3 2
NB. 1

rot =. [: |. |:
NB.     rot 2 2 $ i. 4
NB. 1 3
NB. 0 2

wh =. 1 + >./ - <./
NB.     wh (1 1),:(2 2)
NB. 1 1

coords =. 3 : 0
  'w h' =. (1 + >./ - <./) y
  (<./y) +"1  (i. h) ,"0~ ((h,w) $ i. w)
)
NB.     coords (1 1),:(3 2)
NB. 1 1
NB. 2 1
NB. 3 1

NB. 1 2
NB. 2 2
NB. 3 2

grid =. 4 : 0
  (x d ])"1 coords > y
)
NB.     n =. 2 2 $ i. 4
NB.     n grid"1 <n
NB. 0 1 2
NB. 1 2 3
NB. 2 3 4

NB. 4 3 2
NB. 3 2 1
NB. 2 1 0

compare =. 4 : 0
  'vx ix' =. x
  'vy iy' =. y
  vx = vy
)

tie =. 4 : 0
  (0 {:: x);_1
)

pick =. 4 : 0
  'vx ix' =. x
  'vy iy' =. y
  v =. vx ((y"_) ` (x"_) @. <) vy
)

add =. 4 : 0
  x (pick ` tie @. compare) y
)

edges =. 3 : 0
  top =. 0 { y
  right =. 0 { rot^:1 y
  bottom =. 0 { rot^:2 y
  left =. 0 { rot^:3 y
  ~. top , right , bottom , left
)

numbers =. ". input
grids =. ([ ;"0 i.@#) numbers grid"1 <numbers
sum =. add"1/ grids
groups =. (1&{::)"1 sum
NB. echo groups

without =. _1 , edges groups
raveled =. ,groups
0 0 {:: \:~ ({. ;~ #)/.~ raveled #~ -. raveled e. without
echo 'Done.'