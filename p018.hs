triangle = [[3],[7,4],[2,4,6],[8,5,9,3]]

1. Start at first row
2. For each row pick the best path from the previous row.
3. Once at the end work way back to the beginning.

[95,64]
[[95],[95,64],[64]]

[17,47,82]
[17,17,47,47,82,82]
[[17],[17,47],[47,82],[82]]

expand :: [Int] -> [Int]
expand [] = []
expand (x:xs) = x : x : expand xs

comb :: [Int] -> [[Int]]
comb (x:y:xs) = 

bestFromPrev :: [Int] -> [Int] -> [Int]
bestFromPrev cur prev = 

maxPath :: [[Int]] -> [Int]
maxPath x = head x

main = print $ maxPath triangle
