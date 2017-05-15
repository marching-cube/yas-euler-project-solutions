-module(euler17). 
-export([run/0]). 

run() -> 
	lists:foldl(fun(N, Acc) -> length(spell(N)) + Acc end, 0, lists:seq(1, 1000)).

spell(0) -> "";
spell(1) -> "one";
spell(2) -> "two";
spell(3) -> "three";
spell(4) -> "four";
spell(5) -> "five";
spell(6) -> "six";
spell(7) -> "seven";
spell(8) -> "eight";
spell(9) -> "nine";
spell(10) -> "ten";
spell(11) -> "eleven";
spell(12) -> "twelve";
spell(13) -> "thirteen";
spell(14) -> "fourteen";
spell(15) -> "fifteen";
spell(16) -> "sixteen";
spell(17) -> "seventeen";
spell(18) -> "eighteen";
spell(19) -> "nineteen";
spell(20) -> "twenty";
spell(30) -> "thirty";
spell(40) -> "forty";
spell(50) -> "fifty";
spell(60) -> "sixty";
spell(70) -> "seventy";
spell(80) -> "eighty";
spell(90) -> "ninety";
spell(N) when N < 100 -> 
	spell(N - (N rem 10)) ++ spell(N rem 10);
spell(N) when (N < 1000) and (N rem 100 =:= 0) -> 
	spell(N div 100) ++ "hundred";
spell(N) when N < 1000 -> 
	spell(N - (N rem 100)) ++ "and" ++ spell(N rem 100);
spell(N) -> 
	spell(N div 1000) ++ "thousand" ++ spell(N rem 1000).
