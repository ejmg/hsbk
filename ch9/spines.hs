module Spines where

-- This program will have a runtime error lol.


-- Demonstrates the nature of nonstrict eval in haskell, in particular how
-- spines are evaluated apart from their con cell values when in lists.
-- Functions such as length, which must traverse the structure (spine) of the
-- list, and syntax such as pattern matching will force strictness on the spine
-- without evaluating the values of con cells!

-- > :sprint undefLs
-- undefLs = _
-- > length undefLs -- will throw no error!
-- 3
-- > :sprint undefLs
-- undefLs = [_, _, _] -- spine was evaluated, but NOT the values!
undefLs = [undefined, undefined, undefined]

-- > length badUndefLs -- This will cause an error because the spine itself
-- contains `undefined`.
badUndefLs = [1] ++ undefined ++ [2]

main :: IO ()
main = do
  print "length forces strictness only on the spine of a list. Therefore, \
        \`length [undefined, undefined, undefined]` will work without error."
  print "> length undefLs"
  print $ length undefLs
  print "However, if the spine itself has `undefined`, an error will occur!"
  print "Evaluating `length ([1] ++ undefined ++ [2])` is going to crash the \
        \ the program. Goodbye!"
  print "> length badUndefLs"
  print $ length badUndefLs -- forced eval of spine with undef value, ERROR! 
