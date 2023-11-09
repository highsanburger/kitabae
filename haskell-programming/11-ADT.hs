{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}
import Data.Int
import Data.Char
import Data.List
import Data.Maybe

{- Dog Types -}

data Doggies a = Husky a | Mastiff a deriving (Eq, Show)
data DogueDeBordeaux doge = DogueDeBordeaux doge

{- 
1. Is Doggies a type constructor or a data constructor?  -- type constructor
2. What is the kind of Doggies?       -- * -> * 
3. What is the kind of Doggies String?    -- *
4. What is the type of Husky 10?        -- Num a => Doggies a
5. What is the type of Husky (10 :: Integer)?     -- Doggies Integer
6. What is the type of Mastiff "Scooby Doo"?      -- Doggiest String
7. Is DogueDeBordeaux a type constructor or a data constructor?     -- same name for 2 different things
8. What is the type of DogueDeBordeaux?                   -- doge -> DogueDeBordeaux doge
9. What is the type of DogueDeBordeaux "doggie!"           -- DogueDeBordeaux String
-}


{- Vehicles -}

data Price = Price Integer deriving (Eq, Show)
data Manufacturer = Mini | Mazda | Tata deriving (Eq, Show)
data Airline = PapuAir | CatapultsR'Us | TakeYourChancesUnited deriving (Eq, Show)
data Vehicle = Car Manufacturer Price | Plane Airline deriving (Eq, Show)

myCar = Car Mini (Price 14000)
urCar = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge = Plane PapuAir

-- 1. What is the type of myCar?  -- myCar :: Vehicle

-- 2. Given the following, define the functions:

isCar :: Vehicle -> Bool
isCar (Car _ _)  = True
isCar (Plane _)  = False

isPlane :: Vehicle -> Bool
isPlane (Plane _)  = True
isPlane (Car _ _)  = False

areCars :: [Vehicle] -> [Bool]
areCars vs = map (isCar) vs


-- 3. Now we’re going to write a function to tell us the manufacturer of a piece of data:
getManu :: Vehicle -> Manufacturer
getManu (Car m _) = m

-- 4. Given that we’re returning the Manufacturer, what will happen if you use this on Plane data?
 -- Non Exhaustive patterns exception

-- 5. All right. Let’s say you’ve decided to add the size of the plane as an argument to the Plane constructor. Add that to your datatypes
--    in the appropriate places and change your data and functions appropriately.

data Size = Size Double deriving (Eq, Show)
data Vehicle' = Car' Manufacturer Price | Plane' Airline Size deriving (Eq, Show)

isPlane' :: Vehicle' -> Bool
isPlane' (Plane' _ _)  = True
isPlane' (Car' _ _)  = False


{- Cardinality -}
-- Calculate Cardinality of the following datatypes.

-- 1. data PugType = PugData    -- 1
-- 2. data Airline = PapuAir | CatapultsR'Us | TakeYourChancesUnited    -- 3
--3. Given what we know about Int8, what’s the cardinality of Int16?    
      -- = maxBound :: Int 16 - (minBound :: Int16 ) = 32767 - (-32768) = 6553

-- 4. Use the REPL and maxBound and minBound to examine Int and Integer. What can you say about the cardinality of those types?
      -- minBound :: Int = -9223372036854775808, maxBound :: Int = 9223372036854775807
      -- Integer is unbounded

-- 5. Extra credit (impress your friends!): What’s the connection between the 8 in Int8 and that type’s cardinality of 256?   -- 2^8 this book is so stupid


{- For Example-}

data Example = MakeExample deriving Show
{- 
1. What is the type of data constructor MakeExample? What happens when you request the type of Example?
      :t MakeExample ~~~> Example , Example is itself a type, not a data constructor to HAVE a type.

2. Can you determine what typeclass instances are defined for the Example type using :info in GHCi?
      type Example :: *
      data Example = MakeExample -- Defined at 11-ADT.hs:82:1
      instance [safe] Show Example -- Defined at 11-ADT.hs:82:37

3. Try making a new datatype like Example but with a single type argument added to MakeExample, such as Int. What has changed
   when you query MakeExample with :type in GHCi?
-}
data Eg = MakeEg Int deriving Show
-- MakeEg :: Int -> Eg


{- Logic Goats -}

-- {-# LANGUAGE GeneralizedNewtypeDeriving #-} language extension declared in top of the file
class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

newtype Goats = Goats Int deriving (Eq, Show, TooMany)

-- 1. Reusing the TooMany typeclass, write an instance of the typeclass for the type (Int, String).
-- {-# LANGUAGE FlexibleInstances #-}
instance TooMany (Int,String) where 
  tooMany (n,_) = n > 42

-- 2. Make another TooMany instance for (Int, Int). Sum the values together under the assumption this is a count of goats from two fields.
instance TooMany (Int,Int) where
  tooMany (n1,n2) = (n1 + n2) > 42

-- 3. Make another TooMany instance, this time for (Num a, TooMany a) => (a, a). This can mean whatever you want, such as summing the two numbers together.
instance (Num a, TooMany a) => TooMany (a,a) where
  tooMany (n1,n2) = tooMany n1 || tooMany n2


{- Pity the Bool -}

-- 1. What is the cardinality of this datatype?
data BigSmall = Big Bool | Small Bool deriving (Eq, Show)
    -- card (BigSmall) = card (Big) + card (Small)
    --                 = card (Bool) + card (Bool)
    --                 => 4

-- 2. What is the cardinality of NumberOrBool?
--    What happens if you try to create a Numba with a numeric literal larger than 127? 
--    And with a numeric literal smaller than (-128)?

data NumberOrBool = Numba Int8 | BoolyBool Bool deriving (Eq, Show)
myNumba = Numba (-128)
    -- card(NumberOrBool) = card(Numba) + card(BoolyBool) = 258
    -- Overflow
    -- Overflow


{- Programmers -}

data OperatingSystem = GnuPlusLinux | OpenBSDPlusNevermindJustBSDStill | Mac | Windows deriving (Eq, Show)
data ProgLang = Haskell | Agda | Idris | PureScript deriving (Eq, Show)
data Programmer = Programmer { os :: OperatingSystem , lang :: ProgLang } deriving (Eq, Show)

-- Write a function that generates all possible values of Programmer. Use
-- the provided lists of inhabitants of OperatingSystem and ProgLang.

allOperatingSystems :: [OperatingSystem]
allOperatingSystems =
    [ GnuPlusLinux
    , OpenBSDPlusNevermindJustBSDStill
    , Mac
    , Windows
    ]

allLanguages :: [ProgLang]
allLanguages = [Haskell, Agda, Idris, PureScript]

allProgrammers :: [Programmer]
allProgrammers = [Programmer {os = x, lang = y} | x <- allOperatingSystems, y <- allLanguages]

{- The Quad -}

{-  
1. data Quad = One | Two | Three | Four deriving (Eq, Show)
  -- how many different forms can this take?
    eQuad :: Either Quad Quad
    eQuad = ???
    4 + 4 

2. prodQuad :: (Quad, Quad)   ~~> 4 * 4
3. funcQuad :: Quad -> Quad   ~~> 4 ^ 4
4. prodTBool :: (Bool, Bool, Bool)   ~~> 2 * 2 * 2
5. gTwo :: Bool -> Bool -> Bool   ~~>  (2^2) ^2
6. Hint: 5 digit number
fTwo :: Bool -> Quad -> Quad   ~~> (2^4) ^4 
-}


{- Binary Tree -}

data BinaryTree a = Leaf | Node (BinaryTree a) a (BinaryTree a) deriving (Eq, Ord, Show)

insert' :: Ord a => a -> BinaryTree a -> BinaryTree a
insert' b Leaf = Node Leaf b Leaf
insert' b (Node left a right) | b == a = Node left a right
                              | b < a = Node (insert' b left) a right
                              | b > a = Node left a (insert' b right)

-- Map 

mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree _ Leaf = Leaf
mapTree f (Node left a right) = Node (mapTree f left) (f a) (mapTree f right)

testTree' :: BinaryTree Integer
testTree' = Node (Node Leaf 3 Leaf)
                 1
                 (Node Leaf 4 Leaf)
mapExpected = Node (Node Leaf 4 Leaf)

                   2
                   (Node Leaf 5 Leaf)

mapOkay =
  if mapTree (+1) testTree' == mapExpected
  then print "yup okay!"
  else error "test failed!"


-- Convert binary trees to lists

preorder :: BinaryTree a -> [a]
preorder (Leaf) = []
preorder (Node left a right) = [a] ++ preorder left ++ preorder right

inorder :: BinaryTree a -> [a]
inorder (Leaf) = []
inorder (Node left a right) = inorder left ++ [a] ++ inorder right
 
postorder :: BinaryTree a -> [a]
postorder (Leaf) = []
postorder (Node left a right) = postorder left ++ postorder right ++ [a]

testTree :: BinaryTree Integer
testTree = Node (Node Leaf 1 Leaf)
                2
                (Node Leaf 3 Leaf)

testPreorder :: IO ()
testPreorder =
  if preorder testTree == [2, 1, 3]
  then putStrLn "Preorder fine!"
  else putStrLn "Bad news bears."

testInorder :: IO ()
testInorder =
  if inorder testTree == [1, 2, 3]
  then putStrLn "Inorder fine!"
  else putStrLn "Bad news bears."

testPostorder :: IO ()
testPostorder =
  if postorder testTree == [1, 3, 2]
  then putStrLn "Postorder fine!"
  else putStrLn "postorder failed check"

main :: IO ()
main = do
  testPreorder
  testInorder
  testPostorder


-- foldr for BinaryTree
foldTree :: (a -> b -> b) -> b -> BinaryTree a -> b
foldTree f z (Leaf) = z
foldTree f z (Node left a right) = foldTree f (foldTree f (f a z) left) right 


{-
   Chapter Exercises
                    -}

{- MCQ 
      1-a , 2-c, 3-b, 4-c -}

{- Vigenère Cipher -}


{- As Patterns -}

f :: Show a => (a, b) -> IO (a, b)
f t@(a, _) = do
  print a
  return t

-- Prelude> f (1, 2)
-- 1
-- (1,2)
--
-- 1. This should return True if (and only if) all the values in the first list appear in the second list, though they need not be contiguous.
-- λ> "blah" "blahwoot" ~~~> True
-- λ> "blah" "wootblah" ~~~> True
-- λ> "blah" "wboloath" ~~~> True
-- λ> "blah" "wootbla"  ~~~> False
-- λ> "blah" "halbwoot" ~~~> False

isSubseqOf :: (Eq a) => [a] -> [a] -> Bool
isSubseqOf [] _ = True
isSubseqOf _ [] = False
isSubseqOf str@(s:_) t  = undefined

-- 2. Split a sentence into words, then tuple each word with the capitalized form of each.
--
          -- Prelude> capitalizeWords "hello world"
          -- [("hello", "Hello"), ("world", "World")]
capitalizeWords :: String -> [(String, String)]
capitalizeWords str = zip (words str) (map (\x -> [toUpper ( head x)] ++ (tail x)) (words str)) 


{- Language exercises -}

-- 1. Write a function that capitalizes a word.
-- λ> "Chortle" ~~~> "Chortle"
-- λ> "chortle" ~~~> "Chortle"

capitalizeWord :: String -> String
capitalizeWord str = [toUpper (head str)] ++ (tail str)


-- 2. Write a function that capitalizes sentences in a paragraph. 
--    Recognize when a new sentence has begun by checking for periods. Reuse the capitalizeWord function.
-- λ> "blah. woot ha." ~~~> "Blah. Woot ha."

split :: String -> Char -> [String]
split "" _ = []
split str c  = takeWhile (/= c) str : split s c
             where s = dropWhile (== c) $ dropWhile (/= c) str

capitalizeParagraph :: String -> String
capitalizeParagraph para = init $ foldr (\a b -> a ++ ". " ++ b) "" 
                                        (map (capitalizeWord) 
                                        (map (\x -> if (head x == ' ') then tail x else x) 
                                        (split para '.')))
                          

{- Phone exercise -}

{-
    | 1      | 2 ABC | 3 DEF  |
    | 4 GHI  | 5 JKL | 6 MNO  |
    | 7 PQRS | 8 TUV | 9 WXYZ |
    | * ^    | 0 + _ | # .,   |
-}

-- 1. Create a data structure that captures the phone layout above.

type Btn = (Char, String)
type DaPhone = [Btn] 

phone :: DaPhone
phone = 
  [ ('1', "1")     , ('2', "2abc") , ('3', "3def")
  , ('4', "4ghi")  , ('5', "5jkl") , ('6', "6mno")
  , ('7', "7pqrs") , ('8', "8tuv") , ('9', "9wxyz")
  , ('*', "*^")    , ('0', "0+_") , ('#', "#.,") ]

-- 2. Convert the following conversations into the keypresses required to express them. 

convo :: [String]
convo =
  ["Wanna play 20 questions",
  "Ya",
  "U 1st haha",
  "Lol ok. Have u ever tasted alcohol",
  "Lol ya",
  "Wow ur cool haha. Ur turn",
  "Ok. Do u think I am pretty Lol",
  "Lol ya",
  "Just making sure rofl ur turn"]

-- validButtons = "1234567890*#"
type Digit = Char

-- Valid presses: 1 and up
type Presses = Int

reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
reverseTaps phone c | isUpper c = [('*', 1)] ++ reverseTaps phone (toLower c)
                    | otherwise =  map (\(x,y) -> (x, (1 + fromMaybe (-1) y))) $ filter (\(x,y) -> isJust y) $ map (\(x,y) -> (x, elemIndex c y)) phone

-- assuming the default phone definition
-- 'a' -> [('2', 1)]
-- 'A' -> [('*', 1), ('2', 1)]

cellPhonesDead :: DaPhone -> String -> [(Digit, Presses)]
cellPhonesDead phone str = concat $ map (reverseTaps phone) str


-- 3. How many times do digits need to be pressed for each message?

fingerTaps :: [(Digit, Presses)] -> Presses
fingerTaps dp = sum $ map (\(_,p) -> p) dp


-- 4. What was the most popular letter for each message? What was its cost?

pack ::  Eq a => [a] -> [[a]]
pack [] = []
pack s = (takeWhile (== (head s)) s) : (pack (dropWhile (== (head s)) s))

runLength :: Eq a => [a] -> [(Int, a)]
runLength s = map (\x -> (length x, head x)) $ pack s

mostPopularLetter :: String -> Char
mostPopularLetter = snd . maximum . runLength 

cost :: Char -> String -> Int
cost c s =  (*) (length $ filter (== c) s) (foldr (\(a,b) y -> b+y) 0 $ reverseTaps phone c)


-- 5. What was the most popular letter overall? What was the most popular word?

coolestLtr :: [String] -> Char
coolestLtr = mostPopularLetter . concat

coolestWord :: [String] -> String
coolestWord = snd . maximum . runLength . concat . map words


{- Hutton's Razor -}

-- 1. Your first task is to write the “eval” function which reduces an expression to a final sum.
-- λ> eval (Add (Lit 1) (Lit 9001)) ~~~> 9002

data Expr = Lit Integer | Add Expr Expr

eval :: Expr -> Integer
eval (Lit n) = n 
eval (Add e1 e2) = (+) (eval e1) (eval e2)


-- 2. Write a printer for the expressions.

-- λ> printExpr (Add (Lit 1) (Lit 9001))  ~~~>  "1 + 9001"
-- λ> let a1 = Add (Lit 9001) (Lit 1)
-- λ> let a2 = Add a1 (Lit 20001)
-- λ> let a3 = Add (Lit 1) a2
-- λ> printExpr a3  ~~~>  "1 + 9001 + 1 + 20001"

printExpr :: Expr -> String
printExpr (Lit n) = show n
printExpr (Add e1 e2) = (printExpr e1) ++ " + " ++ (printExpr e2)
