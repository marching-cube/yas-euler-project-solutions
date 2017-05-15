-module(euler12). 
-export([run/0]). 

% Useful facts: 
% 	triangle(n) = n * (n + 1) / 2
%   gcd(n, n+1) = 1
%	sum_of_divisors(p1^k1*p2^k2...) = (1+k1)*(1+k2)*...

run() ->
	Target = 500,
	MaxPrime = 100,
	Primes = lists:filter(fun(X) -> not lists:any(fun(Y) -> X rem Y =:= 0 end, lists:seq(2, X - 1)) end, lists:seq(2, MaxPrime)),
	find(Primes, Target).

find(Primes, Target) -> find(Primes, Target, 2, 2).
find(Primes, Target, X, PrevSum) ->
	Sum = case X rem 2 of
		0 -> sumOfDivisors(X + 1, Primes);
		1 -> sumOfDivisors((X + 1) div 2, Primes)
	end,
	if PrevSum * Sum > Target -> (X * (X+1) ) div 2;
		true -> find(Primes, Target, X+1, Sum)
	end.

order(N, P) when N rem P =:= 0 -> 1 + order(N div P, P);
order(_, _) -> 0.

sumOfDivisors(N, Primes) ->
	Components = lists:filter(fun(X) -> N rem X =:= 0 end, Primes),
	Orders = lists:map(fun(P) -> order(N, P) end, Components),
	lists:foldl(fun(Cnt, Acc) -> (1+Cnt) * Acc end, 1, Orders).

