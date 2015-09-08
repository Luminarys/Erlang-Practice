-module(start).
-compile(export_all).

e1(N) -> e1(0, N, 0).
e1(N, N, Acc) -> Acc;
e1(C, N, Acc) when C rem 3 =:= 0; C rem 5 =:= 0 -> e1(C+1, N, Acc+C);
e1(C, N, Acc) -> e1(C+1, N, Acc).

e1_v2(N) -> lists:sum([L || L <- lists:seq(1, N - 1), L rem 3 =:= 0 orelse L rem 5 =:= 0]).

e2(N) -> e2(N, 0, 1, 0).

e2(N, Pre1, _Pre2, Acc) when Pre1 > N -> Acc;
e2(N, Pre1, Pre2, Acc) when Pre1 rem 2 =:= 0 -> e2(N, Pre2, Pre1+Pre2, Acc+Pre1);
e2(N, Pre1, Pre2, Acc) -> e2(N, Pre2, Pre1+Pre2, Acc).
