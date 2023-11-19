import Data.Char
import Control.Monad
import System.Exit

-- 1. Ciphers: Open your Ciphers module and modify it so that the Caesar and Vigenère ciphers work with user input.

-- Caesar 
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

gimmeCaesar :: IO () 
gimmeCaesar = do 
  putStrLn " Enter Word you to want to encrypt using Caesar cipher : "
  word <- getLine 
  putStrLn " Shift by how many characters? "
  numStr <- getLine
  let num = read numStr :: Int 
  putStrLn $ "Cipher == " ++ (caesar word num)

-- TODO Vigenere


-- 2. Here is a very simple, short block of code. Notice it has a forever that will make it keep running, over and over again. Load it into
-- your REPL and test it out. Then refer back to the chapter and modify it to exit successfully after a False result.

palindrome :: IO ()
palindrome = forever $ do
  line1 <- getLine
  case (line1 == reverse line1) of
    True -> putStrLn "It's a palindrome!"
    False -> putStrLn "Nope!"

-- Ans:

palin :: IO ()
palin = forever $ do
  line1 <- getLine
  case (line1 == reverse line1) of
    True -> putStrLn "It's a palindrome!"
    False -> exitSuccess


-- 3. If you tried using palindrome on a sentence such as “Madam I’m Adam,” you may have noticed that palindrome checker
-- doesn’t work on that. Modifying the above so that it works on sentences, too, involves several steps.

test = "Madam I'm Adam,"

proper :: String -> String 
proper str = map toLower $ filter (\c -> not (isPunctuation c) && not (isSpace c))  str

palinprop :: IO ()
palinprop = forever $ do
  line <- getLine
  let line1 = proper line 
  case (line1 == reverse line1) of
    True -> putStrLn "It's a palindrome!"
    False -> putStrLn "Nope!"


-- 4. 
type Name = String 
type Age = Integer 

data Person = Person Name Age deriving Show 

data PersonInvalid = NameEmpty | AgeTooLow | PersonInvalidUnknown String 
                     deriving (Eq,Show)

mkPerson :: Name -> Age -> Either PersonInvalid Person 
mkPerson name age | name /= "" && age > 0 = Right $ Person name age 
                  | name == "" = Left NameEmpty
                  | not (age > 0) = Left AgeTooLow
                  | otherwise = Left $ PersonInvalidUnknown $ 
                                "Name was: " ++ show name ++ 
                                "Age was: " ++ show age

{- 
Your job is to write the following function without modifying the code above.
a) It should prompt the user for a name and age input.
b) It should attempt to construct a Person value using the name and age the user entered. You’ll need the read function for Age because it’s an Integer rather than a String.
c) If it constructed a successful person, it should print ”Yay! Successfully got a person:” followed by the Person value.
d) If it got an error value, report that an error occurred and  print the error.
 -}

gimmePerson :: IO ()
gimmePerson = do 

  putStrLn "Enter Name : "
  name <- getLine

  putStrLn "Enter Age : "
  ageStr <- getLine

  let age = read ageStr :: Integer
  let person = mkPerson name age

  case mkPerson name age of 
    Right person -> putStrLn $ "Yay Successfully got a person : " ++ show person
    Left notperson -> putStrLn $ "Error : " ++ show notperson
