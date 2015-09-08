-module(recursion).
-export([tail_reverse/1]).
-export([lenient_zip/2]).
-export([quicksort/1]).
-export([fib/1]).

tail_reverse(L) -> tail_reverse(L,[]).

tail_reverse([], Acc) -> Acc;
tail_reverse([H|T], Acc) -> tail_reverse(T, [H|Acc]).

lenient_zip([],_) -> [];
lenient_zip(_,[]) -> [];
lenient_zip([X|Xs],[Y|Ys]) -> [{X,Y}|lenient_zip(Xs,Ys)].

quicksort([]) -> [];
quicksort([Pivot|Rest]) ->
    {Smaller, Larger} = partition(Pivot,Rest,[],[]),
    quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).

partition(_,[], Smaller, Larger) -> {Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) ->
    if H < Pivot -> partition(Pivot, T, [H|Smaller], Larger);
       H >= Pivot -> partition(Pivot, T, Smaller, [H|Larger])
    end.

fib(N) -> fib(0, N, 0, 1).
fib(N, N, Pre1, _) -> Pre1;
fib(C, N, Pre1, Pre2) -> fib(C+1, N, Pre2, Pre1+Pre2).
