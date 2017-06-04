% Square root convergents

-module(euler57).
-export([run/0]).

run() -> 
	Fractions = lists:foldl(fun(_, R) -> [next(hd(R)) | R] end, [{1, 1}], lists:seq(1,1000)),
	153 = length([1 || {N, D} <- Fractions, digits(N) > digits(D)]).

digits(N) when N < 10 -> 1;
digits(N) when N > 1000000000 -> 8 + digits(N div 100000000);
digits(N) -> 1 + digits(N div 10).

next({N, D}) -> {N+2*D, N+D}.