{- MCQ -}

-- 1. d
-- 2. b
-- 3. d
-- 4. b

{- Currying -}

cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

-- fill in the types

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"

-- Evaluate

-- 1. appedCatty "woohoo!"
--      "woops mrow whoohoo!"
-- 2. frappe "1"
--      "1 mrow haha"
-- 3. frappe (appedCatty "2")
--      "woops mrow 2 mrow haha"
-- 4. appedCatty (frappe "blue")
--      "woops mrow blue mrow haha"
-- 5. cattyConny (frappe "pink") (cattyConny "green" (appedCatty "blue"))
--      "pink mrow haha mrow green mrow woops mrow blue"
-- 6. cattyConny (flippy "Pugs" "are") "awesome"
--      "are mrow Pugs mrow awesome"


{- Recursion -}

-- 1. 😨

-- 2. sum recursively from 1 to n
sumRec :: (Eq a, Num a) => a -> a
sumRec 1 = 1
sumRec n = n + sumRec (n-1)

-- 3. recursive multiplication by adding
multRec :: (Integral a) => a -> a -> a
multRec _ 0 = 0
multRec x 1 = x
multRec x y = x + multRec x (y-1)


-- 😨 x2


{- Numbers ~~~> Words -}

digitToWord :: Int -> String
digitToWord 0 = "zero"
digitToWord 1 = "one"
digitToWord 2 = "two"
digitToWord 3 = "three"
digitToWord 4 = "four"
digitToWord 5 = "five"
digitToWord 6 = "six"
digitToWord 7 = "seven"
digitToWord 8 = "eight"
digitToWord 9 = "nine"

-- digits :: Int -> [Int]
-- digits n = undefined

wordNumber :: Int -> String
wordNumber n | n < 10 = digitToWord n
             | otherwise = wordNumber (div n 10) ++ "-"  ++ digitToWord (mod n 10)

