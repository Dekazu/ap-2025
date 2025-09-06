-- What is Functional Programming?
-- Functional programming is a programming paradigm that treats 
-- computation as the evaluation of mathematical functions and avoids changing-state and mutable data.

-- Where does it come from?
-- Functional programming has its roots in lambda calculus, a formal system in mathematical logic and computer science
-- for expressing computation based on function abstraction and application.

-- Worked Example

-- QuickSort algorithm in Haskell
f :: Ord a => [a] -> [a] -- Ord: The type variable 'a' must be an instance of the Ord type class which is used for types that have an ordering.
f [] = [] -- Base case: the reverse of an empty list is an empty list
f (x:xs) = f ys ++ [x] ++ f zs
    where ys = [a | a <- xs, a <= x] -- eq to {a | a in xs, a <= x}, thus ys is the list of elements in xs that are less than or equal to x
          zs = [b | b <- xs, b > x]

-- [] is the empty list
-- (x:xs) is a pattern that matches a non-empty list, where x is the head (first element) and xs is the tail (the rest of the list).
-- ++ is the list concatenation operator.
-- The where clause defines two lists, ys and zs, using list comprehensions.

-- It works for numbers, characters, strings, Bools (everything that can be ordered defined by Ord a)
