% Combinatoric selections

-module(euler54).
-export([run/0]).

run() -> 
	{ok, Data} = file:read_file("p054_poker.txt"),
	Hands = binary:split(Data, [<<"\n">>], [global]),
	376 = length([ 1 || <<Left:14/binary, " ", Right/binary>> <- Hands, classify(Left) > classify(Right)]).

isFlush(L) -> lists:all(fun(A) -> btl(hd(L)) =:= btl(A) end, L).
isStraight([A,B,C,D,E]) -> (A-B =:= 1) and (B-C =:= 1) and (C-D =:= 1) and (D-E =:= 1).
cardValues(L) -> lists:map(fun cardValue/1, L).
cardValue(C) ->
	case bhd(C) of 
		$T -> 10;
		$J -> 11;
		$Q -> 12;
		$K -> 13;
		$A -> 14;
		 L -> L - $0
	end.

classify(Hand) ->
	Tokens = binary:split(Hand, [<<" ">>], [global]),
	IsFlush = isFlush(Tokens),
	Values = lists:reverse(lists:sort(cardValues(Tokens))),
	IsStraight = isStraight(Values),
	encode(Values, IsFlush, IsStraight).

encode([14,_,_,_,_], true, true) -> {9, royal_flush, []};
encode([A,_,_,_,_], true, true) -> {8, straight_flush, [A]};
encode([A,A,A,A,B], _, _) -> {7, four_of_kind, [A, B]};
encode([A,B,B,B,B], _, _) -> {7, four_of_kind, [B, A]};
encode([A,A,B,B,B], _, _) -> {6, full_house, [B, A]};
encode([A,A,A,B,B], _, _) -> {6, full_house, [A, B]};
encode([A,B,C,D,E], true, _) -> {5, flush, [A, B, C, D, E]};
encode([A,_,_,_,_], _, true) -> {4, straight, [A]};
encode([A,A,A,B,C], _, _) -> {3, three_of_kind, [A, B, C]};
encode([A,B,B,B,C], _, _) -> {3, three_of_kind, [B, A, C]};
encode([A,B,C,C,C], _, _) -> {3, three_of_kind, [C, A, B]};
encode([A,A,B,B,C], _, _) -> {2, two_pairs, [A, B, C]};
encode([A,A,B,C,C], _, _) -> {2, two_pairs, [A, C, B]};
encode([A,B,B,C,C], _, _) -> {2, two_pairs, [B, C, A]};
encode([A,A,B,C,D], _, _) -> {1, one_pair, [A, B, C, D]};
encode([A,B,B,C,D], _, _) -> {1, one_pair, [B, A, C, D]};
encode([A,B,C,C,D], _, _) -> {1, one_pair, [C, A, B, D]};
encode([A,B,C,D,D], _, _) -> {1, one_pair, [D, A, B, C]};
encode([A,B,C,D,E], _, _) -> {0, nothing, [A, B, C, D, E]}.

% UTILITIES

bhd(Binary) -> <<H, _>> = Binary, H.
btl(Binary) -> <<_, T>> = Binary, T.

