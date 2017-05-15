-module(euler28). 
-export([run/0]). 

run() ->
	N = 1001,
	S = N*(N+1)*(N+2) div 6,
	R = 1 + 2 * (2*(S-1) - 3 * (N-1) * (N+1) div 4 ),

	{R, sum(N), 669171001} .


sum(Max) -> sum(1, Max).
sum(N, Max) when N > Max -> 0;
sum(1, Max) -> 1 + sum(3, Max);
sum(N, Max) -> lists:sum([ corner(N, C) || C <- lists:seq(0, 3) ]) + sum(N+2, Max).

corner(N, C) -> N*N - (N-1)*C.
