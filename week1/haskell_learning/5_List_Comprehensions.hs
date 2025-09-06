-- Math: Set Comprehensions
-- { x^2 | x <- [1..10]}
-- List Comprehensions in Haskell
-- [ x^2 | x <- [1..10]] -- returns [1,4,9,16,25,36,49,64,81,100]
-- The vertical bar | can be read as "such that"
-- The <- can be read as "drawn from"
-- So the above can be read as "the list of x squared such that x is drawn from the list of numbers 1 to 10"

-- x <- [1..10] is called a generator, it generates values for x from the list [1..10]
-- We can have multiple generators: [ (x,y) | x <- [1,2], y <- [3,4]] -- returns [(1,3),(1,4),(2,3),(2,4)]
-- This can be read as "the list of pairs (x,y) such that x is drawn from [1,2] and y is drawn from [3,4]"
-- The result is the Cartesian product of the two lists
-- Changing the order of generators changes the order of the result: 
-- [ (x,y) | y <- [3,4], x <- [1,2]] -- returns [(1,3),(2,3),(1,4),(2,4)]
-- We can also use predicates to filter the results: [ x | x <- [1..10], even x] -- returns [2,4,6,8,10]
-- This can be read as "the list of x such that x is drawn from [1..10] and x is even"
-- We can have multiple predicates: [ x | x <- [1..10], even x, x > 5] -- returns [6,8,10]
-- This can be read as "the list of x such that x is drawn from [1..10], x is even, and x is greater than 5"


-- Dependent Generators
-- We can have generators that depend on previous generators:
-- [ (x,y) | x <- [1,2,3], y <- [x..3]] -- returns [(1,1),(1,2),(1,3),(2,2),(2,3),(3,3)]
-- This can be read as "the list of pairs (x,y) such that x is drawn from [1,2,3] and y is drawn from [x..3]"
-- Here, the second generator y depends on the value of x from the first generator
-- We can also use predicates that depend on previous generators:
-- [ (x,y) | x <- [1,2,3], y <- [1..3], x + y > 3] -- returns [(2,2),(2,3),(3,1),(3,2),(3,3)]
-- This can be read as "the list of pairs (x,y) such that x is drawn from [1,2,3], y is drawn from [1..3], and x + y is greater than 3

-- Guards in List Comprehensions
-- We can use guards (predicates) in list comprehensions to filter results based on conditions
-- Example: [ x | x <- [1..10], even x] -- returns [2,4,6,8,10]
-- This can be read as "the list of x such that x is drawn from [1..10] and x is even"
-- We can have multiple guards: [ x | x <- [1..10], even x, x > 5] -- returns [6,8,10]
-- This can be read as "the list of x such that x is drawn from [1..10], x is even, and x is greater than 5"
-- Guards can also depend on previous generators: [ (x,y) | x <- [1,2,3], y <- [1..3], x + y > 3] -- returns [(2,2),(2,3),(3,1),(3,2),(3,3)]
-- This can be read as "the list of pairs (x,y) such that x is drawn from [1,2,3], y is drawn from [1..3], and x + y is greater than 3"

factors :: Int -> [Int]
factors n = [ x | x <- [1..n], n `mod` x == 0]
-- factors n returns the list of all factors of n

prime :: Int -> Bool
prime n = factors n == [1,n]
-- prime n returns True if n is prime, False otherwise

-- Because of lazy evaluation, this is efficient even for large n

primes :: Int -> [Int]
primes n = [ x | x <- [2..n], prime x]

-- zip function: takes two lists and combines them into a list of pairs
-- Example: zip [1,2,3] ['a','b','c'] -- returns [(1,'a'),(2,'b'),(3,'c')]
-- If the lists are of different lengths, the result is as long as the shorter list
-- Example: zip [1,2] ['a','b','c'] -- returns [(1,'a'),(2,'b')]

-- String Comprehensions
-- Strings are lists of characters in Haskell, so we can use list comprehensions on strings
-- Example: [ c | c <- "Hello, World!", c `elem` ['A'..'Z']] -- returns "HW"
-- This can be read as "the list of characters c such that c is drawn from the string "Hello, World!" and c is an uppercase letter"

count :: Char -> String -> Int
count x xs = length [x' | x' <- xs, x == x']

-- Exercise 1
pyths :: Int -> [(Int, Int, Int)]
pyths n = [ (x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]

-- Exercise 2
perfect :: Int -> Bool
perfect n = sum (init (factors n)) == n

perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], perfect x]

-- Exercise 3
sp :: [Int] -> [Int] -> Int
sp xs ys = sum [ x * y | (x, y) <- zip xs ys]
