import Distribution.Simple.Utils (xargs, shortRelativePath)
-- Exercise 1:
-- Deecide if all logical values in a list are True
and' :: [Bool] -> Bool
and' [] = True
and' (x:xs) = x && and' xs


-- Concatenate a list of lists
concat' :: [[a]] -> [a]
concat' [] = []
concat' (xs:yss) = xs ++ concat' yss 

-- produce a list with n identical elements
replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' n c = replicate' (n-1) c ++ [c]

-- Select the nth Element of a list
nth :: [a] -> Int -> a
nth (x:_) 0 = x
nth (x:xs) n = nth xs (n-1)

-- Decide if a value is an element of a list
elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' v (x:xs) = v == x || elem' v xs 

-- Exercise 2: merge two sorted lists of values to give a single sorted list
merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) = if x < y then [x] ++ merge xs (y:ys) else [y] ++ merge (x:xs) ys

-- Exercise 3: merge sort
msort :: Ord a => [a] -> [a]
msort [] = [] -- base case: empty list is already sorted
msort (x:[]) = [x] -- base case: single element list is already sorted
msort [x,y] = if x < y then [x,y] else [y,x] -- base case: two element list can be sorted directly
msort xs = merge (msort fh) (msort sh) -- recursive case: split the list in half, sort each half, then merge the results
    where 
        n = length xs `div` 2 -- find the midpoint of the list
        fh = take n xs -- first half is the first n elements
        sh = drop n xs -- second half is the rest of the list