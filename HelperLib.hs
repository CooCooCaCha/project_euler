module HelperLib where

merge :: (Ord a) => [a] -> [a] -> [a]
merge xs@(x:xt) ys@(y:yt) = 
  case compare x y of
    LT -> x : (merge xt ys)
    EQ -> x : (merge xt yt)
    GT -> y : (merge xs yt)

diff :: (Ord a) => [a] -> [a] -> [a]
diff xs@(x:xt) ys@(y:yt) =
    case compare x y of
        LT -> x : (diff xt ys)
        EQ -> diff xt yt
        GT -> diff xs yt

primes, nonprimes :: Integral a => [a]
primes    = [2, 3, 5] ++ (diff [7, 9 ..] nonprimes) 
nonprimes = foldr1 f $ map g $ tail primes
  where 
    f (x:xt) ys = x : (merge xt ys)
    g p         = [ n * p | n <- [p, p + 2 ..]]

iSqrt :: Integral a => a -> a
iSqrt x = floor $ sqrt $ fromIntegral x

isIn :: (Ord a) => a -> [a] -> Bool
isIn x (y:ys)
    | x == y = True
    | x >  y = False
    | otherwise = isIn x ys

isPrime :: Integral a => a -> Bool
isPrime 1 = False
isPrime 2 = True
isPrime x 
    | even x = False
    | otherwise = null $ filter (\y -> x `rem` y == 0) $ [2..(iSqrt x)]

divisors :: Integral a => a -> [a]
divisors n = 1 : filter ((==0) . rem n) [2..(n `div` 2)]

fib :: Integral a => [a]
fib = 1 : 1 : zipWith (+) fib (tail fib)
