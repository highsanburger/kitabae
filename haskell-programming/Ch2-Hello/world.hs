sayHello :: String -> IO()
sayHello x = putStrLn("Hello " ++ x ++ "!")

trip x = x * 3

-- (\f -> (1, 2 + f)) 2
