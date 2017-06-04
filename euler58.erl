% Spiral primes

-module(euler58).
-export([run/0]).

run() ->
	Primes = common:loadPrimes(),
	26241 =:= solve(Primes, 1, 3).

solve(_, N, C) when (C / (1 + 4 * N)) < 0.1 -> 2* N + 1;
solve(Primes, N, C) -> solve(Primes, N+1, C + count(Primes, N+1)).

count(Primes, N) ->
	L = (2*N+1), length([ 1 || K <- [1, 2, 3], isPrime(Primes, L * L - 2 * K * N) ]).

isPrime([P|_], N) when P * P > N -> true;
isPrime([P|_], N) when N rem P =:= 0 -> false;
isPrime([_|T], N) -> isPrime(T, N).