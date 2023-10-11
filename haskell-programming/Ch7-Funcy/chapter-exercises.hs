{- MCQ -}
-- 1. d
-- 2. b
-- 3. d
-- 4. b
-- 5. a

{- 
 - Code
 - -}

-- 1. The following function returns the tens digit of an integral argument.
--
tensDigit :: Integral a => a -> a
tensDigit x = d
    where xLast = x `div` 10
          d = xLast `mod` 10

-- a) First, rewrite it using divMod.
tensDigit' :: Integral a => a -> a
tensDigit' n = mod (fst $ divMod n 10) 10

-- b) Does the divMod version have the same type as the original version? 
--   Yes

-- c) Next, let’s change it so that we’re getting the hundreds digit instead.
hunsD :: Integral a => a -> a
hunsD n = mod (fst $ divMod n 100) 10


-- 2. Implement the function of the type a -> a -> Bool -> a once each using a case expression and once with a guard.

foldBool1 :: a -> a -> Bool -> a
foldBool2 :: a -> a -> Bool -> a
foldBool3 :: a -> a -> Bool -> a

foldBool1 x y b = case b of
  False -> x
  True  -> y 

foldBool2 x y b | b     = y
                | not b = x

foldBool3 x _ False = x
foldBool3 _ y True = y

-- 3. Fill in the definition. Note that the first argument to our function
-- is also a function which can be applied to values. Your second
-- argument is a tuple, which can be used for pattern matching:

g :: (a -> b) -> (a, c) -> (b, c)
g f (a,c) = (f a, c)

-- 4. 
-- read :: Read a => String -> a
-- show :: Show a => a -> String
--
-- behold :- 
--
-- id :: a -> a
-- id x = x
-- roundTrip :: (Show a, Read a) => a -> a
-- roundTrip a = read (show a)
-- main = do
-- print (roundTrip 4)
-- print (id 4)

-- 5. Next, write a pointfree version of roundTrip.
rndTrp :: (Show a, Read a) => a -> a
rndTrp = read . show 

-- 6.
-- Your task now is to change the type of roundTrip in Arith4 to 
-- (Show a, Read b) => a -> b. 
-- How might we tell GHC which instance of Read to dispatch against the String now?
-- Make the expression print (roundTrip 4) work. You will only need the has the type
-- syntax of :: and parentheses for scoping.
--
roundTrip :: (Show a) => a -> Integer  -- ? idk
roundTrip a = read (show a) 
