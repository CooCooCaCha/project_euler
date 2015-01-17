import Data.Char
import System.IO

t :: Integral a => a -> a
t n = n*(n+1) `div` 2

wordValue a = sum $ map ((+ (-64)) . ord) a

isTriangleWord a = (==val) $ last $ takeWhile (<=val) $ map t [1..]
    where val = wordValue a

replaceQuotes :: String -> String
replaceQuotes [] = []
replaceQuotes (x:xs)
    | x == '"' = replaceQuotes xs
    | otherwise = x : replaceQuotes xs

splitNames :: String -> String
splitNames [] = []
splitNames (x:xs)
    | x == ',' = "\n" ++ splitNames xs
    | otherwise =  x : splitNames xs

main = do
    handle <- openFile "p042_words.txt" ReadMode
    contents <- hGetContents handle
    print $ length $ filter isTriangleWord $ (lines . splitNames . replaceQuotes) contents
