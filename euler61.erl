% Cyclical figurate numbers

-module(euler61).
-export([run/0]).

run() -> 
	Fns = [ 
			fun(N) -> N*(N+1) div 2 end,
			fun(N) -> N*N end,
			fun(N) -> N*(3*N-1) div 2 end,
			fun(N) -> N*(2*N-1) end,
			fun(N) -> N*(5*N-3) div 2 end,
			fun(N) -> N*(3*N-2) end
		],

	Outputs = [ [ X || N <- lists:seq(1, 150), X <- [Fn(N)], X =< 9999, X >= 1000, X rem 100 >= 10 ] || Fn <- Fns],

	[Result] = [ S || Perm <- perms(tl(Outputs)), S <- solve(return(hd(Outputs)), Perm) ],
	28684 = lists:sum(Result).

solve(S, []) -> lists:filter(fun check/1, S);
solve(S, [P|T]) -> solve(bind(S,P), T).

check(L) -> (hd(lists:reverse(L)) div 100) =:= (hd(L) rem 100).

return(L) -> [ [N] || N <- L ].

bind(L, R) -> 
	LS = lists:sort(fun([A|_], [B|_]) -> (A rem 100) < (B rem 100) end, L),
	zipMatch(LS, R).

zipMatch([], _) -> [];
zipMatch(_, []) -> [];
zipMatch(L, R) when (hd(hd(L)) rem 100) =:= (hd(R) div 100) ->
	T = hd(hd(L)) rem 100,
	{LH, LT} = lists:splitwith(fun([N|_]) -> (N rem 100) =:= T end, L),
	{RH, RT} = lists:splitwith(fun(N) -> (N div 100) =:= T end, R),
	[ [J | S] || S <- LH, J <- RH ] ++ zipMatch(LT, RT);
zipMatch([[LH|_]|LT], [RH|RT]) when (LH rem 100) < (RH div 100) ->
	zipMatch(LT, [RH|RT]);
zipMatch([[LH|S]|LT], [RH|RT]) when (LH rem 100) > (RH div 100) ->
	zipMatch([[LH|S]|LT], RT).

perms([]) -> [[]];
perms(L)  -> [[H|T] || H <- L, T <- perms(L--[H])].

