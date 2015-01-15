import Data.List

diff :: (Ord a) => [a] -> [a] -> [a]
diff xs@(x:xt) ys@(y:yt) =
    case compare x y of
        LT -> x : (diff xt ys)
        EQ -> diff xt yt
        GT -> diff xs yt

divisors :: Int -> [Int]
divisors n = 1 : filter ((==0) . rem n) [2..(n `div` 2)]

abundantNums = [x | x <- [1..20000], x < (sum (divisors x))]
sumNums = filterDupes $ sort [x + y | x <- abundantNums, y <- abundantNums]

filterDupes :: [Int] -> [Int]
filterDupes [] = []
filterDupes (x:[])   = [x]
filterDupes (x:y:xs) = if x == y 
                       then filterDupes (y:xs)
                       else x : filterDupes (y:xs)

result = diff [1..] sumNums

main = print $ sum $ take 1456 result
