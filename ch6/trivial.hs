module Trivial where

-- as is, will throw error if we try to compare.
data Trivial = Trivial'

-- here is error for trying `Trivial' == Trivial'` with no Eq instance:
--
-- <interactive>:421:1-18: error:
--     • No instance for (Eq Trivial) arising from a use of ‘==’
--     • In the expression: Trivial' == Trivial'
--       In an equation for ‘it’: it = Trivial' == Trivial'


instance Eq Trivial where
  Trivial' == Trivial' = True

