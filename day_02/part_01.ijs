read_lines =. >@:cutopen@:(1!:1) <
lines =. read_lines '/Users/pcorey/advent_of_code_2018/day_02/input'

group =. ([: ~. e.) # ]
count =. [: i."1&' ' group"1
twos_and_threes =. [: (2 3)&e."1 count

*/ +/ twos_and_threes lines
