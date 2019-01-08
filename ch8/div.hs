module Div where

-- type aliases in haskell
type Numerator = Integer
type Denominator = Integer
type Quotient = Integer

dividedBy :: Numerator
          -> Denominator
          -> Quotient

-- traditional division... yay?
dividedBy = div

-- recursive form

dividedBy' :: Integral a
           => a
           -> a
           -> (a, a)
dividedBy' num denom = go num denom 0
  where go n d count
          | n < d = (count, n)
          | otherwise =
              go (n - d) d (count + 1)
