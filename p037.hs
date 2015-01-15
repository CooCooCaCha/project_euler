import Data.List

isPrime n = go 2
    where
        go d
            | d*d > n = True
            | n `rem` d == 0 = False
            | otherwise = go (d+1)

primes = filter isPrime [2..999999]

truncL :: Int -> Bool
truncL x = if isPrime x
           then 
           else False
