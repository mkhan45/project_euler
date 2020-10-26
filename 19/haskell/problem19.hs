-- I could do this with math but i dont want to

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday deriving (Eq, Show)
data Month = January | February | March | April | May | June | July | August | September | October | November | December deriving (Eq, Show)
type Year = Int
type DayNum = Int

data Date = Date Year Month DayNum Day deriving (Eq, Show)

class Next a where
    next :: a -> a

instance Next Day where
    next Monday = Tuesday
    next Tuesday = Wednesday 
    next Wednesday = Thursday 
    next Thursday = Friday 
    next Friday = Saturday 
    next Saturday = Sunday 
    next Sunday = Monday
    
instance Next Month where
    next January = February 
    next February = March 
    next March = April 
    next April = May 
    next May = June 
    next June = July 
    next July = August 
    next August = September 
    next September = October 
    next October = November 
    next November = December 
    next December = January

instance Next Date where
    next (Date year month daynum day) = Date nextYear nextMonth nextNum nextDay
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
countSundays :: Date -> Int
countSundays date = sum $ map (fromEnum . isSundayFirst) (takeWhile before2001 (iterate next date))
    where isSundayFirst :: Date -> Bool
          isSundayFirst (Date _ _ 1 Sunday) = True
          isSundayFirst _ = False

          before2001 :: Date -> Bool
          before2001 (Date year _ _ _) = year < 2001

main = putStrLn $ show $ countSundays (Date 1901 January 1 Monday)
