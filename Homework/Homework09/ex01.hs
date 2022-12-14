{-

Practice for parametrised and recursive types 

-}
{-# LANGUAGE GADTs #-}

module Hw09_ex where 

data Box a = Empty | Has a  deriving (Show)

addN :: Num a => a ->  Box a -> Box a 
addN n Empty = Empty
addN n (Has m) = Has (m + n)

box1 = Has (1 :: Int)

addBoxes :: Num a => Box a -> Box a -> Box a 
addBoxes _ Empty         = Empty
addBoxes Empty _         = Empty
addBoxes (Has a) (Has b) = Has (a + b)

groupBoxes :: (a -> a -> a) -> Box a -> Box a -> Box a 
groupBoxes _ Empty _ = Empty
groupBoxes _ _ Empty = Empty
groupBoxes f (Has a) (Has b) = Has (f a b )

-- extract the value from the Box with a default value
extract :: a -> Box a -> a 
extract def Empty = def
extract _ (Has x) = x 

data Shape c = 
    Circle {
      position :: (Int, Int)
      , radius :: Float
      , color :: c
      }
    | Rectangle {
      position :: (Int, Int)
      , width :: Float
      , height :: Float
      , color :: c 
    } 

type RGB = (Int, Int, Int)

data RGB' = RGB' {
  red :: Int
  , green :: Int
  , blue :: Int 
}

calculateArea :: Shape RGB -> Float
calculateArea (Circle _ r _) = pi * r
calculateArea (Rectangle _ w h _) = w * h 

circleRGB' = Circle (0,0) 2 (RGB' 13 31 33)

-- Twitter interview 
data Tweet = Tweet {
  message :: String
  , likes :: Int
  , comments :: [Tweet] 
} deriving (Show)

-- instance Show Tweet where 
--   show t = message t <> " Likes: " <> show (likes t) <> " Comments..."

aTweet = Tweet "Hello World" 13 [
          Tweet "Hey there" 1 [],
          Tweet "Hi man" 3 [
            Tweet "Where did you disappear?" 2 [
              Tweet "Stil here" 2 [
                Tweet "So answer your messages" 0 [
                  Tweet "Doing it right now" 1 []
                ]
              ]
            ],
            Tweet "Finally" 5 [],
            Tweet "Hi" 2 [
              Tweet "Who are you? ........... Kidding" 3 [] 
            ]
          ]
        ]


engagement' :: Tweet -> Int 
engagement' t = likes t + allcomments(comments t) 
        where 
          allcomments :: [Tweet] -> Int 
          allcomments [] = 0
          allcomments (x:xs) = likes x + allcomments (xs ++ comments x)

printTweet :: Tweet -> [String]
printTweet t = message t : allmessages (comments t) 
            where
              allmessages :: [Tweet] -> [String]
              allmessages [] = []
              allmessages (x:xs) = message x : allmessages (comments x ++ xs)  -- Depth first 
              -- allmessages (x:xs) = message x : allmessages (xs ++ comments x)   -- Breadth First 

-- Data type that represents a linear sequence of nodes, where each node contains a value and point to the rest of the sequence

-- data Sequence a = EmptyS | Node a (Sequence a)

infixr 5 :-> 
data Sequence a where
  EmptyS :: Sequence a
  (:->) :: a -> (Sequence a) -> Sequence a
  deriving Show

emptyNode :: Sequence a
emptyNode = EmptyS

aNode :: Sequence Int 
-- aNode = Node 1 (Node 2 (Node 3 EmptyS))
aNode = 1 :-> 2 :-> 3 :-> EmptyS

aNode2 :: Sequence Int
aNode2 = 1 :-> 2 :-> EmptyS