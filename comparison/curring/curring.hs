#!/usr/bin/env runghc

--
--
-- 
multiply :: Int -> Int -> Int -> Int
multiply x y z = x * y * z

--
--
-- 
main :: IO ()
main = do
    -- case 1
    let step1 = multiply 2
    let step2 = step1 3
    let step3 = step2 4
    print step3

    -- case 2
    print (((multiply 2) 3) 4)
