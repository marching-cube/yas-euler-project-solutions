% Combinatoric selections

-module(euler53).
-export([run/0]).

run() -> lists:sum([ N+1 - 2*findK(N) || N <- lists:seq(23, 100)]).

findK(N) -> findK(N, 1, 1).
findK(N, K, V) when V > 1000000 -> K - 1;
findK(N, K, V) -> findK (N, K+1, (V * (N - K + 1)) div K).
