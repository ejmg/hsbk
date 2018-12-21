module TypeClassInheritance where

-- the following function:
divThenAdd x y = (x / y) + 1

-- will compile just fine alone. However, if it were given the following type
-- sig, it would throw an error upon compiling/loading:
-- divThenAdd Num a => a -> a -> a


-- this is because, in a sense, Num is not "constrained" enough as T.C. It does
-- not have access to the (/) operator. What T.C. does? Fractional!

-- This Works. Also what is inferred by the compiler absent the explicitly
-- declared type signature.
divThenAdd :: Fractional a => a -> a -> a 

-- Key lesson: T.C. inheritance in Haskell works "top down" in an additive
-- manner. While Fractional values can use Num methods, Num values cannot
-- necessarily use Fractional methods. Those that can are... Fractional!

