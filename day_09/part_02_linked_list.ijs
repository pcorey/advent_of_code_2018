replacements =. 'players; last marble is worth';'';'points';''

path =.  '/Users/pcorey/advent_of_code_2018/day_09/sample'

NB. Load the file, remove everything that's not a number, and assign. 'players highest_marble' =. ". replacements rplc~ (1!:1) < path 
init =. 3 : 0
  l =. <": y
  v__l =. y
  n__l =. 0
  p__l =. 0
)

insert =. 4 : 0
  head =. x
  l =. <": y
  nl =. <": head
  pl =. <": p__nl
  v__l =. y
  n__l =. n__pl
  p__l =. p__nl
  n__pl =. y
  p__nl =. y
  v__l
)

remove =. 3 : 0
  l =. <": y
  nl =. <": n__l
  pl =. <": p__l
  n__pl =. n__l
  p__nl =. p__l
  v__nl
)

rotate_cw =. 3 : 0
  l =. <": y
  n__l
)

rotate_ccw =. 3 : 0
  l =. <": y
  p__l
)

NB. head =. init 0
NB. assert head = 0

NB. head =. head insert 1
NB. assert head = 1

NB. head =. head insert 2
NB. assert head = 2

NB. head =. head insert 3
NB. assert head = 3

NB. head =. remove head
NB. assert head = 2

NB. head =. remove head
NB. assert head = 1

NB. head =. remove head
NB. assert head = 0

NB. head =. head insert 1
NB. head =. head insert 2
NB. head =. head insert 3
NB. assert head = 3

NB. head =. rotate_cw head
NB. assert head = 2

NB. head =. rotate_cw head
NB. assert head = 1

NB. head =. rotate_cw head
NB. assert head = 0

NB. head =. rotate_cw head
NB. assert head = 3

turn =. 3 : 0
  NB. Destructure my arguments.
  circle =. 0 {:: y
  player =. players | 1 {:: y
  marble =. 2 {:: y
  scores =. 3 {:: y

  if. 0 = 23 | marble do.
    NB. Grab the current player's current score.
    score =. player { scores
    NB. Add the marble they would have placed to their score.
    score =. score + marble
    NB. Rotate circle 7 counter-clockwise
    circle =. (rotate_ccw^:7) circle
    NB. Add the marble we landed on to the player's score.
    score =. score + circle
    NB. Update the scores list with the player's new score.
    scores =. score (player}) scores
    NB. Remove the marble we landed on.
    circle =. remove circle
  else.
    NB. 
    circle =. (rotate_cw^:2) circle
    circle =. circle insert marble
  end.

  NB. Return our updates arguments.
  circle;(player + 1);(1 + marble);scores
)

head =. init 0

NB. Place as many turns as the game calls for.
scores =. 3 {:: (turn^:(highest_marble*1)) head;0;1;(players $ 0)'

Find our max score.
>./scores
