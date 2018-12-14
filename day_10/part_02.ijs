load 'viewmat'

replacements =. 'position=<';'';',';'';'> velocity=<';' ';'>';'';'-';'_'
path =.  '/Users/pcorey/advent_of_code_2018/day_10/input'

input =. ". > cutopen replacements rplc~ (1!:1) < path

tick =. 3 : 0
  input =. 0 {:: y
  prev =. 1 {:: y
  count =. 2 {:: y
  next =. +/"1 |:"2 (2 2 $ ])"1 input
  max =. >./ 1 {"1 next
  min =. <./ 1 {"1 next
  diff =. | max - min
  if. diff < prev do.
    (next (0 1})"1 input);diff;(count + 1)
  else.
    y
  end.
)

2 {:: tick^:_ input;_;0
