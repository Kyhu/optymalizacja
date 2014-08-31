function q = qi_tau(Tau)   
%%Funkcja jakosci dla zmiennych decyzyjnych - czasow przelaczen

% Stale i zmienne globalne
global x0 psi psit; 

% Przeliczanie Tau na u(t)
[t, u] = tau2u(Tau);

% Wyliczenie trajektorii
[tx,x] = appr([t(1) t(end)], u, x0, @rhs_SRV, 1);  

% Ocenienie trajektorii - funkcja jakosci dla zmiennych stanu w czasie
q = qi_x(t(end), x);


%% Calkowanie wstecz rownan sprzezonych
% Rownania sprzezone jako zmienne globalne

% Wyznacznie pochodnych funkcji jakości po zmiennych stanu
qi_prim = qi_x_grad(x);

% Wyznaczenie granicznego psi - psi(T)
psiT = -qi_prim(end,:); 

% Obrócenie x bo będziemy calkować w tyl. X jest 'sterowaniem'
x = flipud(x); 

% Czas obrocony - calkowanie wstecz rownan sprzezonych
[psit,psi] = appr([tx(end) tx(1)], x, psiT, @psi_rhs_SRV, 1);   

% Obrocenie macierzydo chronologicznej kolejnosci
psi = flipud(psi);
psit = flipud(psit);


