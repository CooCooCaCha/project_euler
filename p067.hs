import Data.List
import Data.Char
import System.IO

tuplePair :: [a] -> [(a,a)]
tuplePair (x:[]) = [(x,x)]
tuplePair (x:y:xs) = (x,y) : tuplePair (y:xs)

pickOption :: Int -> (Int, Int) -> Int
pickOption x options = maximum [first, second]
    where first  = x + (fst options)
          second = x + (snd options)

process :: [[Int]] -> [Int]
process (x:[])   = x
process (x:y:xs) = process (calcRow : xs)
    where expandedRow = tuplePair $ (head x) : x
          calcRow     = zipWith pickOption y expandedRow

readTriangleLine :: String -> [Int]
readTriangleLine [] = []
readTriangleLine (xs) = digit : readTriangleLine (drop 2 dropSpaces)
    where dropSpaces = dropWhile (==' ') xs
          digit = read $ takeWhile (\x -> elem x ['0'..'9']) dropSpaces 

main = do 
    handle <- openFile "p067_triangle.txt" ReadMode
    contents <- hGetContents handle
    print $ maximum $ process $ map readTriangleLine $ lines contents
