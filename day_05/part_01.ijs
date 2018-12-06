input =. (1!:1) < '/Users/pcorey/advent_of_code_2018/day_05/input'

test =. ([ -.@:= ]) * tolower@:[ = tolower@:]
pass =. ([,]) ` (}.@:]) @. ([ test {.@:])

echo # pass/^:_ input
