#!/usr/bin/env runghc

{-# LANGUAGE LambdaCase #-}

main :: IO ()
main = do
    putStrLn $ show $ f1 (Just 100)
    putStrLn $ show $ f2 (Just 100)
    putStrLn $ show $ f3 (Just 100)


--
-- Explicit function definition
--
f1 :: Maybe Int -> Int
f1 x = case x of
    Just x  -> x
    Nothing -> 0

--
-- Lambda expression
--
f2 :: Maybe Int -> Int
f2 = \x -> case x of
    Just x  -> x
    Nothing -> 0

--
-- Point-free style using `\case` statement
-- from GCH 8.6 with `-XLambdaCase` extension
--
f3 :: Maybe Int -> Int
f3 = \case
    Just x -> x
    Nothing -> 0
