-module(euler1). 
-export([run/0]). 

run() -> 
	lists:sum ([X || X <- lists:seq(1, 1000), (X rem 3 =:= 0) or (X rem 5 =:= 0)]). 
