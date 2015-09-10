-module(primes).
-export([get_primes/1]).
-export([get_n_primes/1,get_nth_prime/1]).

get_primes(N) -> sieve(lists:seq(2, N), []).

sieve([], Acc) -> lists:reverse(Acc);
sieve(L, Acc) ->
    [H|T] = [N || N<-L, N rem hd(L) =/= 0 orelse N =:= hd(L)],
    sieve(T, [H] ++ Acc).

get_nth_prime(N) -> hd(get_n_primes(N)).

get_n_primes(1) -> [2];
get_n_primes(2) -> [3,2];
get_n_primes(N) -> get_n_primes(N-2, 6, [3,2]).

get_n_primes(-1, _, Acc) -> tl(Acc);
get_n_primes(0, _, Acc) -> Acc;
get_n_primes(N, C, Acc) ->
    case {is_prime(C-1,Acc), is_prime(C+1,Acc)} of
        {true,true} -> get_n_primes(N-2, C+6, [C-1,C+1] ++ Acc);
        {true,false} -> get_n_primes(N-1, C+6, [C-1] ++ Acc);
        {false,true} -> get_n_primes(N-1, C+6, [C+1] ++ Acc);
        {false,false} -> get_n_primes(N, C+6, Acc)
    end.

is_prime(_,[]) -> true;
is_prime(N,[H|_]) when N rem H =:= 0 -> false;
is_prime(N,[_|T]) -> is_prime(N,T).
