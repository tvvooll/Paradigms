module Main where

picks :: [Int] -> [(Int, Int)]
picks list =
  filter condition
    . zip list
    $ [1 .. length list]
  where
    condition (x, i) = prev > x && next > x
      where
        prev = get (i - 2) list
        next = get i list

get :: Int -> [a] -> a
get n list
  | n > 0 = list !! rem n (length list)
  | otherwise = list !! rem (n + length list) (length list)

main :: IO ()
main = do
  --               .           .        .          .
  print . picks $ [0, 1, 1, 2, 1, 3, 4, 1, 5, 19, 10, 13, 9]

--                 1  2  3  4  5  6  7  8  9  10  11  12 13