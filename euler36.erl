-module(euler36).
-export([run/0]).

run() ->
	lists:sum(
		[ N || 	X <- lists:seq(1, 999), 
				D <- [1, 10], 
				N <- [createPalindromic(X, X div D)],
				isBinaryPalindromic(N) ]).

toBinary(0) -> [];
toBinary(N) -> [ N rem 2 | toBinary(N div 2) ].

isBinaryPalindromic(N) -> 
	B = toBinary(N),
	B =:= lists:reverse(B).

createPalindromic(L, 0) -> L;
createPalindromic(L, R) ->
	createPalindromic(L * 10 + (R rem 10), R div 10).