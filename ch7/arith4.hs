module Arith4 where

-- # 4:

-- Given:

roundTrip :: (Show a, Read a) => a -> a

roundTrip a = read (show a)

-- # 5:

pfRoundTrip :: (Show a, Read a) => a -> a
pfRoundTrip = read . show

-- # 6:
roundTrip' :: (Show a, Read b) => a -> b
roundTrip' a = read (show a)

main :: IO ()
main = do
  print (pfRoundTrip 4)
  print (id 4)
  print ("roundTrip' next:")
-- I think this is the solution to # 6
  print (roundTrip' 4 :: Int)
