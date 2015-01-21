import Data.List
import HelperLib

pent x = x*(3*x-1) `div` 2
pNums = take 10000 $ map pent [1..]

isPNum x = x == reverseReverse
    where reverseP = (iSqrt(24*x+1)+1) `div` 6
          reverseReverse = pent reverseP

main = print $ head $ sort $ [abs( k-j ) | j <- pNums, k <- pNums, j < k, isPNum (k-j), isPNum (j+k) ]