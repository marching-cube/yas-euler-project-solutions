-module(euler29). 
-export([run/0]). 

run() -> brute(10).

brute(Max) -> 
	Numbers = [ pown(A, B) || A <- lists:seq(2, Max), B <- lists:seq(2, Max) ],
	_ = length(lists:usort(Numbers)),

	SmallPrimes = [2, 3, 5, 7],



	P1 = [ {A, B, P} || A <- lists:seq(2, Max), P <- SmallPrimes, P =< trunc(math:log10(Max) / math:log10(A)), B <- lists:seq(2, Max), B rem P =:= 0, B div P > 1 ],
	P2 = [ pown(A, B) || {A, B, _} <- P1],

	% {length(P1), length(Numbers) - length(lists:usort(Numbers)) },
	{P2, dups(Numbers, lists:usort(Numbers))}.

% isDP(B, []) -> false;
% isDP(B, [H|T]) when B rem H =:= 0 -> true;
% isDP(B, [H|T]) -> isDP(B, T).

pown(_, 0) -> 1;
pown(X, N) when N rem 2 =:= 0 -> R = pown(X, N div 2), R * R;
pown(X, N) -> X * pown(X, N-1).


% DEBUG ONLY

% firstDiff([], _) -> error;
% firstDiff(_, []) -> error;
% firstDiff([H1|_], [H2|_]) when H1 =/= H2 -> {H1, H2};
% firstDiff([H1|T1], [H2|T2]) -> firstDiff(T1, T2).

dups(L, []) -> L;
dups(L, [H|T]) -> dups(lists:delete(H, L), T).

% count(X, []) -> 0;
% count(X, [H|T]) when X =:= H -> 1 + count(X, T);
% count(X, [H|T]) -> count(X, T).



