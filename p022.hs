import Data.Char
import Data.List
import System.IO

replaceQuotes :: String -> String
replaceQuotes [] = []
replaceQuotes (x:xs) = if x == '"'
                       then replaceQuotes xs
                       else x : replaceQuotes xs

splitNames :: String -> String
splitNames [] = []
splitNames (x:xs) = if x == ',' 
                    then "\n" ++ splitNames xs
                    else x : splitNames xs

charToNum :: Char -> Int
charToNum x = ord x - 64

scoreName :: String -> Int
scoreName [] = 0
scoreName (x:xs) = (charToNum x) + (scoreName xs)

main = do
    handle <- openFile "p022_names.txt" ReadMode
    contents <- hGetContents handle
    let names = map scoreName $ (sort . lines . splitNames . replaceQuotes) contents
    let numbered = map (\x -> (fst x) * (snd x))  $ zip [1..(length names)] names
    print $ sum numbered
    hClose handle
