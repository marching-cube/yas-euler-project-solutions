-module(common).
-export([product/1, pow10/1, pown/2, gcd/2, snd/1, fst/1]).

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
