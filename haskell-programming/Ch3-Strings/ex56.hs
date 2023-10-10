module Reverse where

-- 5.
rvrs :: String -> String
rvrs cur =  drop 9 cur ++ take 4 (drop 5 cur) ++ take 5 cur

-- 6.
main :: IO ()
-- main = print (rvrs "Curry is awesome")
main = print $ rvrs "Curry is awesome"
