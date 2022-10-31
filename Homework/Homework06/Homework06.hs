-- Question 1
-- Write a function called `repeat'` that takes a value and creates an infinite list with
-- the value provided as every element of the list.
-- >>> repeat 17
--[17,17,17,17,17,17,17,17,17...
repeat' :: a -> [a]
repeat' x = x : repeat' x 

-- Question 2
-- Using the `repeat'` function and the `take` function we defined in the lesson (comes with Haskell),
-- create a function called `replicate'` that takes a number `n` and a value `x` and creates a list
-- of length `n` with `x` as the value of every element. (`n` has to be Integer.)
--

replicateN :: Int -> a -> [a]
replicateN n = take n . repeat'
-- >>> replicate 0 True
r0=  replicateN 0 True
-- []
-- >>> replicate (-1) True
rm1 = replicateN (-1) True
-- []
-- >>> replicate 4 True
-- [True,True,True,True]
r4 = replicateN 4 True


-- Question 3
-- Write a function called `concat'` that concatenates a list of lists.
--
-- >>> concat' [[1,2],[3],[4,5,6]]
-- [1,2,3,4,5,6]
concat' :: [[a]] -> [a]
concat' = foldr(\x acc -> x ++ acc) [] 

concat2' :: [[a]] -> [a]
concat2' = foldr(++) [] 


-- Question 4
-- Write a function called `zip'` that takes two lists and returns a list of
-- corresponding pairs (zips them) like this:
--
-- >>> zip' [1, 2] ['a', 'b']
-- [(1,'a'),(2,'b')]
--
-- If one input list is shorter than the other, excess elements of the longer
-- list are discarded, even if one of the lists is infinite:
-- >>> zip' [1] ['a', 'b']
-- [(1,'a')]
-- >>> zip' [1, 2] ['a']
-- [(1,'a')]
-- >>> zip' [] [1..]
-- []
-- >>> zip' [1..] []
-- []
zip' :: [a] -> [b] -> [(a,b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys


-- Question 5
-- Create a function called `zipWith'` that generalises `zip'` by zipping with a
-- function given as the first argument, instead of a tupling function.
--
-- > zipWith' (,) xs ys == zip' xs ys
-- > zipWith' f [x1,x2,x3..] [y1,y2,y3..] == [f x1 y1, f x2 y2, f x3 y3..]
--
-- For example, `zipWith' (+)` is applied to two lists to produce the list of
-- corresponding sums:
--
-- >>> zipWith (+) [1, 2, 3] [4, 5, 6]
-- [5,7,9]
zipWith' :: (a->b->c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys


-- Question 6
-- Write a function called `takeWhile'` that takes a precate and a list and
-- returns the list up until an element that doesn't satisfy the predicate.
--
-- >>> takeWhile (< 3) [1,2,3,4,1,2,3,4]
-- [1,2]
-- >>> takeWhile (< 9) [1,2,3]
-- [1,2,3]
-- >>> takeWhile (< 0) [1,2,3]
-- []
takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ [] = []
takeWhile' f (x:xs) 
            | f x = x : takeWhile' f xs 
            | otherwise = takeWhile' f xs

-- Question 7 (More difficult)
-- Write a function that takes in an integer n, calculates the factorial n! and
-- returns a string in the form of 1*2* ... *n = n! where n! is the actual result.
factorialStr :: Int -> String
factorialStr n = strOps ++ " = " ++ show resOps
                where 
                  -- if n>1 add 1 will complete the string (1*2*3..) otherwise just put n as a string
                  strOps = if n > 1 then '1':fst ops else show n
                  resOps = snd ops 
                  ops :: ([Char], Int)
                  ops = foldr (\x (str,res) -> ("*" ++ show x ++ str, res * x)) ("", 1) [2..n] -- using foldr the string will be already in the right order with "*2*3..."

-- Question 8
-- Below you have defined some beer prices in bevogBeerPrices and your order list in
-- orderList + the deliveryCost. Write a function that takes in an order and calculates
-- the cost including delivery. Assume that the two lists have the beers in the same order.

bevogBeerPrices :: [(String, Double)]
bevogBeerPrices =
  [ ("Tak", 6.00),
    ("Kramah", 7.00),
    ("Ond", 8.50),
    ("Baja", 7.50)
  ]

orderList :: [(String, Double)]
orderList =
  [ ("Tak", 5),
    ("Kramah", 4),
    ("Ond", 7)
  ]

deliveryCost :: Double
deliveryCost = 8.50

orderCost :: [(String, Double)] -> Double -> [(String, Double)] -> Double
orderCost order delivCost priceList = 
  delivCost + foldr ((+) . getItemCost getPrice) 0.0 order 
-- delivCost + foldr (+) 0.0 (map (\(name, num) -> num * getPrice name) order)  -- version with map
      where
        getItemCost :: (String -> Double) -> (String, Double) -> Double -- version with HOF defs
        getItemCost f (name,num) = f name * num
        getPrice :: String -> Double
        getPrice item = snd $ foldr (\(s, c) acc -> if s == item then (s, c) else acc) ("", 0.0) priceList -- filter but with a default value even if the value is not present