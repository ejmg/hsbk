module MyFoldr where
import           Data.Foldable(toList)

-- straightforward definition of foldr
foldr' :: (a -> b -> b)
       -> b
       -> [a]
       -> b

foldr' _ z []     = z
foldr' f z (x:xs) = f x (foldr' f z xs)


-- equal functionality, easier to follow for understanding
foldr'' :: (a -> b -> b)
       -> b
       -> [a]
       -> b

foldr'' f z xs =
  case xs of
    []     -> z
    (x:xs) -> f x (foldr'' f z xs)

-- I think this is the definition actually used by Data.List for lists...?:
-- import Data.Foldable(toList)
foldr''' :: Foldable t => (a -> b -> b) -> b -> t a -> b
foldr''' f z = foldr f z . toList
