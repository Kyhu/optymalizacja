function [ psit, psi ] = psi_int( tx, x )
%%Calkowanie wstecz rownan sprzezonych

% Wyznacznie pochodnych funkcji jakości po zmiennych stanu
qi_prim = qi_x_grad(x);

% Wyznaczenie granicznego psi - psi(T)
psiT = -qi_prim(end,:); 

% Obrócenie x bo będziemy calkować w tyl. X jest 'sterowaniem'
x = flipud(x); 

% Czas obrocony - calkowanie wstecz rownan sprzezonych
[psit,psi] = appr([tx(end) tx(1)], x, psiT, @psi_rhs_SRV, 1);   

% Obrocenie macierzy do chronologicznej kolejnosci
psi = flipud(psi);
psit = flipud(psit);

end

