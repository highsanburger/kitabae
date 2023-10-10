-- 1. In a similar manner to the function add, define a recursive multiplication function mult :: Nat -> Nat -> Nat for the recursive type of natural numbers:
-- Hint: make use of add in your definition.

data Nat = Z | S Nat deriving (Show,Read)

add :: Nat -> Nat -> Nat
add Z n = n
add (S m) n = S (add m n) 

mult :: Nat -> Nat -> Nat
mult Z n     = Z
mult (S Z) n = n 
mult (S m) n = add n (mult m  n)


-- 2. Although not included in appendix B, the standard prelude defines
--
--    data Ordering = LT | EQ | GT
--  
--    together with a function
--  
--    compare :: Ord a => a -> a -> Ordering
--  
--    that decides if one value in an ordered type is less than (LT), equal to (EQ), or greater than (GT) another value. Using this function, redefine the function
--    occurs :: Ord a => a -> Tree a -> Bool for search trees. Why is this new definition more efficient than the original version?

data T a = L a | N (T a) a (T a) -- Tree/Leaf/Node
occurs :: Ord a => a -> T a -> Bool
occurs x (L y) = x == y
occurs x (N l y r) | compare x y == EQ = True 
                   | compare x y == LT = occurs x l 
                   | compare x y == GT = occurs x r
tree = N (N (L 1) 3 (L 4)) 5 (N (L 6) 7 (L 9))


-- 3. Consider the following type of binary trees:
--  
--    data Tree a = Leaf a | Node (Tree a) (Tree a)
--   
--    Let us say that such a tree is balanced if the number of leaves in the left and right subtree of every node differs by at most one, with leaves themselves 
--    being trivially balanced. Define a function balanced :: Tree a -> Bool that decides if a binary tree is balanced or not.
--  
-- Hint: first define a function that returns the number of leaves in a tree.

data Tb a = Lb a | Nb (Tb a) (Tb a) deriving (Show)

countLeaves :: Tb a -> Int
countLeaves (Lb a) = 1
countLeaves (Nb l r) = countLeaves l + countLeaves r

balanced :: Tb a -> Bool
balanced (Nb l r) = abs (countLeaves l - countLeaves r) < 2

t1 = Nb (Lb 1)          -- True
        (Nb (Lb 21) 
            (Lb 22))

t2 = Nb (Nb (Lb 11)     -- True
            (Lb 12))
        (Nb (Lb 21) 
            (Lb 22))

t3 = Nb (Nb (Lb 11)       -- False
            (Nb (Lb 121) 
                (Lb 122)))
        (Lb 2)

t4 = Nb (Nb (Lb 11)       -- True
            (Nb (Lb 121)
                (Lb 122)))
        (Nb (Lb 21)
            (Lb 22))

-- 4. Define a function balance :: [a] -> Tree a that converts a non-empty list into a balanced tree. Hint: first define a function that splits a list into two
--    halves whose length differs by at most one.

half :: [a] -> ([a],[a])
half xs = (take ((length xs) `div` 2) xs, drop ((length xs) `div` 2) xs)

balance :: [a] -> Tb a 
balance [x] = Lb x
balance xs  = Nb (balance x) (balance y)
            where (x,y) = half xs


-- 5. Given the type declaration
--  
--    data Expr = Val Int | Add Expr Expr
--   
--    define a higher-order function
--  
--    folde :: (Int -> a) -> (a -> a -> a) -> Expr -> a
--
--    such that folde f g replaces each Val constructor in an expression by the function f, and each Add constructor by the function g .

data Expr = Val Int | Add Expr Expr

folde :: (Int -> a) -> (a -> a -> a) -> Expr -> a
folde f g (Val n)   =  f n
folde f g (Add x y) =  g (folde f g x) (folde f g y)


-- 6. Using folde, define a function eval :: Expr -> Int that evaluates an expression to an integer value, and a function size :: Expr -> Int that
--    calculates the number of values in an expression.

-- eval :: Expr -> Int 
-- eval (Val n)   = n 
-- eval (Add x y) = folde (eval x) 


-- 7. Complete the following instance declarations:
--
-- instance Eq a => Eq (Maybe a) where
-- Nothing == Nothing = True
-- Just x == Just y = x == y
-- Nothing == Just x = False
--  
-- instance Eq a => Eq [a] where
-- [x] == [y] = x == y
--  
--
-- 8. Extend the tautology checker to support the use of logical disjunction (v) and equivalence (<=>) in propositions.
-- Ans in ./ch8-taut.hs


-- 9. Extend the abstract machine to support the use of multiplication.

data Exp = Valu Int | Addi Exp Exp | Mult Exp Exp
 
value :: Exp -> Int
value (Valu n)    = n
value (Addi x y)  = value x + value y
value (Mult x y)  = value x * value y
