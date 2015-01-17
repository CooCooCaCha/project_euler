import Data.Char

fractionList = concatMap show [1..]

d x = digitToInt $ fractionList !! (x-1)

main = print $ foldr (*) 1 $ map d $ map (10^) [0..6]