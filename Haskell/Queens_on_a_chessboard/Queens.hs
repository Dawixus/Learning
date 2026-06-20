safe :: (Int, Int) -> (Int, Int) -> Bool
safe (px, py) (dx, dy) = (px == dx && py == dy) 
                          || (py /= dy && 
                              abs(px - dx) /= abs(py - dy))

queens :: [Int] -> Bool
queens seznam = and [safe p d | 
                          p <- zip [1..] seznam,
                          d <- zip [1..] seznam
                          ]

