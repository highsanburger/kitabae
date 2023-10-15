import Data.Time

{- Understanding Folds -}

-- 1. foldr (*) 1 [1..5] will return the same result as
-- == foldl (*) 1 [1..5] == foldl (flip (*)) 1 [1..5]

-- 2. Write out the evaluation steps for foldl (flip (*)) 1 [1..3]
-- -> flip (*) is the same as (*) since multiplication is commutative
--  foldl (*) 1 [1,2,3] = foldl (*) ((*) 1 1) [2,3]
--                      = foldl (*) ((*) ((*) 1 1) 2) [3]
--                      = foldl (*) ((*) ((*) ((*) 1 1) 2) 3) []
--                      = ((*) ((*) ((*) 1 1) 2) 3)
--                      = 6

-- 3. c.
-- 4. a. 

-- 5. Fix errors
fa = foldr (++) "" ["woot", "WOOT", "woot"]
fb = foldr max ' ' "fear is the little death"
fc = foldr (&&) True [False, True]
fd = foldr (||) True [False, True] -- Can never return anything other than True.
fe = foldr ((++) . show) "" [1..5]
ff = foldl const 'a' [1..5]
fg = foldl const 0 "tacos"
fh = foldr (flip const) 0 "burritos"
fi = foldr (flip const) 'z' [1..5]


{- Database Processing -}
data DatabaseItem = DbString String | DbNumber Integer | DbDate UTCTime deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime
           (fromGregorian 1911 5 1)
   (secondsToDiffTime 34123))
  , DbNumber 9001
  , DbString "Hello, world!"
  , DbDate (UTCTime
          (fromGregorian 1921 5 1)
          (secondsToDiffTime 34123))
  ]

-- 1. Write a function that filters for DbDate values and returns a list of the UTCTime values inside them.
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate [] = [] 
filterDbDate (DbDate utc:ds) = [utc] ++ filterDbDate ds
filterDbDate (_:ds) = [] ++ filterDbDate ds

-- 2. Write a function that filters for DbNumber values and returns a list of the Integer values inside them.
filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber [] = [] 
filterDbNumber (DbNumber n:ds) = [n] ++ filterDbNumber ds
filterDbNumber (_:ds) = [] ++ filterDbNumber ds

-- 3. Write a function that gets the most recent date.
mostRecent :: [DatabaseItem] -> UTCTime
mostRecent ds = maximum $ filterDbDate ds

-- 4. Write a function that sums all of the DbNumber values.
sumDb :: [DatabaseItem] -> Integer
sumDb ds = sum $ filterDbNumber ds

-- 5. Write a function that gets the average of the DbNumber values.
avgDb :: [DatabaseItem] -> Double
avgDb ds = fromIntegral (sumDb ds) / fromIntegral (length $ filterDbNumber ds)


{- Scans -}

-- 1. Modify your fibs function to only return the first 20 Fibonacci numbers.
fibs = 1 : scanl (+) 1 fibs
fib_first n = take n fibs -- fibo 20 -- using scan?

-- 2. Modify fibs to return the Fibonacci numbers that are less than 100.
fib_less n = [x | x <- fibs, x < 100] -- using scan? -- doesnt stop 

-- 3. Try to write the factorial function from Recursion as a scan. You’ll want scanl again, and your start value will be 1. Warning:
-- this will also generate an infinite list, so you may want to pass it through a take function or similar.
facs = scanl (*) 1 [2..]

{- Warm Up -}

-- 1. 
stops = "pbtdkg"
vowels = "aeiou"

-- a) Write a function that takes inputs from stops and vowels and makes 3-tuples of all possible stop-vowel-stop combinations. 
oa = [[x] ++ [y] ++ [z] | x <- stops, y <- vowels, z <- stops]

-- b) Modify that function so that it only returns the combinations that begin with a p.
ob = [['p'] ++ [y] ++ [z] | y <- vowels, z <- stops]

-- c) Now set up lists of nouns and verbs (instead of stops and vowels) and modify the function to make tuples representing possible noun-verb-noun sentences.
nouns = [ "Child", "Phone", "Restaurant", "Teacher"]
verbs = [ "Plays", "Calls", "Visits", "Teaches"]

oc = [x ++ " " ++ y ++ " " ++ z | x <- nouns, y <- verbs, z <- nouns]

-- 2. What does the following mystery function do? 
-- seekritFunc x = div (sum (map length (words x))) (length (words x))
seekritFunc x = (sum $ map length $ words x) `div` (length $ words x)  -- average length of word in string

{- Chapter Exercises -}
-- write multiple variations

-- 1. myOr returns True if any Bool in the list is True.
myOr :: [Bool] -> Bool
myOr = foldr (||) False

-- 2. myAny returns True if a -> Bool applied to any of the values in the list returns True.
-- λ> even [1, 3, 5] ~~~> False
-- λ> odd [1, 3, 5] ~~~> True
myAny :: (a -> Bool) -> [a] -> Bool
myAny pred = foldr (\a b -> pred a || b ) False

-- 3. Write two versions of myElem. One version should use folding and the other should use any.
-- λ> 1 [1..10] ~~~> True
-- λ> 1 [2..10] ~~~> False
myElem :: Eq a => a -> [a] -> Bool
myElem el = foldr (\a b -> (el == a) || b) False

myElemAny :: Eq a => a -> [a] -> Bool
myElemAny el = any (== el) 

-- 4. Implement myReverse, don’t worry about trying to make it lazy.
-- λ> "blah" ~~~> "halb"
-- λ> [1..5] ~~~> [5,4,3,2,1]
myReverse :: [a] -> [a]
myReverse = foldr (\a b -> b ++ [a]) []

-- 5. Write myMap in terms of foldr. It should have the same behavior as the built-in map.
myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr (\a b -> f a : b) []

-- 6. Write myFilter in terms of foldr. It should have the same behavior as the built-in filter.
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter pred = foldr (\a b -> if pred a then [a] ++ b else b ) []

-- 7. squish flattens a list of lists into a list
squish :: [[a]] -> [a]
squish = foldr (\a b -> a ++ b) []

-- 8. squishMap maps a function over a list and concatenates the results.
-- λ> (\x -> [1, x, 3]) [2] ~~~> [1,2,3]
-- λ> let f x = "WO " ++ [x] ++ " OT "
-- λ> f "blah" ~~~> "WO b OT WO l OT WO a OT WO h OT "
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr (\a b -> f a ++ b) []

-- 9. squishAgain flattens a list of lists into a list. This time re-use the squishMap function.
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

-- 10. myMaximumBy takes a comparison function and a list and returns the greatest element of the list based on the last value that the comparison returned GT for.
-- λ> (\_ _ -> GT) [1..10] ~~~> 1
-- λ> (\_ _ -> LT) [1..10] ~~~> 10
-- λ> compare [1..10] ~~~> 10
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
-- myMaximumBy cmp as = foldr (\a b -> if (a cmp b) == ) maximum
-- myMaximumBy cmp = foldr (\x y -> if cmp x y == GT then x else y) undefined
myMaximumBy cmp = foldr1 (\x y -> if cmp x y == GT then x else y)

-- 11. myMinimumBy takes a comparison function and a list and returns the least element of the list based on the last value that the comparison returned LT for.
-- λ> (\_ _ -> GT) [1..10] ~~~> 10
-- λ> (\_ _ -> LT) [1..10] ~~~> 1
-- λ> compare [1..10] ~~~> 1
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy cmp = foldr1 (\x y -> if cmp x y == LT then x else y)
