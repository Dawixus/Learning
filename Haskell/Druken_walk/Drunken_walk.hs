import Text.Printf (printf)

-- An infinite stream of pseudorandom numbers in the range [0 .. 3].
pseudo_random :: [Int]
pseudo_random =
    let f :: Integer -> Integer
        f x = (6364136223846793005 * x + 1442695040888963407) `mod` (2 ^ 64)
        stream = iterate f 1
    in map (\n -> fromIntegral (n `div` (2 ^ 62))) stream

step :: (Int, Int) -> Int -> (Int, Int)
step (a, b) dir
  | dir == 0 = (a, b + 1)
  | dir == 1 = (a, b - 1)
  | dir == 2 = (a - 1, b)
  | otherwise = (a + 1, b)

walk :: Int -> (Int, Int) -> [Int] -> (Int, [Int])
walk bound pos (b:rest)
  | newX < -bound || newX > bound = (0, rest)
  | newY < -bound || newY > bound = (0, rest)
  | newX == 0 && newY == 0 = (1, rest)
  | otherwise = walk bound (newX, newY) rest
  where
    (newX, newY) = step pos b

simulate :: Int -> Int -> [Int] -> Int
simulate _ 0 _ = 0
simulate bound tries gen =
  let (res, gen') = walk bound (0,0) gen
  in res + simulate bound (tries - 1) gen'
  
  
main :: IO ()
main = do
  n <- readLn
  t <- readLn

  let ok = simulate n t pseudo_random
      perc = 100 * fromIntegral ok / fromIntegral t :: Double

  printf "survived %.1f%% (%d / %d)\n" perc ok t
  

