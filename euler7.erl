-module(euler7). 
-export([run/0]). 

run() -> hd(findPrimes()).

findPrimes() -> findPrimes([2, 3, 5], 3, 7, 10001, {5, [2, 3, 5]}).
findPrimes(Primes, Count, _, N, _) when Count =:= N -> Primes;
findPrimes(Primes, Count, Next, N, Cache) ->
	{Max, SmallPrimes} = cachedSmallPrimes(Primes, Cache, Next),
	case isPrime(SmallPrimes, Next) of 
		true -> findPrimes([Next | Primes], Count + 1,  Next + 2, N, {Max, SmallPrimes});
		false -> findPrimes(Primes, Count, Next + 2, N, {Max, SmallPrimes})
	end.

cachedSmallPrimes(_, {Max, Cache}, Limit2) when Max*Max > Limit2 -> {Max, Cache};
cachedSmallPrimes(Primes, {_, Cache}, _) -> 
    Result = lists:nthtail(length(Primes) - length(Cache)*2, Primes),
    { hd(Result), lists:reverse(Result) }.

isPrime(Primes, Value) -> 
	not lists:any(fun(X) -> Value rem X =:= 0 end, Primes).

