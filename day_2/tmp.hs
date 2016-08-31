
run = packBin 

-- tasks -> initial bin -> acc bin -> final bin
packBin :: [Int] -> [Int] -> [[Int]] -> [[Int]]
packBin [] [] s = s
packBin [] b s = b : s
packBin (x:xs) b s = let leftQuota = 10 - sum (x:xs)
               in if x <= leftQuota
                    then packBin xs x:b s
                    else packBin (x:xs) [] b:s
