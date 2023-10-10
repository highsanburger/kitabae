-- I MCQ

-- 1. (c) [a] ==> list of elements of type a
-- 2. (a) f :: [[a]] -> [a] ~> [String] = [[Char]]
-- 3. (b) g :: [a] -> Int -> a ==> returns a
-- 4. (c) h :: (a,b) -> a ==> returns first type in tuple

-- II 
{-# LANGUAGE NoMonomorphismRestriction #-} -- if omitted example will take concrete type i.e. (Integer)
example = 1

-- 1. All function applications return a value. Determine the value
-- returned by these function applications and the type of that
-- value.
a1 = (* 9) 6
-- 54 :: Num a => a

b1 = head [(0,"doge"),(1,"kitteh")]
-- (0,"doge") :: Num a => (a,String)

c1 = head [(0 :: Integer ,"doge"),(1,"kitteh")]
-- (0,"doge") :: (Integer,String)

d1 = if False then True else False
-- False :: Bool

e1 = length [1, 2, 3, 4, 5]
-- 5 :: Int

f1 = (length [1, 2, 3, 4]) > (length "TACOCAT")
-- False :: Bool


-- 2. Given, What is the type of w2?
x2 = 5
y2 = x2 + 5
w2 = y2 * 10 -- :: Num a => a

-- 3. Given, What is the type of z3?
x3 = 5
y3 = x3 + 5
z3 y3 = y3 * 10 -- :: Num a => a -> a

-- 4. Given, What is the type of f4?
x4 = 5
y4 = x4 + 5
f4 = 4 / y4 -- :: Fractional a => a

-- 5. Given, What is the type of f5?
x5 = "Julie"
y5 = " <3 "
z5 = "Haskell"
f5 = x5 ++ y5 ++ z5 -- :: [Char]

--
-- III Compile?
--
-- 1.
bigNum = (^) 5 $ 10
-- wahoo = bigNum $ 10 -- no prefix operator for the $
wahoo = (+) bigNum $ 10

-- 2. 
x = print
y = print "woohoo!"
z = x "hello world"  -- all fine

-- 3.
a = (+)
b = 5
-- c = b 10 -- Applying Num a => a type to Num a => a type. 
-- d = c 200 -- " 
c = a b 10
d = a c 200

-- 4.
-- aa = 12 + bb  -- im out of energy fam 
-- bb = 10000 * cc

-- IV type constructor
--
-- Categorize each component of the type signature into 
-- i ~> constrained polymorphic
-- ii ~> fully polymorphic
-- iii ~> concrete 
--
-- f :: zed -> Zed -> Blah - iii
--
-- f :: Enum b => a -> b -> C 
--      (i)           (ii)  (iii)
--
-- f :: f -> g -> C
--      (ii) (ii) (iii)

-- V Write type signature

-- 1. functionH :: [a] -> a
functionH (x:_) = x

-- 2. functionC :: Ord a => a -> a -> Bool
functionC x y = if (x > y) then True else False

-- 3. functionS :: (a, b) -> b
functionS (x, y) = y

-- Given Type, Write Function 
--
-- 1. 
i :: a -> a
i x = x

-- 2. 
c2 :: a -> b -> a
c2 x y = x

-- 3.
ctt :: b -> a -> b 
ctt x y =  x

-- 4.
ct :: a -> b -> b 
ct x y = y

-- 5. 
r :: [a] -> [a]
r xs = reverse xs

-- 6.
co :: (b -> c) -> (a -> b) -> a -> c
co b2c a2b a = b2c (a2b a)

-- 7. 
a7 :: (a -> c) -> a -> a
a7 a2c a = a

-- 8. 
at :: (a -> b) -> a -> b 
at a2b a = a2b a

