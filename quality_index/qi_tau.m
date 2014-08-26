function q = qi_tau(Tau)   % Czasy przelaczen

global x0; % Start trajektorii

% Przeliczanie Tau na u(t)
[t, u] = Tau2u(Tau);

% Wyliczenie trajektorii
[tx,x] = appr([t(1) t(end)], u, x0, @rhs, 1);  

% Ocenienie trajektorii
%q = qi_x(t(end), x);

% Rozwiazywanie rownan sprzezoych
%qi_prim = qi_x_grad(x);
%psiT = -qi_prim(end,:); % poczatkowe/koncowe psi
psiT = [-1,0,1];
x = flipud(x); % Obrócenie x bo będziemy calkować w tym.
[psit,psi] = appr([tx(end) tx(1)], x', psiT, @psi_rhs, 1);   % Czas obrocony
psi = flipud(psi); % Obracamy do chronologicznej kolejnosci
psit = flipud(psit);
x = flipud(x);
% Rozwiazywanie rownan sprzezoych

figure(1);
plot(tx,x); 
figure(2);
plot(psit,psi); 

