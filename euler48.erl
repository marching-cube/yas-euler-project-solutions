% Self powers

-module(euler48).
-export([run/0]).

run() -> 
	M = 10000000000,
	lists:foldl(fun(A, R) -> (R + powmod(A, A, M)) rem M end, 0, lists:seq(1, 1000) ).

powmod(_, 0, _) -> 1;
powmod(A, N, M) when N rem 2 =:= 1 -> (A * powmod(A, N-1, M)) rem M;
powmod(A, N, M) -> X = powmod(A, N div 2, M), (X * X) rem M.
