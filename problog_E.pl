% Probabilidades base para a condição da rua
0.1::str(snow_covered).
0.6::str(dry).
0.3::str(wet).

% Probabilidades base para o volante do dínamo desgastado
0.2::flw.

% Probabilidades condicionais para o dínamo deslizante (R) com base na condição da rua (Str) e no estado do volante (Flw)
0.9::r :- str(snow_covered), flw.
0.6::r :- str(snow_covered), \+flw.
0.2::r :- str(dry), flw.
0.0::r :- str(dry), \+flw.
0.7::r :- str(wet), flw.
0.1::r :- str(wet), \+flw.

% Probabilidades condicionais para a tensão do dínamo (V) com base no estado do dínamo (R)
0.06::v :- r.
0.9::v :- \+r.

% Consultas
query(v).

% Evidência
evidence(str(snow_covered)).
