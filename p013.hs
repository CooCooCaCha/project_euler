import System.IO

main = do
    handle <- openFile "number_list.txt" ReadMode
    contents <- hGetContents handle
    let nums = map read (lines contents) :: [Integer]
    let answer = take 10 (show $ sum nums)
    putStrLn answer
    hClose handle
