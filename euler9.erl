-module(euler9). 
-export([run/0]). 

run() ->
	{A, B, C} = hd([ {A, B, C} || A <- lists:seq(1, 999), (500000 - 1000*A ) rem (1000 - A) =:= 0, B <- [(500000 - 1000*A ) div (1000 - A)], C <- [ 1000 - A - B ] ]),
	A * B * C.

