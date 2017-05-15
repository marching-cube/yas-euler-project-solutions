-module(euler22). 
-export([run/0]). 

run() ->
	List = readList("p022_names.txt"),
	Sorted = lists:sort(List),
	lists:sum(lists:zipwith(fun(X, Y) -> X * score(Y) end, lists:seq(1, length(Sorted)), Sorted)).

score(List) -> lists:sum([letterScore(X) || X <- binary_to_list(List)]).
letterScore($") -> 0;
letterScore(X) -> X - $A + 1.

readList(FileName) ->
    {ok, Data} = file:read_file(FileName),
    binary:split(Data, [<<",">>], [global]).
