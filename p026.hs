import HelperLib
import Data.List

fullReptendPrimes = filter isReptend primes
    where roots x = sort $ map (`rem` x) $ map (10^) [1..(x-1)]
          isReptend x = (roots x) == [1..(x-1)]

main = print $ last $ takeWhile (<1000) fullReptendPrimes