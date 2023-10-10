-- VI Fix it 
--
-- 1. 
module Sing where

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
