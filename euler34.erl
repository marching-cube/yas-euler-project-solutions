-module(euler34). 
-export([run/0]). 

run() ->
	K = element(1, hd(
		lists:dropwhile(fun ({N, _, L}) -> N < L end, 
			[ { N,  N*factorial(9), math:log10(N*362880) } || N <- lists:seq(1, 9) ]
	))),
	brute(K*factorial(9)).

brute(Max) -> [ N || N <- lists:seq(3, Max), value(N) =:= N ].

value(N) when N =:= 0 -> 0;
value(N) -> value(N div 10) + factorial(N rem 10).

factorial(0) -> 1;
factorial(1) -> 1;
factorial(2) -> 2;
factorial(3) -> 6;
factorial(4) -> 24;
factorial(5) -> 120;
factorial(6) -> 720;
factorial(7) -> 5040;
factorial(8) -> 40320;
factorial(9) -> 362880;
factorial(N) -> N * factorial(N-1).
