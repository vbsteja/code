f x y = x*x+y*y
{-comments are enclosed in a curly bracesfollowed with hyphen-}
--this is single line comment for the factorial  program in the haskell language--
fact 0=1
fact n=n*fact(n-1)
--here i am restarting my programming in haskell.--
doubleMeifSmall x y = if x>100 then x else x*2
--program exexution will start at main function--
main =  print(fact 5)

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
--maximum' (x:xs)
--  |  x >  maxTail = x
--  |  otherwise = maxTail
--  where
--    maxTail = maximum' xs

maximum' (x:xs) = max x (maximum' xs)

--quick sort in haskell is one heck of beauty
quicksort :: (Ord z) => [z] -> [z]
quicksort [] = []
quicksort (x:xs) =
  let
    smallerSorted = quicksort [ a | a <- xs, a <= x ]
    biggersorted  = quicksort [ a | a <- xs, a > x ]
    in smallerSorted ++ [x] ++ biggersorted


mulThree :: (Num a) => a -> a -> a -> a
mulThree x y z = x * y * z

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

applyTwice :: (a->a) -> a -> a
applyTwice f x=f ( f x )

largestDivisible :: (Integral a) => a
largestDivisible = head (filter p [100000,99999..])
    where p x = x `mod` 3829 == 0

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
  | even n = n:chain (n `div` 2)
  | odd n  = n:chain (n*3 + 1)
