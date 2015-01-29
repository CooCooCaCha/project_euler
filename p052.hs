import Data.List

isPermMult x = ((==1) . length . nub) $ map (sort . show) $ map (*x) [1..6]

main = print $ head $ filter isPermMult [1..]
