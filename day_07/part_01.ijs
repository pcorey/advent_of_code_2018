lines =. >@:cutopen@:(1!:1)
input =. lines < '/Users/pcorey/advent_of_code_2018/day_07/sample'

parse =. (5 36)&{"1

pairs =. |."1 parse input

steps =. [: /:~ [: ~. ,

next =. 3 : 0
  done =. 0 {:: y
  pairs =. 1 {:: y
  steps =. steps pairs
  left =. {."1 pairs
  right =. {:"1 pairs
  next_step =. {. steps #~ -. steps e. ~. left
  next_pairs =. pairs #~ -. right e. next_step
  remaining_pairs =. pairs #~ right e. next_step

  append =. (done,next_step)"_
  return =. (done)"_
  next_step =. (append ` return @. (0 = # remaining_pairs)"_) _

  next_step;next_pairs
)

append_last =. 4 : 0
  steps =. steps x
  missing =. steps #~ -. steps e. ~. y
  y,missing
)

echo 'Result:'
echo pairs append_last 0{:: next^:_ '' ; pairs
