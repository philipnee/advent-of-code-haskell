main = interact (show . genStoryCount)

count :: [Char] -> Int
count [] = 0
count (x:xs) = matchParan x + count xs

getFirstBasement :: [(Int, Int)] -> Int
getFirstBasement l = foldr

genStoryCount :: [Char] -> [(Int,Int)]
genStoryCount l = foldl genStories [] (indices l)

genStories :: [(Int, Int)] -> (Int, Char) -> [(Int, Int)]
genStories [] (b1, b2) = [(b1, matchParan b2)]
genStories ((a1,a2):xs) (b1, b2) = (b1, a2 + matchParan b2) : (a1,a2):xs

indices :: [a] -> [(Int, a)]
indices xs = zip [0..] xs

matchParan :: Char -> Int
matchParan '(' = 1
matchParan ')' = -1
matchParan _ = 0
