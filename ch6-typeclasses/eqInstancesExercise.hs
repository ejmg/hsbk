-- eqInstancesExercise.hs

module EqInstancesExercise where

-- first

-- remember, the first declaration in the definition of a data constructor is the
-- constructor itself.
data TisAnInteger =
  TisAn Integer deriving Show

instance Eq TisAnInteger where
  (==) (TisAn i)
       (TisAn i') =
    i == i'

-- second

-- given
data TwoIntegers =
  Two Integer Integer deriving Show

instance Eq TwoIntegers where
  (==) (Two a b) (Two a' b') =
    a == a' &&
    b == b'

-- third

-- given
data StringOrInt =
  TisAnInt Int
  | TisAString String

instance Eq StringOrInt where
  (==) (TisAnInt a) (TisAnInt a') =
    a == a'
  (==) (TisAString b) (TisAString b') =
    b == b'
  (==) _ _ = False
