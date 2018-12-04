lines =. >@:cutopen@:(1!:1)
input =. lines < '/Users/pcorey/advent_of_code_2018/day_03/input'

parse =. 3 : 0
  m =. a. e. '1234567890'
  s =. 1   2 2 $ 0 0  1 1
  s =. s , 2 2 $ 0 3  1 0
  ". > (0;s;m;0 _1 0 0) ;:"1 y
)

cut_cloth =. 1 $~ |.

cut_and_shift =. 3 : 0
  left  =. 1 {:: y
  top   =. 2 {:: y
  cloth =. cut_cloth (0 0 0 1 1 # y)
  cloth =. 0 ,^:top cloth
  cloth =. 0 ,"1^:left cloth
  cloth
)

# (>&1 # ]) , +/ cut_and_shift"1 parse input
