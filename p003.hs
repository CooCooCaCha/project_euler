import HelperLib

primeFactors :: Integer -> [Integer]
primeFactors 1 = []
primeFactors x = factor : primeFactors (x `div` factor)
    where end = iSqrt x
          factor = head $ filter (\y -> x `rem` y == 0) primes

main = print $ maximum $ primeFactors 600851475143 