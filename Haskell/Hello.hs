f x y = x*x+y*y
{-comments are enclosed in a curly bracesfollowed with hyphen-}
--this is single line comment for the factorial  program in the haskell language--
fact 0=1
fact n=n*fact(n-1)

x::Int
--program exexution will start at main function--
main =  print(fact 5)
