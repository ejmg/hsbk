module TypeKwonDo where

-- Example:

data Woot
data Blah

f' :: Woot -> Blah
f' = undefined

g' :: (Blah, Woot) -> (Blah, Blah)

-- g' = ? ? ?
-- Answer:

g' (b, w) = (b, f' w)

-- # 1:

f :: Int -> String
f = undefined

g :: String -> Char
g = undefined

h :: Int -> Char

-- h = ? ? ?
-- Answer:

h x = g . f $ x

-- # 2:

-- Given:

data A
data B
data C

q :: A -> B
q = undefined

w :: B -> C
w = undefined

e :: A -> C

-- e = ? ? ?
-- Answer:

e a = w . q $ a


-- # 3:

-- Given:

data X
data Y
data Z

xz :: X -> Z
xz = undefined

yz :: Y -> Z
yz = undefined

xform :: (X, Y) -> (Z, Z)

-- xform = ? ? ?
-- Answer:

xform (x, y) = (xz x, yz y)

-- # 4:

-- Given:

munge :: (x -> y)
      -> (y -> (w, z))
      -> x
      -> w

-- munge = ? ? ?
-- Answer:

munge xToY yToWZ x =
  fst . yToWZ . xToY $ x
