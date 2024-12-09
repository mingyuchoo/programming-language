#!/usr/bin/env runghc

{-# LANGUAGE GADTs  #-}

-- -----------------------------------------
-- Sum Type(Union type) vs. Product Type
-- - Sum Type: unions, variants, ...
-- - Product Type: tuples, records, ...
-- -----------------------------------------

--
-- Sum Type
-- e.g.: Either, Maybe, ...
data Result = Success String
            | Failure String
            deriving Show 

process :: Int -> Result
process n
  | n > 0 = Success "Positive number"
  | otherwise = Failure "Non-positive number"

--
-- Sum Type
-- - GADT (Gneralized Algebraic Data Types)
-- 
data Expr a where
  IntLit  :: Int -> Expr Int
  BoolLit :: Bool -> Expr Bool
  Add     :: Expr Int -> Expr Int -> Expr Int

eval :: Expr a -> a
eval (IntLit n) = n
eval (BoolLit b) = b
eval (Add x y ) = eval x + eval y

--
-- Product Type
-- - tuple type
-- 
type Point = (Int, Int)

move :: Point -> Point
move (x, y) = (x + 1, y + 1)

--
-- Product type
-- - record type
--
data Coordinate = Coordinate { x :: Float
                             , y :: Float
                             }

distance :: Coordinate -> Coordinate -> Float
distance (Coordinate x1 y1) (Coordinate x2 y2) =
  sqrt ((x2 - x1)^2 + (y2 - y1)^2)
  

--
-- main
--
main = do
  print $ process 10

  let expr1 = IntLit 4
  let expr2 = IntLit 6
  let sumExpr = Add expr1 expr2
  print $ eval sumExpr
  
  print $ move (2, 3)

  let pointA = Coordinate 3.0 4.0
  let pointB = Coordinate 0.0 0.0
  print $ distance pointA pointB
