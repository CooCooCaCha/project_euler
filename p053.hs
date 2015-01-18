choose n 0 = 1
choose 0 k = 0
choose n k = choose (n-1) (k-1) * n `div` k

test n = map (choose n) [1..n]

main = print $ length $ filter (>10^6) $ concatMap test [1..100]