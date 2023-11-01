cls :: IO ()
cls = putStr "\ESC[2J"

type Pos = (Int,Int)

writeat :: Pos -> String -> IO ()
writeat p xs = do goto p
                  putStr xs

goto :: Pos -> IO ()
goto (x,y) = putStr ("\ESC[" ++ show y ++ ";" ++ show x ++ "H")

width :: Int
width = 50
 
height :: Int
height = 50

type Board = [Pos]

block :: Board 
block = [(1,1),(1,2),(2,1),(2,2)]

blinker :: Board 
blinker = [(1,2),(2,2),(3,2)]

glider :: Board
glider = [(4,2),(2,3),(4,3),(3,4),(4,4)]

penta :: Board
penta = [(7,8),(8,8),(9,9),(9,7),(10,8),(11,8),(12,8),(13,8),(14,9),(14,7),(15,8),(16,8)]

-- train :: Board
-- train = [(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(10,0),(11,0),(12,0),(13,0),(14,0),(18,0),(19,0),(20,0),(27,0),(28,0),(29,0),(30,0),(31,0),(32,0),(33,0),(35,0),(36,0),(37,0),(38,0),(39,0)]

-- showcells :: Board -> IO ()
-- showcells b = sequence_ [writeat p "O" | p <- b]

showcells :: Board -> IO ()
showcells b = do
  let allPositions = [(x, y) | x <- [1..width], y <- [1..height]]
  sequence_ [writeCell p | p <- allPositions]
  where
    writeCell p
      | p `elem` b = writeat p "O"  -- Alive cells as "O"
      | otherwise   = writeat p "."  -- Dead cells as "."

isAlive :: Board -> Pos -> Bool
isAlive b p = elem p b

isEmpty :: Board -> Pos -> Bool
isEmpty b p = not (isAlive b p)

neighbs :: Pos -> [Pos]
neighbs (x,y) = map wrap [(x-1,y-1), (x,y-1),
                          (x+1,y-1), (x-1,y),
                          (x+1,y), (x-1,y+1),
                          (x,y+1), (x+1,y+1)]

wrap :: Pos -> Pos
wrap (x,y) = (((x-1) `mod` width) + 1,
              ((y-1) `mod` height) + 1)

liveneighbs :: Board -> Pos -> Int
liveneighbs b = length . filter (isAlive b) . neighbs

survivors :: Board -> [Pos]
survivors b = [p | p <- b, elem (liveneighbs b p) [2,3]]

-- births :: Board -> [Pos]
-- births b = [(x,y) | x <- [1..width],
--                     y <- [1..height],
--                     isEmpty b (x,y),
--                     liveneighbs b (x,y) == 3]

births :: Board -> [Pos]
births b = [p | p <- rmdups (concat (map neighbs b)),
                isEmpty b p,
                liveneighbs b p == 3]
 
rmdups :: Eq a => [a] -> [a]
rmdups [] = []
rmdups (x:xs) = x : rmdups (filter (/= x) xs)

nextgen :: Board -> Board
nextgen b = survivors b ++ births b

life :: Board -> IO ()
life b = do cls
            showcells b
            wait 300000
            life (nextgen b)

wait :: Int -> IO ()
wait n = sequence_ [return () | _ <- [1..n]]
