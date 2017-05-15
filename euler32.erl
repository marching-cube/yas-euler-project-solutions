-module(euler32). 
-export([run/0]). 

run() ->
	lists:sum(lists:usort(find())).

find() -> 
    [ N || N <- lists:seq(1000, 9999), A <- lists:seq(1, 99), isSolution(N, A) =:= true ].

isSolution(N, A) when N rem A =:= 0 ->
    isPandigital(integer_to_list(A) ++ integer_to_list(N div A) ++ integer_to_list(N));
isSolution(_, _) -> false.

isPandigital(Str) -> 
    Sorted = lists:usort(Str),
    (hd(Sorted) =/= 48) and (length(Sorted) =:= 9).
