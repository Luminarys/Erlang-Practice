-module(primes).
-compile(export_all).

get_primes(N) -> filter(lists:seq(2, N), []).

filter([], Acc) -> lists:reverse(Acc);
filter(L, Acc) ->
    [H|T] = [N || N<-L, N rem hd(L) =/= 0 orelse N =:= hd(L)],
    filter(T, [H] ++ Acc).
