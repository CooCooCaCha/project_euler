import math

def is_square(n):
    return math.sqrt(n).is_integer()
  
def eratosthenes_sieve(n):
    # Create a candidate list within which non-primes will be
    # marked as None; only candidates below sqrt(n) need be checked. 
    candidates = list(range(n+1))
    fin = int(n**0.5)
 
    # Loop over the candidates, marking out each multiple.
    for i in xrange(2, fin+1):
        if candidates[i]:
            candidates[2*i::i] = [None] * (n//i - 1)
 
    # Filter out non-primes and return the list.
    return [i for i in candidates[2:] if i]

def primeFactors1(num):
    potential = eratosthenes_sieve(num)
    factors = list()
    for x in potential:
        if((num%x) == 0):
            factors.append(x)
    return factors
     
def primeFactors2(num):
    if(num%2 == 0):
        return 2
    a = int(math.ceil(math.sqrt(num)))
    b2 = int(a*a - num)
    while (is_square(b2) == False):
        a += 1
        b2 = a*a - num
    #result = a-math.sqrt(b2)
    return int(a-math.sqrt(b2))
           
def numDivisors(num, factorFunction):
    factors = factorFunction(num)#primeFactors(num)
    curNum = num
    numDiv = 1
    for x in factors:
        power = 0
        while((curNum%x) == 0):
            power += 1
            curNum /= x
        numDiv *= (power+1)
    return numDiv

count = 0
cur = 0
largest = 0

while (largest < 500):
    count += 1
    cur += count
    result = numDivisors(cur, primeFactors1)
    if(result > largest):
        largest = result
        print largest

print 'Answer: ' + str(largest) + ' factors for number ' + str(cur)