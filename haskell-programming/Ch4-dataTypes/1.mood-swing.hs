data Mood = Blah | Woot deriving Show
-- 1. type construct - Mood
-- 2. Blah (or) Woot, its data constructors
-- 3. Function type signatures can only map between type constructors.
changeMood :: Mood -> Mood
-- 4. 
changeMood Blah = Woot
changeMood Woot = Blah  

