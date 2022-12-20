myappend([],Y,Y).
myappend([H|X],Y,[H|Z]) :- myappend(X,Y,Z).
