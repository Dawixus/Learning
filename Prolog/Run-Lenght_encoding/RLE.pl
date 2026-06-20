rle([], []).
rle([X|Xs], [(A, X)|Ys]) :- counter(Xs, X, 1, A, Y), rle(Y, Ys).

counter([], H, C, C, []).
counter([H|Z], H, Acc, C, Rest) :- Acc1 is Acc + 1, counter(Z, H, Acc1, C, Rest).
counter([H|Z], X, C, C, [H|Z]) :- H \= X.


