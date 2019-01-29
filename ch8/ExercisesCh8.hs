module ExercisesCh8 where

-- Multiple Choice
--------------------

-- # 1:
-- Answer: d

-- # 2:
-- Answer: b

-- # 3:
-- Answer: d

-- # 4:
-- Answer: b

-- Reviewing Currying
-----------------------
-- Given following definitions , tell us what value results from further
-- applications:

cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

-- Answer:

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"

-- # 1:
-- Answer: "woops mrow woohoo!"

-- # 2:
-- Given: frappe "1"
-- Answer: "1 mrow haha"

-- # 3:
-- Given: frappe (appedCatty "2")
-- Answer: "woops mrow 2 mrow haha"

-- # 4:
-- Given: appedCatty (frappe "blue")
-- Answer: "woops mrow blue mrow haha"

-- # 5:
-- Given: cattyConny (frappe "pink")
--                   (cattyConny "green" (appedCatty "blue"))
-- Answer: "pink mrow haha mrow green mrow woops mrow blue"

-- # 6:
-- Given: cattyConny (flippy "pugs" "are") "awesome"
-- Answer: "are mrow pugs mrow awesome"

-- Recursion
---------------


