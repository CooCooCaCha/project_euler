--import HelperLib
import Data.List
import Data.Numbers.Primes

primeDivisors :: Int -> [Int]
primeDivisors 1 = []
primeDivisors x = factor : primeDivisors (x `quot` factor)
    where factor = head $ filter (\y -> x `rem` y == 0) primes 

sigma :: Int -> Int
sigma x = foldr (*) 1 factors
    where factors = map ((+1) . length) $ group $ primeDivisors x

sigmaList :: Int -> Int
sigmaList max = 1 + sigHelper primes
    where sigHelper (x:y:xs) = if end == max 
                               then nonPrimeRange
                               else nonPrimeRange + sigHelper (y:xs)
            where start = x+1
                  end   = if y >= max then max else y-1
                  nonPrimeRange = sum $ map ((+ (-1)) . length) $ group $ map sigma [start..end]

range = [2..(10^7-1)]

main = print $ sigmaList (10^6) -- sigmaList (10^7-1)