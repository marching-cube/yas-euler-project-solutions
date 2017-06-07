% Cubic permutations

-module(euler62).
-export([run/0]).

run() -> 127035954683 = search(1, maps:new()).

search(N, Cache) -> 
    T = 5 - 1,
	A = N * N * N,
	Key = integer_to_key(A),
	case maps:get(Key, Cache, {0, A}) of 
		{T    , Min} -> min(Min, A);
		{Count, Min} -> search(N+1, maps:put(Key, {Count+1, min(Min, A)}, Cache))
	end.

integer_to_key(N) -> digits_to_integer(lists:sort(integer_to_digits(N))).

integer_to_digits(0) -> [];
integer_to_digits(N) -> [N rem 10 | integer_to_digits(N div 10)].

digits_to_integer([]) -> 0;
digits_to_integer([H|T]) -> H + 10*digits_to_integer(T).