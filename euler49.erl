% Prime permutations

-module(euler49).
-export([run/0]).

run() -> 
	Primes = [P || P <- common:loadPrimes(), 1000 < P, P < 9999],
	[{1487, _, _}, {A, B, C}] = lists:flatten(lists:map(fun solutions/1, groupBy(fun token/1, Primes))),
	(A * 10000 + B) * 10000 + C.

groupBy(Tokenizer, L) -> 
	groupByFst(lists:sort([{Tokenizer(P), P} || P <- L])).

groupByFst([]) -> [];
groupByFst(List) -> 
	{T, _} = hd(List),
	{L1, Rest} = lists:splitwith(fun({N, _}) -> T =:= N end, List),
	Group = lists:map(fun common:snd/1, L1),
	if length(Group) < 3 -> groupByFst(Rest);
		true -> [Group | groupByFst(Rest)]
	end.

token(N) -> 
	{L, _} = lists:foldl(fun(_, {R, K}) -> {[((N div K) rem 10)|R], 10*K} end, {[], 1}, [1,2,3,4]),
	lists:foldl(fun(A, R) -> 10*R+A end, 0, lists:sort(L)).

solutions(Group) ->
	[ {A, B, C} || A <- Group, B <- Group, A < B, C <- Group, B < C, A + C =:= 2*B].