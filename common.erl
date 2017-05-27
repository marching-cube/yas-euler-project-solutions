-module(common).
-export([product/1, pow10/1, pown/2, gcd/2, snd/1, fst/1, savePrimes/0, loadPrimes/0]).

product(L) -> lists:foldl(fun (X, A) -> X * A end, 1, L).

pow10(0) -> 1;
pow10(K) -> pown(10, K).

pown(_, 0) -> 1;
pown(X, N) when N rem 2 =:= 0 -> R = pown(X, N div 2), R * R;
pown(X, N) -> X * pown(X, N-1).

gcd(A, 0) -> A;
gcd(A, B) -> gcd(B, A rem B).

snd({_, Y}) -> Y.
fst({X, _}) -> X.

savePrimes() -> 
    {ok, File} = file:open("primes.txt", [write]),
	Primes = lists:reverse(euler10:findPrimes(1000000)),
    lists:map(fun(N) -> file:write(File, integer_to_list(N) ++ "\n") end, Primes),
    file:position(File, {eof, -1}),
    file:truncate(File).

loadPrimes() -> 
    {ok, Data} = file:read_file("primes.txt"),
    lists:map(fun binary_to_integer/1, binary:split(Data, [<<"\n">>], [global])).


