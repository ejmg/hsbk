module DayOfWeek where


data DayOfWeek =
  Sun | Mon | Tue | Weds | Thu | Fri | Sat

data Date =
  Date DayOfWeek Int

instance Eq DayOfWeek where
  (==) Sun Sun = True
  (==) Mon Mon = True
  (==) Tue Tue = True
  (==) Weds Weds = True
  (==) Thu Thu = True
  (==) Fri Fri = True
  (==) Sat Sat = True
  (==) _ _ = False

instance Eq Date where
  (==) (Date weekday dayOfMonth) (Date weekday' dayOfMonth') =
    weekday == weekday' && dayOfMonth == dayOfMonth'
