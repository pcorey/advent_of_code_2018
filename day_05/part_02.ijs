input =. (1!:1) < '/Users/pcorey/advent_of_code_2018/day_05/input'

test =. ([ -.@:= ]) * tolower@:[ = tolower@:]
pass =. ([,]) ` (}.@:]) @. ([ test {.@:])

remove =. ] #~ [ i. [: tolower ]
remove_nubs =. [ <@:remove"1~ (1 ,~ #@:nub) $ nub =. [: ~. tolower

echo <./ ([: # [: pass/^:_"1 >)"0 remove_nubs input
