function q = qi_tau(Tau)   % Czasy przelaczen

global x0 psi psit; % Start trajektorii

% Przeliczanie Tau na u(t)
[t, u] = Tau2u(Tau);

% Wyliczenie trajektorii
[tx,x] = appr([t(1) t(end)], u, x0, @rhs_SRV, 1);  

% Ocenienie trajektorii
q = qi_x(t(end), x);

% Rozwiazywanie rownan sprzezoych
qi_prim = qi_x_grad(x);
psiT = -qi_prim(end,:); % poczatkowe/koncowe psi
%psiT = [-1,0,1,-1,0,1,0];


% figure(1);
% plot(tx,x);
% 
% u = fliplr(u); % Obrócenie x bo będziemy calkować w tyl.
% x00 = x(end,:)
% [tx,x] = appr([tx(end) tx(1)], u, x00, @rhs_SRV, 1);   % Czas obrocony
% 
% x = flipud(x);
% tx = flipud(tx);
% 
% figure(3);
% plot(tx,x); 


x = flipud(x); % Obrócenie x bo będziemy calkować w tyl.
[psit,psi] = appr([tx(end) tx(1)], x', psiT, @psi_rhs_SRV, 1);   % Czas obrocony

% obrocenie macierzy - nie ma znaczenia przy wykresie bo i tak obracamy
% obydwa
psi = flipud(psi); % Obracamy do chronologicznej kolejnosci
psit = flipud(psit);
x = flipud(x);

% figure(1);
% plot(tx,x); 
% figure(2);
% plot(psit,psi); 

