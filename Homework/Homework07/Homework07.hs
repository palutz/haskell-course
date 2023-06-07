-- Question 1
-- Investigate the `Bounded` type class. What behaviours it provides?
--  minBound :: a
--  maxBound :: a


-- Question 2
-- The types Int and Word bellong to the same type classes. What is the difference
-- between them? Check maybe the maxBound and minBound parameter for both types.
--   maxBound :: Int
--   9223372036854775807
--   maxBound :: Word
--   18446744073709551615
--   minBound :: Int
--   -9223372036854775808
--   minBound :: Word
--   0 

-- Question 3
-- Investigate the `Enum` type class. What behaviours provides?
--   succ :: a -> a
--   pred :: a -> a
--   toEnum :: Int -> a
--   fromEnum :: a -> Int
--   enumFrom :: a -> [a]
--   enumFromThen :: a -> a -> [a]
--   enumFromTo :: a -> a -> [a]
--   enumFromThenTo :: a -> a -> a -> [a]
--   {-# MINIMAL toEnum, fromEnum #-}


-- Question 4
-- Add the most general type signatures possible to the functions below.
-- Then uncomment the functions and try to compile.
f1 :: (Show a, Fractional a) => a -> a -> [Char] -> [Char]
f1 x y z = show (x / y) ++ z

<<<<<<< HEAD
f2 :: (Bounded a, Enum a, Eq a) => a -> a
f2 x = if x == maxBound then minBound else succ x

f2' :: (Bounded a, Enum a, Eq a) => a -> a
f2' x = if x == maxBound then minBound else succ x
=======
--f1 x y z = show (x / y) ++ z

--f2 x = if x == maxBound then minBound else succ x

>>>>>>> a665d15e1d810766953c5450f94225a26af61723

-- Question 5
-- Investigate the numeric type classes to figure out which behaviors they provide to change between numeric types.
--  Fractional 
--      fromRational :: Rational -> a
--  Real 
--      toRational :: a -> Rational
--  Integer
--      fromInteger :: Integer -> a
--  Integral
--      toInteger :: a -> Integer