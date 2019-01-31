module ExercisesCh8 where
import Data.List (intersperse)


-- Multiple Choice
--------------------

-- # 1:
-- Answer: d

-- # 2:
-- Answer: b

-- # 3:
-- Answer: d

-- # 4:
-- Answer: b

-- Reviewing Currying
-----------------------
-- Given following definitions , tell us what value results from further
-- applications:

cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

-- Answer:

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"

-- # 1:
-- Answer: "woops mrow woohoo!"

-- # 2:
-- Given: frappe "1"
-- Answer: "1 mrow haha"

-- # 3:
-- Given: frappe (appedCatty "2")
-- Answer: "woops mrow 2 mrow haha"

-- # 4:
-- Given: appedCatty (frappe "blue")
-- Answer: "woops mrow blue mrow haha"

-- # 5:
-- Given: cattyConny (frappe "pink")
--                   (cattyConny "green" (appedCatty "blue"))
-- Answer: "pink mrow haha mrow green mrow woops mrow blue"

-- # 6:
-- Given: cattyConny (flippy "pugs" "are") "awesome"
-- Answer: "are mrow pugs mrow awesome"

-- Recursion
---------------

-- # 1:

-- # 2:

-- Answer
rSum :: (Eq a, Num a) => a -> a
rSum 0 = 0
rSum n = n + rSum (n - 1)

-- # 3:

-- Answer: 
rMult :: Integral a => a -> a -> a

-- Better solution?
rMult a b 
  | (a == 0 || b == 0) = 0
  | (a < b) = rMult b a
  | b == 1 = a
  | otherwise = a + rMult a (b - 1)

-- Fixing dividedBy
----------------------

-- As provided in book, div function wasn't ideal bc didn't handle 0 or (-)
-- values correctly, fix it.

data DividedResult =
    Result Integer
  | DividedByZero deriving (Show)

type Numerator = Integer
type Denominator = Integer
type Quotient = Integer

dividedBy :: Numerator
          -> Denominator
          -> Quotient

-- traditional division... yay?
dividedBy = div

-- recursive form

dividedBy' :: Integer
           -> Integer
           -> DividedResult
dividedBy' num denom = go absN absD 0
  where mult = signum num * signum denom
        absN = abs num
        absD = abs denom
        go n d count
          | d == 0 = DividedByZero
          | n == 0 = Result $ mult * count
          | n < d = Result $ mult * count
          | otherwise =
              go (n - d) d (count + 1)

-- McCarthy 91 function
---------------------------

mc91 :: Integer -> Integer
mc91 n
  | n <= 100 = mc91 . mc91 $ n + 11
  | otherwise = n - 10

-- Number into words
-----------------------

digitToWord :: Int -> String
digitToWord n
  | n == 0 = "zero"
  | n == 1 = "one"
  | n == 2 = "two"
  | n == 3 = "three"
  | n == 4 = "four"
  | n == 5 = "five"
  | n == 6 = "six"
  | n == 7 = "seven"
  | n == 8 = "eight"
  | n == 9 = "nine"
  | otherwise = "HMMM"

oneDigit :: Int -> Bool
oneDigit n = elem (div n 1) [0..9]

digits :: Int -> [Int]
digits n = go n []
  where go n' ls
          | (signum n') == (-1) =
              go (abs n') ls
          | oneDigit n' =
            n' : ls
          | otherwise =
              go (div n' 10) (mod n' 10 : ls)

-- solution is predicated on input not having *any* leading 0's.
-- not sure how to make a cute but efficient solution to handle this
-- without string interpolation or bit flipping.
wordNumber :: Int -> String
wordNumber n = concat
               . intersperse "-"
               $ map digitToWord
               $ digits n
