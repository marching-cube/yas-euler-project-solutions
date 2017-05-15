-module(euler1). 
-export([run/0]). 

run() -> 
	List = [X || X <- lists:seq(1, 1000), (X rem 3 =:= 0) or (X rem 5 =:= 0)], 
	lists:foldl(fun(X, Sum) -> X + Sum end, 0, List). 
