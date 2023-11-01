-- 1. Give another possible calculation for the result of double (double 2).

-- double (double 2) ==> double (2+2) ==> double 4 ==> 4 + 4 ==> 8


-- 2. Show that sum [x] “ x for any number x.

summ [] = 0 
summ (x:xs) = x + summ xs
-- summ [x] ==> summ (x:[]) ==> x + summ [] ==> x + 0 ==> x


-- 3. Define a function product that produces the product of a list of numbers,
-- and show using your definition that product [2,3,4] = 24 .

prod [] = 1
prod (x:xs) = x * prod xs


-- 4. How should the definition of the function qsort be modified so that
-- it produces a reverse sorted version of a list?

qrevsort [] = []
qrevsort (x:xs) = qrevsort big ++ [x] ++ qrevsort small
              where 
                big = [a | a <- xs, a >= x ]
                small = [a | a <- xs, a < x ]


-- 5. What would be the effect of replacing <= by < in the original definition of qsort?
-- Hint: consider the example qsort [2,2,3,1,1].

qs [] = []
qs (x:xs) = qs smaller ++ [x] ++ qs larger
              where 
                smaller = [a | a <- xs, a < x] -- not a <= x 
                larger = [b | b <- xs, b > x]

-- qs [2,2,3,1,1] ==> qs (2:2,3,1,1) ==> qs (1,1) ++ [2] ++ qs (3) ==> [1] ++ [2] ++ [3] ==> [1,2,3]
-- thus, qs returns sorted array with only unique elements
