import Data.List (group, sort)

sortAndGroup :: [Int] -> [(Int, Int)]
sortAndGroup xs = reverse(sort[(length g, head g) | g <- group (sort xs)])

getRank :: [(Int, Int)] -> Int
getRank ((4, x):_) = 6
getRank ((3, x):(2, y):_) = 5
getRank ((3, x):_) = 4
getRank ((2, x):(2, y):_) = 3
getRank ((2, x):_) = 2
getRank ((1, x):_) = 1

better :: [Int] -> [Int] -> Bool
better a b = 
  let ra = sortAndGroup a
      rb = sortAndGroup b
  in  if       getRank ra > getRank rb then True
      else if  getRank ra < getRank rb then False
      else     ra > rb
