import Data.List

split3 a b c xs = (conv listA) : (conv listB) : (conv listC) : []
    where conv ys = read $ concatMap show ys
          listA = (take a xs)
          listB = (take b $ drop a xs)
          listC = (drop (a+b) xs)

combos = [split3 a b c perm | perm <- perms, a <- [1..7], b <- [1..7], c <- [1..7], a + b + c == 9 ]
    where perms = permutations [1..9]

toNums :: [[Int]] -> [Int]
toNums p = map (\x -> read $ concatMap show x ) p

main = print $ sum $ nub $ map last $ filter (\[x,y,z] -> x*y == z ) $ combos