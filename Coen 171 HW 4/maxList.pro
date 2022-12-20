maxList([H],H).
maxList([H|T], H) :- maxList(T,X), H > X.
maxList([H|T], X) :- maxList(T,X), H =< X.