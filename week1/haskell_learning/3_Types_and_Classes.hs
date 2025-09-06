-- What is a Type?
-- A type is a name for a collection of related values. For example, in Haskel the basic types are:
-- Int: fixed-precision integer, e.g., -3, 0, 42
-- Integer: arbitrary-precision integer, e.g., -3, 0, 42
-- Float: single-precision floating point, e.g., 3.14, -0.001, 2.0e8
-- Double: double-precision floating point, e.g., 3.14, -0.001, 2.0e8
-- Char: a single Unicode character, e.g., 'a', 'Z', '0', '#'
-- Bool: boolean value, either True or False

-- Type Errors
-- Haskell is a statically typed language, which means that types are checked at compile time
-- A type error occurs when an operation is applied to a value of an incompatible type
-- For example, trying to add an Int and a Char will result in a type error
-- Example: 3 + 'a' -- This will raise a type error because (+) expects two numbers, but 'a' is a Char

-- If evaluating an expression e would produce a value of type t, then e has type t, written e :: t

-- Every well formed expression in Haskell has a type, using a process called type inference
-- BUT it is always a good idea to provide type annotations for top-level functions
-- Type annotations are written using the :: operator, e.g., f :: Int -> Int

-- We can use :type or :t in GHCI to check the type of an expression
-- Example: :type 3 -- returns 3 :: Num p => p, meaning 3 can be any type that is an instance of the Num type class (e.g., Int, Integer, Float, Double)

-- Basic Types
-- Int: fixed-precision integer, e.g., -3, 0, 42
-- Bool: boolean value, either True or False
-- Char: a single Unicode character, e.g., 'a', 'Z', '0
-- String: a list of characters, e.g., "Hello, World!"
-- Float: single-precision floating point, e.g., 3.14, -0.001, 2.0e8
-- Double: double-precision floating point, e.g., 3.14, -0.001, 2.0e8

-- List Types
-- A list is a collection of values of the same type, written using square brackets and commas
-- Example: [1, 2, 3] is a list of Ints
-- The type of a list of elements of type t is written [t]
-- Example: [1, 2, 3] :: [Int], ["Hello", "World"] :: [String], ['a', 'b', 'c'] :: [Char]
-- [] is the empty list, which can be of any type: [] :: [Int], [] :: [String], etc.
-- [[1, 2], [3, 4]] is a list of lists of Ints: [[1, 2], [3, 4]] :: [[Int]]

-- Tuples
-- A tuple is a fixed-size collection of values of potentially different types, written using parentheses and commas
-- Example: (1, "Hello", True) is a tuple of an Int, a String, and a Bool
-- The type of a tuple with elements of types t1, t2, ..., tn is written (t1, t2, ..., tn)
-- Example: (1, "Hello", True) :: (Int, String, Bool)

-- Function Types
-- A function type is written using the -> operator
-- Example: Int -> Int is the type of a function that takes an Int and returns an Int
-- Example: (Int, Int) -> Int is the type of a function that takes a tuple of two Ints and returns an Int
-- Example: Int -> Int -> Int is the type of a function that takes an Int and returns a function that takes an Int and returns an Int (curried function)
-- Note: Int -> Int -> Int is equivalent to Int -> (Int -> Int)

add :: Int -> Int -> Int -- add takes two Ints and returns an Int
add x y = x + y

-- Curried Functions
-- In Haskell, all functions are curried, meaning they take one argument and return a function that takes the next argument
-- Example: a function f of type Int -> Int -> Int can be applied as follows:
-- f 3 4 is equivalent to (f 3) 4
-- f 3 returns a function of type Int -> Int, which is then applied to 4

add' :: Int -> (Int -> Int) -- add' takes an Int and returns a function that takes an Int and returns an Int
add' x y = x + y

-- Curried functions are useful for partial application,
-- where we can apply a function to some of its arguments and get a new function that takes the remaining arguments

mult :: Int -> (Int -> (Int -> Int))
mult x y z = x * y * z

-- mult takes an integer x and returns a function mult x, which in turn takes an integer y and returns
-- a function mult x y, which in turn takes an integer z and returns the product of x, y, and z

-- Why is this useful?
-- We can create new functions by partially applying existing functions. They are often more flexible and reusable.

-- add 1 is a function that takes an Int and adds 1 to it: add 1 :: Int -> Int
-- take 5 :: [Int] -> [Int] -- take 5 is a function that takes a list and returns the first 5 elements
-- drop 5 :: [Int] -> [Int] -- drop 5 is a function that takes a list and drops the first 5 elements

-- Currying Conventions
-- To avoid excessive parentheses, the -> operator is right associative
-- a -> b -> c is interpreted as a -> (b -> c)
-- Function application is left associative
-- f x y is interpreted as (f x) y


-- Polymorphic Functions
-- A polymorphic function is a function that can operate on values of different types
-- Example: the identity function id, which returns its argument unchanged
id :: a -> a -- id takes a value of any type a and returns a value of the same type a
id x = x

-- The type variable a can represent any type, so id can be applied to values of any type
-- Example: id 3 returns 3 (a = Int), id "Hello" returns "Hello" (a = String), id True returns True (a = Bool)
-- Type variables must start with a lowercase letter, e.g., a, b, c, m, n, etc.
-- Type variables can be used in type annotations to indicate that a function is polymorphic
-- Example: length :: [a] -> Int is a polymorphic function that takes a list of any type a and returns an Int
-- Example: fst :: (a, b) -> a is a polymorphic function that takes a tuple of any types a and b and returns a value of type a

-- Overloaded Functions
-- An overloaded function is a function that can operate on values of different types, but with some restrictions
-- Example: the equality operator (==), which can be used to compare values of different types, but only if those types are instances of the Eq type class
-- Example: (==) :: Eq a => a -> a -> Bool is an overloaded function that takes two values of the same type a (which must be an instance of the Eq type class) and returns a Bool
-- Example: (+) :: Num a => a -> a -> a is an overloaded function that takes two values of the same type a (which must be an instance of the Num type class) and returns a value of type a

-- Num - Numeric types
-- Eq - Equality types
-- Ord - Ordered types
-- Show - Types that can be converted to strings

-- When defining a new function, it is useful to begin by writing fown its type;
-- Within a script, it is good practise to state the type of every new function defined;
-- When starting the types of polymorphic functions that use numbers, equality or orderings,
-- take care to include the necessary class constraints. Worst case you can use :t in GHCI to find out what they are.
