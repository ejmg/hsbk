-- parametricity.hs

module Parametricity where

f :: a -> a
f x = x

f2 :: a -> a -> a

f2 x = id (f x)
