load 'viewmat'

replacements =. 'position=<';'';',';'';'> velocity=<';' ';'>';'';'-';'_'
path =.  '/Users/pcorey/advent_of_code_2018/day_10/input'

input =. ". > cutopen replacements rplc~ (1!:1) < path

tick =. 3 : 0
  input =. 0 {:: y
  prev =. 1 {:: y
  next =. +/"1 |:"2 (2 2 $ ])"1 input
  max =. >./ 1 {"1 next
  min =. <./ 1 {"1 next
  diff =. | max - min
  if. diff < prev do.
    (next (0 1})"1 input);diff
  else.
    y
  end.
)

to_mat =. 3 : 0
  min_x =. <./ 0 {"1 y
  min_y =. <./ 1 {"1 y
  max_x =. >./ 0 {"1 y
  max_y =. >./ 1 {"1 y
  coords =. 0 1 {"1 y
  coords =. (min_x,min_y) -~"1 coords
  mat =. ((1 + | max_y - min_y),(1 + | max_x - min_x)) $ 0
  updates =. (<@:;/@:|.)"1 coords
  1 updates} mat
)

viewmat to_mat 0 {:: tick^:_ input;_
