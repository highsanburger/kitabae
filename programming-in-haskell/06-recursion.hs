-- 1. How does the recursive version of the factorial function behave if applied to a negative argument, such as (-1)? Modify the definition to prohibit negative
--    arguments by adding a guard to the recursive case.

-- fac (-1) ==> (-1) * fac(-2) ==> (-1) * ( (-2) * fac(-3 ) ) ==> ...  diverges

fac :: (Num a, Ord a) => a -> a
fac 0 = 1
fac n | n < 0     = 0
      | otherwise = n * fac(n-1)


-- 2. Define a recursive function sumdown :: Int -> Int that returns the sum of the non-negative integers from a given value down to zero. For example,
--    sumdown 3 should return the result 3+2+1+0 = 6 .

sumdown :: Int -> Int 
sumdown 0 = 0
sumdown n = n + sumdown (n-1)


-- 3. Define the exponentiation operator ^ for non-negative integers using the same pattern of recursion as the multiplication operator *, and show how the ex-
--    pression 2 ^ 3 is evaluated using your definition.

expo :: Int -> Int -> Int
expo _ 0 = 1
expo 0 _ = 0
expo n m = n * expo n (m-1)
-- expo 2 3 ==> 2 * (expo 2 (2)) ==> 2 * (2 * (expo 2 (1))) ==> 2 * (2 * (2 * (expo 2 (0)))) ==> 2*2*2*1 ==> 8


-- 4. Define a recursive function euclid :: Int -> Int -> Int that implements Euclid’s algorithm for calculating the greatest common divisor of two non-
--    negative integers: if the two numbers are equal, this number is the result; otherwise, the smaller number is subtracted from the larger, and the same
--    process is then repeated. For example:
--
--    > euclid 6 27
--    3
--    e 6 27 = e 6 21 = e 6 15 = e 6 9 = e 6 3 = e 3 3 = 3

euclid :: Int -> Int -> Int 
euclid x y | x < 0 || y < 0 = error "Negative Number"
           | x == y = x
           | x > y  = euclid (x-y) y
           | x < y  = euclid x (y-x)
euclid _ _ = error "Invalid Input"


-- 5. Using the recursive definitions given in this chapter, show how length [1,2,3], drop 3 [1,2,3,4,5], and init [1,2,3] are evaluated.

{- 
            (~) better than (==>)
            length [1,2,3] ~ 1 + length [2,3] ~ 1 + 1 + length[3] ~ 1 + 1 + 1 length[] ~ 1+1+1+0 ~ 3
            drop 3 [1,2,3,4,5] ~ drop 2 [2,3,4,5] ~ drop 1 [3,4,5] ~ drop 0 [4,5] ~ [4,5]
            init [1,2,3] ~ 1: init [2,3] ~ 1: 2: init[3] ~ 1: 2: [] ~ [1,2]
 -}


-- 6. Without looking at the definitions from the standard prelude, define the following library functions on lists using recursion.

-- a. Decide if all logical values in a list are True:
andd :: [Bool] -> Bool
andd [] = True
andd (b:bs) = b && andd bs

-- b. Concatenate a list of lists:
concatt :: [[a]] -> [a]
concatt [] = [] 
concatt (x:xs) = x ++ concatt xs

-- c. Produce a list with n identical elements:
replicatee :: Int -> a -> [a]
replicatee 0 _  = []
replicatee n a  = a : replicate (n-1) a 

-- d. Select the nth element of a list:
sel :: [a] -> Int -> a
sel (x:_) 0 = x
sel (_:xs) n = sel xs (n-1) 
sel [] _ = error "Empty list"

-- e. Decide if a value is an element of a list:
iselem :: Eq a => a -> [a] -> Bool
iselem l (x:xs) | l == x = True
                | null xs = False
                | otherwise = iselem l xs
iselem _ [] = error "Empty List"

-- Note: most of these functions are defined in the prelude using other library functions rather than using explicit recursion, and are generic functions rather
--       than being specific to the type of lists.


-- 7. Define a recursive function merge :: Ord a => [a] -> [a] -> [a] that merges two sorted lists to give a single sorted list. For example:
--  
-- > merge [2,5,6] [1,3,4]
-- [1,2,3,4,5,6]
--  
-- Note: your definition should not use other functions on sorted lists such as insert or isort , but should be defined using explicit recursion.

merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) = if x < y then x : merge xs (y:ys) else y : merge (x:xs) ys


-- 8. Using merge, define a function msort :: Ord a => [a] -> [a] that implements merge sort, in which the empty list and singleton lists are already
--    sorted, and any other list is sorted by merging together the two lists that result from sorting the two halves of the list separately.
--  
-- Hint: first define a function halve :: [a] -> ([a],[a]) that splits a list
--       into two halves whose lengths differ by at most one.

halve :: [a] -> ([a],[a])
halve xs | n `mod` 2 == 0 = (take n xs, drop n xs) 
         | otherwise = (take n xs, drop n xs) 
                    where {n = length xs `div` 2 }

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort ys) (msort zs)
            where (ys,zs) = halve xs


-- 9. Using the five-step process,
--
--          1. Define the Type
--          2. Enumerate the cases
--          3. Define the simple cases
--          4. Define the other cases
--          5. Generalize and simplify
--
--     construct the library functions that:

-- a. calculate the sum of a list of numbers;
summ :: Num a => [a] -> a 
summ [] = 0 
summ (x:xs) = x + summ xs

-- b. take a given number of elements from the start of a list;
takee :: Int -> [a] -> [a]
takee 0 _  = []
takee _ [] = []
takee n (x:xs) = x : takee (n-1) xs

-- c. select the last element of a non-empty list.
lastt :: [a] -> a
lastt [a] = a
lastt (_:as) = last as
lastt [] = error "Empty List"
