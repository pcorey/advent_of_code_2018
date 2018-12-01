input =. 1!:1 < '/Users/pcorey/advent_of_code_2018/day_01/input'
boxed =. cutopen input
lines =. > boxed
numbers =. 0 "./ lines

package_next =. 4 : 0
  (x,({:x)+({.y));(1|.y)
)

package_result =. 4 : 0
  x;y
)

change =. 3 : 0
  frequencies =. >@{. y
  changes =. >@{: y
  frequency =. {: frequencies
  change =. {. changes
  repeated =. frequency e. (}: frequencies)
  next =. package_next ` package_result @. repeated
  frequencies next changes
)

result =. change^:_ (0;numbers)
echo 'Repeated frequency:'
{:@:{.@:> result
