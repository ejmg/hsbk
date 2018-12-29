module SomeGuards where

myAbs :: Integer -> Integer
myAbs x
  | x < 0     = (-x)
  | otherwise = x


-- can have guards with different types of expressions

isRight :: (Num a, Eq a) => a
        -> a
        -> a
        -> String

isRight a b c
  | a^2 + b^2 == c^2 = "RIGHT ON, BROTHER - HH"
  | otherwise        = "THIS AINT IT, CHIEF - HH"

-- Can also use where clauses:

aveGrade :: (Fractional a, Ord a ) => a -> String
aveGrade x
  | y >= 0.90  = "A"
  | y >= 0.80  = "B"
  | y >= 0.70  = "C"
  | y >= 0.59  = "D"
  | otherwise = "F"
  where y = x / 100.0
