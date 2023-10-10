-- 1. Redefine the combinatorial function choices using a list comprehension rather than using composition, concat and map.

choices :: [a] -> [[a]]
choices [] = [[]]
choices (x:xs) = [x:ys | ys <- choices xs] ++ choices xs


-- 2. Define a recursive function isChoice :: Eq a => [a] -> [a] -> Bool that decides if one list is chosen from another, without using the combinatorial
--    functions perms and subs. Hint: start by defining a function that removes the first occurrence of a value from a list.




-- 3. What effect would generalising the function split to also return pairs containing the empty list have on the behaviour of solutions?
--  
--
-- 4. Using the functions choices, exprs, and eval, verify that there are 33,665,406, possible expressions over the 
--    numbers 1, 3, 7, 10, 25, 50, and that only 4,672,540 of these expressions evaluate successfully.
--  
--  
-- 5. Similarly, verify that the number of expressions that evaluate successfully increases to 10,839,369 if the numeric domain is generalised to
--    arbitrary integers. Hint: modify the definition of valid.
--  
--  
-- 6. Modify the final program to:
--
-- a. allow the use of exponentiation in expressions;
--
-- b. produce the nearest solutions if no exact solution is possible;
--
-- c. order the solutions using a suitable measure of simplicity.
