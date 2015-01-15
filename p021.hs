properDivisors :: Int -> [Int]
properDivisors x = 1 : [ y | y <- [2..(x `div` 2)], x `rem` y == 0 ]

divisorLists = map (sum . properDivisors) [1..9999]

d :: Int -> Int
d x = divisorLists !! (x-1)

amicablePair :: Int -> Int -> Bool
amicablePair x y = (d x) == y && (d y) == x && x /= y

listPairs :: Int -> [(Int, Int)]
listPairs x = [ (y, z) | y <- [1..(x-1)], z <- [1..(x-1)], y < z, amicablePair y z ]

expanded :: [(Int, Int)] -> [Int]
expanded [] = []
expanded (x:xs) = (fst x) : (snd x) : expanded xs

main = print $ sum $ expanded $ listPairs 10000
