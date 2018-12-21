module Uncurried where

nonsense :: Bool -> Integer
nonsense True = 21
nonsense False = 109


-- all of these will yield same result
curriedFn :: Integer 
          -> Bool
          -> Integer
curriedFn i b = 
  i + (nonsense b)

anon :: Integer 
     -> Bool
     -> Integer
anon = \f b -> f + (nonsense b)

-- manually nest lambdas to avoid automatic currying.
anonNested :: Integer 
           -> Bool 
           -> Integer
anonNested =
  \i -> \b -> i + (nonsense b)
