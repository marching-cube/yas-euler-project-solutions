-module(euler26). 
-export([run/0]). 

run() ->
	Candidates = ([ {order(10, N), N} || N <- lists:seq(11, 1000), N rem 5 =/= 0, N rem 2 =/= 0 ]),
	{_, Result} = lists:foldl(fun max/2, {0, 0}, Candidates),
	Result.

order(N, Mod) -> order(N, Mod, N, 1).
order(_, _, 1, R) -> R;
order(N, Mod, C, R) -> order(N, Mod, (C * N) rem Mod, R + 1).

% Remark1: 1/N = C/99..9  <=>  10**K = N * C + 1  ==>  10**K == 1 mod N
% Remark2: period(1/P) = period(K/P)
% Remark3: period(1/2P) = period(1/P), period(1/5P) = period(1/P)
