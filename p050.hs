import HelperLib

primeList x = reverse $ takeWhile (<x) primes

largestPrime xs
    | sumPrime == True = sumList
    | otherwise        = largestPrime (tail xs)
    where sumList  = sum xs
          sumPrime = (sumList < (10^6)) && isPrime sumList

main = print $ largestPrime $ primeList (10^4)