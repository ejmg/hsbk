module CaseExpr where

-- if-then-else equivalent:
-- if x + 1 == 1 then "nice" else "oh..."

-- turns out that Num doesn't have Eq as a superclass?
funcZ :: (Num a, Eq a) => a -> String
funcZ x =
  case x + 1 == 1 of
    True -> "cool"
    False -> "oh..."
