factors :: Int -> [Int]
factors 0 = []
factors 1 = []
factors n = go n 2
    where
      go 1 _ = []
      go m d
          | d * d > m = [m]
          | mod m d == 0 = d : go (div m d) d
          | otherwise = go m (next d)
      
      next 2 = 3
      next k = k + 2

gap :: Int -> (Int, Int)
gap n =
    let primes = [x | x <- [2..n], factors x == [x]]
        pairs  = zip primes (tail primes)
    in find (head pairs) pairs
  where
    find best [] = best
    find (a, b) ((x, y):rest)
        | b - a < y - x = find (x, y) rest
        | otherwise     = find (a, b) rest
