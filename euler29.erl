-module(euler29). 
-export([run/0]). 

% Remark: smart/1 implementation does not computes only powers A^B <= 100 (brute/1 computes all <= 100^100)
% Remark: without caching of countBs results, results of countBs could be grouped for better performance

run() ->
	Max = 100,
	S = brute(Max),
	S = smart(Max),
	S.

brute(Max) ->
	All = [ common:pown(A, B) || A <- lists:seq(2, Max), B <- lists:seq(2, Max)],
	length(lists:usort(All)).

smart(Max) -> 
	Ks = findKs(Max),
	lists:sum(lists:map(fun(K) -> countBs(K, Max) end, Ks))
		+ (Max-1 - length(Ks)) * countBs(1, Max).

findKs(Max) -> 
	MaxA = trunc(math:sqrt(Max)),
	MaxK = trunc(math:log2(Max)),
	Ks = [ {common:pown(A, K), K} || 
				K <- lists:seq(2, MaxK), 
		        A <- lists:seq(2, MaxA), 
				common:pown(A, K) =< Max ],
				Ks,
	lists:map(fun common:snd/1, dedup(lists:usort(Ks))).

dedup([]) -> [];
dedup([X]) -> [X];
dedup([{X1,K1}|[{X2,K2}|T]]) when X1 =/= X2 -> [{X1,K1} | dedup([{X2,K2}|T]) ];
dedup([{X1,K1}|[{_,K2}|T]]) -> dedup([{X1, max(K1, K2)}|T]).

countBs(1, Max) -> Max - 1;
countBs(K, Max) -> length([ B || B <- lists:seq(2, Max), isUniqueB(B, K, Max) ]).

isUniqueB(_, 1, _) -> true;
isUniqueB(B, K, Max) -> isUniqueB(B, K, K-1, Max).
isUniqueB(B, K, 1, Max) -> K*B > Max;
isUniqueB(B, K, D, Max) ->
	(((K * B) rem D =/= 0) or ((K*B) div D > Max)) and isUniqueB(B, K, D-1, Max).