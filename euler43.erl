% Sub-string divisibility

-module(euler43).
-export([run/0]).

run() ->
	List = [ N || N3 <- init(17), 
				  N4 <- addPossibleDigits(N3, 13),
				  N5 <- addPossibleDigits(N4, 11, [5]),
				  N6 <- addPossibleDigits(N5, 7),
				  N7 <- addPossibleDigits(N6, 5, [0, 2, 4, 6, 8]),
				  N8 <- addPossibleDigits(N7, 3),
				  N9 <- addPossibleDigits(N8, 2),
				  {N, _} <- addPossibleDigits(N9, 1) ],
	lists:sum(List).

init(K) ->
	[ {N, 1000} || N <- lists:seq(K, 999, K), hasThreeDistinctDigits(N) =:= true ].

addPossibleDigits({N, H}, K) -> addPossibleDigits({N, H}, K, lists:seq(0, 9)).
addPossibleDigits({N, H}, K, Digits) ->
	[ {H*D + N, H * 10} || D <- Digits, not containsDigit(N, H, D), (D * 100 + (N div (H div 100))) rem K =:= 0].

hasThreeDistinctDigits(N) ->
	{A, B, C} = { N rem 10, (N div 10) rem 10, N div 100 },
	(A =/= B) and (B =/= C) and (A =/= C).

containsDigit(_, 1, _) -> false;
containsDigit(N, _, D) when N rem 10 =:= D -> true;
containsDigit(N, H, D) -> containsDigit(N div 10, H div 10, D).
