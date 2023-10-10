-- 1. Using library functions, define a function halve :: [a] -> ([a],[a]) that
--    splits an even-lengthed list into two halves. For example:
--  
-- > halve [1,2,3,4,5,6]
-- ([1,2,3],[4,5,6])

halve xs = (take n xs, drop n xs) where {n = length xs `div` 2 }


-- 2. Define a function third :: [a] -> a that returns the third element in a list
--    that contains at least this many elements using:

-- a. head and tail;
third1 xs = head (tail (tail xs))

-- b. list indexing !!;
third2 xs = xs !! 2

-- c. pattern matching.
third3 (_:_:x:_) = x


-- 3. Consider a function safetail :: [a] -> [a] that behaves in the same way
--    as tail except that it maps the empty list to itself rather than producing an
--    error. Using tail and the function null :: [a] -> Bool that decides if a
--    list is empty or not, define safetail using:

-- a. a conditional expression;
safetail1 xs = if null xs then [] else tail xs

-- b. guarded equations;
safetail2 xs | null xs = []
             | otherwise = tail xs

-- c. pattern matching.
safetail3 [] = []
safetail3 xs = tail xs


-- 4. In a similar way to && in section 4.4, show how the disjunction operator 
--    || can be defined in four different ways using pattern matching.
--
-- Using aur(1-4) instead of ||

aur1 True  True  = True
aur1 True  False = True
aur1 False True  = True
aur1 False False = False 

aur2 False False = False
aur2 _ _ = True

aur3 True _ = True
aur3 _ b = b

aur4 b c | c == b = b 
         | otherwise = True

helpor a = [a True True, a True False, a False True, a False False]


-- 5. Without using any other library functions or operators, show how the meaning
--    of the following pattern matching definition for logical conjunction && can be
--    formalised using conditional expressions:
--  
-- True && True = True
-- _ && _ = False
--  
-- Hint: use two nested conditional expressions.

and5 p q = if p == True then if q == True then True else False else False


-- 6. Do the same for the following alternative definition, and note the difference
--    in the number of conditional expressions that are required:
--
-- True && b = b
-- False && _ = False

and6 p q = if p == True then q else False


-- 7. Show how the meaning of the following curried function definition can be
--    formalised in terms of lambda expressions:
--
-- mult :: Int -> Int -> Int -> Int
-- mult x y z = x*y*z

mult = \x -> (\y -> (\z -> x * y *z ))


-- 8. The Luhn algorithm is used to check bank card numbers for simple errors
-- such as mistyping a digit, and proceeds as follows:
--
-- * consider each digit as a separate number;
-- * moving left, double every other number from the second last;
-- * subtract 9 from each number that is now greater than 9;
-- * add all the resulting numbers together;
-- * if the total is divisible by 10, the card number is valid.
--  
-- Define a function luhnDouble :: Int -> Int that doubles a digit and sub-
-- tracts 9 if the result is greater than 9. For example:
--  
-- > luhnDouble 3
-- 6
--  > luhnDouble 6
-- 3
   
luhnDouble n | n < 5 = 2 * n 
             | otherwise = 2*n - 9

-- Using luhnDouble and the integer remainder function mod, define a function
-- luhn :: Int -> Int -> Int -> Int -> Bool that decides if a four-digit
-- bank card number is valid. For example:
--  
-- > luhn 1 7 8 4
-- True
--  
-- > luhn 4 7 8 3
-- False
 
luhn a b c d = (\x -> (x `mod` 10 == 0)) (luhnDouble a + b + luhnDouble c + d)
