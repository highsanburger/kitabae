-- 1. Show how the list comprehension [f x | x <- xs, p x] can be re-expressed using the higher-order functions map and filter.

a1 f p as = map f (filter p as)


-- 2. Without looking at the definitions from the standard prelude, define the following higher-order library functions on lists.
  
-- a. Decide if all elements of a list satisfy a predicate:
   -- all :: (a -> Bool) -> [Bool] -> Bool
alll f xs = and [f x | x <- xs]

-- b. Decide if any element of a list satisfies a predicate:
--    any :: (a -> Bool) -> [Bool] -> Bool
anyy f xs = or [f x | x <- xs]  

-- c. Select elements from a list while they satisfy a predicate:
--    takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhilee _ [] = []
takeWhilee p (a:as) | p a       = a : takeWhilee p as
                    | otherwise = []

-- d. Remove elements from a list while they satisfy a predicate:
--    dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhilee _ [] = []
dropWhilee p (a:as) | p a       =  dropWhilee p as
                    | otherwise = (a:as)
   
-- Note: in the prelude the first two of these functions are generic functions rather than being specific to the type of lists.
--  
--  
-- 3. Redefine the functions map f and filter p using foldr.
-- foldr 
mapp :: (a -> b) -> [a] -> [b]
-- mapp _ []     = []
-- mapp f (a:as) =  f a : mapp f as
mapp f xs = foldr (\x y -> f x : y) [] xs

filterr :: (a -> Bool) -> [a] -> [a]
-- filterr _ []      = []
-- filterr p (a:as)  | p a       = a : filterr p as
--                   | otherwise = filterr p as
filterr p xs = foldr (\x y -> if p x then x : y else y) [] xs


-- 4. Using foldl, define a function dec2int :: [Int] -> Int that converts a decimal number into an integer. For example:
--  
-- > dec2int [2,3,4,5]
-- 2345

dec2int :: [Int] -> Int
dec2int xs = foldl (\x y -> 10*x +y ) 0 xs


-- 5. Without looking at the definitions from the standard prelude, define the higher-order library function curry that converts a function on pairs into
--    a curried function, and, conversely, the function uncurry that converts a curried function with two arguments into a function on pairs.
--  
-- Hint: first write down the types of the two functions.

curryy ::  ((a,b) -> c) -> (a -> b -> c)
curryy f a b = f (a,b)

uncurryy :: (a -> b -> c) -> (a,b) -> c
uncurryy f (a,b) = f a b 


-- 6. A higher-order function unfold that encapsulates a simple pattern of recursion for producing a list can be defined as follows:
--  
--    unfold p h t x | p x       = []
--                   | otherwise = h x : unfold p h t (t x)
--     
--    That is, the function unfold p h t produces the empty list if the predicate p is true of the argument value, and otherwise produces a non-empty list by
--    applying the function h to this value to give the head, and the function t to generate another argument that is recursively processed in the same way
--    to produce the tail of the list. For example, the function int2bin can be rewritten more compactly using unfold as follows:
--  
--    int2bin = unfold (== 0) (‘mod‘ 2) (‘div‘ 2)
--  
--    Redefine the functions chop8, map f and iterate f using unfold




-- 7. Modify the binary string transmitter example to detect simple transmission errors using the concept of parity bits. That is, each eight-bit binary number
--    produced during encoding is extended with a parity bit, set to one if the number contains an odd number of ones, and to zero otherwise. In turn, each
--    resulting nine-bit binary number consumed during decoding is checked to ensure that its parity bit is correct, with the parity bit being discarded if this
--    is the case, and a parity error being reported otherwise.
--  
-- Hint: the library function error :: String -> a displays the given string as an error message and terminates the program; the polymorphic result type
--       ensures that error can be used in any context.
--  
--  
-- 8. Test your new string transmitter program from the previous exercise using a faulty communication channel that forgets the first bit,
--    which can be modelled using the tail function on lists of bits.
--
--
-- 9. Define a function altMap :: (a -> b) -> (a -> b) -> [a] -> [b] that alternately applies its two argument functions to successive elements in a list,
--    in turn about order. For example:
--  
--    > altMap (+10) (+100) [0,1,2,3,4]
--    [10,101,12,103,14]
--
--
-- 10. Using altMap, define a function luhn :: [Int] -> Bool that implements the Luhn algorithm from the exercises in chapter 4 for bank card numbers of
--     any length. Test your new function using your own bank card.
