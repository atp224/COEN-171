partition(_, [], [], []).
partition(P, [X|XS], [X|YS], ZS) :- X < P, partition(P, XS, YS, ZS).
partition(P, [X|XS], YS, [X|ZS]) :- X >= P, partition(P, XS, YS, ZS).

quicksort([],[]).
quicksort([X|XS],YS) :- partition(X,XS,L,R),
                        quicksort(L, LS),
                        quicksort(R, RS),
                        append(LS, [X|RS], YS).