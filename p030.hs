import Data.Char

isNarc :: Int -> Int -> Bool
isNarc n x = (==x) $ sum $ map (^n) $ map digitToInt $ show x

narc :: Int -> [Int]
narc n = [x | x <- [2..maxNarc], isNarc n x]
    where maxNarc = sum [9 * 10^x | x <- [0..n]]

main = print $ sum $ narc 5
