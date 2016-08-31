main = interact (show . length . uniq . startUp)

startUp :: String -> [(Int, Int)]
startUp s = (0,0) : getPositions2 s (0,0) (0,0)

getPositions2 :: String -> (Int,Int) -> (Int,Int) -> [(Int, Int)]
getPositions2 [] t1 t2 = []
getPositions2 (x:xs) t1 t2 = let c = parse x t1
                               in c : getPositions2 xs t2 c

getPositions :: String -> (Int, Int) -> [(Int, Int)]
getPositions [] t = []
getPositions (x:xs) t = let c = parse x t
                        in c : getPositions xs c

uniq :: Eq a => [a] -> [a]
uniq [] = []
uniq (x:xs) = if elem x xs
              then uniq xs
              else x : uniq xs

parse :: Char -> (Int, Int) -> (Int, Int)
parse a t = case (a,t) of
              ('>', (t1, t2)) -> (t1 + 1, t2)
              ('<', (t1, t2)) -> (t1 - 1, t2)
              ('^', (t1, t2)) -> (t1, t2 + 1)
              ('v', (t1, t2)) -> (t1, t2 - 1)
              (_, (t1, t2))   -> (t1,t2)
