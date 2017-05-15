-module(euler23). 
-export([run/0, sumOfDivisors/2]). 
-import(euler10, [findPrimes/1]).

run() ->
	Limit = 28123,
	Primes = lists:reverse(findPrimes(Limit)),
	Abundants = lists:filter(fun(N) -> sumOfDivisors(N, Primes) > 2*N end, lists:seq(2, Limit)),
	RevAbundants = lists:reverse(Abundants),

	% Falses = lists:usort([A + B || A <- Abundants, B <- Abundants, A =< B, A+B < Limit]),
	% lists:sum(lists:seq(1, Limit-1)) - lists:sum(Falses).

	Numbers = lists:filter(fun(N) -> not isSumOfTwo(N, Abundants, RevAbundants) end, lists:seq(1, Limit-1)),
	lists:sum(Numbers).



sumOfDivisors(1, _) -> 1;
sumOfDivisors(N, []) -> 1 + N;
sumOfDivisors(N, [P | _]) when P*P > N -> 1 + N;
sumOfDivisors(N, [P | Tail]) ->
	subsum(N, P) * sumOfDivisors(remove(N, P), Tail).

subsum(N, P) when N rem P =/= 0 -> 1;
subsum(N, P) -> 1 + P*subsum(N div P, P).

remove(N, P) when N rem P =/= 0 -> N;
remove(N, P) -> remove(N div P, P).

isSumOfTwo(_, [], _) -> false;
isSumOfTwo(_, _, []) -> false;
isSumOfTwo(_, [L|_], [R|_]) when L > R -> false;
isSumOfTwo(N, [L|TL], [R|TR]) when L + R > N -> isSumOfTwo(N, [L|TL], TR);
isSumOfTwo(N, [L|TL], [R|TR]) when L + R < N -> isSumOfTwo(N, TL, [R|TR]);
isSumOfTwo(_, _, _) -> true.


