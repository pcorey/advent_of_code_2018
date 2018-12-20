load 'viewmat'

iterations =. 20

replacements =. 'initial state: ';'';'=> ';'';'.';'0 ';'#';'1 '
path =.  '/Users/pcorey/advent_of_code_2018/day_12/input'
replaced =. cutopen replacements rplc~ (1!:1) < path

NB. Parse out initial state as boolean array
initial =. ". > {. replaced

NB. Build matrix of replacement patterns
patterns =. }:"1 ". > }. replaced

NB. Build array of replacement values
replacements =. {:"1 ". > }. replaced

NB. Replace a length-5 y with a replacement value
replace =. replacements"_ {~ patterns&i.

iterate =. 3 : 0
  (1 ,: 5) replace;._3 (0,0,0,0,y,0,0,0,0)
)

iterated =. iterate^:(<iterations) (initial)
viewmat iterated

echo +/ iterated # (iterations * 2) -~ i. # iterated

