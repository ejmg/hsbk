module Indentation where

-- neither of the following will actually load/compile as is.

-- let
--   x = 3
--   y = 4

-- let x = 3
--     y = 4

-- good example of well indented declaration

foo x =
  let y = x * 2
      z = x ^ 2
  in 2 * y * z

-- alternative but still well indented & follows standards (4 space indent tho)

bar x =
    let y = x * 2
        z = x ^ 2
    in 2 * y * z

