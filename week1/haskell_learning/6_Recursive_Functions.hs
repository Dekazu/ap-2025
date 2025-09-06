-- As we have seen, functions can call other functions. But they can also call themselves. 
-- This is called recursion, and it is a powerful technique that allows us to solve problems 
-- by breaking them down into smaller subproblems.

-- Factorial function using recursion
factorial :: Int -> Int
factorial 0 = 1 -- base case: the factorial of 0 is 1
factorial n = n * factorial (n - 1) -- recursive case: n! = n * (n-1)!

-- The base case is essential to prevent infinite recursion.

myproduct :: Num a => [a] -> a
myproduct [] = 1 -- base case: the product of an empty list is 1
myproduct (x:xs) = x * myproduct xs -- recursive case: the product of a non-empty list is the head times the product of the tail
-- Here, we use pattern matching to distinguish between the empty list and a non-empty list.

-- quicksort:
-- Rule 1: Empty list is already sorted
-- Rule 2: For a non-empty list, can be sorted by sorting the tail values <= the head
-- and sorting the tail values > the head, then concatenating the results
qsort :: Ord a => [a] -> [a]
qsort [] = [] -- base case: the empty list is already sorted
qsort (x:xs) = qsort [y | y <- xs, y <= x] ++ [x] ++ qsort [y | y <- xs, y > x]
-- Here, we use list comprehensions to partition the tail into two lists:
-- one with elements less than or equal to the head, and one with elements greater than the head.