-module(euler21). 
-export([run/0]). 
-import(euler10, [findPrimes/1]).
-import(euler23, [sumOfDivisors/2]).

run() ->
	Limit = 10000,
	Primes = lists:reverse(findPrimes(Limit)),
	lists:sum([X || X <- lists:seq(2, Limit), check(X, Primes)]).

check(N, Primes) -> 
	Sum1 = sumOfDivisors(N, Primes) - N,
	Sum2 = sumOfDivisors(Sum1, Primes) - Sum1,
	(N =:= Sum2) and (N =/= Sum1).

% Remark: it is possible to store check/2's intermediary results, for 2x speed improvement
