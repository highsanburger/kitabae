-- Comprehension check
--
-- 1. No change.
-- 2. 
twoP x = 3.14 * (x*x)
-- 3.
twoPi x = pi * (x*x)

-- Head Code
-- Rewrite with where clauses:
--
-- 1. let x = 3; y = 1000 in x * 3 + y

-- 2. let y = 10; x = 10 * 5 + y in x * 5

-- 3. 
let x = 7
    y = negate x
    z = y * 10
 -- in z / x + y


{-Ch Ex-}
-- 4.
waxOn = x * 5
  where x = z ^ 2
        z = 7

triple x = x *3 

waxOff x = triple x
