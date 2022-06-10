module Main where

import Data.List

median :: [Int] -> Int
median l
  | even len = div (head med + last med) 2
  | otherwise = head med
  where
    list = sort l
    len = length list
    med = take 2 (drop (div len 2 - rem (len + 1) 2) list)

filterList :: [Int] -> [Int]
filterList list = filter (\a -> a /= median list) list

main :: IO ()
main = do
  print . filterList $ [0, 2, 2, 1, 3]
