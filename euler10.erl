-module(euler10). 
-export([run/0, findPrimes/1]). 

run() -> 
	N = 2000000,
	lists:sum(findPrimes(N)).

findPrimes(N) -> findPrimes([5, 3, 2], 7, N, {5, [5, 3, 2]}).
findPrimes(Primes, Next, N, _) when Next > N -> Primes;
findPrimes(Primes, Next, N, Cache) ->
	{Max, SmallPrimes} = cachedSmallPrimes(Primes, Cache, Next),
	case isPrime(SmallPrimes, Next) of 
		true -> findPrimes([Next | Primes], Next + 2, N, {Max, SmallPrimes});
		false -> findPrimes(Primes, Next + 2, N, {Max, SmallPrimes})
	end.

cachedSmallPrimes(_, {Max, Cache}, Limit2) when Max*Max > Limit2 -> {Max, Cache};
cachedSmallPrimes(Primes, {_, Cache}, _) -> 
    Result = lists:nthtail(length(Primes) - length(Cache)*2, Primes),
    { hd(Result), lists:reverse(Result) }.

isPrime(Primes, Value) -> 
	not lists:any(fun(X) -> Value rem X =:= 0 end, Primes).

