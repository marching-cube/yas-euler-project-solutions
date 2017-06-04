% Permuted multiples

-module(euler52).
-export([run/0]).

run() -> hd([ N || N <- lists:seq(102345, 165432), check(N)]).

check(N) -> check(N, 1, encode1(N)).
check(_, K, _) when K > 6 -> true;
check(N, K, C) -> (C =:= encode2(N*K)) and check(N, K+1, C).

encode1(N) when N =:= 0 -> 0;
encode1(N) -> (1 bsl (N rem 10))  +  encode1(N div 10).

encode2(N) when N =:= 0 -> 0;
encode2(N) -> (1 bsl (N rem 10)) bor encode2(N div 10).
