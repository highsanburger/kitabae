import Data.Maybe 
{-Ch Ex-}

-- Determine the kinds

-- 1. What is the kind of a?
-- idd :: a -> a
-- idd = undefined
--
-- -- :k a ~~~> *
-- -- :k idd ~~~> * -> *
--
--
-- -- 2. What are the kinds of a and f?
-- r :: a -> f a
-- r = undefined
--
-- -- :k a ~~~> error
-- -- :k f ~~~> * -> *
--

{- String Process -}

-- 1. Write a recursive function named replaceThe which takes a text/string, breaks it into words and replaces each instance of “the” with “a”.
--    It’s intended only to replace exactly the word “the”.
-- λ> replaceThe "the cow loves us" ~~~> "a cow loves us"

replaceThe :: String -> String
replaceThe = unwords . map (\w -> if w == "the" then "a" else w) . words 


-- 2. Write a recursive function that takes a text/string, breaks it into words, and counts the number of instances of ”the” followed by a vowel-initial word.
--    λ> countTheBeforeVowel "the cow" ~~~> 0
--    λ> countTheBeforeVowel "the evil cow" ~~~> 1

countTheBeforeVowel :: String -> Integer
countTheBeforeVowel s = sum $ map ( \(w,v) -> if (w == "the") && (head v `elem` "aeiou") then 1 else 0 ) $ zip (words s) (tail $ words s)


-- 3. Return the number of letters that are vowels in a word. Hint: it’s helpful to break this into steps. Add any helper functions necessary to achieve your objectives.

-- a) Test for vowelhood
isVowel :: Char -> Bool
isVowel c = c `elem` "aeiouAEIOU"

-- b) Return the vowels of a string
vowels :: String -> String 
vowels = filter (isVowel) 

-- c) Count the number of elements returned
countVowels :: String -> Int
countVowels = length . vowels


-- Validate the word
--
-- Use the Maybe type to write a function that counts the number of vowels in a string and the number of consonants. If the number
-- of vowels exceeds the number of consonants, the function returns Nothing.
-- 
newtype Word' = Word' String deriving (Eq, Show)

countCons :: String -> Int
countCons = length . filter (not . isVowel)

mkWord :: String -> Maybe Word'
mkWord s | countCons s < countVowels s = Nothing
         | otherwise                   = Just (Word' s)


{- It’s only Natural -}

-- You’ll be presented with a datatype to represent the natural numbers. The only values representable with the naturals are whole numbers
-- from zero to infinity. Your task will be to implement functions to convert Naturals to Integers and Integers to Naturals. The conversion
-- from Naturals to Integers won’t return Maybe because Integer is a strict superset of Natural. Any Natural can be represented by an Integer,
-- but the same is not true of any Integer. Negative numbers are not valid natural numbers.

data Nat = Zero | Succ Nat deriving (Eq, Show)

-- λ> natToInteger Zero ~~~> 0
-- λ> natToInteger (Succ Zero) ~~~> 1
-- λ> natToInteger (Succ (Succ Zero)) ~~~> 2

natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ nat) = 1 + natToInteger (nat)

-- λ> integerToNat 0 ~~~> Just Zero
-- λ> integerToNat 1 ~~~> Just (Succ Zero)
-- λ> integerToNat 2 ~~~> Just (Succ (Succ Zero))
-- λ> integerToNat (-1) ~~~> Nothing

integerToNat :: Integer -> Maybe Nat
integerToNat 0       = Just Zero
integerToNat n | n < 0 = Nothing
               | otherwise = Just (Succ (fromJust $ integerToNat (n - 1)))


{- Small library for Maybe -}

-- 1. Simple boolean checks for Maybe values.

isJust' :: Maybe a -> Bool
isJust' Nothing = False
isJust' _       = True

isNothing' :: Maybe a -> Bool 
isNothing' Nothing = True 
isNothing' _       = False

-- 2. The following is the Maybe catamorphism. You can turn a Maybe value into anything else with this.
--    λ> mayybee 0 (+1) Nothing ~~~> 0
--    λ> mayybee 0 (+1) (Just 1) ~~~> 2

mayybee :: b -> (a -> b) -> Maybe a -> b
mayybee v f Nothing = v
mayybee v f (Just a) = f a

-- 3. In case you just want to provide a fallback value.
--    λ> fromMaybe' 0 Nothing ~~~> 0
--    λ> fromMaybe' 0 (Just 1) ~~~> 1

fromMaybe' :: a -> Maybe a -> a
fromMaybe' v Nothing = v
fromMaybe' v (Just a) = a

-- Try writing it in terms of the maybe catamorphism

fromMaybe'' :: a -> Maybe a -> a
fromMaybe'' v = mayybee v id 


-- 4. Converting between List and Maybe.

--    λ> listToMaybe' [1, 2, 3] ~~~> Just 1
--    λ> listToMaybe' [] ~~~> Nothing

listToMaybe' :: [a] -> Maybe a
listToMaybe' [] = Nothing 
listToMaybe' (a:as) = Just a

--    λ> maybeToList' (Just 1) ~~~> [1]
--    λ> maybeToList' Nothing ~~~> []

maybeToList' :: Maybe a -> [a]
maybeToList' Nothing = []
maybeToList' (Just a) = [a]

-- 5. For when we want to drop the Nothing values from our list.
--    λ> catMaybes' [Just 1, Nothing, Just 2] ~~~> [1, 2]
--    λ> let xs = take 3 $ repeat Nothing
--    λ> catMaybes' xs ~~~> []

catMaybes' :: [Maybe a] -> [a]
catMaybes' [] = [] 
catMaybes' (Nothing : ms) = catMaybes' ms
catMaybes' (Just a : ms ) = [a] ++ catMaybes' ms

-- 6. You’ll see this called “sequence” later.

-- λ> flipMaybe [Just 1, Just 2, Just 3] ~~~> Just [1, 2, 3]
-- λ> flipMaybe [Just 1, Nothing, Just 3] ~~~> Nothing

flipMaybe :: Eq a => [Maybe a] -> Maybe [a]
flipMaybe ms | elem Nothing ms = Nothing
             | otherwise       = Just (map fromJust ms)


{- Small library for Either -}

-- 1. Try to eventually arrive at a solution that uses foldr, even if earlier versions don’t use foldr.
lefts' :: [Either a b] -> [a]
lefts' [] = []
lefts' (Right b : ms) = lefts' ms
lefts' (Left a : ms ) = [a] ++ lefts' ms

-- 2. Same as the last one. Use foldr eventually.
rights' :: [Either a b] -> [b]
rights' [] = []
rights' (Left a : ms ) = rights' ms
rights' (Right b : ms) = [b] ++ rights' ms

-- 3.
partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' es = (lefts' es, rights' es)

-- 4. 
eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' f (Left a) = Nothing
eitherMaybe' f (Right b) = Just (f b)

-- 5. This is a general catamorphism for Either values.
either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' f g (Left a)  = f a
either' f g (Right b) = g b

-- 6. Same as before, but use the either' function you just wrote.
eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe'' f e = either' (\a -> Nothing) (\b -> Just (f b) ) e

{- Anamorphisms -}

-- 1. Write the function myIterate using direct recursion. 

myIterate :: (a -> a) -> a -> [a]
myIterate f x = x : myIterate f ( f x )


-- 2. Write the function myUnfoldr using direct recursion. 

myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]
myUnfoldr f v = case f v of 
  Nothing    -> [] 
  Just (a,b) -> a : myUnfoldr f b

-- 3. Rewrite myIterate into betterIterate using myUnfoldr. 

betterIterate :: (a -> a) -> a -> [a]
betterIterate f x = myUnfoldr (\t -> Just (t, f t)) x


{- Binary Tree -}

data BinaryTree a = Leaf | Node (BinaryTree a) a (BinaryTree a) deriving (Eq, Ord, Show)

-- 1. Write unfold for BinaryTree.

unfold :: (a -> Maybe (a,b,a)) -> a -> BinaryTree b
unfold f v = case f v of 
  Nothing      -> Leaf 
  Just (a1,b,a2) -> Node ( unfold f a1 ) b ( unfold f a2 )

-- 2. Make a tree builder. Using the unfold function you’ve made for BinaryTree, write the following function:

treeBuild :: Integer -> BinaryTree Integer
treeBuild n = unfold (\a -> if a == 0 then Nothing else Just(a - 1 , a - 1,a -1)) n

-- TODO ulta kyun aaraaaa

-- You should be producing results that look like the following:
-- λ> treeBuild 0 ~~~> Leaf
-- λ> treeBuild 1 ~~~> Node Leaf 0 Leaf
-- λ> treeBuild 2 ~~~> Node (Node Leaf 1 Leaf) 0 (Node Leaf 1 Leaf)
-- λ> treeBuild 3 ~~~> Node (Node (Node Leaf 2 Leaf) 
--                                 1
--                                (Node Leaf 2 Leaf))
--                      0
--                      (Node (Node Leaf 2 Leaf)
--                            1
--                            (Node Leaf 2 Leaf))
--
-- Or in a slightly different representation:
-- 0
--
--   0
--  / \
-- 1   1
--
--       0
--      / \
--     1   1
--    /\  /\
--   2 2 2 2
