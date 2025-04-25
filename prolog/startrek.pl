% in this context the quadrant is a 'cluster'
system(alpha_quadrant, terran).
system(alpha_quadrant, vulcanian).
system(alpha_quadrant, bajoran).

% planets for systems
planets([mercury, venus, earth, mars, jupiter, saturn, uranus, neptune], terran).
planets([vulcan, vulcan2], vulcanian).
planets([bajor], bajoran).

% 
feature(bajoran, ictp).
feature(mars, asteroidbelt).


% Rules
in_cluster(Planet, Cluster) :-
    system(Cluster, System),
    planets(Planets, System),
    member(Planet, Planets).

has_ictp(System) :- feature(System, ictp).

