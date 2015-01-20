import Data.Char

digitSum x = sum $ map digitToInt $ show x
main = print $ maximum $ map digitSum [a^b | a <- [1..99], b <- [1..99]]