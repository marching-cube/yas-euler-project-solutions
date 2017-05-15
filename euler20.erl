-module(euler20). 
-export([run/0]). 

run() ->
	Limit = 100,
	sod(factorial(Limit)).

factorial(1) -> 1;
factorial(N) -> factorial(N-1) * N.

sod(0) -> 0;
sod(N) -> (N rem 10) + sod(N div 10).