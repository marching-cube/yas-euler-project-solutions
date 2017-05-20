-module(euler38).
-export([run/0]).

% In order to maximise the concatented product
% * the first digit of N has to be 9,
% * then the first digit of the N x 2 part must be 1,
% * then N should be maximised,
% * then n = 2 if any sloution exists for n = 2.

run() ->
	concatenate(find(9876)).

find(N) ->
	case isPandigital(concatenate(N)) of
		true -> N;
		false -> find(N-1)
	end.

concatenate(N) -> N * 100000 + 2 * N.

isPandigital(N) ->
	Test = lists:usort(integer_to_list(N)),
	(hd(Test) =/= 48) and (length(Test) =:= 9).

