import HelperLib
import Data.List

consPrimes :: Int -> Int -> Int -> [Int]
consPrimes a b n 
    | value < 1 = []
    | isPrime value = value : consPrimes a b (n+1)
    | otherwise = []
    where value = n^2 + a*n + b

abComb = [ (a*b, length $ consPrimes a b 0) | a <- [-999..999], b <- [-999..999]]

main = print $ fst $ maximumBy (\x y -> compare (snd x) (snd y)) $ abComb