module Inc where

inc :: Num a => a -> a
inc = (+1)

-- definite # of applications.
three :: Num a => a
three = inc . inc . inc $ 0

-- abstract out # applications from inc and three.
incTimes :: (Eq a, Num a)
         => a
         -> a
         -> a
-- where:
-- times = # applications of (+1) desired
-- n = argument being applied to
incTimes 0 n = n
incTimes times n =
  1 + (incTimes (times - 1) n)

-- > incTimes 10 0
-- 10
-- > incTimes 5 5
-- 10

-- can abstract out the use of recursion itself from incTimes:

applyTimes :: (Eq a , Num a)
           => a
           -> (b -> b)
           -> b
           -> b
applyTimes 0 _ b = b
applyTimes n f b = f . applyTimes (n - 1) f $ b

incTimes' :: (Eq a, Num a)
          => a
          -> a
          -> a
incTimes' times n = applyTimes times (+1) n
