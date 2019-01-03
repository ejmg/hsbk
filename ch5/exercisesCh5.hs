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


-- Type variable or specific constructor?
