-- exhaustiveInput.hs

module ExhaustiveInput where

f :: Int -> Bool

-- correctly catches all possible values to f to handle
f 2 = True
f _ = False

