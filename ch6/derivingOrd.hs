module DerivingOrd where

-- in Haskell, can automatically derive some T.C. depending on your type.
data DayOfWeek =
  Sun | Mon | Tue | Weds | Thu | Fri | Sat
  deriving (Eq, Show) -- auto derive Eq, Show for DayOfWeek.

-- with Sum types, like DayOfWeek, if we derived Ord, the types are ordered
-- least to greatest according to Haskell's compiler.

-- If you want different behavior, must define yourself!

-- IMPORTANT: when defining, whether auto or not, Eq or Ord, you must have the
-- other defined as well. Will get warnings otherwise.

-- Let's make Friday greater than all other days
instance Ord DayOfWeek where
  compare Fri Fri = EQ
  compare Fri _ = GT
  compare _ Fri = LT
  compare _ _ = EQ -- all other days equally trash
