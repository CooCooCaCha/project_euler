import Data.List

main = print $ last $ take 1000000 $ sort $ permutations [0..9]
