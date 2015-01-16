import math

digits = str(math.factorial(100))
sumDigits = 0

for x in digits:
    sumDigits += int(x)

print sumDigits