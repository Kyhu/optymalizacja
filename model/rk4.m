function [t, x] = rk4(x0, tx, u, nt, fun)
% Algorytm Rungego Kutty rzedu 4
% Metoda numeryczna do iteracyjnego rozwiazywania rownan rozniczkowych zwyczajnych
% !! Wzory na polskiej Wikipedii maja bledy !!
% x0 - punkt startowy
% (tx(1), tx(2)) - przedzial czasu
% u - sterowanie
% nt - liczba punktow
% fun - funkcja (rownania)

n = length(x0);         % Wymiar
h = (tx(2)-tx(1))/nt;	% Krok roniczkowania
x = zeros(nt, n);       % inicjalizacja macierzy punktow

% Inicjowanie pochodnych zerami
dx1 = zeros(n, 1); % aproksymacja pochodnej pierwszego rzedu - k1
dx2 = dx1;  % aproksymacja pochodnej drugiego rzedu - k2
dx3 = dx1;  % aproksymacja pochodnej trzeciego rzedu - k3
dx4 = dx1;  % aproksymacja pochodnej czwartego rzedu - k4

% Zmienne tymczasowe (krokowe)
xtmp = x0; % xn
x(1, :) = x0';
t = tx(1);

% Pomocnicze wartosci przy algorytmie rk4
h_2 = h/2;
h_6 = h/6;

for i = 1:nt % for po wszystkich punktach
    
    dx1 = fun(t, xtmp, u);
    dx2 = fun(t + h_2, xtmp + h_2*dx1, u);
    dx3 = fun(t + h_2, xtmp + h_2*dx2, u);
    dx4 = fun(t + h, xtmp + h*dx3, u);    
    
    xtmp = xtmp +  h_6*(dx1 + 2*dx2 + 2*dx3 + dx4 );
    x(i+1, :) = xtmp';
    
    % Kolejny krok
    t = t + h; % Przesuniecie czasu o h    
end

% Czas odpowiadajacy wyliczonym punktom
t = linspace(tx(1), tx(2), nt+1)';
