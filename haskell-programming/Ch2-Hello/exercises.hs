-- Comprehension check
--
--2. 
twoP x = 3.14 * (x*x)
twoPi x = pi * (x*x)
foo x =
    let y = x * 2
        z = x ^ 2
    in 2 * y * z
x = 7
y = 10
f x y = x + y

-- let vs where
result    =  x*3 + y
  where x = 3 
        y = 1000


-- Chapter Ex
-- 4.
waxOn = x * 5
  where x = z ^ 2
        z = 7

triple x = x *3 

waxOff x = triple x
