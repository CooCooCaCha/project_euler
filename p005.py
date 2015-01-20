def check(num):
    div = True
    for z in {20, 19, 18, 17, 16, 15, 14, 13, 12}:
        if( (num % z) != 0):
            div = False
            break
    return div

x = 44
end = False
while (end == False):
    x += 11
    if(check(x)):
        end = True
    
print( 'Answer: ' + str(x))