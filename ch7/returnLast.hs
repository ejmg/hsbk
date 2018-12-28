module ReturnLast where

-- type sig says "give me 4 args and I'll toss all of them, save for `d`."
returnLast :: a -> b -> c -> d -> d
-- fn declaration does exactly that:
returnLast _ _ _ d = d

-- we can explicitly parenthesize the associativity of the fn type, (->)
-- this is functionally the same as the first declaration but with currying
-- behavior made explicit. It conforms to the right associativity of (->) as
-- expected and intended.
returnLast' :: a -> (b -> (c -> (d -> d)))
-- same behavior, compiles without issue.
returnLast' _ _ _ d = d

-- We can try flipping the explicit parenthesization, and it will result in a
-- fn that won't compile:
-- returnBroke :: (((a -> b) -> c) -> d) -> d
-- returnBroke _ _ _ d = d

-- does not work, why? We are asking for something fundamentally different
-- in the type signature versus the Fn declaration itself!

-- The signature tells us that the fn takes **one** argument, which is a Fn
-- itself, defined: `(((a -> b) -> c) -> d)`

-- We can get a Fn that performs this behavior, though! We just need to
-- realize that our parenthesization is asking for something else!

-- we parenthesize to the left so we can refer to a separate Fn, (a -> b),
-- and use it as an argument. We made a HOF!
returnAfterApply :: (a -> b) -> a -> c -> b
-- Defintion tells us: "Take a fn and two values as arguments. Throw away the
-- second and apply the fn to the first."
returnAfterApply f a c = f a

-- > f' = returnAfterApply (-) 3 2
-- > f' 2
-- 1
