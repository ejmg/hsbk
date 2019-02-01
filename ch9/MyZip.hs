module MyZip where


myZip :: [a] -> [b] -> [(a, b)]
myZip [] _ = []
myZip _ [] = []
myZip xs ys = go xs ys []
  where go xs' ys' ls
          | null xs' || null ys' =
            ls
          | otherwise =
              go (tail xs') (tail ys') (ls ++ [(head xs', head ys')])

myZipWith :: (a -> b -> c)
          -> [a] -> [b] -> [c]
myZipWith _ [] _ = []
myZipWith _ _ [] = []
myZipWith f xs ys = go xs ys []
  where go xs' ys' ls
          | null xs' || null ys' =
              ls
          | otherwise =
              go (tail xs') (tail ys') (ls ++ [f (head xs') (head ys')])

myZip' :: [a] -> [b] -> [(a, b)]
myZip' [] _ = []
myZip' _ [] = []
myZip' xs ys = myZipWith (,) xs ys
