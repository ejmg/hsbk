module GreetIfCool1 where

greetIfCool :: String -> IO ()
greetIfCool coolness =
  if cool
     then putStrLn "waaaaazzzup"
  else
    putStrLn "get outta here, boi"
  where cool =
          coolness == "downright frosty"
