-module(ds).
-export([quicksort/1]).

quicksort([]) -> [];
quicksort([Pivot|L]) ->
           quicksort([X || X <- L,X<Pivot]) ++ [Pivot] ++ quicksort([X || X <- L,X>=Pivot]).
