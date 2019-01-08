module PatMatch where

-- match on head

myH :: [a] -> a
myH (x : _) = x
-- Note: this is not exhaustive :(

-- match on tail

myT (_ : xs) = xs
-- Exhaustive!
myT _ = []


-- Alternative and arguably better, using Maybe:

myH' :: [a] -> Maybe a
myH' [] = Nothing
myH' (x : _) = Just x

myT' :: [a] -> Maybe [a]
myT' [] = Nothing
myT' (_ : []) = Nothing
myT' (_ : xs) = Just xs
