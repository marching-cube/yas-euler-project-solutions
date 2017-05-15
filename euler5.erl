-module(euler5). 
-export([run1/0, run2/0]). 

run2() -> 
	lists:foldl(fun(X, Acc) -> Acc * (X div gcd(X, Acc)) end, 1, lists:seq(2, 20)).

gcd(A, 0) -> A;
gcd(A, B) -> gcd(B, A rem B).



run1() ->
	Factors = lists:foldl(fun(X, Acc) -> mergeFactorLists(decompose(X), Acc) end, [], lists:seq(2, 20)),
	multiplyFactors(Factors).

multiplyFactors(L) -> multiplyFactors(L, 1).
multiplyFactors([], Acc) -> Acc;
multiplyFactors([{_, 0} | T], Acc) -> multiplyFactors(T, Acc);
multiplyFactors([{K, C} | T], Acc) -> multiplyFactors([{K, C-1} | T], K * Acc).

decompose(N) -> decompose(N, 2).
decompose(N, K) when N < K*K -> addFactor([], N);
decompose(N, K) when N rem K =:= 0 -> addFactor(decompose(N div K, K), K);
decompose(N, K) -> decompose(N, K+1).

addFactor([], K) -> [{K, 1}];
addFactor([{K, Count} | T], K) -> [{K, Count + 1} | T];
addFactor(T, K) -> [{K, 1} | T].

addOrMaxFactor([], {K, Count}) -> [{K, Count}];
addOrMaxFactor([{K, C} | T] , {K, Count}) -> [{K, max(C, Count)} | T];
addOrMaxFactor([A | T] , {K, Count}) -> [ A | addOrMaxFactor(T, {K, Count})].

mergeFactorLists([], L) -> L;
mergeFactorLists(L, []) -> L;
mergeFactorLists([{K, Count} | T], L) ->
	mergeFactorLists(T, addOrMaxFactor(L, {K, Count})).


