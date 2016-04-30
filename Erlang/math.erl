-module(function_ex).
-export([factorial/1,area/1,double/1,times/1]).

factorial(0) -> 1;
factorial(N) -> N * factorial(N-1).

area({square,side}) ->square*side.
