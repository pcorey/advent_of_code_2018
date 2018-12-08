input =. ". (1!:1) < '/Users/pcorey/advent_of_code_2018/day_08/input'

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
  rest =. metadatas }. rest
  (siblings,children,metadata);rest
)

echo +/,0{::process (0 1 $ 0);input
