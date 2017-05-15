-module(euler2). 
-export([run1/0, run2/0]). 

run1() ->
	Even = [ X || X <- list([2, 1], 4000000), X rem 2 =:= 0],
	lists:sum(Even).

run2() ->
	calc(1, 2, 0, 4000000).


calc(_, B, Sum, Limit) when B > Limit ->
	Sum;
calc(A, B, Sum, Limit) when B rem 2 =:= 0 ->
	calc(B, A + B, Sum + B, Limit);
calc(A, B, Sum, Limit) -> 
	calc(B, A + B, Sum, Limit).


list([B, A | Tail], Limit) when B + A < Limit ->
	list([B+A, B, A | Tail], Limit);
list(Result, _) -> Result.