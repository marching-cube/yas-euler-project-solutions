-module(euler27). 
-export([run/0]). 

run() ->
	MaxPrime = 79*79 + 79*999 + 1000,
	Primes = lists:reverse(euler10:findPrimes(MaxPrime)),
	BList = [ P || P <- Primes, P > 41, P < 1000 ],

	lists:foldl(fun foldMax/2, {0, 0, 0},
		[ {A, B, longest(A, B, 0, Primes)} || B <- BList, A <- lists:seq(-2*trunc(math:sqrt(B)), 999) ] ).

foldMax({A, B, X}, {A0, B0, X0}) -> if X > X0 -> {A, B, X}; true -> {A0, B0, X0} end.

isPrime(_, []) -> error;
isPrime(X, [H|T]) when X > H -> isPrime(X, T);
isPrime(X, [X|_]) -> true;
isPrime(_, _) -> false.

longest(A, B, N, Primes) -> 
	case isPrime(N*N + A*N + B, Primes) of
		true -> 1 + longest(A, B, N+1, Primes);
		false -> 0
	end.
