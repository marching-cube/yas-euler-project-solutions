-module(euler4). 
-export([run/0]). 

run() -> find(999).

find(N) -> 
	P = makePalindrom(N),
	case checkFactors(P, 999) of
		false -> find(N-1);
		K -> {P, K, P div K}
	end.

makePalindrom(N) -> N * 1000 + (N rem 10) * 100 + ((N rem 100) div 10) * 10 + (N div 100).

checkFactors(N, K) when N div K > K -> false;
checkFactors(N, K) when N rem K =:= 0 -> K;
checkFactors(N, K) -> checkFactors(N, K-1).
