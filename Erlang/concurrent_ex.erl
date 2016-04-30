-module(concurrent_ex).
-export([loop/0]).

loop() ->
		receive 
		{rectangle,Width,Height} ->
			io:format("area is ~p~n",[Width * Height]),
			loop();
		{traingle,Len} ->
			io:format("area is ~p ~n",[Len * Len]),
			loop();
		{circle,Radius} ->
			io:format("area of circle is ~p ~n ",[Radius * Radius]),
			loop()
		%Other ->
		%	io:format("i dont know the area... please gimme proper args."),
		%	loop()
		after 10->
			true
end.
