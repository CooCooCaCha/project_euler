import Data.List

isPrime n = go 2
    where
        go d
            | d*d > n = True
            | n `rem` d == 0 = False
            | otherwise = go (d+1)

primes = filter isPrime [2..999999]

isIn x [] = False
isIn x (y:ys) = if x == y
                then True
                else isIn x ys

shiftNum :: Int -> Int
shiftNum x = read $ (tail asString) ++ [(head asString)]
    where asString = show x

primeRotH :: Int -> Int -> [Int]
primeRotH _ 0     = []
primeRotH x shift = if isPrime x
                    then (
                        if ((length $ show x) /= (length $ show shifted))
                        then []
                        else x : (primeRotH shifted (shift-1))
                    )
                    else []
    where shifted = shiftNum x

primeRotList :: Int -> [Int]
primeRotList x = primeRotH x $ length $ show x

primeRot :: Int -> Bool
primeRot x = (==lengthX) $ length $ primeRotList x
    where lengthX = length $ show x

main = print $ length $ nub $ sort $ filter primeRot [2..999999]
