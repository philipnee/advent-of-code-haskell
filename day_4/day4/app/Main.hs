module Main where

import Data.ByteString.Lazy.Char8 (pack)
import Data.Digest.Pure.MD5       (md5)

hashing :: Int -> String -> Int
hashing n s = if (take 5 s) == "000000"
              then n
              else hashing (n + 1) (show  (md5 (pack ("iwrupvqb" ++ (show (n + 1))))))

main :: IO ()
main = do
--  s <- readFile "input.txt"
  putStrLn (show (hashing 0 ""))
