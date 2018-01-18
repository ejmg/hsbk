-- eqInstancesExercise.hs

module EqInstancesExercise where

-- first

-- remember, the first declaration in the definition of a data constructor is the
-- constructor itself.
data TisAnInteger =
  TisAn Integer

instance Eq TisAnInteger where
  (==) (TisAn i) (TisAn i') =
    i == i'
