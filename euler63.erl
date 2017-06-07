% Powerful digit counts

-module(euler63).
-export([run/0]).

% Task: Counting K that satisfy 10^(N-1) <= K^N < 10^N for N = 1, ...

run() -> 
	49 = lists:sum([ 10 - C || N <- lists:seq(1, 100), C <- [ceil(math:pow(10, (N-1)/N))], C < 10 ]).

ceil(X) when 1.0 * trunc(X) =:= X -> trunc(X);
ceil(X) -> trunc(X) + 1.
