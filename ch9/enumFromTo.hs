module EnumFromTo where

-- Write own enumFromTo definitions by looking at their type sigs.

-- # 1:

-- Given:

eftBool :: Bool -> Bool -> [Bool]

-- Answer:

eftBool True True = [True] -- enumFromTo 1 1 returns [1]
eftBool True False = [] -- enumFromTo 1 0 returns []
eftBool False True = [False, True]
eftBool _ _ = [False]

-- # 2:

-- Given:

eftOrd :: Ordering
       -> Ordering
       -> [Ordering]

-- Answer:

eftOrd GT GT = [GT]
eftOrd EQ GT = [EQ, GT]
eftOrd LT GT = [LT, EQ, GT]
eftOrd EQ EQ = [EQ]
eftOrd LT EQ = [LT, EQ]
eftOrd LT LT = [LT]
eftOrd _  _  = []

-- # 3:

-- Given:

eftInt :: Int
       -> Int
       -> [Int]

-- Answer:

eftInt x y = go x y []
  where go i j ls
          | i == j = (i : ls)
          | i < j = 
            go i (j - 1) (j : ls)
          | otherwise = []

-- # 4:

-- Given:

eftChar :: Char -> Char -> [Char]
eftChar c c' = go c c' []
  where go i j ls
          | i == j = (i : ls)
          | i < j =
            go i (pred j) (j : ls)
          | otherwise = []
