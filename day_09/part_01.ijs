replacements =. 'players; last marble is worth';'';'points';''
path =.  '/Users/pcorey/advent_of_code_2018/day_09/input'

NB. Load the file, remove everything that's not a number, and assign.
'players highest_marble' =. ". replacements rplc~ (1!:1) < path

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
    circle =. _7 |. circle
    NB. Add the marble we landed on to the player's score.
    score =. score + {. circle
    NB. Update the scores list with the player's new score.
    scores =. score (player}) scores
    NB. Remove the marble we landed on.
    circle =. }. circle
  else.
    NB. 
    circle =. marble , 2 |. circle
  end.

  NB. Return our updates arguments.
  circle;(player + 1);(1 + marble);scores
)

NB. Place as many turns as the game calls for.
scores =. 3 {:: (turn^:highest_marble) 0;0;1;(players $ 0)

NB. Find our max score.
>./scores