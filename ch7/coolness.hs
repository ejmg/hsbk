module Coolness where

greetIfCool :: String -> IO ()
greetIfCool coolness =
  case cool of
    True ->
      putStrLn "ey, what's good?"
    False ->
      putStrLn "booooi get out of here"
    where cool =
            coolness == "WU TANG!"
