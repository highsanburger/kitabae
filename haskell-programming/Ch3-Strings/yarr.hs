module Yar where

greet = "Yarrr"

print2 :: IO ()
print2 = do 
  putStrLn greet

main :: IO ()
main = do
  print2
  putStr greet

-- y,n,y,n,n,y,n,y
