% Pentagon numbers

-module(euler44).
-export([run/0]).

% remark: Pj - Pi = (j-i)[3*(j+i)-1]
% notation: D = j-i
%           S = j+i
%           N is the variable in N(3N-1)

run() -> find().

find() -> find(1).
find(N) ->
	case isSolution(N) of
		true -> pentagonal(N);
		false -> find(N+1)
	end.

isSolution(N) ->
	P = 2*pentagonal(N),
	[] =/= [ {I, J} || 
			D <- lists:seq(N rem 3, N-1, 3), 
			P rem D =:= 0, 
			S <- [sumFromDiff(D, N)],
			(S rem 2) =:= (D rem 2),
			{I, J} <- [ ijFromSumDiff(S, D) ], 
			{PI, PJ} <- [ {pentagonal(I), pentagonal(J) }],
			isPentagonal(PJ+PI),
			isPentagonal(PJ-PI)].

isPentagonal(N) ->
	X = round(math:sqrt(1+24*N)),
	(X*X =:= 1+24*N) and ((X + 1) rem 6 =:= 0).
pentagonal(N) -> (N*(3*N-1)) div 2.
ijFromSumDiff(S, D) -> { (S - D) div 2, (S + D) div 2 }.
sumFromDiff(D, N) -> (((2*pentagonal(N)) div D) + 1) div 3.


% REFERENCE

brute() ->
	Ps = [ pentagonal(N) || N <- lists:seq(1, 2500)],
	lists:min([ {P2-P1, pentagonalIdx(P1), pentagonalIdx(P2), pentagonalIdx(P2-P1)} || P1 <- Ps, P2 <- Ps, P1 < P2, isPentagonal(P1+P2), isPentagonal(P2-P1) ]).

pentagonalIdx(N) -> (round(math:sqrt(1+24*N))+ 1) div 6.
