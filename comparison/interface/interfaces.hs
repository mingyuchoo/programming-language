#!/usr/bin/env runghc

-- ------------------------------------
-- 영어 순서: a Subject -> Verbs -> Objects
-- Haskell 설계 순서: a Subject -> Verbs -> Objects
-- Haskell 구현 순서: a Subject -> Verbs -> Objects
-- ------------------------------------
{-# LANGUAGE InstanceSigs #-}


-- ------------------------------------
-- a Subject
-- ------------------------------------
main :: IO ()
main = do
    let dog = Dog;
    let cat = Cat;

    feedPet dog
    feedPet cat

    walkThePet dog
    walkThePet cat

-- ------------------------------------
-- Verbs
-- ------------------------------------
feedPet :: (Pet a) => a -> IO ()
feedPet pet = eat pet

walkThePet :: (Pet a) => a -> IO ()
walkThePet pet = makeSound pet


-- ------------------------------------
-- Objects
-- ------------------------------------
data Dog = Dog;
data Cat = Cat;

class Pet a where
    eat :: a -> IO ()
    makeSound :: a -> IO ()

instance Pet Dog where
    eat :: Dog  -> IO ()
    eat _ = putStrLn "The dog is eating."

    makeSound :: Dog -> IO ()
    makeSound _ = putStrLn "Woof! Woof!"

instance Pet Cat where
    eat :: Cat  -> IO ()
    eat _ = putStrLn "The cat is eating."

    makeSound :: Cat -> IO ()
    makeSound _ = putStrLn "Meow! Meow!"

