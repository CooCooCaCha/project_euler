# This program answers the following question
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143?

import math
import time

# checks if a number is prime
def isPrime(num):
    prime = True

    # As it turns out we only need to check for prime factors that are 
    # less than or equal to the square root of the number
    rootOfNum = int(math.sqrt(num))
    while (rootOfNum > 1):
        if((num % rootOfNum) == 0 ):
            prime = False
            break
        rootOfNum -= 1
    return prime

# init variables
curNum = int(round(math.sqrt(600851475143-1)))
print(curNum)
end = False
progressPercentage = 0
operationCount = 0
opsPerPercent = curNum/100

# compute largest prime factor while printing percent completed  
while (~end & (curNum > 1)):
    curNum -= 1

    if(isPrime(curNum)):
        if((600851475143 % curNum) == 0):
            end = True
            
    operationCount += 1
    if(operationCount >= opsPerPercent):
        progressPercentage += 1
        operationCount = 0

        print('Progress ' + str(progressPercentage) + '%')

# print answer
print('Answer is ' + str(curNum))
raw_input("Press Any Key To Exit") # Where's the any key??? lol