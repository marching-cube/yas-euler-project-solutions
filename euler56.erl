% Powerful digit sum

-module(euler56).
-export([run/0]).

run() -> 
	Estimate = digitSum(common:pown(99, 100)),
	lists:max([ {digitSum(common:pown(A, B)), A, B} || A <- lists:seq(2, 99), A rem 10 =/= 0, B <- lists:seq(2, 100), 9*B*math:log10(A) > Estimate]).

digitSum(N) -> digitSum(N, 0).
digitSum(0, R) -> R;
digitSum(N, R) -> digitSum(N div 10, R + (N rem 10)).