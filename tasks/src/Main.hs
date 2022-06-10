module Main where

-- Варіант 10
-- Задача 1: Визначити кількість різних додатніх елементів у списку.
task1 :: [Int] -> Int
task1 = length . unique []
  where
    unique uniqueList [] = uniqueList
    unique uniqueList (x : xs)
      | x `elem` uniqueList = unique uniqueList xs
      | x > 0 = unique (x : uniqueList) xs
      | otherwise = unique uniqueList xs

-- Задача 2: Знайти кількість значущих цифр у двійковому запису заданого натурального числа.

task2 :: Int -> Int
task2 n = count 0 n
  where
    count m 0 = m
    count m n = count (m + 1) (div n 2)

-- Задача 3: За натуральним значенням n згенерувати впорядкований за зростанням список
--           елементів цілочислової множини M.
--       10. M = { k(k + 1)(k + 2) / 6 | 1 <= k <= n}.

task3 :: Int -> [Int]
task3 n = [div (k * (k + 1) * (k + 2)) 6 | k <- [1 .. n]]

-- Задача 4: За натуральним значенням n згенерувати впорядкований за зростанням список
--           елементів цілочислової множини M.
--       10. M = { f_k | 1 <= k <= n^2 }, де f_k – k-те число Фібоначчі.

task4 :: Int -> [Int]
task4 n = [f k | k <- [1 .. n ^ 2]]
  where
    f 1 = 1
    f 2 = 1
    f k = f (k - 2) + f (k - 1)

-- Задача 5: За натуральним значенням n згенерувати впорядкований за зростанням список
--           елементів цілочислової множини M.
--       10. M = { p_k | 1 <= k <= n^3 }, де p_k – k-те просте число.

task5 :: Int -> [Int]
task5 n = primes [] 2 (n ^ 3)
  where
    primes :: [Int] -> Int -> Int -> [Int]
    primes list _ 0 = list
    primes list i n
      | foldl (\acum elem -> acum && rem i elem /= 0) True list = primes (list ++ [i]) (i + 1) (n - 1)
      | otherwise = primes list (i + 1) n

-- Задача 6: За натуральним значенням n згенерувати впорядкований за зростанням список
--           елементів цілочислової множини M. Метод сортування — за бажанням.
--       10. M = { kcos(k) | 1 <= k <= n}.

task6 :: (Enum a, Floating a) => a -> [a]
task6 n = [k * cos k | k <- [1 .. n]]

-- Задача 7: Перетворення списків за поданою схемою.
--       10. [ a1, a2, a3, …, an ] ---> [ a2, a4, a6, a8, …, a1, a3, a5, a7, … ];

task7 :: [a] -> [a]
task7 = reorder ([], [])
  where
    reorder :: ([a], [a]) -> [a] -> [a]
    reorder (odd, even) [] = even ++ odd
    reorder (odd, even) (x : xs)
      | length even < length odd = reorder (odd, even ++ [x]) xs
      | otherwise = reorder (odd ++ [x], even) xs

-- Задача 8: Перетворення списків циклічними зсувами.
--       10. Для списку з парною кількістю елементів отримати результат циклічного зсуву на дві позиції
--           ліворуч елементів, що стоять на непарних місцях, та на дві позиції праворуч елементів, що
--           стоять на парних місцях.

task8 :: [a] -> [a]
task8 = reorder ([], [])
  where
    reorder :: ([a], [a]) -> [a] -> [a]
    reorder (odd, even) [] = concat [[x, y] | (x, y) <- zip (moveLeft odd) (moveRight even)]
      where
        moveRight :: [a] -> [a]
        moveRight list = (last . init $ list) : last list : (init . init $list)
        moveLeft :: [a] -> [a]
        moveLeft list = (tail . tail $ list) ++ [head list, head . tail $ list]
    reorder (odd, even) (x : xs)
      | length even < length odd = reorder (odd, even ++ [x]) xs
      | otherwise = reorder (odd ++ [x], even) xs

-- Задача 9: Перетворення списків циклічними зсувами.
--       10. Для списку з парною кількістю елементів отримати результат циклічного зсуву на 2k позицій
--           ліворуч елементів, що стоять на непарних місцях, та на 2k позицій праворуч елементів, що стоять
--           на парних місцях.

task9 :: Int -> [a] -> [a]
task9 0 list = list
task9 k list =
  task9 (k - 1)
    . reorder ([], [])
    $ list
  where
    reorder :: ([a], [a]) -> [a] -> [a]
    reorder (odd, even) [] = concat [[x, y] | (x, y) <- zip (moveLeft odd) (moveRight even)]
      where
        moveRight :: [a] -> [a]
        moveRight list = (last . init $ list) : last list : (init . init $list)
        moveLeft :: [a] -> [a]
        moveLeft list = (tail . tail $ list) ++ [head list, head . tail $ list]
    reorder (odd, even) (x : xs)
      | length even < length odd = reorder (odd, even ++ [x]) xs
      | otherwise = reorder (odd ++ [x], even) xs

-- Задача 10: Різні задачі на обробку списків із цілими числами.
--        10. Знайти N (різних) найменших елементів списку та сформувати новий список, вилучаючи всі їх
--            примірники з початкового списку.

task10 :: Int -> [Int] -> [Int]
task10 0 list = list
task10 n list =
  task10 (n - 1)
    . filter (\x -> x /= minimum list)
    $ list

-- Задача 11: Виконати N послідовних перестановок голови в кінець списку.

task11 :: Int -> [a] -> [a]
task11 0 list = list
task11 _ [] = []
task11 n (x : xs) = task11 (n - 1) (xs ++ [x])

-- Задача 12: Вилучити зі списку N перших елементів.

task12 :: Int -> [a] -> [a]
task12 0 list = list
task12 _ [] = []
task12 n (x : xs) = task12 (n - 1) xs

-- Задача 13: Обчислити 1! + 2! + ... . + (N - 1)! + N!.

task13 :: Int -> Int
task13 1 = 1
task13 n = task13 (n - 1) + fact n
  where
    fact :: Int -> Int
    fact 0 = 1
    fact 1 = 1
    fact n = n * fact (n - 1)

-- Задача 14: Виконати N послідовних перестановок останнього елемента списку у початок списку.

task14 :: Int -> [a] -> [a]
task14 0 list = list
task14 _ [] = []
task14 n list = task14 (n - 1) (last list : init list)

-- Задача 15: Обчислити N! + (N - 2)! + (N - 4)! + ... +1. (Остання одиниця відповідає 1! або 0! залежно від парності N).

task15 :: Int -> Int
task15 0 = 1
task15 1 = 1
task15 n = task13 (n - 2) + fact n
  where
    fact :: Int -> Int
    fact 0 = 1
    fact 1 = 1
    fact n = n * fact (n - 1)

-- Задача 16: Вилучити зі списку N останніх елементів.

task16 :: Int -> [a] -> [a]
task16 0 list = list
task16 _ [] = []
task16 n list = task14 (n - 1) (init list)

-- Задача 17: Обчислити N! + (N - 2)! + ... + [N/2]!. (У [N/2] квадратні дужки означають узяття цілої частини числа).

task17 :: Int -> Int
task17 n = sum [fact x | x <- [n, n - 2 .. div n 2]]
  where
    fact 0 = 1
    fact 1 = 1
    fact n = n * fact (n - 1)

main :: IO ()
main = do
  print . task14 5 $ [1 .. 20]