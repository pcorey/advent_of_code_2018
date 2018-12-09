input =. ". (1!:1) < '/Users/pcorey/advent_of_code_2018/day_08/sample'

process =. 3 : 0
  siblings =. 0 {:: y
  childrens =. 0 { 1 {:: y
  metadatas =. 1 { 1 {:: y
  rest =. 2 }. 1 {:: y
  if. childrens = 0 do.
    children =. 0 1 $ 0
  else.
    next =. process^:childrens (0 1 $ 0);rest
    children =. 0 {:: next
    rest =. 1 {:: next
  end.
  metadata =. (i. metadatas) { rest
  node =. metadata;<children
  rest =. metadatas }. rest
  (siblings,node);rest
)

count =. 3 : 0
  metadata =. 0{::y
  children =. 1{::y
  if. 0 = # children do.
    +/ metadata
  else.
    indexes =. 1 -~ metadata
    indexes =. indexes #~ _1 < indexes
    indexes =. indexes #~ -. (1 -~ # children) < indexes
    +/ count"_1 indexes { children
  end.
)

tree =. 0{0{::process(0 1 $ 0);input
echo count tree
