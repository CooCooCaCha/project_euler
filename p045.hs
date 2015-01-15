import Data.List

t = map (`div` 2) $ filter even [x*(x+1) | x <- [1..]]
p = map (`div` 2) $ filter even [x*(3*x-1) | x <- [1..]]
h = [x*(2*x-1) | x <- [1..]]

merge :: (Ord a) => [a] -> [a] -> [a]
merge xs@(x:xt) ys@(y:yt) = 
  case compare x y of
      LT -> (merge xt ys)
      EQ -> x : (merge xt yt)
      GT -> (merge xs yt)

main = print $ take 3 $ merge h $ merge t p
