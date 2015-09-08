-module(rpn).
-export([rpn/1]).

rpn(L) when is_list(L) ->
    [Res] = lists:foldl(fun rpn/2, [], string:tokens(L, " ")),
    Res.

rpn("+", [H1,H2|S]) -> [H2+H1|S];
rpn("-", [H1,H2|S]) -> [H2-H1|S];
rpn("*", [H1,H2|S]) -> [H2*H1|S];
rpn("/", [H1,H2|S]) -> [H2/H1|S];
rpn(Val, Stack) -> [list_to_integer(Val)|Stack].
