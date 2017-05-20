-module(common).
-export([product/1, pow10/1, gcd/2]).

product(L) -> lists:foldl(fun (X, A) -> X * A end, 1, L).

pow10(0) -> 1;
pow10(K) -> 10 * pow10(K-1).

gcd(A, 0) -> A;
gcd(A, B) -> gcd(B, A rem B).
