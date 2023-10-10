import Data.Char

-- 1. Using a list comprehension, give an expression that calculates the sum
--    1^2 + 2^2 + ... + 100^2 of the first one hundred integer squares.

square_sum n = sum [x^2 | x <- [1..n] ]


-- 2. Suppose that a coordinate grid of size m x n is given by the list of all pairs
--    (x,y) of integers such that 0 <= x <= m and 0 <= y <= n. Using a list comprehension
--    define a function grid :: Int -> Int -> [(Int,Int)] that returns a coordinate grid
--    of a given size. For example:
--
--    > grid 1 2
--    [(0,0),(0,1),(0,2),(1,0),(1,1),(1,2)]

grid m n = [(x,y) | x <- [0..m], y <- [0..n]]


-- 3. Using a list comprehension and the function grid above, define a function
--    square :: Int -> [(Int,Int)] that returns a coordinate square of size n,
--    excluding the diagonal from (0,0) to (n,n). For example:
--
--    > square 2
--    [(0,1),(0,2),(1,0),(1,2),(2,0),(2,1)]

square n = [(x,y) | (x,y) <- grid n n , x /= y]


-- 4. In a similar way to the function length, show how the library function
--    replicate :: Int -> a -> [a] that produces a list of identical elements
--    can be defined using a list comprehension. For example:
--
--    > replicate 3 True
--    [True,True,True]

rep n a = [a | x <- [1..n]]


-- 5. A triple (x, y, z) of positive integers is Pythagorean if it satisfies the equation
--    x^2 + y^2 = z^2. Using a list comprehension with three generators, define a function 
--    pyths :: Int -> [(Int,Int,Int)] that returns the list of all such triples whose components
--    are at most a given limit. For example:
--
--    > pyths 10
--    [(3,4,5),(4,3,5),(6,8,10),(8,6,10)]

pyths n = [(x,y,z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]


-- 6. A positive integer is perfect if it equals the sum of all of its factors, excluding
--    the number itself. Using a list comprehension and the function factors, define a function 
--    perfects :: Int -> [Int] that returns the list of all perfect numbers up to a given limit. For example:
--
--    > perfects 500
--    [6,28,496]

factors n = [x | x <- [1..n-1], n `mod` x == 0]
perfects n = [x | x <- [1..n], sum (factors x) == x]


-- 7. Show how the list comprehension [(x,y) | x <- [1,2], y <- [3,4]] with
--    two generators can be re-expressed using two comprehensions with single gen erators. 
--    Hint: nest one comprehension within the other and make use of the library function concat :: [[a]] -> [a].

compnest = concat [[(x, y) | y <- [3, 4]] | x <- [1, 2]]


-- 8. Redefine the function positions using the function find.

positions x xs = [i | (xt,i) <- zip xs [0..], x == xt]
find k t = [v | (kt,v) <- t, k == kt]

posns x xs = find x (zip xs [0..])


-- 9. The scalar product of two lists of integers xs and ys of length n is given by
--    the sum of the products of corresponding integers:
--
--    summation from i = 0 to n - 1 ( xs_i * ys_i)
--
--    In a similar manner to chisqr, show how a list comprehension can be used to
--    define a function scalarproduct :: [Int] -> [Int] -> Int that returns
--    the scalar product of two lists. For example:
--
--    > scalarproduct [1,2,3] [4,5,6]
--    32

scalarproduct xs ys = sum [x*y | (x,y) <- zip xs ys ]


-- 10. Modify the Caesar cipher program to also handle upper-case letters.

alpha2num x = ord x - ord 'a'  
num2alpha n = chr (ord 'a' + n)

a2n x = ord x - ord 'A'  
n2a n = chr (ord 'A' + n)

shift n x | isLower x = num2alpha ((alpha2num x + n) `mod` 26)
          | isUpper x = n2a ((a2n x + n) `mod` 26) 
          | otherwise = ' '

encode n xs = [shift n x | x <- xs]
