module ExercisesCh6 where
import           Data.List

-- Does is type check?
---------------------------

data Person = Person Bool deriving (Show) -- adding deriving clause fixes it.

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)

data Mood = Blah | Woot deriving (Show, Eq) -- adding Eq instance fixes.

settleDown x = if x == Woot
               then Blah
               else x

type Subject = String
type Verb = String
type Object = String

data Sentence =
  Sentence Subject Verb Object
  deriving (Eq, Show)

s1 = Sentence "Dogs" "drool" -- partially applied only.
s2 = Sentence "Julie" "loves" "dogs"
s1' = Sentence "Dogs" "drool" "on their bed." -- fully applied.


-- Given datatype, what can we do?
---------------------------------------


-- Given:
data Rocks = Rocks String deriving (Eq, Show, Ord)
data Yeah = Yeah Bool deriving (Show, Eq, Ord)
data Papu = Papu Rocks Yeah deriving (Show, Eq, Ord)

-- # 1: Does *not* type check.

-- Given:
-- phew = Papu "chase" True

-- Answer:
phew = Papu (Rocks "chases") (Yeah True)

-- # 2: Type checks!

-- Given:
truth = Papu (Rocks "chomskydoz") (Yeah True)

-- # 3: Type checks!

-- Given:
equalityForAll :: Papu -> Papu -> Bool
equalityForAll p p' = p == p'

-- # 4: Does *not* type check.

-- Given:
comparePapus :: Papu -> Papu -> Bool
comparePapus p p' = p > p'

-- Answer: Add `Ord` to deriving instances to all three types provided.
-- Test inputs:
-- > comparePapus (Papu (Rocks "foo") (Yeah True)) (Papu (Rocks "foo") (Yeah True)) -- they are equal
-- False
-- > comparePapus (Papu (Rocks "foo") (Yeah True)) (Papu (Rocks "boo") (Yeah True)) -- second papu has `boo` which is less than `foo`
-- True 


-- Match the types.
------------------------


-- # 1:

-- Given:

i :: Num a => a
i = 1

-- Try replacing with: i :: a

-- Answer: Will not type check. Too polymorphic.

-- # 2:

-- Given:

f :: Float
f = 1.0

-- Try: f :: Num a => a

-- Answer: Will *not* type check. Too polymorphic. Value of `1.0` infers to
-- stricter typeclass constraint of at least `Fractional a`

-- # 3:

-- Given:

-- f' :: Float
f' = 1.0

-- Try: f :: Fractional a => a

f' :: Fractional a => a

-- Answer: Typechecks! Works for reason explained in previous problem.

-- # 4:

-- Given:

-- f'' :: Float
f'' = 1.0

-- Try: f :: RealFrac a => a

f'' :: RealFrac a => a

-- Answer: Typechecks!

-- # 5:

-- Given:

-- freud :: a -> a
freud x = x

-- Try: freud :: Ord a => a -> a

freud :: Ord a => a -> a

-- Answer: Typechecks! Works on anything that at least has Ord impl.

-- # 6:

-- Given:

-- freud' :: a -> a
freud' x = x

-- Try: freud' :: Int -> Int

freud' :: Int -> Int

-- Answer: Typechecks! Works on anything that is of concrete Int type, obv.

-- # 7:

-- Given:

myX = 1 :: Int
sigmund :: Int -> Int
sigmund x = myX

-- Try: sigmund :: a -> a

-- Answer: Will *not* typecheck. New type sig is maximally polymorphic, value
-- assigned is the conrete type of Int.

-- # 8:

-- Given:

myX' = 1 :: Int

sigmund' :: Int -> Int
sigmund' x = myX'

-- Try: sigmund' :: Num a => a -> a

-- Answer: Will *not* typecheck. myX' is explicitly set to the concrete type of
-- Int, whereas sigmund' is expecting a value that is only polymorphically
-- constrianed by Num.

-- # 9:

-- Given:

-- need to import Data.List
-- jung :: Ord a => [a] -> a
jung xs = head (sort xs)

-- Try: jung :: [Int] -> Int
jung :: [Int] -> Int

-- Answer: Type checks!

-- # 10:

-- Given:

-- young :: [Char] -> Char
young xs = head (sort xs)

-- Try: young :: Ord a => [a] -> a

young :: Ord a => [a] -> a

-- Answer: Typechecks!

-- # 11:

-- Given:

mySort :: [Char] -> [Char]
mySort = sort

signifier :: [Char] -> Char
signifier xs = head (mySort xs)

-- Try: signifier :: Ord a => [a] -> a

-- Answer: Does *not* typecheck. We declare mySort to have a signature that
-- returns [Char]. This is a concrete type whereas the suggested type sig has
-- a maximally polymorphic type variable.


-- Type-Kwon-Do Two: Electrick Typealoo
---------------------------------------------

-- # 1:

-- Given:

chk :: Eq b => (a -> b) -> a -> b -> Bool

-- Answer:

chk aToB a b = (==) b . aToB $ a

-- Test example:
-- > chk fromRational 1.0 1
-- True
-- > chk fromRational 1.5 1
-- False

-- # 2:

arith :: Num b
      => (a -> b)
      -> Integer
      -> a
      -> b

-- this type checks but not sure one of the intended answers, lol.
-- arith aToB _ a =
--   aToB a

-- This more abides by the hint provided by book.
arith aToB _ a =
  aToB a + aToB a
