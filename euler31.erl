-module(euler31). 
-export([run/0]). 

run() ->
	brute().

% there is exactly 1 combination involving 200p
% for every combination of 5p, 10p, 20p, 50p, 100p that's sums to less than 200,
%   it is easy to calculate possible 2p, 1p combinations

brute() -> 
    lists:sum(
        [ 1 + (200 - (P5 + P10 + P20 + P50 + P100)) div 2 ||  
            P5 <- lists:seq(0, 200, 5),
            P10 <- lists:seq(0, 200, 10),
            P5 + P10 =< 200,
            P20 <- lists:seq(0, 200, 20),
            P5 + P10 + P20 =< 200,
            P50 <- lists:seq(0, 200, 50),
            P5 + P10 + P20 + P50 =< 200,
            P100 <- lists:seq(0, 200, 100),
            P5 + P10 + P20 + P50 + P100 =< 200 ]) + 1.
