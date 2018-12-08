base_time =. 60
workers   =. 4

lines =. >@:cutopen@:(1!:1)
input =. lines < '/Users/pcorey/advent_of_code_2018/day_07/input'

parse =. (5 36)&{"1

attach_time =. 3 : 0
  y;(1 + base_time + 65 -~ a. i. y)
)

pairs =. attach_time"0 |."1 parse input

steps =. [: /:~ [: ~. ,

strip_time =. 0&{::"1

work =. 3 : 0
  step =. 0 {:: y
  time =. 1 {:: y
  step;(time - 1)
)

tick =. 3 : 0
  done =. > 0 {:: y
  pairs =. > 1 {:: y
  working =. > 2 {:: y
  count =. > 3 {:: y

  if. 0 = # pairs do.
    pairs =. 0 2 $ 0
  end.

  steps =. steps strip_time pairs
  left =. {."1 strip_time pairs
  right =. {:"1 strip_time pairs
  free_steps =. steps #~ -. steps e. (, > {."1 working)
  available_next_steps =. (attach_time"0 free_steps) #~ -. free_steps e. ~. left
  length =. ((# available_next_steps) <. workers <. (workers - # working))
  next_step =. (i. length) { available_next_steps


  if. # available_next_steps do.
    working =. working , next_step
  end.

  length =. (workers <. (# working))
  worked =. work"1 (i. length) { working
  working =. worked (i. length) } working

  completed =. , (0 = 1&{::)"1 working
  completed_steps =. , strip_time working #~ completed
  working =. working #~ -. completed

  next_pairs =. pairs #~ -. right e. completed_steps
  remaining_pairs =. pairs #~ right e. completed_steps

  append =. (done,completed_steps)"_
  return =. (done)"_
  next_done =. (append ` return @. (0 = # remaining_pairs)"_) _

  if. y -: (<next_done);(<next_pairs);(<working);(<count) do.
    next_count =. count
  else.
    next_count =. count + 1
  end.

  (<next_done);(<next_pairs);(<working);(<next_count)
)

append_last =. 4 : 0
  steps =. steps x
  missing =. steps #~ -. steps e. ~. y
  y,missing
)

result =. tick^:_ (<'');(<pairs);(<(0 2$0));(<_1)
string =. > 0 {:: result
all_steps =. steps strip_time pairs
missing =. all_steps #~ -. all_steps e. ~. string
missing_time =. 1 {:: attach_time missing
count =. 3 {:: result

echo 'Result:'
echo count + missing_time
