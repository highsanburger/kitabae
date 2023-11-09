{- Matching -}

-- not    :: Bool -> Bool
-- length :: [a] -> Int
-- concat :: [[a]] -> [a]
-- head   :: [a] -> a
-- (<)    :: Ord a => a -> a -> Bool


{- Type Arguments -}

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

{- Parametricity -}

-- 1. is id the only function with signature :: a -> a (fully polymorphic)
idt :: a -> a 
idt = undefined -- 🤡😹

-- 2. only funcs with following signature
g1 :: a -> a -> a 
g1 x y  = x

g2 :: a -> a -> a 
g2 x y = y

-- 3. 
ht :: a -> b -> b -- h returns a functions hc :: b -> b,
ht x p = p        -- since there is only one legit function of that type (id) 
-- above is the only legit function with the mentioned signature.
-- behavior doesnt change when types change

 
{- Apply Youzelf -}

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


{- Chapter Exercises -}


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


-- VI Fix it 
--
-- 1. 
-- module Sing where

fstString :: [Char] -> [Char]
fstString x = x ++ " in the rain"

sndString :: [Char] -> [Char]
sndString x = x ++ " over the rainbow"

sing = if (x < y) then fstString x else sndString y -- 2.x>y <=> x<y
                where x = "Singin"
                      y = "Somewhere"

-- 3. 
-- module Arith3Broken where

main :: IO ()
main = do
                print (1 + 2)
                putStrLn "10"
                print (negate (-1))
                print ((+) 0 blah)
                      where blah = negate 1

-- VII Type-Kwon-Do
--
-- 1. 
f :: Int -> String
f = undefined
g :: String -> Char
g = undefined
h :: Int -> Char
h n = g (f n)

-- 2. 
data A
data B
data C
q :: A -> B
q = undefined
w :: B -> C
w = undefined
e :: A -> C
e a = w (q a)

-- 3. 
data X
data Y
data Z
xz :: X -> Z
xz = undefined
yz :: Y -> Z
yz = undefined
xform :: (X, Y) -> (Z, Z)
xform (x,y) = (xz x, yz y)

-- 4.
-- munge :: (x -> y)    😕😕😕😕😕
--       -> (y -> (w, z))
--       -> x
--       -> w
-- munge f g h = w
