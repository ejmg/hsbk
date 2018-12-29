module ArtfulDodgy where

-- fill in type sig for the functions
dodgy :: Num a => a -> a -> a
dodgy x y = x + y * 10

oneIsOne :: Num a => a -> a
oneIsOne = dodgy 1

oneIsTwo :: Num a => a -> a
oneIsTwo = (flip dodgy) 2

main :: IO ()
main = do
  -- what do you think the results will be?
  -- I just check the expressions with equality against my estimated applications.
  print (dodgy 1 1 == 11)
  print (dodgy 2 2 == 22)
  print (dodgy 1 2 == 21)
  print (dodgy 2 1 == 12)
  print (oneIsOne 1 == 11)
  print (oneIsOne 2 == 21)
  print (oneIsTwo 1 == 21)
  print (oneIsTwo 2 == 22)
  print (oneIsOne 3 == 31)
  print (oneIsTwo 3 == 23)
