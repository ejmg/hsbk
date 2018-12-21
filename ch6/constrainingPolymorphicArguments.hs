module ConstrainingPolymorphicArguments where

-- given a type
data Identity a = Identity a

-- how do we know that the type variable `a` itself has an Eq
-- instance? This matters because the following Eq instance will fail:

-- instance Eq (Identity a) where
--   (==) (Identity v) (Identity v') = v == v'

-- Solution: Enforce that `a` itself must have the type class Eq implemented

instance Eq a => Eq (Identity a) where
  (==) (Identity v) (Identity v') = v == v'
