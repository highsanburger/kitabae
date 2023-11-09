import Data.Char
{- EnumFromTo -}
-- Write your own enumFromTo definitions for the types provided

eftBool :: Bool -> Bool -> [Bool]
eftBool False False = [False]
eftBool False True  = [False,True]
eftBool True  False = []
eftBool True  True  = [True]

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd LT GT = [LT,EQ,GT]
eftOrd LT EQ = [LT,EQ]
eftOrd LT LT = [LT]
eftOrd GT GT = [GT]
eftOrd GT EQ = []
eftOrd GT LT = []
eftOrd EQ GT = [EQ,GT]
eftOrd EQ EQ = [EQ]
eftOrd EQ LT = []

eftInt :: Int -> Int -> [Int]
eftInt x y | y < x = []
           | otherwise = x : eftInt (x+1) y

eftChar :: Char -> Char -> [Char]
eftChar a b | b < a = []
            | otherwise = a : eftChar (succ a) b


{- Thy Fearful Symmetry -}

-- 1. Using takeWhile and dropWhile, write a function that takes a string
-- and returns a list of strings, using spaces to separate the elements
-- of the string into words

myWords :: String -> [String]
myWords "" = []
myWords str  = takeWhile (/= ' ') str : myWords s
             where s = dropWhile (== ' ') $ dropWhile (/= ' ') str


-- 2. Next, write a function that takes a string and returns a list of
-- strings, using newline separators to break up the string

firstSen = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful\ \ symmetry?"

sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen

shouldEqual =
  [ "Tyger Tyger, burning bright"
  , "In the forests of the night"
  , "What immortal hand or eye"
  , "Could frame thy fearful symmetry?"
  ]


myLines :: String -> [String]
myLines "" = []
myLines str  = takeWhile (/= '\n') str : myLines s 
               where s = dropWhile (== '\n') $ dropWhile (/= '\n') str


main :: IO ()
main = print $ "Are they equal? " ++ show (myLines sentences == shouldEqual)


-- 3. Now let’s look at what those two functions have in common.
-- Try writing a new function that parameterizes the character
-- you’re breaking the string argument on and rewrite myWords and
-- myLines using it.

split :: String -> Char -> [String]
split "" _ = []
split str c  = takeWhile (/= c) str : split s c
             where s = dropWhile (== c) $ dropWhile (/= c) str


{- Comprehend Thy Lists -}

mySqr = [x^2 | x <- [1..10]]    -- [1,4,9,16,25,36,49,64,81,100]

c1 = [x | x <- mySqr, rem x 2 == 0]     -- [4,16,36,64,100]
c2 = [(x, y) | x <- mySqr, y <- mySqr, x < 50, y > 50]  -- [(1,64),(1,81),(1,100) and also for 1 ~> 4,9,16,25,36,49]
c3 = take 5 [ (x, y) | x <- mySqr, y <- mySqr, x < 50, y > 50 ]   -- [(1,64),(1,81),(1,100),(4,64),(4,81)]


{- Square Cube -} 

mySqre = [x^2 | x <- [1..5]]
myCube = [y^3 | y <- [1..5]]

-- 1. First write an expression that will make tuples of the outputs of mySqre and myCube.
s1 = [(x,y) | x <- mySqre, y <- myCube]

-- 2. Now alter that expression so that it only uses the x and y values that are less than 50.
s2 = [(x,y) | x <- mySqre, y <- myCube, x < 50, y < 50]

-- 3. Apply another function to that list comprehension to determine how many tuples inhabit your output list.
s2l = length s2

{- Bottom Madness -}
-- Will the following expressions return a value or be ⊥ ?

b1 = [x^y | x <- [1..5], y <- [2, undefined]]   -- b 
b2 = take 1 $ [x^y | x <- [1..5], y <- [2, undefined]]  -- v
b3 = sum [1, undefined, 3]    -- b 
b4 = length [1, 2, undefined]   -- v
b5 = length $ [1, 2, 3] ++ undefined    -- b
b6 = take 1 $ filter even [1, 2, 3, undefined]    -- v
b7 = take 1 $ filter even [1, 3, undefined]       -- b
b8 = take 1 $ filter odd [1, 3, undefined]        -- v
b9 = take 2 $ filter odd [1, 3, undefined]        -- v
b10 = take 3 $ filter odd [1, 3, undefined]       -- b

-- Is it in : 1. normal form or 2. weak head normal form or 3. neither?

-- n1 = [1, 2, 3, 4, 5]    
-- n2 = 1 : 2 : 3 : 4 : _  
-- n3 = enumFromTo 1 10    
-- n4 = length [1, 2, 3, 4, 5]
-- n5 = sum (enumFromTo 1 10)
-- n6 = ['a'..'m'] ++ ['n'..'z']
-- n7 = (_, 'b')


{- More Bottoms -}

-- value or bottom?
m1 = take 1 $ map (+1) [undefined, 2, 3]    -- b
m2 = take 1 $ map (+1) [1, undefined, 3]    -- v
m3 = take 2 $ map (+1) [1, undefined, 3]    -- b

-- 4. explain the function 
itIsMystery xs = map (\x -> elem x "aeiou") xs    -- returns a mask of whether elem is vowel

-- 5. evaluate 
fa = map (^2) [1..10]   -- [1,4,9,...100]
fb = map minimum [[1..10], [10..20], [20..30]] --  [1,10,20]
fc = map sum [[1..5], [1..5], [1..5]]     -- [15,15,15]

-- 6. 
myBool :: a -> a -> Bool -> a
myBool _ y True  = y
myBool x _ False = x

{- Filtering -}

-- 1. write a filter function that would give us all the multiples of 3 out of a list from 1-30?
mult3 = filter (\x -> x `mod` 3 == 0) [1..30]
-- 2. compose the above function with the length function to tell us *how many* multiples of 3 there are between 1 and 30?
len3 = length mult3
-- 3. Next we’re going to work on removing all articles (’the’, ’a’, and ’an’) from sentences. You want to get to something that works like this:
--
-- Prelude> myFilter "the brown dog was a goof"
-- ["brown","dog","was","goof"]
remArt str = filter (\s -> (s /= "the") || (s /= "a") || (s /= "an")) (words str)

{- Zipping -}

-- 1. Write your own version of zip and ensure it behaves the same
-- as the original.
--
myzip :: [a] -> [b] -> [(a, b)]
myzip [] _ = []
myzip _ [] = []
myzip (x:xs) (y:ys) = [(x,y)] ++ myzip xs ys


-- 2. Do what you did for zip, but now for zipWith:
--
myzipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myzipWith _ [] _ = []
myzipWith _ _ [] = []
myzipWith f (x:xs) (y:ys) = [f x y] ++ myzipWith f xs ys


-- 3. Rewrite your zip in terms of the zipWith you wrote.
myZip :: [a] -> [b] -> [(a, b)]
myZip x y = myzipWith f x y 
          where f a b = (a,b)


{- Chapter Exercises -}

{- Ciphers -}
shift :: Char -> Int -> Char 
shift c n | c == ' '  = ' '
          | isLower c && (asc > 122) = chr (asc - 26)
          | isLower c && (asc < 97)  = chr (asc + 26)
          | isUpper c && (asc > 90)  = chr (asc - 26)
          | isUpper c && (asc < 65)  = chr (asc + 26)
          | otherwise = chr asc
          where asc = ord c + n

caesar :: String -> Int -> String
caesar str n = map (\x -> shift x n) str

unCaesar :: String -> Int -> String
unCaesar str n = caesar str (-n)
