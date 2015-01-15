import Data.List
import Data.Ord

collatzNext :: Int -> Int
collatzNext x
    | even x = x `div` 2
    | otherwise = 3 * x + 1

collatzLength :: Int -> Int
collatzLength 1 = 1
collatzLength x = 1 + collatzLength (collatzNext x)

main = do
    let numRange = [1..999999]
    let lengths = zip numRange $ map collatzLength numRange
    print $ fst $ maximumBy (comparing snd) lengths
