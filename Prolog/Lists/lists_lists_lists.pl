numerals([], []).
numerals([1|X], [one|Y]) :- numerals(X, Y).
numerals([2|X], [two|Y]) :- numerals(X, Y).
numerals([3|X], [three|Y]) :- numerals(X, Y).
numerals([4|X], [four|Y]) :- numerals(X, Y).
numerals([5|X], [five|Y]) :- numerals(X, Y).

pref(L, M) :- append(L, _, M).

nth(N, List, X) :-
    integer(N),
    N >= 0,
    nth_(N, List, X).

nth_(0, [X|_], X).

nth_(N, [_|T], X) :-
    N > 0,
    N1 is N - 1,
    nth_(N1, T, X).

concat([], N, N).
concat([Y|Ys], B, [Y|Ms]) :- concat(Ys, B, Ms). 

sel([], []).
sel([X|Xs], [X|Ys]) :- sel(Xs, Ys).

sel(X, [X|Ls], M) :- sel(Ls, M).
sel(X, [T|Ys], [T|Xs]) :- sel(X, Ys, Xs).

sel4(X, [X|L], Y, [Y|M]) :- sel(L, M).
sel4(X, [K|L], Y, [K|M]) :- sel4(X, L, Y, M).

dup([], []).
dup([X|L], [X,X|M]) :- dup(L, M).

nums(I, J, []) :-
    J < I.

nums(I, J, [I|L]) :-
    I =< J,
    I1 is I + 1,
    nums(I1, J, L).

