% Lychrel numbers

-module(euler55).
-export([run/0]).

run() -> 
	249 = length([ N || N <- lists:seq(1, 10000), isLychrel(N)]).

reverse(N) -> reverse(N, 0).
reverse(0, R) -> R;
reverse(N, R) -> reverse(N div 10, 10 * R + (N rem 10)).

isPalindrom(N) -> N =:= reverse(N).

isLychrel(N) -> isLychrel(N, 0).
isLychrel(_, 50) -> true;
isLychrel(N, D) ->
	case (D > 0) and isPalindrom(N) of
		true -> false;
		false -> isLychrel(N + reverse(N), D+1)
	end.
