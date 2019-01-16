module FearfulSymmetry where

-- # 1:

-- Write Fn that takes a string and returns a list of strings using spaces to
-- separate the elements of the string into words.

startWithWord :: String -> Bool
startWithWord str =
  takeWhile (==' ') str ==""

myWords :: String -> [String]
myWords str = go str []
  where go str' ls
          | str' == "" = ls
          | startWithWord str' =
            go (dropWhile (/=' ') str') ((takeWhile (/=' ') str') : ls)
          | (not (startWithWord str')) =
            go (dropWhile (==' ') str') ls
          | otherwise = []
