-module(example).
-export([start/1]).
start(Name) ->
  io:format("Hello Mr.~s",[Name]),
  %io:format(Name),
  io:format("~n").
