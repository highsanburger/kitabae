import System.IO 

-- 1. Redefine putStr :: String -> IO () using a list comprehension and the library function sequence_ :: [IO a] -> IO ().

putStrr :: String -> IO ()
putStrr cs = sequence_ [ do putChar c | c <- cs]


-- 2. Using recursion, define a version of putBoard :: Board -> IO () that displays nim boards of any size, rather than being specific to boards with just
--  five rows of stars.
--  Hint: first define an auxiliary function that takes the current row number as an additional argument.


type Board = [Int]

stars :: Int -> String
stars n = concat (replicate n "* ")

putRow :: Int -> Int -> IO ()
putRow row num = do putStr (show row)
                    putStr ": "
                    putStrLn (stars num)

-- putBoard2 :: Board -> [Int] -> IO ()
-- putBoard2 (c:cs) (n:ns) = do putRow n c



-- 3. In a similar manner to the first exercise, redefine the generalised version of putBoard using a list comprehension and sequence_.

putBoard3 :: Board -> IO ()
putBoard3 brd = sequence_ [ putRow x y | (x,y) <- bs]
            where bs = zip [1..] brd 


-- 4. Define an action adder :: IO () that reads a given number of integers from the keyboard, one per line, and displays their sum. 
-- For example:
--  > adder
-- How many numbers? 5
-- 1
-- 3
-- 5
-- 7
-- 9
-- The total is 25

-- Hint: start by defining an auxiliary function that takes the current total and how many numbers remain to be read as arguments. You will also likely need
-- to use the library functions read and show.

getLen :: IO Int 
getLen = do 
   putStr "How many number? "
   len <- getInt 
   return len

getInt :: IO Int
getInt = do
  input <- getLine 
  return (read input :: Int)


add :: Int -> Int ->  IO ()

add 1 total = do
  n <- getInt 
  putStr "The total is "
  putStrLn $ show (n+total)

add len total = do
  n <- getInt 
  add (len - 1) (total + n)


adder :: IO ()
adder = do 
   len <- getLen
   add len 0
 
-- 5. Redefine adder using the function sequence :: [IO a] -> IO [a] that performs a list of actions and returns a list of the resulting values.

-- adder5 :: IO ()
-- adder5 = do
--   len <- getLen
--   add len 0


-- 6. Using getCh, define an action readLine :: IO String that behaves in the same way as getLine, except that it also permits the delete key to be used
 -- to remove characters. Hint: the delete character is ’\DEL’, and the control character for moving the cursor back one space is ’\b’.
 
readLine :: IO String
readLine = do
   do x <- getChar
      if x == '\n' then
          return []
      else if x == '\b' then
          return '\0']

 
 
 
do xs <- getLine
 
return (x:xs)
