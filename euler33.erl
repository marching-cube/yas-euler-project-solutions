-module(euler33). 
-export([run/0]). 

run() ->
	{A, B} = lists:foldl(fun multiply/2, {1, 1}, find()),
	B div common:gcd(A, B).

find() -> [ {A, B} || 
				A <- lists:seq(10, 99), 
				B <- lists:seq(10, 99), 
				A < B, 
				isEqual({A, B}, simplify({A, B})) ].

multiply({A, B}, {C, D}) -> {A*C, B*D}.

simplify({A, B}) when (A rem 10) =:= (B div 10) -> { A div 10, B rem 10 };
simplify({A, B}) -> {B, A}.

isEqual({A, B}, {C, D}) ->
	E1 = common:gcd(A, B),
	E2 = common:gcd(C, D),
	(A div E1 =:= C div E2) and (B div E1 =:= D div E2).