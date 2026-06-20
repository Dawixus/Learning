import Data.Char (toUpper, toLower)

join :: String -> [String] -> String
join sep [] = ""
join sep [word] = word
join sep (word:rest) = concat[word, sep, (join sep rest)]

capitalize :: String -> String
capitalize sentence = processChars sentence ' '

processChars :: String -> Char -> String
processChars [] prev = []
processChars (x:xs) prev
      | prev == ' ' = toUpper x : processChars xs x
      | otherwise = x : processChars xs x

strWords :: String -> [String]
strWords [] = []
strWords xs =
  let xs' = dropWhile (== ' ') xs
  in if null xs'
     then []
     else
       let (w, rest) = break (== ' ') xs'
       in w : strWords rest
