% Convergents of e

-module(euler65).
-export([run/0]).

run() -> 
	L = lists:reverse([2 | lists:flatten([  [1, 2*N, 1] || N <- lists:seq(1, 33) ])]),
	{N, _} = lists:foldl(fun next/2, {hd(L), 1}, tl(L)),
	272 = sum(N).

next(A, {N, D}) -> K = common:gcd(D, N), { (N*A+D) div K, N div K }.

sum(0) -> 0;
sum(N) -> (N rem 10) + sum(N div 10).

