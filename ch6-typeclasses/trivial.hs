-- trivial.hs

module Trivial where

data Trivial =
  Trivial | NotTrivial


instance Eq Trivial where
  Trivial == Trivial = True
  NotTrivial == NotTrivial = True
  Trivial == NotTrivial = False
  NotTrivial == Trivial = False
