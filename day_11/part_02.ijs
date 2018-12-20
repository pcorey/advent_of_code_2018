size =. 100

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

count =. 3 : 0
  chunks =. > y
  chunk_size =. # 0 0 {:: chunks
  flat_chunks =. , +/"1 ,"2 > chunks
  max =. >./ flat_chunks
  highest =. flat_chunks i. >./ flat_chunks
  coord =. |. (0,(size-(chunk_size-1)))#:highest
  max;coord,chunk_size
)

grid =. init"0 grid
chunks =. (grid&(<@:chunk_by~))"0 (1 + i. size)
counts =. count"_1 chunks
load 'plot'
plot (0&{::)"1 counts
NB. scores =. > 0 {"1 counts
NB. idx =. scores i. >./ scores
NB. 1 {:: idx { counts
