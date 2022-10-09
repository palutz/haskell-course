import GHC.IO.Encoding (getForeignEncoding)
-- Question 1
-- Lets say you have the nested values defined bellow. How would you get the value of
-- 4 by using only pattern matching in a function?

nested :: [([Int], [Int])]
nested = [([1,2],[3,4]), ([5,6],[7,8])]

getFourth :: [([Int], [Int])] -> Int
getFourth [(_, (_:q:[]))] = q
getFourth _ = 0

-- Question 2
-- Write a function that takes a list of elements of any type and, if the list has 3 or more elements, it
-- removes them. Else, it does nothing. Do it two times, one with multiple function definitions and one with
-- case expressions.
removeIf3 :: [a] -> [a]
removeIf3 (a:b:c:_) = []
removeIf3 xs = xs 


-- Question 3
-- Create a function that takes a 3-element tuple (all of type Integer) and adds them together
add3Tuple :: (Int, Int, Int) -> Int
add3Tuple(a, b, c) = a + b + c 

-- Question 4
-- Implement a function that returns True if a list is empty and False otherwise.
isEmptyList :: [a] -> Bool
isEmptyList [] = True
isEmptyList _ = False

-- Question 5
-- Write the implementation of the tail function using pattern matching. But, instead of failing if
-- the list is empty, return an empty list.
tailPM :: [a] -> [a]
tailPM (_:xs) = xs
tailPM [] = []

-- Question 6
-- write a case expression wrapped in a function that takes an Int and adds one if it's even. Otherwise does nothing. 
-- (Use the `even` function to check if the number is even.)
add1ToEven :: Int -> Int 
add1ToEven x = 
    case even x of
        True -> x + 1
        False -> x 
