module OldTupleExercise where

-- CH4 had exercise to make fn that met the signature:
foo :: (a, b) -> (c, d) -> ((b, d), (a, c))
-- one possible solution was to use functions introduced:
-- f x y = ((snd x, snd y), (fst x, fst y))
-- alternatively, though, could pattern match!
foo (a, b) (c, d) = ((b, d), (a, c))
-- λ> foo (3, 1) (4, 2)
-- ((1, 2), (3, 4))
