-- typeInference1.hs
module TypeInference1 where

f :: Num a => a -> a -> a
f x y = x + y + 3

tripleTyped :: Integer -> Integer
tripleTyped x = x * 3
