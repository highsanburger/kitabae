module Addition where 

import Test.Hspec 
import Test.QuickCheck

sayHello :: IO ()
sayHello = putStrLn "Hello!"

main :: IO ()
main = hspec $ do
  describe "Addition" $ do 
    it "1 + 1 is greater than 1" $ do
      (1 + 1) > 1 `shouldBe` True

{-Short Exercise-}

sumRec :: (Eq a, Num a) => a -> a
sumRec 1 = 1
sumRec n = n + sumRec (n-1)

-- inter :: IO () 
-- inter = hspec $ do 
--   describe "Recursive Summation" $ do 
--     it "9 + 0 is 0" $ do 
--       (sumRec 9 0) == 9 `shouldBe` True

main2 :: IO ()
main2 = hspec $ do
  describe "Plus 1" $ do 
    it "x + 1 is always\ \ greater than x" $ do
      property $ \x -> x + 1 > (x :: Int)

prop :: Int -> Bool 
prop x = x + 1 > x 

runQc :: IO () 
runQc =  quickCheck prop
