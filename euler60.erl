% Prime pair sets

-module(euler60).
-export([run/0]).

run() -> 
	PList = common:loadPrimes(),
	MaxGuess = 27000,
	LA = lists:takewhile(fun(P) -> P < MaxGuess end, PList),
	L0 = [3, 5, 7, 11, 13],
	S = [ [A, B, C, D, E] || 
		A <- L0, LB <- [match(PList, LA, A, (MaxGuess-A), 3)], 
		B <- LB, LC <- [match(PList, LB, B, (MaxGuess-A-B), 2)],
		C <- LC, LD <- [match(PList, LC, C, (MaxGuess-A-B-C), 1)],
		D <- LD, LE <- [match(PList, LD, D, (MaxGuess-A-B-C-D), 0)],
		E <- LE ],
	26033 = lists:sum(hd(S)).

match(Primes, List, T, Max, _) -> [ P || P <- List, T < P, P =< Max, isPrime(Primes, combine(T, P)), isPrime(Primes, combine(P, T))].

combine(A, B) -> combine(A, B, B).
combine(A, B, 0) -> A + B;
combine(A, B, S) -> combine(10 * A, B, S div 10).

isPrime([P|_], N) when P * P > N -> true;
isPrime([P|_], N) when N rem P =:= 0 -> false;
isPrime([_|T], N) -> isPrime(T, N).