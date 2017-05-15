-module(euler30). 
-export([run/0]). 

run() ->
	Numbers = lists:filter(fun(X) -> X =:= sum5(X) end, lists:seq(10, 299999)),
	lists:sum(Numbers).

sum5(0) -> 0;
sum5(X) -> pow5(X rem 10) + sum5(X div 10).
pow5(X) -> X*X*X*X*X.

