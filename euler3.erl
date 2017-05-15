-module(euler3). 
-export([run/0]). 

run() ->
	Primes = decomopose(600851475143, 2),
	lists:last(Primes).

decomopose(N, D) when N < D*D -> 
	[ N ];
decomopose(N, D) when N rem D =:= 0 -> 
	[ D | decomopose(N div D, D) ];
decomopose(N, D) -> 
	decomopose(N, D+1).
