module TypeClassConstraints where

-- type class-constrained polymorphic type variables is how we can play with
-- literals as different types of numerics

-- fifteen = 15
-- `:t fifteen` yields a type class constraint of  `Num a => a`

-- this is legal because of type class constraint polymorphism
fftnInt = fifteen :: Int
  where fifteen = 15 -- nods head
fftnDouble = fifteen :: Double 
  where fifteen = 15 -- nods more

main :: IO ()
main = do
  putStrLn "Type class-constrained polymorphism allows us to use the same"
  putStrLn "arithmetic operations (and functions generally) across all"
  putStrLn "types that implement an instance of the type class."
  putStr ("15 :: Int + 15 :: Int = ")
  print (fftnInt + fftnInt)
  putStr ("15 :: Double + 15 :: Double = ")
  print (fftnDouble + fftnDouble)
  -- can't mix streams, though
  -- 15 :: Double + 15 :: Int is illegal.
