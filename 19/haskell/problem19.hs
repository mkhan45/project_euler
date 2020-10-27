-- I could do this with math but i dont want to

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday deriving (Bounded, Enum, Eq, Show)
data Month = January | February | March | April | May | June | July | August | September | October | November | December 
    deriving (Bounded, Enum, Eq, Show)
type Year = Int
type DayNum = Int

data Date = Date Year Month DayNum Day deriving (Eq, Show)

next :: (Eq a, Enum a, Bounded a) => a -> a
next x = if x == maxBound then minBound else succ x

addDay :: Date -> Date
addDay (Date year month daynum day) = Date nextYear nextMonth nextNum nextDay
    where nextYear = if (month, daynum) == (December, 31) then year + 1 else year
          nextMonth = if daynum == (numDays month year) then next month else month
          nextNum = if daynum == (numDays month year) then 1 else daynum + 1
          nextDay = next day

          -- A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
          isLeapYear year
            | year `rem` 400 == 0 = True
            | year `rem` 4 == 0 = year `rem` 100 /= 0
            | otherwise = False

          numDays :: Month -> Year -> Int
          numDays month year
            | month == February = if isLeapYear year then 29 else 28
            | month `elem` [September, April, June, November] = 30
            | otherwise = 31

-- overcounts by 1 and i've no idea why
countSundays :: Date -> Date -> Int
countSundays start_date end_date = length $ filter isSundayFirst (takeWhile (/= end_date) (iterate addDay start_date))
    where isSundayFirst :: Date -> Bool
          isSundayFirst (Date _ _ 1 Sunday) = True
          isSundayFirst _ = False

main = putStrLn $ show $ countSundays (Date 1901 January 1 Tuesday) (Date 2000 December 31 Sunday)
