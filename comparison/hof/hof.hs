#!/usr/bin/env runghc

-- Haskell functions can take functions as parameters
-- and return functions as return values.
-- A function that does either of those is called
-- a higher order function.

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

main :: IO ()
main = do
    print $ applyTwice (+3) 10
