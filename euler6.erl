-module(euler6). 
-export([run/0]). 

run() ->
	N = 100,
	lists:sum([ X * Y || X <- lists:seq(1,N), Y <- lists:seq(1,N), X =/= Y ]).

