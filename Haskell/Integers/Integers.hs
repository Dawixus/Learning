factors :: Integer -> [Integer]
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

noDuplicates :: [Integer] -> Bool
noDuplicates (x:y:xs) | x /= y = noDuplicates(y:xs)
                      | x == y = False
noDuplicates _ = True

squareFree :: [Integer]
squareFree = filter isSquareFree [1..]
  where
    isSquareFree n = noDuplicates (factors n)

squareRoot :: Integer -> Integer
squareRoot n = bs 0 n
    where 
      bs l r
        | l > r = r
        | mid * mid <= n = bs (mid + 1) r
        | otherwise = bs l (mid - 1)
        where 
          mid = l + div (r - l)  2
