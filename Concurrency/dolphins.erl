-module(dolphins).
-compile(export_all).

dolphin1() ->
    receive
        do_a_flip ->
            io:format("How about no?~n");
        fish ->
            io:format("So long and thanks for all the fish!~n");
        _ ->
            io:format(":^))))))~n")
    end.

dolphin2() ->
    receive
        {From, do_a_flip} ->
            From ! "How about fuck you too :^)";
        {From, fish} ->
            From ! "So long and thanks for all the fish!";
        _ ->
            io:format(":^))))))~n")
    end.

dolphin3() ->
    receive
        {From, do_a_flip} ->
            From ! "How about fuck you too :^)",
            dolphin3();
        {From, fish} ->
            From ! "So long and thanks for all the fish!";
        _ ->
            io:format("Ayy lmao~n"),
            dolphin3()
    end.
