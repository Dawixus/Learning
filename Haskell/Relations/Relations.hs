is_equiv :: (a -> a -> Bool) -> [a] -> Bool
is_equiv f xs = is_reflex f xs && is_symetric f xs && is_transitive f xs

is_reflex :: (a -> a -> Bool) -> [a] -> Bool
is_reflex f xs = all (== True) [f x x | x <- xs]

is_symetric :: (a -> a -> Bool) -> [a] -> Bool
is_symetric f xs = all (== True) [not (f x y) || f y x | x <- xs, y <- xs]

is_transitive :: (a -> a -> Bool) -> [a] -> Bool
is_transitive f xs = all (== True) [not (f x y) || not (f y z) || f x z | x <- xs, y <- xs, z <- xs]

classes :: (a -> a -> Bool) -> [a] -> [[a]]
classes rel [] = []
classes rel (x:xs) = equaltox : classes rel rest
    where
       equaltox = (x : filter (\y ->(rel x y)) xs)
       rest = filter (\y -> not (rel x y)) xs

reflexive_closure :: Eq a => (a -> a -> Bool) -> (a -> a -> Bool)
reflexive_closure r x y = (x == y) || r x y
