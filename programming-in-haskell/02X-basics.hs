-- 1. , 2. & 3. are trivial (😛)


-- 4. last can also be defined as 

last1 xs = head (reverse xs)
last2 xs = xs !! (length xs - 1)


-- 5. init can also be defined as 

init1 xs = reverse (drop 1 (reverse xs))
init2 xs = reverse (tail (reverse xs))
