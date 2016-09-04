import Data.List

main = interact (show . count . map isNice . lines)

naughtyChars = ["ab", "cd", "pq", "xy"]
vows = "aeiou"

count = foldl countNice 0

countNice :: Int -> Bool -> Int
countNice res True = res + 1
countNice res _ = res

isNice :: String -> Bool
isNice xs = ((checkPairs . strToPair) xs) && (has3Vows xs 0)

has3Vows :: String -> Int -> Bool
has3Vows _ 3 = True
has3Vows [] _ = False
has3Vows (x:xs) n = if elem x vows then has3Vows xs (n + 1) else has3Vows xs n

checkPairs :: [[Char]] -> Bool
checkPairs i = let res = foldr isNicePair [False,True] i
               in foldr (&&) True res

isNicePair :: [Char] -> [Bool] -> [Bool]
isNicePair [] _ = [False, False]
isNicePair _ [_,False] = [False, False]
isNicePair [c1,c2] [b1,_] = if b1 == True then [True, (not (elem [c1,c2] naughtyChars))]
                                          else [(c1 == c2), (not (elem [c1,c2] naughtyChars))]

strToPair :: [Char] -> [String]
strToPair = foldr addToPair []

addToPair :: Char -> [[Char]] -> [[Char]]
addToPair c [] = [[c]]
addToPair c (x:xs) = if (length x) == 1
                       then (c:x) : xs
                       else [c, (head x)] : x : xs
