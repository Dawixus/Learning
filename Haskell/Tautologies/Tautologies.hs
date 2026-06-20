data Prop = 
    Const Bool
  | Var Char
  | Not Prop
  | And Prop Prop
  | Or Prop Prop
  deriving Show
  
eval :: [(Char, Bool)] -> Prop -> Bool
eval _ (Const a) = a
eval env (Var x)   = case lookup x env of
                        Just v  -> v
                        Nothing -> False
eval env (Not p) = not (eval env p)
eval env (And a b) = (eval env a) && (eval env b)
eval env (Or a b) = (eval env a) || (eval env b)

vars :: Prop -> [Char]
vars (Const _) = []
vars (Var x)   = [x]
vars (Not p)   = vars p
vars (And p q) = vars p ++ vars q
vars (Or p q)  = vars p ++ vars q

filterOut :: (Eq a) => [a] -> [a]
filterOut [] = []
filterOut (x:xs) = x : filter (/= x) xs

assignments :: [Char] -> [[(Char, Bool)]]
assignments [] = [[]]
assignments (x : xs) = 
      [(x, b) : rest | b <- [False, True], rest <- assignments xs]
      
isTaut :: Prop -> Bool
isTaut a =
      let variables = filterOut $ vars a
          assignmentCombs = (assignments variables)
      in all (==True) [eval assign a | assign <- assignmentCombs]
