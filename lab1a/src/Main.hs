module Main where

import Data.List

filterList list2 =
  filter
    ( \a ->
        (/=) 2
          . length
          . filter (== a)
          $ list2
    )

fun a list2 = length (filter (== a) list2)

main :: IO ()
main = do
  print . filterList [1, 2, 1, 3, 1, 2, 4, 3, 5] $ [1, 2, 3, 4]
