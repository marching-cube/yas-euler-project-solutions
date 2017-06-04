% Prime digit replacements

-module(euler51).
-export([run/0]).

% due to casting out threes 
% -> last digit cannot be part of the pattern
% -> pattern's length must be multiple of 3

run() -> 
	Dgts = 6,
	Primes = lists:dropwhile(fun (N) -> N < 100000 end, common:loadPrimes()),
	Ts = transforms(Dgts),
	L = lists:sort([ {I, R, N} || F <- Ts, P <- Primes, {I, L, R, N} <- [F(P)], same3Digits(L) =:= true]),
	121313 = findLargeGroup(L).

transforms(Dgts) -> 
	Pl = [ [common:pow10(C), common:pow10(B), common:pow10(A)] || A <- lists:seq(1, Dgts-3), B <- lists:seq(0, Dgts-2), A < B, C <- lists:seq(0, Dgts-1), B < C],
	Pr = [ lists:subtract([ common:pow10(D) || D <- lists:seq(Dgts-1, 0, -1)], L) || L <- Pl ],
	lists:zipwith3(fun(L, R, I) -> fun(N) -> { I, subint(N, L), subint(N, R), N} end end, Pl, Pr, lists:seq(1, length(Pl))).

findLargeGroup([]) -> [];
findLargeGroup(List) ->
	{I, L, N} = hd(List),
	{H, T} = lists:splitwith(fun({It, Lt, _}) -> (It =:= I) and (Lt =:= L) end, List),
	if length(H) > 7 -> N;
		true -> findLargeGroup(T)
	end.

same3Digits(A) -> ((A rem 10) =:= ((A div 10) rem 10)) and (((A div 10) rem 10) =:= ((A div 100) rem 10)).

subint(N, L) -> lists:foldl(fun(M, R) -> R * 10 + (N div M) rem 10 end, 0, L).
