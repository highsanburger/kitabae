-- Eq Instances : Write the Eq instance for the datatype provided.
-- 1. 
data TisAnInteger =
        TisAn Integer
instance Eq TisAnInteger where 
    (==) (TisAn n) (TisAn m) = n == m

-- 2. 
data TwoIntegers =
        Two Integer Integer
instance Eq TwoIntegers where
    (==) (Two n1 n2) (Two m1 m2) = n1 == m1 && n2 == m2

-- 3.
data StringOrInt =
        TisAnInt Int | TisAString String
instance Eq StringOrInt where
    (==) (TisAnInt n) (TisAnInt m) = n == m
    (==) (TisAString s) (TisAString t) = s == t

-- 4.
data Pair a =
    Pair a a
instance Eq a => Eq (Pair a) where
    (==) (Pair x1 x2) (Pair y1 y2) = x1 == y1 && x2 == y2 

-- 5. 
data Tuple a b =
    Tuple a b
instance (Eq a, Eq b) => Eq (Tuple a b) where 
    (==) (Tuple x1 y1) (Tuple x2 y2) = x1 == x2 && y1 == y2

-- 6. 
data Which a =
    ThisOne a | ThatOne a
instance Eq a => Eq (Which a) where
    (==) (ThisOne x) (ThisOne y) = x == y
    (==) (ThatOne x) (ThatOne y) = x == y

-- 7. 
data EitherOr a b =
    Hello a | Goodbye b
instance (Eq a, Eq b) => Eq (EitherOr a b) where
    (==) (Hello x) (Hello y) = x == y
    (==) (Goodbye x) (Goodbye y) = x == y

-- Will they work
--
-- Next, take a look at the following code examples and try to decide if
-- they will work, what result they will return if they do, and why or
-- why not?

-- 1. correct. result - 5
w1 = max (length [1, 2, 3]) (length [8, 9, 10, 11, 12])
--
-- -- 2. correct. result - LT
w2 = compare (3 * 4) (3 * 5)
--
-- 3. Incorrect. compare :: Ord a => a -> a -> Bool. but actual type is not the same.
-- w3 = compare "Julie" True
--
-- -- 4. Correct. Result - False
w4 = (5 + 3) > (3 + 6)
