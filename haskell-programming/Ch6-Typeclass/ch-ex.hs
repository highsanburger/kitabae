import Data.List
-- MCQ
--
-- 1. c
-- 2. a,b
-- 3. a
-- 4. c
-- 5. a
--
-- Typecheck ?
-- 
-- 1. No, since it isnt an instance of Show.
-- data Person = Person Bool
data Person = Person Bool deriving Show
printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)

-- 2. No, since it isnt an instance of Eq.
-- data Mood = Blah | Woot deriving Show
data Mood = Blah | Woot deriving (Eq,Show)
settleDown x = if x == Woot
                then Blah
                else x

-- 3. a) Woot, Blah
--    b) Error, since 9 is Int and settleDown :: Mood -> Mood
--    c) Error, since Mood is not deriving Ord

-- 4. No, since s1 is missing a third argument.
type Subject = String
type Verb = String
type Object = String

data Sentence = Sentence Subject Verb Object deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"

-- 
-- Do the following typecheck for the given datatypes?
--
data Rocks = Rocks String deriving (Eq, Show)
data Yeah = Yeah Bool deriving (Eq, Show)
data Papu = Papu Rocks Yeah deriving (Eq, Show)

-- 1. No, Papu takes two args Rocks and Yeah which in turn take String and Bool resp.
-- phew = Papu "chases" True

-- 2. Yes.
truth = Papu (Rocks "chomskydoz") (Yeah True)

-- 3. Yes.
equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'

-- 4. No. Papu does not have an instance of Ord.
-- comparePapus :: Papu -> Papu -> Bool
-- comparePapus p p' = p > p'

-- 
-- Match the types
--

-- 1. No, since we need constraint Num a.
ia :: Num a => a
ia = 1
-- ib :: a
-- ib = 1

-- 2. Yes WRONG
-- need to add Fractional a 
f2a :: Float
f2a = 1.0
-- f2b :: Num a => a
-- f2b = 1.0
--
-- 3. Yes
f3a :: Float
f3a = 1.0
f3b :: Fractional a => a
f3b = 1.0
--
-- 4. Yes
f4a :: Float
f4a = 1.0
f4b :: RealFrac a => a -- class (Real a, Fractional a) => RealFrac a
f4b = 1.0

-- 5. Yes.
freuda :: a -> a
freuda x = x
freudb :: Ord a => a -> a
freudb x = x

-- 6. Yes
freud'a :: a -> a
freud'a x = x
freud'b :: Int -> Int
freud'b x = x

-- 7. No , since Int not specified in signature of sigmundb
myXa = 1 :: Int
sigmunda :: Int -> Int
sigmunda x = myXa
-- sigmundb :: a -> a
-- sigmundb x = myXa

-- 8. No, since Int not specified 
myX8 = 1 :: Int
sigmund'a :: Int -> Int
sigmund'a x = myX8
-- sigmund'b :: Num a => a -> a
-- sigmund'b x = myX8

-- 9. Yes
junga :: Ord a => [a] -> a
junga xs = head (sort xs)
jungb :: [Int] -> Int
jungb xs = head (sort xs)

-- 10. Yes.
younga :: [Char] -> Char
younga xs = head (sort xs)
youngb :: Ord a => [a] -> a
youngb xs = head (sort xs)

-- 11. No , since mySort is of concrete type but signifier has polymorphic signature.
mySort :: [Char] -> [Char]
mySort = sort
signifier :: [Char] -> Char
signifier xs = head (mySort xs)
-- signifierb :: Ord a => [a] -> a
-- signifierb xs = head (mySort xs)

--
-- Type-Kwon-Do 2
--

-- 1.
chk :: Eq b => (a -> b) -> a -> b -> Bool
chk f x y = (f x) == y 

-- 2. Hint: use some arithmetic operation to
-- combine values of type 'b'. Pick one.
arith :: Num b => (a -> b) -> Integer -> a -> b
arith f n x = (f x) + fromInteger n
