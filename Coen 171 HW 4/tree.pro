insert(X, empty, node(empty, X, empty)).
insert(X, node(L,X,R), node(L,X,R)).
insert(X, node(L,Y,R), node(T,Y,R)) :- X =< Y, !,insert(X,L,T).
insert(X, node(L,Y,R), node(L,Y,T)) :- X > Y, insert(X,R,T).

exists(X, node(_,X,_)).
exists(X, node(L,Z,_)) :- X < Z, exists(X,L).
exists(X, node(_,Z,R)) :- X > Z, exists(X,R).