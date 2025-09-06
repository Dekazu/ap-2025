import Data.Time.Clock.TAI (taiClock)
-- Conditional Expressions
-- A conditional expression is an expression that evaluates to one of two values based on a condition
-- In Haskell, the if-then-else construct is used to define conditional expressions. Must have both then and else branches.
-- Syntax: if condition then expression1 else expression2
-- Example: if x > 0 then "Positive" else "Non-positive"
-- Can be nested: if x > 0 then "Positive" else if x == 0 then "Zero" else "Negative"

-- Guards
-- Guards are a way to define functions based on multiple conditions
-- Syntax:
-- functionName args
--     | condition1 = expression1
--     | condition2 = expression2
--     | otherwise  = expression3
-- Example:
absValue :: Int -> Int
absValue x
    | x < 0     = -x
    | x == 0    = 0
    | otherwise = x -- otherwise is equivalent to True, must be the last guard

-- Pattern Matching
-- Pattern matching is a way to define functions based on the structure of their arguments
-- Syntax:
-- functionName pattern1 = expression1
-- functionName pattern2 = expression2
-- Example:
factorialPM :: Int -> Int
factorialPM 0 = 1 -- base case
factorialPM n = n * factorialPM (n - 1) -- recursive case

-- List Patterns
-- Internally, every list is either the empty list [] or a constructor (:) that adds an element to the front of a list.
-- Example: [1,2,3] is syntactic sugar for 1 : (2 : (3 : []))
-- We can use list patterns to match against lists
sumList :: [Int] -> Int
sumList [] = 0 -- base case: the sum of an empty list is 0
sumList (x:xs) = x + sumList xs -- recursive case: the sum of a non-empty list is the head plus the sum of the tail
-- (x:xs) is a pattern that matches a non-empty list, where x is the head (first element) and xs is the tail (the rest of the list).
-- x:xs must be in parentheses to indicate that it is a single pattern

-- Lambda Expressions
-- A lambda expression is an anonymous function that can be used as a value
-- Syntax: \arg1 arg2 ... argN -> expression
-- Example: \x -> x + 1 is a function that takes an argument x and returns x + 1
-- Example: \x y -> x + y is a function that takes two arguments x and y and returns their sum
-- Lambda expressions can be used anywhere a function is expected
-- Example: map (\x -> x + 1) [1,2,3] -- returns [2,3,4]
-- Example: filter (\x -> x > 2) [1,2,3,4] -- returns [3,4]
-- Example: foldr (\x acc -> x + acc) 0 [1,2,3] -- returns 6

-- Why are they useful?
-- Lambda expressions can be used to give a formal meaning to function defined using currying
-- For example:
addLambda :: Int -> Int -> Int
addLambda x y = x + y
-- is equivalent to
addLambda' :: Int -> (Int -> Int)
addLambda' = \x -> (\y -> x + y)
-- Here, addLambda' is a function that takes an integer x and returns a function that takes an integer y and returns the sum of x and y

-- Lambdas can be used to avoid naming functions that are only used once
-- Example: instead of defining a function to add 1 to each element of a list,
-- we can use a lambda expression with map
incrementList :: [Int] -> [Int]
incrementList xs = map (\x -> x + 1) xs

-- Operator Sections
-- An operator section is a way to create a function by partially applying an infix operator
-- Syntax: (operator arg) or (arg operator)
-- Example: (+ 1) is a function that takes an argument x and returns x + 1
-- Example: (1 +) is a function that takes an argument x and returns 1 + x
-- Example: (2 *) is a function that takes an argument x and returns 2 * x
-- Example: (* 2) is a function that takes an argument x and returns x * 2
-- Example: (3 `div`) is a function that takes an argument x and returns 3 `div` x
-- Example: (`div` 3) is a function that takes an argument x and returns x `div` 3

-- Useful to construct functions in a point-free style
-- Example: instead of writing
-- add1 x = x + 1
-- we can write
add1 :: Int -> Int
add1 = (+ 1)
-- Here, add1 is a function that takes an integer and adds 1 to it


safetail :: [a] -> [a]
safetail [] = []
safetail xs = tail xs

safetail2 :: Eq a => [a] -> [a]
safetail2 xs = if null xs then [] else tail xs

safetail3 :: [a] -> [a]
safetail3 xs 
    | null xs = []
    | otherwise = tail xs