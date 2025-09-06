import Distribution.Simple.Utils (xargs)
-- look at standard library functions at https://hackage.haskell.org/package/base/docs/Prelude.html

-- head function: returns the first element of a list: head [1,2,3,4] -- returns 1

-- tail function: returns the list without its first element: tail [1,2,3,4] -- returns [2,3,4]

-- select the nth element of a list (0-indexed): [1,2,3,4] !! 2 -- returns 3

-- select the first n elements of a list: take 3 [1,2,3,4] -- returns [1,2,3]

-- drop the first n elements of a list: drop 2 [1,2,3,4] -- returns [3,4]

-- length function: returns the length of a list: length [1,2,3,4] -- returns 4, length [] -- returns 0

-- sum function: returns the sum of a list of numbers: sum [1,2,3,4] -- returns 10, sum [] -- returns 0

-- product function: returns the product of a list of numbers: product [1,2,3,4] -- returns 24, product [] -- returns 1

-- append two lists: [1,2] ++ [3,4] -- returns [1,2,3,4], [] ++ [1,2] -- returns [1,2], [1,2] ++ [] -- returns [1,2]

-- reverse function: returns the reverse of a list: reverse [1,2,3,4] -- returns [4,3,2,1], reverse [] -- returns []

-- init function: returns the list without its last element: init [1,2,3,4] -- returns [1,2,3], init [1] -- returns [], init [] -- raises an error

--------------------
-- Function Application
--------------------
-- In Haskell, function application is done by placing the function name before its arguments, separated by spaces.
-- For example, to apply the function f to the argument x, you would write
-- f x
-- Function application has higher precedence than any infix operator, so f x + 1 is interpreted as (f x) + 1.
-- To change the order of evaluation, you can use parentheses, e.g., f (x + 1).

-- Mathematics vs Haskell
-- f(x)       | -> f x
-- f(x, y)    | -> f x y
-- f(g(x))    | -> f (g x) -- parentheses needed to indicate that g is applied to x first, else it would be interpreted as f takes two arguments: g (function) and x
-- f(x, g(y)) | -> f x (g y)
-- f(x)g(y)   | -> f x * g y

-- instead of writing f(f(f(x))) we can use the $ operator to reduce parentheses: f $ f $ f x
-- $ has the lowest precedence of all operators, so f $ g x + 1 is interpreted as f (g x + 1) not (f g x) + 1


-- Test if everything works:

double x = x + x

quadruple x = double $ double x

factorial n = product [1..n] -- [1..n] is a list from 1 to n

average ns = sum ns `div` length ns -- `div` is an infix operator for integer division

-------
-- GHCI Commands
-------

-- :load or :l <filename> -- load a Haskell file
-- :reload or :r -- reload the current file
-- :set editor name -- set the editor to name (e.g., vim, nano)
-- :edit or :e <filename> -- open the file in the editor
-- :edit or :e -- open the current file in the editor
-- :type or :t <expression> -- show the type of the expression
-- :info or :i <name> -- show information about the name (e.g.,
-- ? -- show help
-- :quit or :q -- quit GHCI

-------
-- Naming Requirments
-------

-- Function and argument names must start with a lowercase letter and can contain 
-- letters, numbers, underscores, and apostrophes (e.g., myFunction, x1, my_var, count').

-- Capitalized names are used for types and constructors (e.g., Maybe, Just, Nothing).

-- By convention, list arguments usually have an s suffix (e.g., xs, nums, chars).
-- two s, e.g. xss, for a list of lists.

-- layout rules: indentation is significant in Haskell. 
-- In a sequence of definitions, all definitions must be indented to the same level.


mylast :: [a] -> a
mylast [] = error "Empty list"
mylast [x] = x
mylast (x:xs) = mylast xs

mylast2 :: [a] -> a
mylast2 xs = head (reverse xs)

myinit :: [a] -> [a]
myinit [x] = []
myinit (x:xs) = [x] ++ myinit xs

myinit2 :: [a] -> [a]
myinit2 xs = reverse (drop 1 (reverse xs))

myinit3 :: [a] -> [a]
myinit3 xs = take (length xs - 1) xs