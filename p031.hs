perms = filter (==200) [a+b+c+d+e+f+g+h | a <- [0,200], b <- [0,100..200], c <- [0,50..200], d <- [0,20..200], e <- [0,10..200], f <- [0,5..200], g <- [0,2..200], h <- [0,1..200]]

main = print $ length perms
