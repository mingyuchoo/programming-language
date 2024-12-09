#!/usr/bin/env runghc

--
--
-- 
divide :: Int -> Int -> Either String Int
divide _ 0 = Left "Division by zero"
divide x y = Right (x `div` y)

--
--
-- 
addOne :: Int -> Either String Int
addOne x = Right (x + 1)

--
--
-- 
multiplyByTwo :: Int -> Either String Int
multiplyByTwo x = Right (x * 2)

--
-- print function for result Either type
-- 
printResult :: Either String Int -> IO ()
printResult (Left err) = putStrLn $ "Error: " ++ err
printResult (Right val) = putStrLn $ "Result: " ++ show val

--
-- main
-- 
main :: IO ()
main = do
    printResult $ divide 100 2 >>= addOne >>= multiplyByTwo
    printResult $ divide 100 0 >>= addOne >>= multiplyByTwo
