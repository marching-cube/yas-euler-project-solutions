-module(euler22). 
-export([run/0]). 

run() ->
    {ok, Data} = file:read_file("p022_names.txt"),
    List = binary:split(Data, [<<",">>], [global]),
	Sorted = lists:sort(List),
	lists:sum(lists:zipwith(fun(X, Y) -> X * score(Y) end, lists:seq(1, length(Sorted)), Sorted)).

score(L) -> lists:sum([ X - 64 || <<X>> <= L, X =/= 34 ]).
