cur = 0

for x in range(100, 1000):
    for y in range(100, 1000):
        result = x*y
        if(result > cur):
            if(str(result) == str(result)[::-1]):
                cur = result
                print str(x) + ' x ' + str(y)

print 'Answer: ' + str(cur)