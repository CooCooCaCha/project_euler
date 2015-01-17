import Data.Char
import Data.List

candidates :: Integral a => [(a,a)]
candidates = [(a,b) | a <- [10..99], b <- [10..99], a < b ]

isDigitCancelFraction :: Fractional a => a -> Bool
isDigitCancelFraction x
    | (a == (reverse a)) || (b == (reverse b)) = False
    | (head a /= head b) && (last a /= last b) = False
    | otherwise = frac == ((digitToInt $ fst reduced) / (digitToInt $ snd reduced))
    where a = sort $ show $ fst x
          b = sort $ show $ snd x
          frac = (fst x) / (snd x)
          reduced = if (head a == head b) then (last a, last b) else (head a, head b)

main = print $ take 10 $ map isDigitCancelFraction $ candidates