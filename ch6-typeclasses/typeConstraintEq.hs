-- typeConstraintEq.hs

module TypeConstraintEq where

data Identity a =
  Identity a

-- dummy data type to compare (has no Eq type, will fail)
data NoEqInst = NoEqInst

-- using constrained polymorph, can now compare Identity type when param has Eq instance
instance Eq a => Eq (Identity a) where
  (==) (Identity a) (Identity a') = a == a'
