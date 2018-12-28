module PalindromeCheck where


pal :: String -> String
pal xs =
  case xs == reverse xs of
    True -> "yeeeeaaaa boiii, it's a palindrome!"
    False -> "hell no"

-- alternative where clause version:

pal' :: String -> String
pal' xs =
  case y of
    True -> "yeeeeaaaa boiii, it's a palindrome!"
    False -> "hell no"
  where y = xs == reverse xs
