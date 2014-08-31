function q = qi_x(T, x)    
%%Wspolczynnik jakosci zalezny od trajektorii

% Wspolczynnik przy calce
lambda = 1;

% Wartosc calki
calka = x(end,7);

% Stan koncowy
xT = x(end, 1:6);

% Wskaznik jakosci - rownanie 4.37 lub 4.40 w doktoracie Dr Banii(strona 104)
q = T + lambda*calka + norm(xT)^2;

% Czemu calka to x(7)? Zobacz wyklad 2 prof Korytowskiego, fragment o wskazniku z calka

