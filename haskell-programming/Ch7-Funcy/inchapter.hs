-- Grab Bag

-- 1. ALL of the following are equivalent
mTha x y z = x * y * z
mThb x y = \z -> x * y * z
mThc x = \y -> \z -> x * y * z
mThd = \x -> \y -> \z -> x * y * z -- all above have :: Num a => a -> a -> a -> a
                                   -- but mThd :: Integer -> Integer -> Integer -> Integer

-- 2. mTh 3 :: Num a =>  a -> a -> a

-- 3. 
-- a) Rewrite the f function in the where clause.
addOneIfOdd n = case odd n of
  True -> f n
  False -> n
  -- where f n = n + 1
  where f = \n -> n + 1

-- b) Rewrite the following to use anonymous lambda syntax:
-- addFive x y = (if x > y then y else x) + 5
addFive = \x -> (\y -> (if x > y then y else x) + 5)

-- c) Rewrite the following so that it doesn’t use anonymous lambda syntax:
-- mflip f = \x -> \y -> f y x
mflip f x y = f y x

{- 
 - Variety Pack
 - -}

-- 1.
k (x, y) = x
k1 = k ((4-1), 10)
k2 = k ("three", (1 + 2))
k3 = k (3, True)

-- a) k :: (a,b) -> a
-- b) k1 :: Num a => a, k2 :: [Char], k3 :: Num a => a
-- c) k1 & k3 


-- 2.
f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
-- f = undefined
f (a,b,c) (d,e,f) = ((a,d),(c,f))

{- 
 - Case Practice
 - -}
-- rewrite into case

-- 1. functionC x y = if (x > y) then x else y
functionC x y = case x > y of
  True -> x
  False -> y

-- 2. ifEvenAdd2 n = if even n then (n+2) else n
ifEvenAdd2 n = case even n of 
  True -> n + 2
  False -> n 

-- 3. 
nums x = case compare x 0 of
  LT -> -1
  GT -> 1
  EQ -> 0

{- 
 - Artful Dodgy
 - -}

dodgy :: Num a => a -> a -> a
dodgy x y = x + y * 10
oneIsOne :: Num a => a -> a
oneIsOne = dodgy 1
oneIsTwo :: Num a => a -> a
oneIsTwo = (flip dodgy) 2

-- 1. dodgy 1 0   ~~> 1 
-- 2. dodgy 1 1   ~~> 11
-- 3. dodgy 2 2   ~~> 22
-- 4. dodgy 1 2   ~~> 21 
-- 5. dodgy 2 1   ~~> 12
-- 6. oneIsOne 1  ~~> 11
-- 7. oneIsOne 2  ~~> 21 
-- 8. oneIsTwo 1  ~~> 21
-- 9. oneIsTwo 2  ~~> 22
-- 10. oneIsOne 3 ~~> 31
-- 11. oneIsTwo 3 ~~> 23

{- 
 - Guard Duty
 - -}

-- 1. 2. 
avgGrade :: (Fractional a, Ord a) => a -> Char
-- avgGrade x  | otherwise = 'Z' -- Always outputs 'Z'
avgGrade x  | y >= 0.9 = 'A'
            | y >= 0.7 = 'C'
            | y >= 0.59 = 'D'
            | y >= 0.8 = 'B' -- Never reached
            | y < 0.59 = 'F'
            where y = x / 100

pal xs
    | xs == reverse xs = True
    | otherwise = False
-- 3. returns True when xs is a palindrome (a)
-- 4. pal can only take lists as args
-- 5. pal :: Eq a => [a] -> Bool

numbers x
    | x < 0 = -1
    | x == 0 = 0
    | x > 0 = 1

-- 6. (c)
-- 7. it can only take nums as args
-- 8. numbers :: Ord a => a -> a -- WRONG
--    numbers :: (Ord a1, Num a1, Num a2) => a1 -> a2

