-module(euler37).
-import(euler10, [findPrimes/1]).
-export([run/0]).

run() ->
	List = lists:reverse(findPrimes(1000000)),
	Set = sets:from_list(List),
	lists:sum([ N || N <- List, N > 10, rightCheck(N div 10, Set), leftCheck(N, Set)]).

rightCheck(0, _) -> true;
rightCheck(N, Primes) -> sets:is_element(N, Primes) and rightCheck(N div 10, Primes).

leftCheck(N, Primes) -> leftCheck(N, intCap(N), Primes).
leftCheck(0, _, _) -> true;
leftCheck(N, L, Primes) -> sets:is_element(N, Primes) and leftCheck(N rem L, L div 10, Primes).

intCap(N) when N < 10 -> 1;
intCap(N) -> 10 * intCap(N div 10).

% 748317