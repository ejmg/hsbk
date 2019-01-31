module BottomMadness where

-- will they return values or bottom?

-- # 1:
-- Answer: Bottom. Will throw exception moment `undefined` is evaluated.

-- # 2:
-- Answer: returns [1]

-- # 3:
-- Answer: Bottom. Exception thrown.

-- # 4:
-- Answer: returns 3

-- # 5:
-- Answer: Bottom. Exception thrown.
{-
   Worth discussing: undefined concatenated as an element to a list, which
   violates the type signature. However, before that even happens, undefined
   itself itself is evaluated, which throws an exception rather than a plain
   type error.
-}

-- # 6:
-- Answer: [2]

-- # 7:
-- Answer: Bottom. Exception thrown.

-- # 8:
-- Answer: [1]

-- # 9:
-- Answer: [1, 3]

-- # 10:
-- Answer: Bottom. Exception thrown.
