module Ex where
-- Building functions 
cur = "Curry is awesome"
-- 2.

a2 :: [Char] -> [Char]
a2 str = drop 0 str

b2 :: [Char] -> [Char]
b2 str = take 1 (drop 4 str)

c2 :: [Char] -> [Char]
c2 str = drop 9 str

-- 3.
three :: String -> Char
three str = str !! 2

-- 4.
four :: Int -> Char
four n = str !! n
  where str = "Curry is awesome"


