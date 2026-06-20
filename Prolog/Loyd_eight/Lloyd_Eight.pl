% Movement logic
move(Start, Next, Direction) :- 
    nth0(EmptyIndex, Start, 0), 
    neighbor(EmptyIndex, TargetIndex, Direction),
    nth0(TargetIndex, Start, Value),
    swap(Start, 0, Value, Next).

% Grid geometry
neighbor(J, L, d) :- (J < 6, L is J + 3).
neighbor(J, L, n) :- (J > 2, L is J - 3).
neighbor(J, L, p) :- (J mod 3 =\= 2, L is J + 1).
neighbor(J, L, l) :- (J mod 3 =\= 0, L is J - 1).

% Swap utility
swap([], _, _, []).
swap([X|T], X, Y, [Y|NT]) :- !, swap(T, X, Y, NT).
swap([Y|T], X, Y, [X|NT]) :- !, swap(T, X, Y, NT).
swap([H|T], X, Y, [H|NT]) :- swap(T, X, Y, NT).

% Manhattan Heuristic
h(Stav, Cil, CelkovaVzdalenost) :-
    findall(Vzd, (
        nth0(IdxAkt, Stav, Cislo),
        Cislo \= 0,
        nth0(IdxCil, Cil, Cislo),
        R1 is IdxAkt // 3, S1 is IdxAkt mod 3,
        R2 is IdxCil // 3, S2 is IdxCil mod 3,
        Vzd is abs(R1 - R2) + abs(S1 - S2)
    ), SeznamVzdalenosti),
    sum_list(SeznamVzdalenosti, CelkovaVzdalenost).

% A* Algorithm
% Main Call 
vyres(Start, Cil, Reseni) :-
    h(Start, Cil, H),
    astar([uzel(H, 0, Start, [])], Cil, [Start], Reseni).

% 1. Targer Found
astar([uzel(_, _, Cil, History)|_], Cil, _, Reseni) :-
    reverse(History, Reseni), !.

% 2. Recursive Call
astar([uzel(_, G, Stav, History)|Ostatni], Cil, Navstivene, Reseni) :-
    G1 is G + 1,
    findall(uzel(F1, G1, NovyStav, [Smer|History]),
            (move(Stav, NovyStav, Smer), 
             \+ member(NovyStav, Navstivene),
             h(NovyStav, Cil, H1),
             F1 is G1 + H1),
            NoveUzly),
    
    % Actualization of visited states
    vytahni_stavy(NoveUzly, NoveStavy),
    append(NoveStavy, Navstivene, AktualniNavstivene),
    
    % Priority queue
    append(NoveUzly, Ostatni, NezarazenaFronta),
    sort(0, @=<, NezarazenaFronta, NovaFronta),
    
    astar(NovaFronta, Cil, AktualniNavstivene, Reseni).

% Helper function for states
vytahni_stavy([], []).
vytahni_stavy([uzel(_, _, S, _)|T], [S|Stavy]) :- vytahni_stavy(T, Stavy).

% Entry points
vyresStd(Start, S) :- vyres(Start,[1,2,3,4,5,6,7,8,0], S).

%Trivialni osmicka, rovnou vyresena
test1:-vyresStd([1,2,3,4,5,6,7,8,0],X),length(X,N),write(N),write(' '),write(X).

%Jednoducha osmicka na 10 kroku
test2:-vyresStd([5,8,2,1,0,3,4,7,6],X),length(X,N),write(N),write(' '),write(X).

%Osmicka na 15 kroku
test3:-vyresStd([8,0,2,5,7,3,1,4,6],X),length(X,N),write(N),write(' '),write(X).

%Osmicka na 20 kroku
test4:-vyresStd([8,7,0,5,4,2,1,6,3],X),length(X,N),write(N),write(' '),write(X).

%Lloydova osmicka z prikladu vyse, potrebuje 22 kroku
test5:-vyresStd([2,4,3,5,1,7,0,6,8],X),length(X,N),write(N),write(' '),write(X).

%Tezka osmicka na 25 kroku
test6:-vyresStd([8,4,7,0,6,2,5,1,3],X),length(X,N),write(N),write(' '),write(X).

%Nejtezsi osmicka, na 31 kroku
test7:-vyresStd([8,6,7,2,5,4,3,0,1],X),length(X,N),write(N),write(' '),write(X).
