lines =. >@:cutopen@:(1!:1)
input =. lines < '/Users/pcorey/advent_of_code_2018/day_02/input'

compare =. 4 : 0
  differences =. x ([: +/ [: -. =) y
  differences;x;y
)

comparisons =. ,/ input compare"1/ input
ones =. 1&= 0&{::"1 comparisons
words =. > }."1 ones # comparisons
([: ~. (-.@:~: # ])"1/) words
