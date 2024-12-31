#!/usr/bin/env runghc

data Box a = Box { item :: a } deriving (Show)

newBox :: a -> Box a
newBox i = Box { item = i }


class Management b where
  get :: b a -> Either String a
  set :: b a -> a -> Either String ()

instance Management Box where
  get (Box i) = Right i
  set (Box _i) _v = Right ()


main :: IO ()
main = do
  let myBox = newBox 100

  case get myBox of
    Right i -> putStrLn $ "Item: " <> show i
    Left e -> putStrLn $ "Failed to get item: " <> e
  
  case set myBox 1000 of
    Right _ -> putStrLn "Item updated successfully"
    Left e -> putStrLn $ "Failed to set item: " <> e
