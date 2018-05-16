-- dates.hs

-- add a `deriving Show` clause to each so we can print them to REPL
data DayOfWeek =
  Mon | Tue | Wed | Thu | Fri | Sat | Sun deriving Show

data Date =
  Date DayOfWeek Int deriving Show

instance Eq DayOfWeek where
  (==) Mon Mon = True
  (==) Tue Tue = True
  (==) Wed Wed = True
  (==) Thu Thu = True
  (==) Fri Fri = True
  (==) Sat Sat = True
  (==) Sun Sun = True
  (==) _ _     = False


-- because the compiler is expecting values of DayOfWeek and Int, we don't
-- need to specify that in the instance declaration for the values compared
instance Eq Date where
  (==) (Date weekday dayOfMonth)
       (Date weekday' dayOfMonth') =
    weekday == weekday'
    && dayOfMonth == dayOfMonth'

