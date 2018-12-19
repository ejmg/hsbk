module IfWhereWat where

t :: String
t = "truthin"
f :: String
f = "falsin"

main :: IO ()
main = do
  putStrLn ("t is " ++ t)
  putStrLn ("f is " ++ f)
  putStrLn ("if True then t else f?")
  print (if True then t else f)
  putStrLn ("if False then t else f?")
  print (if False then t else f)
