-module(euler15). 
-export([run/0]). 

run() ->
	combinations(40, 20).

combinations(N, M) -> factorial(N, M) div factorial(M, 1).

factorial(N, N) -> 1;
factorial(N, M) -> factorial(N-1, M) * N.

