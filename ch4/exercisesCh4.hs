module ExercisesCh4 where

p = "Papuchon"
s = "The Simons"
also = ["Quake", s]
awesome = [p, "curry", ":)"]
allAwesome = [awesome, also]

-- # 8
isPalinddrome :: (Eq a) => [a] -> Bool
isPalinddrome x = if reverse x == x
                  then True
                  else False

-- # 9
myAbs :: Integer -> Integer
myAbs x = if x < 0
          then (-x)
          else x

-- # 10
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = ((snd x, snd y), (fst x, fst y))

-- # 1
x = (+)
lAdd :: [a] -> Int
lAdd xs = w `x` 1
  where w = length xs

-- # 2

id' = \i -> i

-- # 3
f' (a, b) = a
