% Define the probabilities for Str
0.05::str(wet).
0.05::str(snow_covered).
0.9::str(dry).

% Define the probabilities for Flw
0.4::flw.
0.6::not_flw.

% Define the conditional probabilities for R given Str and Flw
0.95::r :- str(snow_covered), flw.
0.7::r :- str(snow_covered), not_flw.

% Define the probabilities for V given R
0.04::v :- r.
0.99::v :- not(r).

% Define the probabilities for B and K
0.05::b.
0.05::k.

% Define the probabilities for Li given V, B, and K
0.99::li :- v, b, k.
0.01::li :- v, b, not(k).
0.01::li :- v, not(b), k.
0.001::li :- v, not(b), not(k).
0.05::li :- not(v), b, k.
0.005::li :- not(v), b, not(k).
0.005::li :- not(v), not(b), k.
0::li :- not(v), not(b), not(k).

% Query the probability of V given Str = snow_covered
query(v).
evidence(str(snow_covered)).
