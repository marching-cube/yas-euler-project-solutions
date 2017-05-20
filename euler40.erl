-module(euler40).
-export([run/0]).

run() ->
	common:product([findDigit(common:pow10(K)-1) || K <- lists:seq(0, 6)]).

findDigit(N) ->
	{K, Bk} = base(N),
	A = common:pow10(K) + (N - Bk) div (K + 1),
	I = K - (N - Bk) rem (K + 1),
	digitAt(A, I).

base(N) -> base(N, 0, 0).
base(N, K, Bk) ->
	A = (K+1)*9*common:pow10(K),
	case N < Bk + A of
		true -> {K, Bk};
		false -> base(N, K + 1, Bk + A)
	end.

digitAt(A, 0) -> A rem 10;
digitAt(A, K) -> digitAt(A div 10, K - 1).