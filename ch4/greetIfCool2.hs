module GreetIfCool2 where

-- cool is defined as a function in this one
greetIfCool :: String -> IO ()
greetIfCool coolness = 
  if cool coolness
     then putStrLn "waaaaazzzup"
  else
    putStrLn "get outta here, boi"
  where cool v =
          v == "downright frosty"
