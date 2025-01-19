#!/usr/bin/env runghc

main :: IO ()
main =
  putStrLn $ show $ lazyExample 10

 
-- Haskell은 기본적으로 Lazy Evaluation
lazyExample :: Int -> Int
lazyExample x = 
  let y = expensiveComputation x
  in 1 + 1


-- Haskell은 기본적으로 Lazy Evaluation
expensiveComputation :: Int -> Int
expensiveComputation x = x * x


