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
            go (dropWhile (/=' ') str') (ls ++ [(takeWhile (/=' ') str')])
          | not $ startWithWord str' =
            go (dropWhile (==' ') str') ls
          | otherwise = ls


-- # 2:

-- Similar to #1, but break on '\n' escape character.

-- Given:

-- module PoemLines where

firstSen = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful\
            \ symmetry?"
sentences = firstSen ++ secondSen
  ++ thirdSen ++ fourthSen

shouldEqual =
  [ "Tyger Tyger, burning bright"
  , "In the forests of the night"
  , "What immortal hand or eye"
  , "Could frame thy fearful symmetry?"
  ]

main :: IO ()
main =
  print $
  "Are they equal? "
  ++ show (myLines sentences
           == shouldEqual)


-- Answer:

myLines :: String -> [String]
myLines sntnc = go sntnc []
  where go sntnc' ls
          | sntnc' == "" = ls          
          | (dropWhile (/='\n') sntnc' /="") && ((head sntnc') /= '\n')=
              go (dropWhile (/='\n') sntnc')
              (ls ++ [(takeWhile (/='\n') sntnc')])
          | (sntnc' /= "") && ((last sntnc') /= '\n') =
              go "" (ls ++ [sntnc'])
          | (sntnc' /= "") =
              go (tail sntnc') ls
          | otherwise = []

-- myLines sntnc = go sntnc []
--   where go sntnc' ls
--           | sntnc' == "" = ls
--           | (dropWhile (/='\n') sntnc' /="") =
--               go (dropWhile (/='\n') sntnc')
--               (ls ++ [(takeWhile (/='\n') sntnc')])
--           | (sntnc' /= "") =
--               go "" (ls ++ [sntnc'])
--           | otherwise = []
