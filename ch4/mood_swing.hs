module MoodSwing where

-- trivial data declaration

data Mood = Blah | Woot deriving Show

changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood _ = Blah

-- > changeMood Blah
-- Woot
-- > changeMood Woot
-- Blah
