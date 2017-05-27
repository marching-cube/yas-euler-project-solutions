% Distinct primes factors

-module(euler47).
-export([run/0]).

run() -> 
	MaxPrime = 10000,
	Primes = lists:reverse(euler10:findPrimes(MaxPrime)),
	find(1, 0, Primes).

find(N, 4, _) -> N-4;
find(N, R, Primes) -> 
	case countFactors(N, Primes) of 
		4 -> find(N+1, R+1, Primes);
		_ -> find(N+1, 0, Primes)
	end.

countFactors(N, [P | _]) when N < P*P -> 1;
countFactors(N, [P | T]) when N rem P =:= 0 -> 
	1 + countFactors(removeFactor(N, P), T);
countFactors(N, [_ | T])  ->  countFactors(N, T).

removeFactor(N, P) when N rem P =:= 0 -> N div P;
removeFactor(N, _) -> N.
	
