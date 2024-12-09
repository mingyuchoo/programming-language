#!/usr/bin/env runghc

-- -----------------------------------------
-- Sum Type(Union type) vs. Product Type
-- - Sum Type: unions, variants, ...
-- - Product Type: tuples, records, ...
-- -----------------------------------------

--
-- Sum Type
-- 
data Result = Success String
            | Failure String
            deriving Show 

process :: Int -> Result
process n
  | n > 0 = Success "Positive number"
  | otherwise = Failure "Non-positive number"

--
-- Product Type
-- 
type Point = (Int, Int)

move :: Point -> Point
move (x, y) = (x + 1, y + 1)

-- main
main = do
  print $ process 10
  print $ move (2, 3)
