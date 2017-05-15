-module(euler24). 
-export([run/0]). 

run() ->
	Target = 1000000,
	Digits = lists:seq(0, 9),
	Factorials = lists:foldl(fun(X, Acc) -> [X*hd(Acc) | Acc] end, [1], lists:seq(2, length(Digits)-1)),
	Result = permute(Target-1, Digits, Factorials),
	lists:foldl(fun(X, Acc) -> 10*Acc + X end, 0, Result).

permute(_, Digits, []) -> Digits;
permute(N, Digits, [F | T]) ->
	D = lists:nth(N div F + 1, Digits),
	NewDigits = lists:delete(D, Digits),
	[D | permute(N rem F, NewDigits, T)].

