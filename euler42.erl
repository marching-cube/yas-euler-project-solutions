-module(euler42). 
-export([run/0]). 

run() -> 
    {ok, Data} = file:read_file("p042_words.txt"),
    Words = binary:split(Data, [<<",">>], [global]),
    Triangles = sets:from_list([ (N*N + N) div 2 || N <- lists:seq(1, 100)]),
    Counter = fun(X, R) -> case sets:is_element(score(X), Triangles) of true -> R+1; false -> R end end,
    lists:foldl(Counter, 0, Words).

score(L) -> lists:sum([ X - 64 || <<X>> <= L, X =/= 34 ]).


