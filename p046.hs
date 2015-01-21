import HelperLib

squares = map (^2) [1..]

isGoldback x = not $ null $ filter (==x) testList
    where testPrimes = takeWhile (<x) primes
          testSquares = takeWhile (<x) squares
          testList = [p + (2 * s) | p <- testPrimes, s <- testSquares]

main = print $ head $ dropWhile isGoldback $ filter (not . even) nonprimes