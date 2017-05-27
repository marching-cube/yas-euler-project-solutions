% Goldbach's other conjecture

-module(euler46).
-export([run/0]).

run() -> 
	Max = 10000,
	Primes = sets:from_list(euler10:findPrimes(Max)),
	Components = [ 2*X*X || X <- lists:seq(1, trunc(math:sqrt(Max/2)))],
	find(3, Primes, Components, Max).

find(N, Primes, Components, Max) when N < Max -> 
	case (not sets:is_element(N, Primes)) and (isCounterExample(N, Components, Primes)) of
		true -> N;
		false -> find(N+2, Primes, Components, Max)
	end.

isCounterExample(N, Components, Primes) -> 
	not lists:any(fun(C) -> (N - C > 0) and sets:is_element(N - C, Primes) end, Components).
