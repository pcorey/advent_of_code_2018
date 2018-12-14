replacements =. 'players; last marble is worth';'';'points';''

path =.  '/Users/pcorey/advent_of_code_2018/day_09/input'

NB. Load the file, remove everything that's not a number, and assign.
'players highest_marble' =. ". replacements rplc~ (1!:1) < path

type =. 4

init =. 3 : 0
  NB. Allocate space for a new node.
  addr =. mema 8*type
  NB. Write the value, prev ptr, and next ptr.
  res =. (0,addr,addr) memw (addr,0,3,type)
  addr
)

insert =. 4 : 0
  'v pp pn'    =. memr x, 0,3,type
  'pv ppp ppn' =. memr pp,0,3,type
  'nv npp npn' =. memr pn,0,3,type

  NB. Allocate and write new node.
  addr =. mema 8*type

  if. *./ x = pp , pn do.
    NB. Only 1 element in the list.
    (y,x,x) memw addr,0,3,type
    (v,addr,addr) memw x,0,3,type
  else.
    if. pp = pn do.
      NB. Only 2 elements in the list.
      (y,pn,x) memw addr,0,3,type
      (v,addr,pn) memw x,0,3,type
      (nv,x,addr) memw pn,0,3,type
    else.
      NB. Normal insertion case.
      (y,pp,x) memw addr,0,3,type
      (v,addr,pn) memw x,0,3,type
      (nv,x,npn) memw pn,0,3,type
      (pv,ppp,addr) memw pp,0,3,type
    end.
  end.


  addr
)

remove =. 3 : 0
  'v pp pn' =. memr y,0,3,type
  'pv ppp ppn' =. memr pp,0,3,type
  'nv npp npn' =. memr pn,0,3,type
  
  NB. Free the current node.
  memf y

  NB. Update neighbor nodes
  (pv,ppp,pn) memw pp,0,3,type
  (nv,pp,npn) memw pn,0,3,type

  pn
)

rotate_cw =. 3 : 0
  'v pp pn' =. memr y,0,3,type
  pn
)

rotate_ccw =. 3 : 0
  'v pp pn' =. memr y,0,3,type
  pp
)

value =. 3 : 0
  'v pp pn' =. memr y,0,3,type
  v
)

print =. 3 : 0
  addr =. 0 {:: y
  seen =. 1 {:: y
  vals =. 2 {:: y
  if. -. addr e. seen do.
    'v pp pn' =. memr addr,0,3,type
    print pn;(addr,seen);(vals,v)
  else.
    vals
  end.
)

turn =. 3 : 0
  NB. Destructure my arguments.
  circle =. 0 {:: y
  player =. players | 1 {:: y
  marble =. 2 {:: y
  scores =. 3 {:: y

  NB. echo print circle;(0$0);(0$0)

  if. 0 = 23 | marble do.
    NB. Grab the current player's current score.
    score =. player { scores
    NB. Add the marble they would have placed to their score.
    score =. score + marble
    NB. Rotate circle 7 counter-clockwise
    circle =. (rotate_ccw^:7) circle
    NB. Add the marble we landed on to the player's score.
    score =. score + value circle
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
scores =. 3 {:: (turn^:(highest_marble*100)) head;0;1;(players $ 0)

NB. Find our max score.
>./scores
