import Data.List
import HelperLib

truncPrime :: (Integral a, Show a) => (String -> String) -> a -> Bool
truncPrime f x
    | isPrime x = if nextX == [] then True else truncPrime f $ read nextX
    | otherwise = False
    where strX = show x
          nextX = f strX

truncLR x = truncPrime tail x
truncRL x = truncPrime init x

main = print $ sum $ take 11 $ filter (\x -> (truncLR x) && (truncRL x)) ([10..] :: [Int])