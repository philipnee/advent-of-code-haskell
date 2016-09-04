import Data.List

main = interact (show . count . map isNice . lines)

isNice line = (hasNonAdjacentPairs . strToPair) line && hasIntervalChars line

count = foldl isTrue 0

isTrue :: Int -> Bool -> Int
isTrue r True = r + 1
isTrue r _ = r

hasIntervalChars :: String -> Bool
hasIntervalChars [] = False
hasIntervalChars (x1:x2:[]) = False
hasIntervalChars (x1:[]) = False
hasIntervalChars (x1:x2:x3:xs) = if x1 == x3 then True else hasIntervalChars (x2:x3:xs)

hasNonAdjacentPairs :: [String] -> Bool
hasNonAdjacentPairs [] = False
hasNonAdjacentPairs (x:[]) = False
hasNonAdjacentPairs (x:y:[]) = False
hasNonAdjacentPairs (x:xs) = if elem x (tail xs) then True else hasNonAdjacentPairs xs

strToPair :: [Char] -> [String]
strToPair = foldr addToPair []

addToPair :: Char -> [[Char]] -> [[Char]]
addToPair c [] = [[c]]
addToPair c (x:xs) = if (length x) == 1
                       then ((c:x) : xs)
                       else ([c, (head x)] : x : xs)
