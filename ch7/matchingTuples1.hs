module TupleFunctions where

-- using pattern matching, fn is very clean.
addEmUp2 :: Num a => (a, a) -> a
addEmUp2 (x, y) = x + y

-- not using pattern matching 🤢
-- addEmUp2 tup = (fst tup) + (snd tup)

-- only care about first result, _ the rest!
fst3 :: (a, b, c) -> a
fst3 (x, _, _) = x

-- similarly...
third3 :: (a, b, c) -> c
third3 (_, _, x) = x
