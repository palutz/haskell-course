import Data.Char (isUpper)
import Text.XHtml (coords)
import Data.List (sort)
-- Create a higher-order function that takes 3 parameters: A function and the two parameters that that function takes, and
-- flips the order of the parameters.
-- For example this: `(/) 6 2` returns `3`. But this: `flip' (/) 6 2` returns `0.3333333333`]
flipAndDoIt :: (a -> a -> a) -> a -> a -> a
flipAndDoIt f a b = f b a


-- Create the `uncurry'` function that converts a curried function to a function on pairs. So this: `(+) 1 2` that returns `3` can be written as
-- `uncurry' (+) (1,2)` (with the two different arguments inside a pair).
uncurry' :: (a -> a -> a) -> (a, a) -> a 
uncurry' f (a, b) = f a b

-- Create the `curry'` function that converts an uncurried function to a curried function. So this: `fst (1,2)` that returns `1` can be written as
-- `curry' fst 1 2` (with the tuple converted into two different arguments).
curry' :: ((a, a) -> a) -> a -> a -> a
curry' f a b = f (a, b)

-- Use higher-order functions, partial application, and point-free style to create a function that checks if a word has an uppercase letter.
-- Start with using just higher-order functions and build from there. 
hasUpper :: String -> Bool 
hasUpper = any isUpper
hasUpper' :: String -> Bool 
hasUpper' = any (`elem` ['A'..'Z'])

-- Create the `count` function that takes a team ("Red", "Blue", or "Green") and returns the amount of votes the team has inside `votes`.
votes :: [String]
votes = ["Red", "Blue", "Green", "Blue", "Blue", "Red"]

countVotes :: String -> [String] -> Int 
countVotes team = length . filter(== team) 

-- Create a one-line function that filters `cars` by brand and then checks if there are any left.
cars :: [(String,Int)]
cars = [("Toyota",0), ("Nissan",3), ("Ford",1)]

anyCarsLeft :: String -> [(String, Int)] -> Bool 
anyCarsLeft br = not . null . filter(\(b, _) -> b /= br)
-- shorter version 
-- anyCarsLeft br = any (\(b, _) -> b /= br)