-- typeKwonDo.hs

module TypeKwonDo where

-- first set

f :: Int -> String
f = undefined
g :: String -> Char
g = undefined
h :: Int -> Char
-- h = ???
h x = g ( f x )

-- second set

data A
data B
data C
q :: A -> B
q = undefined
w :: B -> C
w = undefined
e :: A -> C
-- e = ???
e x = w (q x)

-- third set

data X
data Y
data Z
xz :: X -> Z
xz = undefined
yz :: Y -> Z
yz = undefined
xform :: (X, Y) -> (Z, Z)
-- xform = ???

xform (x, y) = (xz x, (yz y))

-- fourth set

munge :: (x -> y)
      -> (y -> (w, z))
      -> x
      -> w
-- munge = ???

munge xToY yToWZ x = fst (yToWZ (xToY x))
