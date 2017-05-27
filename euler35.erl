-module(euler35). 
-export([run/0]). 

run() ->
	List = common:loadPrimes(),
	Set = sets:from_list(List),
	length(find(List, Set, 1, 1)).

find([], _, _, _) -> [];
find([P|R], Set, S, K) when P > 10*S -> find([P|R], Set, S*10, K+1);
find([P|R], Set, S, K) -> 
	case isCircular(P, S, K, Set) of
		true -> [ P | find(R, Set, S, K) ];
		false -> find(R, Set, S, K)
	end.

isCircular(P, S, K, PrimesSet) ->
	All = lists:foldl(fun (_, R) -> [next(hd(R), S) | R] end, [P], lists:seq(2, K) ),
	lists:foldl(fun (N, R) -> R and sets:is_element(N, PrimesSet) end, true, All).

next(N, S) -> S * (N rem 10) + (N div 10).

% pown(10, 0) -> 1;
% pown(10, 1) -> 10;
% pown(10, 2) -> 100;
% pown(10, 3) -> 1000;
% pown(10, 4) -> 10000;
% pown(10, 5) -> 100000;
% pown(N, 0) -> 1;
% pown(N, K) -> N * pown(N, K-1).

