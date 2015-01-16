sumOfSquares = 0

for x in range(1, 101):
    sumOfSquares += x**2

squareOfSum = sum(range(1, 101))**2

print squareOfSum-sumOfSquares