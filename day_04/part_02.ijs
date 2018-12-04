load 'regex'

lines =. >@:cutopen@:(1!:1)
input =. lines < '/Users/pcorey/advent_of_code_2018/day_04/input'

numbers =. ".@:(]#^:_1]#[) (e.&' 0123456789')

sleep_map =. 3 : 0
  1 y } 60 $ 0
)

filter =. (' ' -.@:= 0&{)"1 # ]

parse_log =. 3 : 0
  head =. {. y
  rest =. filter }. y
  'Y M D h m id' =. numbers head
  sleep =. sleep_map"0 ({:"1 numbers"1 rest #~ (# rest) $ 1 0)
  wake =. _1 * sleep_map"0 ({:"1 numbers"1 rest #~ (# rest) $ 0 1)
  id&;"2 +/\"1 sleep + wake
)

parse =. 3 : 0
  groups =. +/\ ('G' = 19&{::)"1 y
  masks =. groups&e."0 ~. groups
  parse_log"_1 masks # y
)

group_days =. 3 : 0
  id =. 0 {:: {. y
  days =. ,/ 1 {::"_1 y
  id;days
)

group =. 3 : 0
  ids =. 0 {::"1 y
  ids group_days/. y
)

stats =. 3 : 0
  id =. 0 {:: y
  days =. 1 {:: y
  overlap =. +/ days
  most =. >./ overlap
  minute =. overlap i. most
  most; minute; id; days
)

log =. /:~ input
result =. (2&{:: * 1&{::) {. \:~ stats"1 group parse log
echo 'Result: '
echo result
