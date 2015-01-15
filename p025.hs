import Data.List
import Data.Maybe

fib :: [Integer]
fib = 1 : 1 : zipWith (+) fib (tail fib)

main = print $ (+1) $ fromJust $ elemIndex 1000 $ map (length . show) fib
