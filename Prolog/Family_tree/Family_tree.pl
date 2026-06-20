grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

great_grandmother(G, X) :- female(G), grandparent(G, Y), parent(Y, X).

sibling(X, Y) :- parent(Z, X),
		 parent(Z, Y),
		 X \= Y.

full_sibling(X, Y) :- parent(Z, X),
                 parent(Z, Y),
                 X \= Y,
		 parent(W, X),
		 parent(W, Y),
		 Z \= W.


first_cousin(X, Y) :- 
		parent(A, X), 
		parent(B, Y), 
		full_sibling(A, B).

second_cousin(X, Y) :- 
	parent(A, X), 
	parent(B, Y), 
	first_cousin(A, B).


nth_cousin(X, Y) :-
    first_cousin(X, Y).

nth_cousin(X, Y) :-
    parent(A, X),
    parent(B, Y),
    nth_cousin(A, B).
