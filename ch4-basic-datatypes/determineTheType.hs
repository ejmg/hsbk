{-# LANGUAGE NoMonomorphismRestriction #-}

module DetermineTheType where

-- simple example
example = 1

x = 5
y = x + 5
w = y * 10
z y = y * 10


a = "Julie"
b = " <3 "
c = "Haskell"
d = a ++ b ++ c -- f :: [a] -> [a] -> [a]
