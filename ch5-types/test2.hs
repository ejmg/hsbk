co :: (b -> c) -> (a -> b) -> a -> c
-- co = undefined
co bToC aToB a =
  (bToC (aToB a))

ao :: (a -> c) -> a -> a
-- a = undefined
ao _ a = a

ao' :: (a -> b) -> a -> b
-- a' = undefined
ao' aToB a = aToB a
