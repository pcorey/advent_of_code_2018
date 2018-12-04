lines =. >@:cutopen@:(1!:1)
input =. lines < '/Users/pcorey/advent_of_code_2018/day_03/input'

parse =. ".@:(]#^:_1]#[) (e.&' 0123456789')

repackage =. 3 : 0
  'i l t w h' =. y
  i,l,t,(l + w),(t + h)
)

intersect =. 4 : 0
  'i_1 l_1 t_1 r_1 b_1' =. x
  'i_2 l_2 t_2 r_2 b_2' =. y
  -.+./(l_2>:r_1),(r_2<:l_1),(t_2>:b_1),(b_2<:t_1)
)

parsed =. parse"1 input
({."1 parsed) #~ -. 1 i. +/ intersect"1/~ repackage"1 parsed
