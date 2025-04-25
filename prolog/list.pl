students([owen, ben, josie, martyna, stuart]).
lecturers([aurelien, mark, fiona, jacqui]).

writelist([]) :- nl.
writelist([H|T]) :-
    write(H), nl,
    writelist(T).

writelist(X) :- students(X).