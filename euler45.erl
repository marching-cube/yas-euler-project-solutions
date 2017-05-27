% Triangular, pentagonal, and hexagonal

-module(euler45).
-export([run/0]).

run() -> check(285+1, 165, 143).

check(Nt, Np, Nh) -> check(triangle(Nt), pentagonal(Np), hexagonal(Nh), Nt, Np, Nh).

check(T, P, H, _, _, _) when (T =:= P) and (P =:= H) -> T;
check(T, P, H, Nt, Np, Nh) when (T =< P) and (T =< H) -> check(triangle(Nt+1), P, H, Nt+1, Np, Nh);
check(T, P, H, Nt, Np, Nh) when (P =< T) and (P =< H) -> check(T, pentagonal(Np+1), H, Nt, Np+1, Nh);
check(T, P, H, Nt, Np, Nh) when (H =< T) and (H =< P) -> check(T, P, hexagonal(Nh+1), Nt, Np, Nh+1).

triangle(N) -> N*(N+1) div 2.
pentagonal(N) -> N*(3*N-1) div 2.
hexagonal(N) -> N*(2*N-1).