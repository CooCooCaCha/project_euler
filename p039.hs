import Data.List
import HelperLib

pTriples max = filter (<=max) $ map sum $ [[k*(m^2-n^2), k*2*m*n, k*(m^2+n^2)] | k <- [1..max], m <- [1..iSqrt max], n <- [1..iSqrt max], m > n, odd (m-n), (gcd m n) == 1 ]

main = print $ fst $ last $ sortBy (\x y -> compare (snd x) (snd y)) $ map (\x -> (head x, length x) ) $ group $ sort $ pTriples 1000