-module(euler14). 
-export([run/0]). 

% TODO: memory

run() ->
	Max = 1000000,
	Partials = [ {N, search(N, 1)} || N <- lists:seq(1,Max) ],
	lists:foldl(fun(X, Acc) -> aggregate(X, Acc) end, {1, 1}, Partials).
	% listCollatz(X).

aggregate({N, L}, {Acc_N, Acc_L}) ->
	case Acc_L > L of
		true -> {Acc_N, Acc_L};
		false -> {N, L}
	end.

search(N, Length) when N =:= 1 -> Length;
search(N, Length) -> search(collatz(N), Length+1).

collatz(N) when N rem 2 =:= 0 -> N div 2;
collatz(N) -> 3*N + 1.

listCollatz(N) -> listCollatz([N], N).
listCollatz(L, N) when N =:= 1 -> L;
listCollatz(L, N) -> 
	A = collatz(N),
	listCollatz([A|L], A).



searchWithCache(N, Length, Cache) when N =:= 1 ->
	{ N, Length, orddict:append(N, Length, Cache) };
searchWithCache(N, Length, Cache) ->
	case orddict:find(N, Cache) of
		{ok, Value} -> { N, Value + Length, orddict:append(N, Value + Length, Cache) };
		_ -> search(collatz(N), Length+1)
	end.
	
% {837799,525}