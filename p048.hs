selfPowerSum :: Integer -> Integer
selfPowerSum 1 = 1
selfPowerSum x = x^x + selfPowerSum (x-1)

lastTen :: String -> String
lastTen (x:xs)
    | strLen <= 10 = xs
    | otherwise = lastTen xs
    where strLen = length xs

main = print $ lastTen $ show $ selfPowerSum 1000
