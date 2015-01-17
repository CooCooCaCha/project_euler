import Data.Char
import Data.List

onesName x = case x of
    1 -> "one"
    2 -> "two"
    3 -> "three"
    4 -> "four"
    5 -> "five"
    6 -> "six"
    7 -> "seven"
    8 -> "eight"
    9 -> "nine"
    0 -> "zero"
    _ -> ""

tensName x = case x of
    10 -> "ten"
    11 -> "eleven"
    12 -> "twelve"
    13 -> "thirteen"
    14 -> "fourteen"
    15 -> "fifteen"
    16 -> "sixteen"
    17 -> "seventeen"
    18 -> "eighteen"
    19 -> "nineteen"
    20 -> "twenty"
    30 -> "thirty"
    40 -> "forty"
    50 -> "fifty"
    60 -> "sixty"
    70 -> "seventy"
    80 -> "eighty"
    90 -> "ninety"
    _  -> ""

splitNumber x = zipWith (*) (map (10^) [(lenX-1),(lenX-2)..0]) $ map digitToInt stringX
    where stringX = show x
          lenX = length $ stringX

englishNumbers [] = []
englishNumbers xt@(x:xs)
    | x >= 1000 = (onesName (x `div` 1000)) ++ "thousand" ++ englishNumbers xs
    | x >= 100  = (onesName (x `div` 100))  ++ "hundred"  ++ englishNumbers xs
    | x >= 10   = (tensName x) ++ englishNumbers xs
    | otherwise = onesName x

removeZeros xs
    | length xs == 1 = xs
    | otherwise = filter (/=0) xs

combineLast xs
    | lenXS == 1 = xs
    | (rXS !! 1) == 10 = (take (lenXS-2) xs) ++ [(sum $ take 2 rXS)] 
    | otherwise = xs
    where lenXS = length xs
          rXS = reverse xs

english x = (englishNumbers toNums) ++ addAnd
    where toNums = (removeZeros . combineLast . splitNumber) x
          addAnd = if (x >= 100 && (length toNums) >= 2) then "and" else ""

main = print $ sum $ map (length . english) [1..1000]
