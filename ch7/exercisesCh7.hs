module ExerciseCh7 where

-- Multiple Choice
---------------------

-- # 1:
-- Answer: d

-- # 2:
-- Answer: b

-- Test with:
-- f :: Char -> String
-- f x = x : "foo"
-- g :: String -> [String]
-- g x = [x ,"bar"]

-- # 3:

-- Answer: d

-- Test with:
-- f :: Ord a => a -> a -> Bool
-- f x y = x > y

-- # 4:
-- Answer: b

-- # 5:
-- Answer: a

-- Test with:
-- f :: a -> a
-- f x = x


-- Let's write code
------------------------


-- # 1:

-- Given:

tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = x `div` 10
        d     = xLast `mod` 10

--- --- a) Rewrite with divMod

--- --- Answer:

tensDigit' :: Integral a => a -> a -- Do NOT need to change typ sig.
tensDigit' x = snd . divMod y $ 10
  where y = fst . divMod x $ 10

--- --- b) does it have the same type? Yes.

--- --- c) Change to get hundreds digit instead:

hunsDigit :: Integral a => a -> a
hunsDigit x = snd . divMod y $ 10
              where y = fst . divMod x $ 100


-- # 2:

-- Given:

foldBool :: a -> a -> Bool -> a

--- --- a) impl once with case expr

foldBool a a' boo =
  case boo of
    True -> a'
    False -> a

--- --- b) impl once with guards

foldBool'' :: a -> a -> Bool -> a
foldBool'' a a' boo
  | boo == True = a'
  | otherwise = a

-- # 3:

-- Given:

g :: (a -> b) -> (a, c) -> (b, c)

-- Answer:

g aToB (a, c) =
  (aToB a, c)

