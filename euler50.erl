% Consecutive prime sum

-module(euler50).
-export([run/0]).

run() -> 
	Primes = common:loadPrimes(),
	PrimeSet = sets:from_list(Primes),
	PrimeSums = lists:reverse(lists:foldl(fun(A, R) -> [A+hd(R) | R] end, [0], Primes)),
	find(PrimeSums, tl(PrimeSums), 0, PrimeSet).

find([H1|_], [H2|_], A, _) when H2-H1 > 1000000 -> A;
find([H1|R1], [H2|R2], A, PrimeSet) -> 
	{V, R} = innerLoop(H1, [H2|R2], {A, R2}, PrimeSet),
	find(R1, R, V, PrimeSet).

innerLoop(H1, [H2|_], B, _) when H2-H1 > 1000000 -> B;
innerLoop(H1, [H2|R2], {V, R}, PrimeSet) -> 
	case sets:is_element(H2-H1, PrimeSet) of 
		true -> innerLoop(H1, R2, {H2-H1, tl(R2)}, PrimeSet);
		false -> innerLoop(H1, R2, {V, R}, PrimeSet)
	end.
