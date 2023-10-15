{- Mood Swing -}

data Mood = Blah | Woot deriving Show
-- 1. type construct - Mood
-- 2. Blah (or) Woot, its data constructors
-- 3. Function type signatures can only map between type constructors.
changeMood :: Mood -> Mood
-- 4. 
changeMood Blah = Woot
changeMood Woot = Blah  

{- Chapter Exercises -}

awesome = ["Papuchon", "curry", ":)"]
also = ["Quake", "The Simons"]
allAwesome = [awesome, also]

-- 1. length :: [a] -> Integer
--
-- 2. 5, 3, 2, 5
--
-- 3. 6 / length [1,2,3] returns error as length returns Int but 
--    (/) requires 2 Fractional inputs.
--
-- 4. 6 `div` length [1,2,3] ==> 2
--
-- 5. type of 2 + 3 == 5 is Bool. Result is True.
--
-- 6. Bool, False.
--
-- 7. Works? If yes, result?
--
-- > length allAwesome == 2
-- True
-- > length [1, 'a', 3, 'b']
-- Doesnt work as lists can only have elements of same type.
-- > length allAwesome + length awesome
-- 2 + 3 ==> 5
-- > (8 == 8) && ('b' < 'a')
-- True && False ==> False
-- > (8 == 8) && 9
-- Doesnt work as (&&) :: Bool -> Bool -> Bool
--
-- 8. 
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome s = s == reverse s

-- 9. 
myAbs :: Integer -> Integer
myAbs n = if n > 0 then n else (- n)

-- 10. 
f :: (a,b) -> (c,d) -> ((b,d),(a,c))
f x y = ((snd x, snd y), (fst x, fst y))

{- Syntax -}

-- 1.  
x = (+)
ff :: String -> Int
ff xs = x w 1
     where w = length xs

-- 2.
idd = (\x -> x)

-- 3.
fff (a,b) = a

-- MCQ
-- 1. c
-- 2. b
-- 3. a
-- 4. d 
