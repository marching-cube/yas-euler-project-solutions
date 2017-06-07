% Diophantine equation

-module(euler66).
-export([run/0]).

run() -> 
	{_, N} = lists:max([ {solve(N), N} || N <- lists:seq(2, 1000), not_square(N)]),
	661 = N.

solve(N) -> solve(N, {1, 0, 1}, {1, 0}, {0, 1}).
solve(N, _, {H1, _}, {K1, _}) when (H1*H1 - N *K1*K1 =:= 1) and (K1 > 0) -> H1;
solve(N, S, {H1, H2}, {K1, K2}) ->
	{A, NS} = next_state(N, S),
	H0 = A*H1 + H2,
	K0 = A*K1 + K2,
	solve(N, NS, {H0, H1}, {K0, K1}).

next_state(N, {A, B, C}) -> 
	K = trunc((A * math:sqrt(N) + B) / C),
	{RA, RB, RC} = {C * A, - C * (B - K*C), A * A * N - (K*C - B)*(K*C - B)},
	D = common:gcd(common:gcd(RA, RC), common:gcd(RB, RC)),
	{K, {RA div D, RB div D, RC div D}}.

not_square(N) -> 
	Y = trunc(math:sqrt(N) + 0.1),
	Y * Y =/= N.
