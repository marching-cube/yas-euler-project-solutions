-module(euler39).
-export([run/0]).

% the problem is equivalent to counting solutions of the following equation (obtained by substition):
% 	2(p-a)(p-b) = p^2
% this implies counting x (=p-a) such that:
%   2x | p^2
%   p/2 < x < p 
% and in addition we can assume that
%   p > 1000/2 (or else 2p must have at least the same number of solutions)
%   2 | p      (or else 2x division fails automatically)

run() ->
	Max = 1000,
	Results = [ {length(solutions(P)), P} || P <- lists:seq((Max div 2) + 2, Max, 2) ],
	element(2, lists:max(Results)).

solutions(P) -> [ X || X <- lists:seq((P div 2) + 1, P-1), ((P*P) rem (2*X)) =:= 0 ].