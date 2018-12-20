NB. ﻿   a =. 5 5 $ i. 25
NB.    a
NB.  0  1  2  3  4
NB.  5  6  7  8  9
NB. 10 11 12 13 14
NB. 15 16 17 18 19
NB. 20 21 22 23 24
NB.    3 <\"2 |:"2 > 3 <\ a
NB. ┌────────┬────────┬────────┐
NB. │0 5 10  │1 6 11  │2 7 12  │
NB. │1 6 11  │2 7 12  │3 8 13  │
NB. │2 7 12  │3 8 13  │4 9 14  │
NB. ├────────┼────────┼────────┤
NB. │5 10 15 │6 11 16 │7 12 17 │
NB. │6 11 16 │7 12 17 │8 13 18 │
NB. │7 12 17 │8 13 18 │9 14 19 │
NB. ├────────┼────────┼────────┤
NB. │10 15 20│11 16 21│12 17 22│
NB. │11 16 21│12 17 22│13 18 23│
NB. │12 17 22│13 18 23│14 19 24│
NB. └────────┴────────┴────────┘

size =. 300

chunk_by =. [ <\"2 [: |:"2 [: > <\ 

grid =. (size,size) $ i. size * size

grid_serial_number =. 9424

init =. 3 : 0
  'cy cx' =. (0,size)#:y
  rack_id =. cx + 10
  power =. rack_id*cy
  power =. power + grid_serial_number
  power =. power * rack_id
  power =. 10 | power <.@% 100
  power =. power - 5
  power
)

NB. Build and populate our fuel cell grid
grid =. init"0 grid

NB. Chunk into 3x3 sub-grids
chunks =. 3 chunk_by grid

NB. Find the sum of each sub-grid and flatten the list
flat_chunks =. , +/"1 ,"2 > chunks

NB. Find the max sub-grid sum
max =. >./ flat_chunks

NB. And find that max's index
highest =. flat_chunks i. >./ flat_chunks

NB. Get the resulting x/y coord
result =. |. (0,(size-2))#:highest

echo result