flatten :: [[a]] -> [a]
flatten ([x]) = x
flatten ([x]:xss) = x : flatten(xss)
flatten ([]:xss) = flatten(xss)
flatten ((x:xs):xss) = x : flatten((xs):xss)

dezip :: [(a, b)] -> ([a], [b])
dezip [] = ([], [])
dezip ((a, b) : xs) = (a : dezipL(xs), b : dezipR(xs))
dezipL [] = []
dezipL ((a, b) : xs) = a : dezipL(xs)
dezipR [] = []
dezipR ((a, b) : xs) = b : dezipR(xs)

rev :: [a] -> [a]
rev xs = rearange xs []
  where
    rearange [] acc = acc
    rearange (x:xs) acc = rearange xs (x:acc) 

