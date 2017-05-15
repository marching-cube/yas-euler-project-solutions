-module(euler16). 
-export([run/0]). 

run() -> 
	N = lists:foldl(fun(_, Acc) -> 2 * Acc end, 1, lists:seq(1, 1000)),
	sum(N).

sum(0) -> 0;
sum(N) -> sum(N div 10) + (N rem 10).
