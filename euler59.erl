% XOR decryption

-module(euler59).
-export([run/0]).

run() -> 
	{ok, Data} = file:read_file("p059_cipher.txt"),
	Values = [ binary_to_integer(N) || N <- binary:split(Data, [<<",">>], [global])],
	Keys = eliminateKeys(Values),
	[Passphrase] = [ K || K <- Keys, cipherContainsWord(Values, "the", K), cipherContainsWord(Values, "have", K)],
	PlainText = decode(Values, Passphrase),
	107359 = lists:sum(PlainText).

eliminateKeys(L) -> eliminateKeys(L, [lists:seq($a, $z), lists:seq($a, $z), lists:seq($a, $z)], 0).
eliminateKeys([], R, I) when I rem 3 =/= 0 -> eliminateKeys([], cycle(R), I+1);
eliminateKeys([], [R1, R2, R3], _) -> [ [A, B, C] || A <- R1, B <- R2, C <- R3];
eliminateKeys([A | T], [L1, L2, L3], I) -> eliminateKeys(T, [L2, L3, eliminateNonprintable(A, L1)], I + 1).
	
eliminateNonprintable(A, L) -> [ B || B <- L, N <- [ A bxor B ], (((N < 127) and (N > 31)))].

cipherContainsWord([], _, _) -> false;
cipherContainsWord(Data, Word, Key) -> cipherHasPrefix(Data, Word, Key) or cipherContainsWord(tl(Data), Word, cycle(Key)).

cipherHasPrefix(_, [], _) -> true;
cipherHasPrefix([], _, _) -> false;
cipherHasPrefix([H1|T1], [H2|T2], Key) when (H1 bxor hd(Key)) =:= H2 -> cipherHasPrefix(T1, T2, cycle(Key));
cipherHasPrefix(_, _, _) -> false.

cycle([A, B, C]) -> [B, C, A];
cycle([H|T]) -> T ++ [H].

decode([], _) -> [];
decode([H|T], Key) -> [ (H bxor hd(Key)) | decode(T, cycle(Key)) ].
