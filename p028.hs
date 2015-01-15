import Data.List

spiralDiags :: Int -> [Int]
spiralDiags 1 = [1]
spiralDiags n = [(start),(start+step)..(end)] ++ (spiralDiags (n-2))
    where end   = n^2
          start = end - step * 3
          step  = n - 1

main = print $ sum $ spiralDiags 1001
