-- Write a function that takes a value and multiplies it by 3. Test that it works using GHCi.
times3 x = x * 3

-- Write a function that calculates the area of a circle. Test that it works using GHCi.
circleArea :: Floating a => a -> a
circleArea r = pi * r ** 2

-- Write a function that calculates the volume of a cylinder by composing the previous function together with the height of the cylinder. 
-- Test that it works using GHCi.
cylArea :: Floating a => a -> a -> a
cylArea h r = h * circleArea r

-- Write a function that checks if the volume of a cylinder is greater than or equal to 42. Test that it works using GHCi.
checkVolume42 :: (Floating a, Ord a, Eq a) => a -> a -> Bool
checkVolume42 h r = 
    let vol = cylArea h r
    in vol >= 42.0
