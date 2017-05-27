-module(euler41). 
-export([run/0]). 

run() ->
    MaxPrime = trunc(math:sqrt(7654321)),
    Primes = lists:reverse(euler10:findPrimes(MaxPrime)),
    IsPrime = fun(X) -> not lists:any(fun(N) -> X rem N =:= 0 end, Primes) end,
    hd(findOverPermutations(IsPrime, [1,2,3,4,5,6,7])).

findOverPermutations(Predicate, Digits) -> findOverPermutations(Predicate, Digits, []).
findOverPermutations(Predicate, [], Current) -> 
    I = toInteger(Current),
    case Predicate(I) of 
        true -> [I];
        false -> []
    end;
findOverPermutations(Predicate, [D|T], Current) ->
    Tries = [ findOverPermutations(Predicate, T, insertAt(N, D, Current)) || N <- lists:seq(0, length(Current)) ],
    lists:max(Tries).

toInteger([]) -> 0;
toInteger([D|T]) -> D + 10 * toInteger(T).

insertAt(0, A, List) -> [A | List];
insertAt(N, A, [H | T]) -> [H | insertAt(N-1, A, T)].