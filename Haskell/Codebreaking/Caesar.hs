import Data.Char (toLower)
import Data.Char(ord,chr,isLower,isUpper)
import Data.List (minimumBy)
import Data.Ord (comparing)

velikostAbecedy :: Int
velikostAbecedy = ord 'z' - ord 'a' + 1

pismenoNaCislo :: Char -> Char -> Int
pismenoNaCislo a c = ord c - ord a

cisloNaPismeno :: Char -> Int -> Char
cisloNaPismeno a n = chr (ord a + n)

posun :: Int -> Char -> Char -> Char
posun n c a = cisloNaPismeno a ((pismenoNaCislo a c + n) `mod` velikostAbecedy)

posun' :: Int -> Char -> Char
posun' n c | isLower c = posun n c 'a'
           | isUpper c = posun n c 'A'
           | otherwise = c

caesar :: Int -> String -> String
caesar n xs = [posun' n x | x <- xs]

enFreq :: [Double]
enFreq = [8.2, 1.5, 2.8, 4.3, 12.7, 2.2, 2.0,
          6.1, 7.0, 0.2, 0.8, 4.0, 2.4, 6.7,
          7.5, 1.9, 0.1, 6.0, 6.3, 9.1, 2.8,
          1.0, 2.4, 0.2, 2.0, 0.1]

czFreq :: [Double]
czFreq = [8.6, 1.7, 3.3, 3.6, 10.5, 0.2, 0.2,
          2.2, 7.5, 2.2, 3.6, 4.2, 3.5, 6.8,
          8.0, 3.2, 0.01, 4.9, 6.3, 5.1, 4.0,
          4.3, 0.01, 0.1, 2.8, 3.2]

lshift :: Int -> [a] -> [a]
lshift n word = (drop m word) ++ (take m word)
  where m = n `mod` 26 

freqTable :: String -> [Double]
freqTable a = [percent c | c <- ['a'..'z']]
      where
        word = map toLower (filter (/= ' ') a)
        wordlen = length word
        percent c
          | wordlen == 0 = 0
          | otherwise = 100 * fromIntegral (length (filter (== c) word)) / fromIntegral wordlen
        
chikvadr :: [Double] -> [Double] -> Double
chikvadr ob ex = sum (zipWith (\o e -> (o - e) * (o - e) / e) ob ex)

bestShift :: [Double] -> [Double] -> Int
bestShift ob ex = fst (minimumBy (comparing snd) [(n, (chikvadr (lshift n ob) ex)) | n <- [0..25]])

crack :: [Double] -> String -> String
crack ex input = caesar (- bestShift (freqTable input) ex) input

