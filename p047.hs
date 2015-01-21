import HelperLib
import Data.List

primeFactors x = map (\x -> foldr (*) 1 x ) $ group $ primeDivisors x

distinctConsecutive (x:y:z:w:xs)
    | isDiff && isLongEnough == True = x
    | otherwise = distinctConsecutive (y:z:w:xs)
    where pfX = primeFactors x
          pfY = primeFactors y
          pfZ = primeFactors z
          pfW = primeFactors w
          combined = pfX ++ pfY ++ pfZ ++ pfW
          isLongEnough = (length combined) == 16
          isDiff = (length combined) == (length . group . sort) combined

main = print $ distinctConsecutive [2..]