-module(euler25). 
-export([run/0]). 

run() ->
	fib().

fib() -> fib(1, 1, 2).
fib(F0, F1, I) ->
	case nlength(F1) =:= 1000 of
		true -> I;
		false -> fib(F1, F0 + F1, I + 1)
	end.

nlength(N) when N < 10000000000 -> trunc(math:log10(N))+1;
nlength(N) -> 10 + nlength(N div 10000000000).

