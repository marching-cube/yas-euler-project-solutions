% Odd period square roots

-module(euler64).
-export([run/0]).

run() -> 
	1322 =:= lists:sum([ fractionLength(N) rem 2 || N <- lists:seq(2, 10000), not isSquare(N)]).

isSquare(N) -> 
	R = trunc(math:sqrt(N)),
	R * R =:= N.

fractionLength(N) ->
	S0 = {1, 0, 1},
	S1 = nextState(N, S0),
	fractionLength(N, S1, S1).

fractionLength(N, S, S1) ->
	case nextState(N, S) of 
		S1 -> 1;
		S2 -> 1 + fractionLength(N, S2, S1)
	end.

nextState(N, {A, B, C}) -> 
	K = trunc((A * math:sqrt(N) + B) / C),
	{RA, RB, RC} = {C * A, - C * (B - K*C), A * A * N - (K*C - B)*(K*C - B)},
	D = common:gcd(common:gcd(RA, RC), common:gcd(RB, RC)),
	{RA div D, RB div D, RC div D}.




% C * A * sqrt(N) - C * (B - K*C) 
% -------------------------------
% A * A * N - (K*C - B)^2

