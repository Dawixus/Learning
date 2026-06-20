% Base predicate – creates an arithmetic expression from a list
% and evaluates its value.
% vlozOperatory(+List, -Value, -Expr)
% From the input list generates an expression Expr and computes its Value.
vlozOperatory(X, H, V):- 
    seznam_na_vyraz(X, V),  
    eval(V, H).             

% seznam_na_vyraz(+List, -Expr)
% If the list contains only one element, the expression is that element.
seznam_na_vyraz([X], X).

% If the list contains more elements, recursively splits it into two
% non-empty parts and combines the subexpressions using arithmetic operators.
seznam_na_vyraz(Z, Expr) :-
    append(X, Y, Z),        
    X \= [],                
    Y \= [],                
    seznam_na_vyraz(X, XL), 
    seznam_na_vyraz(Y, YL),
    (Expr = XL + YL; 
     Expr = XL - YL; 
     Expr = XL * YL; 
     (Yresult is YL, Yresult =\= 0, Expr = XL / YL)).

% eval(+Expr, -Value)
% Evaluates an arithmetic expression and returns its numeric value.
eval(X, X) :- number(X).

% addition
eval(A + B, Result) :-
    eval(A, VA),           
    eval(B, VB),           
    Result is VA + VB.    

% subtraction
eval(A - B, Result) :-
    eval(A, VA),           
    eval(B, VB),           
    Result is VA - VB.     

% multiplication
eval(A * B, Result) :-
    eval(A, VA),           
    eval(B, VB),           
    Result is VA * VB.     

% integer division (division by zero is prevented)
eval(A / B, Result) :-
    eval(A, VA),           
    eval(B, VB),           
    VB \= 0,              
    Result is VA // VB.    % integer division
