-- printfixed.hs

module PrintFixed where

printSecond :: IO()
printSecond =
  putStrLn greeting

greeting :: String
greeting = "yarrr"

main :: IO()
main = do
  putStrLn greeting
  printSecond
