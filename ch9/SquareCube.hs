module SquareCube where

-- Given:
mySqr = [x^2 | x <- [1..5]]
myCube = [y^3 | y <- [1..5]]

-- # 1:
-- Write expression that will make tuples of the outputs of mySqr and myCube

myTupls = [(x,y) | x <- mySqr, y <- myCube]

-- # 2:
-- Now edit so that it only have tuples with values < 50

myTupls' = [(x,y) | x <- mySqr, y <- myCube, x < 50, y < 50]

-- # 3:
-- "Apply another function to that list comprehension to determine how many
-- tuples inhabit your output list."

-- length myTupls' (?)
