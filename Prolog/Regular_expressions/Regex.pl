match([], []).
match([one(S)|Sx], L) :- append(S, A, L), match(Sx, A).

match([opt(S)|Sx], L) :- match(Sx, L).
match([opt(S)|Sx], L) :- append(S, A, L), match(Sx, A).

match([plus(S)|Sx], L) :- append(S, A, L), match(Sx, A).
match([plus(S)|Sx], L) :- append(S, A, L), match([plus(S)|Sx], A).

match([star(S)|Sx], L) :- match(Sx, L).
match([star(S)|Sx], L) :- append(S, A, L), match(Sx, A).
match([star(S)|Sx], L) :- append(S, A, L), match([plus(S)|Sx], A).

