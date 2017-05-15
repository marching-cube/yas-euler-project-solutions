-module(euler19). 
-export([run/0]). 

run() ->
	Start = (1+365-31) rem 7,
	countFrom(1901, 2000, {Start, 0}).

countFrom(Year, Until, {_, Count}) when Year > Until -> Count;
countFrom(Year, Until, Result) when (Year rem 4 =:= 0) and ((Year rem 100 =/= 0) or (Year rem 400 =:= 0)) ->
	LeapYearInfo = [31, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30],
	countFrom(Year + 1, Until, countOneYear(Result, LeapYearInfo));
countFrom(Year, Until, Result) ->
	RegularYearInfo = [31, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30],
	countFrom(Year + 1, Until, countOneYear(Result, RegularYearInfo)).

countOneYear(Result, Info) -> 
	lists:foldl(fun(N, Acc) -> update(N, Acc) end, Result, Info).

update(N, {D, C}) ->
	case (N + D) rem 7 of
		0 -> {N + D, C + 1};
		_ -> {N + D, C}
	end.

