load 'viewmat'

iterations =. 20

replacements =. 'initial state: ';'';'=> ';'';'.';'0 ';'#';'1 '
path =.  '/Users/pcorey/advent_of_code_2018/day_12/input'
replaced =. cutopen replacements rplc~ (1!:1) < path

NB. Parse out initial state as numbered pots
initial =. I. ". > {. replaced

NB. Build matrix of replacement patterns
patterns_and_output =. ". > }. replaced
patterns_to_keep =. {:"1 patterns_and_output
patterns =. patterns_to_keep # ([: < 2 -~ I.)"1 }:"1 patterns_and_output
NB. patterns =. patterns #~ 1 {:: patterns

check_pattern =. 4 : 0
  pot_to_check =. 0 {:: x
  pots_with_plants =. 1 {:: x
  pattern_to_check =. > y

  pots_above_cutoff =. pots_with_plants >: pot_to_check - 2
  pots_below_cutoff =. pots_with_plants <: pot_to_check + 2
  pots_to_check =. pots_above_cutoff *. pots_below_cutoff
  pots_to_check =. pots_to_check # pots_with_plants

  (pot_to_check + pattern_to_check) -: pots_to_check
)

check_pot =. 4 : 0
  pot_to_check =. y
  pots_with_plants =. x
  +./ (pot_to_check;pots_with_plants)&check_pattern"0 patterns
)

iterate =. 3 : 0
  pots_with_plants =. > y
  pots_to_check =. (2 -~ <./ pots_with_plants) + i. 4 + (>./ - <./) pots_with_plants
  next_pots_with_plants =. < pots_to_check #~ pots_with_plants&check_pot"0 pots_to_check
  next_pots_with_plants
)

normalize =. <@:(<./ -~ ])@:>

find_cycle =. 3 : 0
  previous =. 0 {:: y
  previous_normalized =. 1 {:: y
  next =. iterate {: previous
  next_normalized =. normalize next
  if. (next_normalized e. previous_normalized) do.
    NB. next_min =. <./ > next
    NB. previous_min =. <./ > {: previous
    NB. (# previous);(previous_normalized i. next_normalized);(next_min - previous_min);({: previous)
    index =. previous_normalized i. next_normalized
    index;(index { previous)
  else.
    if. 1000 < # previous do.
      return.
    end.
    find_cycle (previous,next);<(previous_normalized,next_normalized)
  end.
)

NB. iterate^:84 <initial
NB. iterate^:85 <initial
NB. iterate^:86 <initial
NB. iterate^:87 <initial
NB. iterate^:88 <initial

NB. +/>iterate^:84 <initial
NB. +/>iterate^:85 <initial
NB. +/>iterate^:86 <initial
NB. +/>iterate^:87 <initial
NB. +/>iterate^:88 <initial

NB. +/>iterate^:100 <initial

result =. find_cycle (<initial);(<normalize<initial)
to_add =. 50000000000 - (0 {:: result)
final_pots_with_plants =. to_add + (1 {:: result)
+/ final_pots_with_plants