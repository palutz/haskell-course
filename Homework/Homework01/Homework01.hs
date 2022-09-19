
-- Question 1
-- Write a multiline comment below.
{-
Comment01 
02 
03
-}


-- Question 2
-- Define a function that takes a value and multiplies it by 3.
triple x = 3 * x 

-- Question 3
-- Define a function that calculates the area of a circle.
areaCircle r = pi * r ^ 2

-- Question 4
-- Define a function that calculates the volume of a cylinder by composing the previous function together with the height of the cylinder. 
volCyl h r = h * areaCircle r

-- Question 5
-- Define a function that checks if the volume of a cylinder is greater than or equal to 42.
isVolAtLeast42 h r = volCyl h r >= 42

