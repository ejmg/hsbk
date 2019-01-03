-- monomorphism restriction is by default.
-- what it does is tries to infer a concrete when possible for a top level
-- declarations. this disables that.
{-# LANGUAGE NoMonomorphismRestriction #-}

module ExercisesCh5 where

-- determine the most polymorphic type for the declarations below:

-- # 1: function applications

a1 = (* 9) 6
-- 54, type: Num a

b1 = head [(0, "doge"), (1, "kitteh")]
-- (0, "doge"), type: (Num a, [Char])

c1 = head [(0 :: Integer, "doge"), (1, "kitteh")]
-- (0, "doge"), type: (Integer, [Char])

d1 = if False then True else False
-- False, type: Bool

e1 = length [1, 2, 3, 4, 5]
-- 5, type: Int

f1 = (length [1, 2, 3, 4]) > (length "TACOCAT")
-- False, type Bool

-- # 2: Given

x2 = 5
y2 = x2 + 5
w2 = y2 * 10

-- what is type of w?
-- answer: Num a.

-- # 3: Given

x3 = 5
y3 = x3 + 5
z y = y * 10

-- what is type of z?
-- answer: Num a => a -> a

-- # 4: Given

x4 = 5
y4 = x4 + 5
f4 = 4 / y4

-- what is type of f?
-- answer: Fractional a => a

-- #5: Given
x5 = "julie"
y5 = " <3 "
z5 = "haskell"
f5 = x5 ++ y5 ++ z5
-- what is type of f?
-- answer: [Char]


-- Does it compile?

-- # 1: No.

bigNum = (^) 5 $ 10
-- wahoo = bigNum $ 10 -- Error: expr bigNum is being applied, takes no args.
wahoo = (^) bigNum $ 10 -- or replace $ with infix op, etc

-- # 2: Yes.

x'2 = print
y'2 = print "woohoo"
z'2 = x'2 "hello world" 

-- # 3: No.

a'3 = (+)
b'3 = 5
-- c = b 10 -- Error: expr b is being applied, takes no args.
c'3 = a'3 b'3 -- or with original literal value, doesn't matter.
d'3 = c'3 200

-- # 4: No.

a'4 = 12 + b'4
-- b'4 = 10000 * c'4 -- Error: c'4 is not declared (at top level).
b'4 = 10000 * c'4
  where c'4 = 3 -- or just replace with literal, declare at top level, etc


-- Write a type signature

-- # 1:

-- given:

functionH (x:_) = x

-- answer

functionH :: [a] -> a

-- # 2:

-- given:

functionC x y =
  if (x > y)
  then True
  else False

functionC :: (Ord a) => a -> a -> Bool

-- Given a type, write the function

-- Example

-- Given:

myFunc :: (x -> y)
       -> (y -> z)
       -> (c)
       -> (a, x)
       -> (a, z)

-- write the function!

-- answer:

myFunc xToY yToZ _ (a, x) =
  (a, yToZ . xToY $ x)

-- # 1:

-- Given:
i :: a -> a

-- answer:
i x = x

-- # 2:

-- Given:

c :: a -> b -> a

-- answer:

c x _ = x

-- # 3

-- Given:

c'' :: b -> a -> b

-- Answer:

c'' x _ = x -- Note, alpha equivalence with # 2.

-- # 4:

-- Given:

c' :: a -> b -> b

-- Answer:

c' _ y = y

-- # 5:

-- Given:

r :: [a] -> [a]

-- Answer:

r x = tail x -- multiple valid answers.

-- # 6:

-- Given:

co :: (b -> c) -> (a -> b) -> a -> c


-- Answer:

co bToC aToB a =
  bToC (aToB a)  -- This is def of function composition, i think.

-- # 7:

-- Given:

a'' :: (a -> c) -> a -> a

-- Answer:

a'' _ a =
  a

-- # 8:

-- Given:

a''' :: (a -> b) -> a -> b

-- Answer:

a''' aToB a = aToB a


-- Fix it.

-- # 1:

-- module Sing where

fstString :: [Char] -> [Char]
fstString x = x ++ " in the rain"

sndString :: [Char] -> [Char]
sndString x = x ++ " over the rainbow"

sing = if (x < y) -- 
       then fstString x
       else sndString x
  where x = "Singin"
        y = "Somewhere"

-- # 2:

-- module Arith3Broken where

main :: IO ()

main = do
  print (1 + 2)
  putStrLn "10"
  print (negate (-1))
  print ((+) 0 blah)
    where blah = negate 1
    
