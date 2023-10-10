-- Matching
--
-- not    :: Bool -> Bool
-- length :: [a] -> Int
-- concat :: [[a]] -> [a]
-- head   :: [a] -> a
-- (<)    :: Ord a => a -> a -> Bool
--
-- Arguments
-- 1. f :: a -> a -> a -> a 
--    x :: Char
--  f x :: Char -> Char -> Char   -- a.
--
-- 2. g :: a -> b -> c -> b 
--    g 0 'c' "woot" :: Char   -- d.
--
-- 3. h is (Num a, Num b) => a -> b -> b 
--    h 1.0 2 :: Num b => b  -- d.
--
-- 4. h 1 (5.5 :: Double) :: Double  -- c.
--
-- 5. jackal :: (Ord a, Eq b) => a -> b -> a 
--    jackal "str1" "str2" :: [Char]    -- a.
--
-- 6. jackal "keyboard" :: Eq b => b -> [Char]  -- b.
--
-- 7. kessel :: (Ord a, Num b) => a -> b -> a,
--    kessel 1 2 :: Num a => a -- WRONG --> as Complex is also an instance of Num ( and not Ord)
--               :: (Ord a, Num a) => a -- d.
--
-- 8. kessel 1 (2 :: Integer) : Num a => a -- WRONG    
--                            : (Ord a, Num a) => a -- a.
--
-- 9. kessel (1 :: Integer) 2 :: Integer  -- c.

--
-- Parametricity
--

-- 1. is id the only function with signature :: a -> a (fully polymorphic)
idt :: a -> a 
idt = undefined -- 🤡😹

-- 2. only funcs with following signature
g1 :: a -> a -> a 
g1 x y  = x

g2 :: a -> a -> a 
g2 x y = y

-- 3. 
h :: a -> b -> b -- h returns a functions hc :: b -> b,
h x p = p        -- since there is only one legit function of that type (id) 
-- above is the only legit function with the mentioned signature.
-- behavior doesnt change when types change

-- 
-- Apply Youzelf
-- 

-- 1.Type signature of general function (++) :: [a] -> [a] -> [a]
-- How might that change when we apply it to the following value?
myConcat x = x ++ " yo"          -- [Char] -> [Char]

-- 2. General function (*) :: Num a => a -> a -> a
-- Applied to a value
myMult x = (x / 3) * 5           -- Fractional a => a -> a

-- 3.
-- take :: Int -> [a] -> [a]
myTake x = take x "hey you"       --  Int -> [Char]

-- 4.
-- (>) :: Ord a => a -> a -> Bool
myCom x = x > (length [1..10])     -- Int -> Bool

-- 5.
-- (<) :: Ord a => a -> a -> Bool
myAlph x = x < 'z'                 -- Char -> Bool
