function [q, tx, x] = qi_tau(Tau)   
%%Funkcja jakosci dla zmiennych decyzyjnych - czasow przelaczen

% Stale i zmienne globalne
global x0; 

% Przeliczanie Tau na u(t)
[t, u] = tau2u(Tau);

% Wyliczenie trajektorii
[tx,x] = appr([t(1) t(end)], u, x0, @rhs_SRV, 1);  

% Ocenienie trajektorii - funkcja jakosci dla zmiennych stanu w czasie
q = qi_x(t(end), x);
