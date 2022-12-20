% add(a,[a,b,c],L) has two responses without the cut:
% L = [a,b,c]
% L = [a,a,b,c]

not(X) :- X, !, fail.
not(_).

add(X,L,L) :- member(X,L), !.
add(X,L,[X|L]).

add2(X,L,L) :- member(X,L).
add2(X,L,[X|L]) :- not(member(X,L)).
