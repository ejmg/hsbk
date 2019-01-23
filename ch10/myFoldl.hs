module MyFoldl where

-- cute trick to see associativity of foldl

conc = concat
f x y = conc ["(", x, "+", y, ")"]
-- > foldl f "0" (map show [1..5])

-- Traditional definition per GHC <= 7.8

foldl' ::  (b -> a -> b)
       -> b
       -> [a]
       -> b
foldl' f acc []     = acc
foldl' f acc (x:xs) = foldl' f (f acc x) xs


-- Newer type definition per GHC >= 7.10
-- foldl'' :: Foldable t
--        => (b -> a -> b)
--        -> b
--        -> t a
--        -> b
