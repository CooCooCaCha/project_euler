import HelperLib
import Data.List

isPan x = sX == take (length sX) ['1'..'9'] 
    where sX = (sort . show) x

main = print $ maximum $ filter isPan $ filter isPrime $ map read $ concatMap permutations $ map (\x -> ['1'..x]) ['1'..'9']