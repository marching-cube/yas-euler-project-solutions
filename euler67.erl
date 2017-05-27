-module(euler67). 
-export([run/0]). 

run() ->
    {ok, Data} = file:read_file("p067_triangle.txt"),
	Input = [ [ binary_to_integer(X) || X <- binary:split(Line, [<<" ">>], [global]) ] || Line <- binary:split(Data, [<<"\n">>], [global]), Line =/= <<>> ],
	R = lists:foldl(fun(L, Acc) -> 
			lists:zipwith3(fun(A, B, C) -> A + max(B, C) end, L, [0 | Acc], Acc ++ [0] )
		end, [], Input),
	lists:foldl(fun(N, Acc) -> max(N, Acc) end, 0, R).

