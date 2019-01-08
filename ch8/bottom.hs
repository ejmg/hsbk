module Bottom where

-- One type of bottom is a computation that terminates with an error.

f :: Bool -> Int

-- we explicitly tell GHC to throw this error, but it still counts as a bottom
f True = error "blah"
f False = 0

-- Similarly, if we define our function only partially, also will get bottom.
f' :: Bool -> Int
f' False = 0


-- can make partial function into total function with Maybe:
-- data Maybe a = Nothing | Just a

f'' :: Bool -> Maybe Int
f'' False = Just 0
f'' _ = Nothing
