-- exercise from end of chapter
module BuildingFunctions where

-- input: "Hello World"
-- output: "ello World"

fun1 :: String -> String
fun1 x = tail x

-- input: "Curry is awesome!"
-- output: "Curry is awesome"

fun2 :: String -> String
fun2 x = take 16 x

-- input: "Curry is awesome"
-- output: "y"
fun3 :: String -> Char
fun3 x = x !! 4

-- input: "Curry is awesome"
-- output: "awesome!"
fun4 :: String -> String
fun4 x = drop 9 x

-- exercise 3
-- fn that returns third character
thirdLetter :: String -> Char
thirdLetter x = x !! 2

-- exercise 4
-- fn that returns the desired index for a constant string
letterIndex :: Int -> Char
letterIndex x = "Curry is awesome!" !! x

-- exercise 5
-- fn "rvrs" that takes the string "Curry is awesome" "reverses" it.
-- input: "Curry is awesome"
-- output: "awesome is Curry"
rvrs :: String -> String
rvrs x = fun4 x ++ (take 4 (drop 5 x))  ++ take 5 x
