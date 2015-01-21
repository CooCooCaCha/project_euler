import Data.Char
import Data.List

isDigitCancel :: Int -> Int -> Bool
isDigitCancel x y 
    | (((/=1) . length) diffX) || (((/=1) . length) diffY) || containsZero = False
    | otherwise = ((fromIntegral x) / (fromIntegral y)) == ((fromIntegral $ head diffX) / (fromIntegral $ head diffY))
    where digitsX      = map digitToInt $ show x
          digitsY      = map digitToInt $ show y
          containsZero = (elem 0 digitsX) || (elem 0 digitsY)
          diffX        = digitsX \\ digitsY
          diffY        = digitsY \\ digitsX

digitCancel = filter (\x -> isDigitCancel (fst x) (snd x)) candidates
    where candidates = [(x,y) | x <- [10..99], y <- [10..99], x < y]

reduceFraction :: (Int, Int) -> (Int, Int)
reduceFraction fraction
    | fracGCD == 1 = fraction
    | otherwise = reduceFraction ( (nom `div` fracGCD), (denom `div` fracGCD) )
    where nom     = fst fraction
          denom   = snd fraction
          fracGCD = gcd nom denom

main = print $ reduceFraction $ ((product $ map fst digitCancel), (product $ map snd digitCancel))
