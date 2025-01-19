#!/usr/bin/env runghc

{-# LANGUAGE BangPatterns #-}

main :: IO ()
main = do
  putStrLn $ show $ strictExample1 10
  putStrLn $ show $ strictExample2 10

 
-- Strict Evaluation를 위해 seq 함수를 사용한 예시
strictExample1 :: Int -> Int
strictExample1 x =
  let y = expensiveComputation x
  in y `seq` (1 + 1)

-- Strict Evaluation를 위해 BangPattern 언어 확장을 사용한 예시
strictExample2 :: Int -> Int
strictExample2 x = 
  let !y = expensiveComputation x
  in 1 + 1
  
-- Haskell은 기본적으로 Lazy Evaluation
expensiveComputation :: Int -> Int
expensiveComputation x = x * x


