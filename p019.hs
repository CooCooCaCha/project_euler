import Data.Time.Calendar
import Data.Time.Calendar.WeekDate

daysFromStart :: Integer -> Day
daysFromStart x = addDays x $ fromGregorian 1901 1 1

dayOfWeek :: (Integer, Int, Int) -> Int
dayOfWeek (year,week,day) = day

isFirstOfMonth :: (Integer, Int, Int) -> Bool
isFirstOfMonth (year,month,day) = day == 1

sunday = 7

main = print $ length $ filter (==sunday) $ map (dayOfWeek . toWeekDate) $ 
    filter (\x -> isFirstOfMonth $ toGregorian x) $ map daysFromStart [0..36524]