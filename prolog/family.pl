% Define a relationship mother(child, mum).
mother(alice, lea).
mother(john, julia).
mother(lea, alberta).

% now for the dads
father(james, alfred).
father(lea, john).
father(julia, edward).

% generic parents rule
parent(X, Y) :- mother(X, Y).
parent(X, Y) :- father(X, Y).

grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

