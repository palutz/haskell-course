-- Question 1
-- Write a function that checks if the monthly consumption of an electrical device is bigger, equal, or smaller than the maximum allowed and
-- returns a message accordingly. 
-- The function has to take the hourly consumption of an electrical device, the hours of daily use, and the maximum monthly consumption allowed.
-- (Monthly usage = consumption (kW) * hours of daily use (h) * 30 days).
monthlyConsumption :: Double -> Double -> Double -> String
monthlyConsumption cons hrs maxCons = 
    "Total consumption is " ++ result ++ " the max consumption allowed"
    where 
        totCons = cons * hrs * 30.0
        result 
            | totCons > maxCons = "greater than"
            | totCons == maxCons = "equal to"
            | otherwise = "less than"


-- Question 2
-- Prelude:
-- We use the function `show :: a -> String` to transform any type into a String.
-- So `show 3` will produce `"3"` and `show (3 > 2)` will produce `"True"`.

-- In the previous function, return the excess/savings of consumption as part of the message.
monthlyConsumption2 :: Double -> Double -> Double -> String
monthlyConsumption2 cons hrs maxCons = 
    "Total consumption is " ++ result ++ " the max consumption allowed"
    where 
        totCons = cons * hrs * 30.0
        diffCons = totCons - maxCons
        result 
            | diffCons > 0 = "greater by " ++ show diffCons ++ " than"
            | diffCons == 0 = "equal to"
            | otherwise = "less by " ++ show diffCons ++ " than"



-- Question 3
-- Write a function that showcases the advantages of using let expressions to split a big expression into smaller ones.
-- Then, share it with other students in Canvas.
expoVsFact :: Int -> Int -> Int
expoVsFact x y = 
    let expon = x ^ y 
        factSum = product [1..x] + product [1..y]
    in 
        if expon > factSum then expon
        else factSum



-- Question 4
-- Write a function that takes in two numbers and returns their quotient such that it is not greater than 1.
-- Return the number as a string, and in case the divisor is 0, return a message why the division is not
-- possible. To implement this function using both guards and if-then-else statements.  
quotient :: Int -> Int -> String 
quotient x y 
    | x > y = show (y `div` x)
    | y == 0 = "division is not possible"
    | otherwise = show (x `div` y)


-- Question 5
-- Write a function that takes in two numbers and calculates the sum of squares for the product and quotient
-- of those numbers. Write the function such that you use a where block inside a let expression and a
-- let expression inside a where block. 
calcSum2 :: Double -> Double -> Double 
calcSum2 x y = 
    let prodxy = (*)
        quotxy = (/) 
    in summed  (squared (prodxy x y))  (squared (quotxy x y))
        where 
            squared :: Double -> Double
            squared q = q * q
            summed :: Double -> Double -> Double
            summed = (+)