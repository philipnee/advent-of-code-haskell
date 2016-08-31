import Data.List

main = interact (show . sum . map ribbon . map (sortBy (flip compare)) .map (parse . split) . lines)

area :: [Int] -> Int
area [] = 0
area (s1:s2:s3:[]) =
                      let a1 = s1 * s2
                          a2 = s1 * s3
                          a3 = s2 * s3
                      in 2 * (a1 + a2 + a3) + minimum (a1:a2:a3:[])

split :: String -> [String]
split xs = foldr sublstr [[]] xs

ribbon :: [Int] -> Int
ribbon (x:xs) = 2 * (sum xs) + foldl (*) 1 (x:xs)

sublstr :: Char -> [String] -> [String]
sublstr 'x' xs = "" : xs
sublstr c xs = (c : head xs) : tail xs

sublst :: [String] -> Char -> [String]
sublst xs 'x' = "" : xs
sublst xs c = (c : head xs) : tail xs

parse :: [String] -> [Int]
parse = map read
