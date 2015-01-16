for n in range(1, 1000):
    for m in range(n+1, 1000):
        a = m**2 - n**2
        b = 2*m*n
        c = m**2 + n**2
        if((a+b+c) == 1000):
            print 'Answer: a=' + str(a) + ' b=' + str(b) + ' c=' + str(c) + ', abc = ' + str(a*b*c)
            