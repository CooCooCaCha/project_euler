import Numeric
import Data.Char

toBinary :: Int -> String
toBinary x = showIntAtBase 2 intToDigit x ""

palin xs = xs == (reverse xs)

isPalin x = palin (show x) && palin (toBinary x)

main = print $ sum $ filter (isPalin) [1..999999]
